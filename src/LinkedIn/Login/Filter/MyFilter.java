package LinkedIn.Login.Filter;
/**
 * 过滤器
 * @author Seavan_CC
 *
 */
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyFilter implements Filter {

	  public MyFilter() {
	    // TODO Auto-generated constructor stub
	  }

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain filterChain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		try{
		    HttpServletRequest httpServletRequest = (HttpServletRequest)request;
		    HttpServletResponse httpServletResponse = (HttpServletResponse)response;
		    httpServletRequest.setCharacterEncoding("utf-8");
		    httpServletResponse.setCharacterEncoding("utf-8");
		    //判断过滤的页面或Servlet的stuNumber的session对象是否为空，如果为空则跳转到登录界面
		    if((((HttpServletRequest) request).getSession().getAttribute("stuNumber")) == null)
		    {
		    	String path = httpServletRequest.getContextPath();
		    	httpServletResponse.sendRedirect(path+"/LoginPage.jsp");
		    }		
		    filterChain.doFilter(httpServletRequest, httpServletResponse);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("hello");
	}
	  
	 

	}