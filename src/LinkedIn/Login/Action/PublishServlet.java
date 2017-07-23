package LinkedIn.Login.Action;
/**
 * 发送博客的Servlet
 * 
 */
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

import LinkedIn.Login.Dao.Dao;
import LinkedIn.Login.JavaBean.Blog;

import com.jspsmart.upload.*;

public class PublishServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PublishServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String path = request.getContextPath();
		//获取发送的图片，并存入系统文件夹下
		JspFactory fac = JspFactory.getDefaultFactory();   
		PageContext pageContext = fac.getPageContext(this, request,response,   
		                       null, false, JspWriter.DEFAULT_BUFFER, true);  
		SmartUpload su=new SmartUpload();
		if(pageContext == null)
		{
			System.out.println("空");
		}else{
			su.initialize(pageContext);
		}
		su.setAllowedFilesList("jpg,bmp,gif,png,PNG,JPG");
		try {
			su.upload();
		} catch (SmartUploadException e1) {
			e1.printStackTrace();
		}
		try {
			su.save("/upload", SmartUpload.SAVE_VIRTUAL);
		} catch (SmartUploadException e) {
			e.printStackTrace();
		}
		//将发送的图片存到个人文件夹下
		String pictureUrl="upload/"+su.getFiles().getFile(0).getFileName();
		System.out.println(pictureUrl);
		//获取发送的博客的文字信息
		byte[] sour = su.getRequest().getParameter("blogtext").getBytes("utf-8");
		String blogText=new String(sour,"utf-8");
//		String blogText = URLEncoder.encode(su.getRequest().getParameter("blogtext"),"utf-8");
//		System.out.println(blogText);
//		blogText = URLDecoder.decode(blogText,"utf-8");
		System.out.println(blogText);
		//获取发送博客的时间
		java.util.Date time=new java.util.Date();
		java.sql.Timestamp timeStamp=new java.sql.Timestamp(time.getTime());
		//获取用户已经发送的博客
		Blog blog=new Blog();
		blog.setStuNumber(request.getSession().getAttribute("stuNumber").toString());
		blog.setBlogText(blogText);
		blog.setTime(timeStamp);
		blog.setPictureUrl(pictureUrl);
		Dao dao=new Dao();
		boolean result=dao.publish(blog);
		//获取发送博客的用户学号
		String stuNumber = request.getSession().getAttribute("stuNumber").toString();
		ArrayList<Blog> myBlogs=dao.getBlog(stuNumber);
		//发送成功后更新博客列表
		request.getSession().setAttribute("blogLists", myBlogs);
		response.sendRedirect(path+"/BlogPage.jsp");
	}

}
