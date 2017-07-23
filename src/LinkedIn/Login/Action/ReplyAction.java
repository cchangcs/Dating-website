package LinkedIn.Login.Action;
/**
 * 回复帖子的Servlet
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
import LinkedIn.Login.JavaBean.Frog;

public class ReplyAction extends HttpServlet {

	public ReplyAction() {
		super();
	}

	public void destroy() {
		super.destroy(); 
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String path = request.getContextPath();
		Dao dao = new Dao();
		Frog frog = new Frog();
		//通过话题号获取对话题的回复
		String frogNumber = request.getParameter("frogNumber");
		frog = dao.getFrog(frogNumber);
		//跳转到回复界面
		response.sendRedirect(path+"/ReplyPage.jsp");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}


	public void init() throws ServletException {
	}

}
