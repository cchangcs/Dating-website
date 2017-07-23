package LinkedIn.Contact.chat;
/**
 * 聊天的用户
 * @author Seavan_CC
 *
 */


import java.io.Serializable;
import java.util.Vector;

public class UserInfo implements Serializable {
	private static UserInfo user = new UserInfo();
	private Vector vector = null;

	// 利用private调用构造函数，防止被外界产生新的instance对象
	public UserInfo() {
		this.vector = new Vector();
	}

	// 外界使用的instance对象
	public static UserInfo getInstance() {
		return user;
	}

	// 增加用户
	public boolean addUser(String user) {
		if (user != null) {
			this.vector.add(user);
			return true;
		} else {
			return false;
		}
	}

	// 获取用户列表
	public Vector getList() {
		return vector;
	}

	// 移除用户
	public void removeUser(String user) {
		if (user != null) {
			vector.removeElement(user);
		}
	}
}
