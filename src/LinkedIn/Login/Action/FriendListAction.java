package LinkedIn.Login.Action;
/**
 * 获取好友列表的Servlet
 * @author Seavan_CC
 *
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.jndi.url.iiopname.iiopnameURLContextFactory;

import LinkedIn.Login.Dao.Dao;
import LinkedIn.Login.JavaBean.User;

public class FriendListAction extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
//	private static List<String> list;
	public FriendListAction() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getContextPath();
		//更新new_User的session对象
		request.getSession().setAttribute("new_User", null);
		request.getSession().setAttribute("search_list",null);
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		//跳转到好友列表页面
		response.sendRedirect(path+"/FriendList.jsp");
		String stuNumber="";
		if(request.getSession().getAttribute("stuNumber") != null)
		{
			stuNumber=(request.getSession().getAttribute("stuNumber")).toString();
		}
		Dao dao=new Dao();
		
		List<Map<String,Object>> params = new ArrayList<Map<String,Object>>();
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("name", "stuNumber1");
		map.put("rela", "=");
		map.put("value", "'"+stuNumber+"'");//注意添加双引号里面的单引号，构成sql语句必须添加单引号才行
		params.add(map);
		List<User> friend_list;
		try {
			friend_list = dao.query(params);
			List<User> userList = null;
			if(friend_list.isEmpty())
			{
				userList = new ArrayList<User>();
				User testUser = new User();
				testUser.setStuName("test");
				userList.add(testUser);
				//更新好友列表
				request.getSession().setAttribute("friendli",userList);
			}else{
				if(userList != null && !userList.isEmpty())
				{
					for(int i = 0;i<userList.size();i++)
					{
						userList.remove(i);
					}
				}
				request.getSession().setAttribute("friendli",friend_list);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


	}
	public void init() throws ServletException {
		// Put your code here
	}

}
