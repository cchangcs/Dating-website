package LinkedIn.Login.Action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import LinkedIn.Login.Dao.Dao;
import LinkedIn.Login.JavaBean.User;
/**
 * 查询好友的Servlet
 * @author Seavan_CC
 *
 */
public class SearchAction extends HttpServlet {

	public SearchAction() {
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
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		//跳转到好友列表主页
		response.sendRedirect(path+"/FriendList.jsp");
		String stu = request.getParameter("_search");
		HttpSession session= request.getSession();
		Dao dao = new Dao();
		List<User> search_list=null;
		List<Map<String,Object>> params = new ArrayList<Map<String,Object>>();
    	Map<String,Object> map = new HashMap<String, Object>();
	    if(stu.equals(""))
	    {
	    	//如果查询条件为空，就置查询表的session对象为空
	    	search_list = new ArrayList<User>();
	    	request.getSession().setAttribute("search_list",search_list);
	    	List<User> clearList = (List<User>) request.getSession().getAttribute("search_list");
	    	for(int i = 0;i < clearList.size();++i){
	    		clearList.remove(i);
	    	}
	    }
	    if(!stu.equals("") )
	    {
	    	//先根据学号进行查询用户
	    	map.put("name", "stuNumber");
	    	map.put("rela", "=");
	    	map.put("value", "'"+stu+"'");//注意添加双引号里面的单引号，构成sql语句必须添加单引号才行
	    	params.add(map);			
	    	try {
				search_list = dao.search(params);
				if(search_list.size() == 0)
				{
					//根据名字查询用户
					map.put("name", "stuName");
			    	map.put("rela", "=");
			    	map.put("value", "'"+stu+"'");//注意添加双引号里面的单引号，构成sql语句必须添加单引号才行
			    	params.add(map);			
			    	try {
						search_list = dao.search(params);
						if(search_list==null)
						{
						}else{
						    request.getSession().setAttribute("search_list",search_list);
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}else{
					//查询后更新好友列表
					request.getSession().setAttribute("search_list",search_list);
				}		
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
	    	
	    }
	}

	public void init() throws ServletException {
		super.init();
	}

}
