package LinkedIn.Login.Action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import LinkedIn.Login.Dao.Dao;
import LinkedIn.Login.JavaBean.Frog;
/**
 * 发布话题的Servlet
 * @author Seavan_CC
 *
 */
public class AddForgAction extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public AddForgAction() {
		super();
	}
	
	public void destroy() {
		super.destroy(); 
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=gbk");
		request.setCharacterEncoding("gbk");
		String path = request.getContextPath();
		//获取话题标题和话题内容
		String title = new String(request.getParameter("frogTitle").getBytes("gbk"),"utf-8");
		System.out.println(new String(request.getParameter("frogTitle").getBytes("gbk"),"utf-8"));
		String content = new String(request.getParameter("frogContent").getBytes("gbk"),"utf-8");
		java.util.Date time=new java.util.Date();
		java.sql.Timestamp timeStamp=new java.sql.Timestamp(time.getTime());
		String stuNumber = request.getSession().getAttribute("stuNumber").toString();	
		String type = new String(request.getParameter("type").getBytes("gbk"),"gbk");
		Frog frog = new Frog();
		frog.setForgTitle(title);
		frog.setFrogContent(content);
		frog.setFrogDate(timeStamp);
		frog.setStuNumber(stuNumber);
		frog.setNewReply(timeStamp);
		frog.setType(type);
		Dao dao=new Dao();
		boolean result=dao.addFrog(frog);
		//判断话题是兴趣类还是专业类
		if(type.equals("Interests and hobbies"))
		{
			//更新兴趣社区表
			ArrayList<Frog> myInterestFrogs=dao.getFrogs(type);
			request.getSession().setAttribute("frogInterestLists", myInterestFrogs);
		}
		if(type.equals("Professional knowledge resources"))
		{
			//更新专业社区表
			ArrayList<Frog> myMajorFrogs=dao.getFrogs(type);
			request.getSession().setAttribute("frogMajorLists", myMajorFrogs);
		}
		response.sendRedirect(path+"/ForumPage.jsp");
	}

	public void init() throws ServletException {
		
	}

}
