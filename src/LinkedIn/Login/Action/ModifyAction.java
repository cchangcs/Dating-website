package LinkedIn.Login.Action;
/**
 * 获取博客的Servlet
 * @author Seavan_CC
 *
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import LinkedIn.Login.Dao.Dao;
import LinkedIn.Login.JavaBean.Blog;

public class ModifyAction extends HttpServlet {
	
	public ModifyAction() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getContextPath();
		Dao dao=new Dao();
		//查询登录用户自己的博客，并存储到session对象中
		String stuNumber = request.getSession().getAttribute("stuNumber").toString();
		ArrayList<Blog> myBlogs=dao.getBlogs(stuNumber);
		request.getSession().setAttribute("blogList", myBlogs);
		//跳转到个人主页
		response.sendRedirect(path+"/ModifyPage.jsp");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		super.doPost(request, response);
	}

	public void init() throws ServletException {
		
	}

}
