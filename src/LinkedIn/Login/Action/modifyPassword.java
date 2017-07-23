package LinkedIn.Login.Action;
/**
 * 修改密码的Servlet
 * @author Seavan_CC
 *
 */
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import LinkedIn.Login.Dao.Dao;

public class modifyPassword extends HttpServlet {

	public modifyPassword() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		super.doGet(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("jinlaile");
		String path = request.getContextPath();
		Dao dao = new Dao();
		//获取修改密码的用户学号
		String stuNumber = request.getSession().getAttribute("stuNumber").toString();
		String oldPassword = request.getParameter("old_pass");
		String old = dao.searchPass(stuNumber);
		String newPassword = request.getParameter("new_pass");
		String message ="";
		if(!oldPassword.equals(old))
		{
//			  response.setContentType("text/html; charset=UTF-8"); //转码
//			  PrintWriter out = response.getWriter();
//			  out.flush();
//			  out.println("<script>");
//			  out.println("alert('原密码输入错误！');");
//			  out.println("</script>");
			message = "原密码输入错误！";
			request.getSession().setAttribute("message", message);
			response.sendRedirect(path+"/ModifyPage.jsp");
			return;
		}
		//修改个人密码
		boolean result = dao.modifyPassword(newPassword, stuNumber);
		if(result)
		{
//			response.setContentType("text/html; charset=UTF-8"); //转码
//			PrintWriter out = response.getWriter();
//			out.flush();
//			out.println("<script>");
//			out.println("alert('修改密码成功');");
//			out.println("</script>");
			message = "修改密码成功！";
			//如果修改密码成功，跳转到个人主页
			request.getSession().setAttribute("message", message);
			response.sendRedirect(path+"/ModifyPage.jsp");
			
		}else{
			
		}
		
	}

	public void init() throws ServletException {
		
	}

}
