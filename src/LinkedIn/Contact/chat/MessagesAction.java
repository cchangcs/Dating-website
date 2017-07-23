package LinkedIn.Contact.chat;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Random;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;
import org.jdom.output.Format;
import org.jdom.output.XMLOutputter;
/**
 * 对话的Servlet
 * @author Seavan_CC
 *
 */

public class MessagesAction extends HttpServlet {

	public MessagesAction() {
		super();
	}

	public void destroy() {
		super.destroy(); 
	}


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if ("getMessages".equals(action)) {		//从XML文件中读取聊天信息
			this.getMessages(request, response);
		} else if ("sendMessage".equals(action)) {	//发送聊天信息
			this.sendMessages(request, response);
		} else if ("loginRoom".equals(action)) {	//登录时，写入系统公告
			this.loginRoom(request, response);
		}
	}
	// 读取保存聊天信息的XML文件
	public void getMessages(HttpServletRequest request,HttpServletResponse response) {
		response.setContentType("text/html;charset=GBK");
		String fileURL = createFile(request, response); // 当文件不存在时创建该文件
		
		/*******************开始解析保存聊天内容的XML文件**********************/
		Document feedDoc =null;
		try {
			SAXBuilder builder = new SAXBuilder();
			feedDoc = builder.build(fileURL); //得到xml的文件
			Element root = feedDoc.getRootElement();			//获取根节点
			Element channel = root.getChild("messages");		//获取messages节点 还有一种xpath读法
			Iterator items = channel.getChildren("message").iterator();		//获取message节点
			String messages = "";
			// 获取当前用户
			HttpSession session = request.getSession();
			String userName = "";
			if (null == session.getAttribute("username")) {
				request.setAttribute("messages", "error");		//保存标记信息，表示用户账户已经过期
			} else {
				userName = session.getAttribute("username").toString();
				DateFormat df = DateFormat.getDateTimeInstance();//得到时间
				while (items.hasNext()) {
					Element item = (Element) items.next();
					String sendTime = item.getChildText("sendTime");	//获取发言时间
					try {
						if (df.parse(sendTime).after(
								df.parse(session.getAttribute("loginTime").toString()))
								|| sendTime.equals(session.getAttribute("loginTime").toString())) {
							String from = item.getChildText("from");	//获取发言人
							String face = item.getChildText("face");	//获取表情
							String to = item.getChildText("to");		//获取接收者
							String content = item.getChildText("content");	//获取发言内容
							boolean isPrivate = Boolean.valueOf(item.getChildText("isPrivate"));
							if (isPrivate) {		//获取私聊内容
								if (userName.equals(to)
										|| userName.equals(from)) {
									messages += "<font color='red'>[私人对话]</font><font color='blue'><b>"
											+ from
											+ "</b></font><font color='#CC0000'>"
											+ face
											+ "</font><font color='green'>["
											+ to
											+ "]</font>"
											+ "&nbsp;<font color='gray'>["
											+ sendTime + "]</font><br>"
											+ content+"<br/>";
								}
							} else if ("[系统公告]".equals(from)) {	//获取系统公告信息
								
							} else {		//获取普通发言信息
								messages += "<li class='send'><font color='#9AFF9A'><b>" + from
										+ "</b></font><font >"
										+ face
										+ "</font></font>"
										+ "&nbsp;&nbsp;&nbsp;<font color='#97FFFF'>["
										+ sendTime + "]</font><br>"
										+ content+"<br/></li>";
							}
						}
					} catch (Exception e) {
						System.out.println("说。。" + e.getMessage());
					}
				}
				request.setAttribute("messages", messages);		//保存获取的聊天信息
			}
			//转发给内容的jsp
			request.getRequestDispatcher("content.jsp").forward(request,response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	// 登录时，写入系统公告

	public void loginRoom(HttpServletRequest request,
			HttpServletResponse response) {
		response.setContentType("text/html;charset=GBK");
		HttpSession session = request.getSession();
		//引用字符串工具类
		StringUtils su=new StringUtils();
		//转化编码的格式
		String username=su.toGBK(request.getSession().getAttribute("stuNumber").toString());	//获得登录用户名
		String userip=su.toGBK(request.getParameter("ip"));		//获得登录IP
		UserInfo user=UserInfo.getInstance();		//获得UserInfo类的对象
		session.setMaxInactiveInterval(600);		//设置Session的过期时间为10分钟
		Vector vector=user.getList();
		boolean flag=true;		//标记是否登录的变量
		//判断用户是否登录
		if(vector!=null&&vector.size()>0){
			//循环遍历看里面是否有和用户名相等的
			for(int i=0;i<vector.size();i++){
				if(user.equals(vector.elementAt(i))){
					PrintWriter out = null;
					try {
						out = response.getWriter();
						out.println("<script language='javascript'>alert('该用户已经登录');window.location.href='LoginPage.jsp.jsp';</script>");
					} catch (IOException e) {
						e.printStackTrace();
					}
					flag=false;
					break;
				}
			}
		}
		//保存用户信息
		if(flag){
			UserListener ul=new UserListener();					//创建UserListener的对象
			//设置一个字符串进去 就是用户名 和ip 保存进去
			ul.setUser(username+"("+userip+")");								//添加用户
			user.addUser(ul.getUser());							//添加用户到UserInfo类的对象中
			session.setAttribute("user2",ul);					//将UserListener对象绑定到Session中
			session.setAttribute("username",username);			//保存当前登录的用户名
			session.setAttribute("loginip",userip);				//保存当前登录的IP
			session.setAttribute("loginTime",new Date().toLocaleString());		//保存登录时间
		}
		/** *******************开始系统公告********************************** */
		String fileURL = createFile(request, response); // 当文件不存在时创建该文件
		// 获取当前用户
		SAXBuilder builder = new SAXBuilder();
		try {
			Document feedDoc = builder.build(fileURL);

		Element root = feedDoc.getRootElement();
		Element channel = root.getChild("messages");
		Element newNode = new Element("message");
		channel.addContent(newNode); // 创建messages节点
		Element fromNode = new Element("from").setText("[系统公告]");
		newNode.addContent(fromNode);
		Element faceNode = new Element("face").setText("");
		newNode.addContent(faceNode);
		Element toNode = new Element("to").setText("");
		newNode.addContent(toNode);
		Element contentNode = new Element("content")
				.setText("<font color='gray'>[" + username + "]("+userip+")开始聊天</font>");
		newNode.addContent(contentNode);
		// 登录时间
		Element sendTimeNode = new Element("sendTime").setText(new Date()
				.toLocaleString());
		newNode.addContent(sendTimeNode);
		Element isPrivateNode = new Element("isPrivate").setText("false");
		newNode.addContent(isPrivateNode);
		//跳转到登陆成功的界面
		request.getRequestDispatcher("login_ok.jsp").forward(request, response);
		XMLOutputter xml = new XMLOutputter(Format.getPrettyFormat());
		xml.output(feedDoc, new FileOutputStream(fileURL));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 发送聊天信息
	public void sendMessages(HttpServletRequest request,
			HttpServletResponse response){
		response.setContentType("text/html;charset=GBK");
		StringUtils su = new StringUtils();
		//随机的对象
		Random random = new Random();
		String from = su.toUTF8(request.getParameter("from"));			//发言人
		String face = su.toUTF8(request.getParameter("face"));			//表情
		String to = su.toUTF8(request.getParameter("to"));				//接收者
		String color = request.getParameter("color");					//字体颜色
		String content = su.toUTF8(request.getParameter("content"));	
		System.out.println(content);//发言内容
		String isPrivate = request.getParameter("isPrivate");			//是否为悄悄话
		@SuppressWarnings("deprecation")
		String sendTime = new Date().toLocaleString();					//发言时间
		/** *******************开始添加聊天信息********************************** */
		String fileURL = createFile(request, response); // 当文件不存在时创建该文件
		SAXBuilder builder = new SAXBuilder();
		Document feedDoc;
		try {
			feedDoc = builder.build(fileURL);
		
		Element root = feedDoc.getRootElement();
		Element channel = root.getChild("messages");
		Element newNode = new Element("message");
		channel.addContent(newNode); // 创建messages节点
		Element fromNode = new Element("from").setText(from);
		newNode.addContent(fromNode);			//添加发言人子节点
		Element faceNode = new Element("face").setText(face);
		newNode.addContent(faceNode);			//添加表情子节点
		Element toNode = new Element("to").setText(to);
		newNode.addContent(toNode);			//添加接收者子节点
		Element contentNode = new Element("content").setText("<font color='"
				+ color + "'>" + content + "</font>");
		newNode.addContent(contentNode);			//添加聊天内容子节点
		// System.out.println("发送的信息："+from+face+to+content);
		// 发言时间
		Element sendTimeNode = new Element("sendTime").setText(sendTime);
		newNode.addContent(sendTimeNode);			//添加发言时间子节点
		Element isPrivateNode = new Element("isPrivate").setText(isPrivate);
		newNode.addContent(isPrivateNode);			//添加是否为悄悄话子节点
		//转发的界面
		request.getRequestDispatcher(
				"MessagesAction?action=getMessages&nocache="
						+ random.nextInt(10000)).forward(request, response);
		XMLOutputter xml = new XMLOutputter(Format.getPrettyFormat());
		xml.output(feedDoc, new FileOutputStream(fileURL));

		/** *****************添加结束******************************* */
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	// 根据现在日期生成XML文件名，并判断该文件是否存在，如果不存在将创建该文件
	public String createFile(HttpServletRequest request,
			HttpServletResponse response) {
		Date date = new Date();
		String newTime = new  SimpleDateFormat("yyyyMMdd").format(date);
		//得到文件的路劲 和名称
		String fileURL = getServletContext().getRealPath("/")+"xml\\"+newTime + ".xml";
		System.err.println("文件的路径为----》"+fileURL);
		/** **************判断XML文件是否存在，如果不存在则创建该文件********** */
		File file = new File(fileURL);
		if (!file.exists()) { // 判断文件是否存在，如果不存在，则创建该文件
			try {
				PrintWriter out =null;
				try {
					out = response.getWriter();
					out.println("<script language='javascript'>alert('第一个登录');window.location.href='index.jsp';</script>");
				} catch (IOException e) {
					e.printStackTrace();
				}
				file.createNewFile(); // 创建文件  一个XML文件
				String dataStr = "<?xml version=\"1.0\" encoding=\"GBK\"?>\r\n";
				dataStr = dataStr + "<chat>\r\n";
				dataStr = dataStr + "<messages></messages>";
				dataStr = dataStr + "</chat>\r\n";
				byte[] content = dataStr.getBytes();
				FileOutputStream fout = new FileOutputStream(file);
				fout.write(content); // 将数据写入输出流
				fout.flush(); // 刷新缓冲区
				fout.close(); // 关闭输出流
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else{
			PrintWriter out =null;
			try {
				out = response.getWriter();
				out.println("<script language='javascript'>alert('有了。');</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
		return fileURL;
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
