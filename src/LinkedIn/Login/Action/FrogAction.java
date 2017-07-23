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
/**
 * 获取发送的话题的Servlet
 * @author Seavan_CC
 *
 */
public class FrogAction extends HttpServlet {

	public FrogAction() {
		super();
	}

	public void destroy() {
		super.destroy(); 
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=gbk");
		request.setCharacterEncoding("gbk");
		String path = request.getContextPath();
		Dao dao = new Dao();
		//获取兴趣社区中的话题
		String type1="Interests and hobbies";
		ArrayList<Frog> myFrogs=dao.getFrogs(type1);
		request.getSession().setAttribute("frogInterestLists", myFrogs);
		//获取专业社区中的话题
		String type="Professional knowledge resources";
		ArrayList<Frog> myFrogs2=dao.getFrogs(type);
		request.getSession().setAttribute("frogMajorLists", myFrogs2);
		response.sendRedirect(path+"/ForumPage.jsp");
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	
	}


	public void init() throws ServletException {
		
	}

}
