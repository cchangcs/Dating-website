package LinkedIn.Login.Action;
/**
 * 删除好友的Servlet
 * @author Seavan_CC
 *
 */
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import LinkedIn.Login.Dao.Dao;

public class DeleteAction extends HttpServlet {

	public DeleteAction() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		super.doGet(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getContextPath();
		Dao dao = new Dao();
		//获取删除的好有学号
		String contactNumber  = request.getParameter("deleteNumber");
		//从数据库中删除好友
		boolean result = dao.deleteFriend(contactNumber);
		if(result)
		{
			response.sendRedirect(path+"/servlet/FriendListAction");
		}else{
			
		}
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
