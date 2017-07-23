package LinkedIn.Login.Action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import LinkedIn.Login.Dao.Dao;
import LinkedIn.Login.JavaBean.Frog;
import LinkedIn.Login.JavaBean.FrogReply;
/**
 * 添加社区回复的Servlet
 * @author Seavan_CC
 *
 */
public class AddReplyAction extends HttpServlet {

	public AddReplyAction() {
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
		//获取回复社区的用户学号和回复内容
		String replyStuNumber = new String(request.getParameter("replyStuNumber").getBytes("gbk"),"gbk");
		String replyContent = new String(request.getParameter("replyTextArea").getBytes("gbk"),"gbk");
		java.util.Date time=new java.util.Date();
		java.sql.Timestamp timeStamp=new java.sql.Timestamp(time.getTime());
		String frogNumber = request.getSession().getAttribute("frogNumber").toString();
		String stuNumber = request.getSession().getAttribute("stuNumber").toString();
		FrogReply frogReply = new FrogReply();
		frogReply.setFrogNumber(frogNumber);
		frogReply.setReplyContent(replyContent);
		frogReply.setReplyDate(timeStamp);
		frogReply.setStuNumber(stuNumber);
		Dao dao =new Dao();
		//获取话题
		Frog frog = (Frog)request.getSession().getAttribute("searchFrog");
		if(dao.addReply(frogReply))
		{
			frog.setReplyCount(dao.replyCount(frogNumber));
			//更新话题
			request.getSession().setAttribute("searchFrog", frog);
			ArrayList<FrogReply> frogReplies = dao.getReply(frogNumber);
			//更新回复表
			request.getSession().setAttribute("replyList", frogReplies);
			response.sendRedirect(path+"/ReplyPage.jsp");
		}else{
			
		}
	}

	public void init() throws ServletException {
		
	}

}
