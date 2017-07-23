package LinkedIn.Contact.chat;

import javax.servlet.http.HttpSessionBindingEvent;
/**
 * 用户监听器
 * @author Seavan_CC
 *
 */
public class UserListener implements
javax.servlet.http.HttpSessionBindingListener{
	private String user;
	private UserInfo container = UserInfo.getInstance();
	//无参构造方法
	public UserListener() {
		user = "";
	}
	// 设置在线监听人员
	public void setUser(String user) {
		this.user = user;
	}

	// 获取在线监听
	public String getUser() {
		return this.user;
	}
	
	// 当Session有对象加入时执行的方法
	public void valueBound(HttpSessionBindingEvent event) {
		System.out.println("上线用户为"+ user);
		
	}
	// 当Session有对象移除时执行的方法
	public void valueUnbound(HttpSessionBindingEvent event) {
		System.out.println(this.user+"下线了...");
		if (user!="") {
			container.removeUser(user);
		}
		
	}

}
