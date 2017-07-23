package LinkedIn.Login.Dao;
/**
 * 对数据库的操作
 * @author Seavan_CC
 *
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.sun.corba.se.impl.protocol.giopmsgheaders.ReplyMessage;
import com.sun.crypto.provider.RSACipher;


import sun.security.util.Password;
import LinkedIn.Login.JavaBean.*;
import LinkedIn.Login.connection.OracleConnection;

public class Dao {
	private OracleConnection oc = new OracleConnection();
	public Dao()
	{
	}
	//实现用户注册
	public boolean register(User user)
	{
		try {
			Connection	conn = oc.getCon();
			String sql = "insert into UserStu " +
					" values(?,?,?,?,?,?,?,?,?) ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, user.getStuNumber());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getStuName());
			ps.setString(4, user.getMajor());
			ps.setString(5, user.getGrade());
			ps.setString(6,user.getSex());
			ps.setInt(7, user.getAge());
			ps.setString(8, user.getHobby());
			ps.setString(9, user.getHeadPostrait());
			ps.execute();
			System.out.println("注册成功！");
			return true;
		} catch (SQLException e) {
			System.out.println("注册失败！");
			e.printStackTrace();
			return false;
		}
	}
	//实现用户登录
		public User login(String stuNumber)
		{
			try {
				Connection	conn = oc.getCon();
				String sql = "select * from UserStu " +
						" where stuNumber=? ";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1,stuNumber);
				ResultSet rs = ps.executeQuery();
				User user = null;
				while(rs.next())
				{
					user = new User();
					user.setStuNumber(rs.getString("stuNumber"));
					user.setPassword(rs.getString("password"));
					user.setStuName(rs.getString("stuName"));
					user.setAge(Integer.parseInt(rs.getString("age")));
					user.setSex(rs.getString("sex"));
					user.setMajor(rs.getString("major"));
					user.setGrade(rs.getString("grade"));
					user.setHeadPostrait(rs.getString("headPostrait"));
					user.setHobby(rs.getString("hobby"));
				}
				System.out.println("登录成功！");
				return user;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("登录失败！");
				e.printStackTrace();
				return null;
			}
		}
	
	//实现查询
		public List<User> query(List<Map<String,Object>> params) throws SQLException{
			//3、通过数据库的连接操作数据库，实现增删改查
			StringBuilder sb = new StringBuilder();
			sb.append("select * from UserStu where stuNumber in (select stuNumber2 from"
					+ " Contacts where 1=1 ");
		
			if(params != null && params.size()>0)
			{
				for (int i = 0; i < params.size(); i++) {
					Map<String,Object> map=params.get(i);
					sb.append(" and "+map.get("name")+" "
							+map.get("rela")+" "+map.get("value")+")");
							
				}
			}
			Connection	conn = oc.getCon();
			java.sql.PreparedStatement ptmt = conn.prepareStatement(sb.toString());

			System.out.println(sb.toString());
			ResultSet rs = ptmt.executeQuery();
			
			List<User> gs = new ArrayList<User>();
			User user = null;
			while(rs.next())
			{
				user = new User();
				/*private String stuNumber;
				private String password;
				private String stuName;
				private String major;
				private String grade;
				private String sex;
				private int age;
				private String hobby;*/
				user.setStuNumber(rs.getString("stuNumber"));
				user.setStuName(rs.getString("stuName"));
				user.setPassword(rs.getString("password"));
				user.setMajor(rs.getString("major"));
				user.setGrade(rs.getString("grade"));
				user.setSex(rs.getString("sex"));
				user.setAge(rs.getInt("age"));
				user.setHobby(rs.getString("hobby"));
				user.setHeadPostrait(rs.getString("headPostrait"));
				gs.add(user);
			}
			return gs;
		}
		//实现按学号查询好友
		public List<User> search(String stuNumber)
		{
			try {
				Connection	conn = oc.getCon();
				String sql = "select * from UserStu " +
						" where stuNumber=? ";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1,stuNumber);
				ResultSet rs = ps.executeQuery();
				User user = null;
				while(rs.next())
				{
					user = new User();
					user.setStuNumber(rs.getString("stuNumber"));
					user.setPassword(rs.getString("password"));
				}
				System.out.println("登录成功！");
				return null;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("登录失败！");
				e.printStackTrace();
				return null;
			}
		}
		
		//删除好友
		public boolean deleteFriend(String stuNumber)
		{
			try {
				Connection	conn = oc.getCon();
				String sql = "delete from Contacts " +
						" where stuNumber2 = ?";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, stuNumber);
				ps.execute();
				System.out.println("删除好友成功！");
				return true;
			} catch (SQLException e) {
				System.out.println("删除好友失败！");
				e.printStackTrace();
				return false;
			}
		}
		//实现按不同条件查询好友
		public List<User> search(List<Map<String,Object>> params) throws SQLException
		{
				Connection	conn = oc.getCon();
				//3、通过数据库的连接操作数据库，实现增删改查
				System.out.println("hello");
				StringBuilder sb = new StringBuilder();
				sb.append("select * from UserStu where 1=1 ");//在实际开发过程中经常使用使用一个永真条件1=1对sql对sql语句进行连接
				if(params != null && params.size()>0)
				{
					for (int i = 0; i < params.size(); i++) {
						Map<String,Object> map=params.get(i);
						sb.append(" and "+map.get("name")+" "
								+map.get("rela")+" "+map.get("value")+"");
								
					}
				}
				java.sql.PreparedStatement ptmt = conn.prepareStatement(sb.toString());
				ResultSet rs = ptmt.executeQuery();
				
				List<User> gs = new ArrayList<User>();
				User user = null;
				while(rs.next())
				{
					user = new User();
					user.setStuNumber(rs.getString("stuNumber"));
					user.setStuName(rs.getString("stuName"));
					user.setPassword(rs.getString("password"));
					user.setMajor(rs.getString("major"));
					user.setGrade(rs.getString("grade"));
					user.setSex(rs.getString("sex"));
					user.setAge(rs.getInt("age"));
					user.setHeadPostrait(rs.getString("headPostrait"));
					user.setHobby(rs.getString("hobby"));
					gs.add(user);
				}
				return gs;
		}
		//实现添加联系人
		public boolean add(String number1,String number2) throws SQLException
		{
			try{
				Connection	conn = oc.getCon();
				String string="insert into contacts values('"+number1+"','"+number2+"')";
				System.out.println(string);
				java.sql.PreparedStatement ptmt = conn.prepareStatement(string);

				ptmt.executeQuery();
				return true;
			}catch(Exception e){
				e.printStackTrace();
				return false;
			}
		}
		
		//实现发表博客
		public boolean publish(Blog blog){
			Connection conn=oc.getCon();
			try {
				String sql="insert into blog "+
						"values(blog_number.nextval,?,?,?,?)";
				PreparedStatement ps=conn.prepareStatement(sql);
				ps.setString(1, blog.getStuNumber());
				ps.setString(2, blog.getBlogText());
				ps.setString(3, blog.getPictureUrl());
				ps.setTimestamp(4, blog.getTime());
				ps.execute();
				System.out.println("发布成功！");
				return true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("发布失败！");
				return false;
			}
			
		}


		//获取自己发送的博客
		public  ArrayList<Blog> getBlogs(String sNumber){
			Connection conn=oc.getCon();
			try {
				String sql="select stunumber,text,picture,time from blog where stuNumber=? order by time desc ";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1,sNumber);
				ResultSet rs=ps.executeQuery();
				ArrayList<Blog> allBlogs=new ArrayList<Blog>();
				while(rs.next()){
					String stuNumber=rs.getString("stunumber");
					String blogText=rs.getString("text");
					String pictureUrl=rs.getString("picture");
					java.sql.Timestamp timeStamp=rs.getTimestamp("time");
					Blog blog=new Blog();
					blog.setStuNumber(stuNumber);
					blog.setBlogText(blogText);
					blog.setPictureUrl(pictureUrl);
					blog.setTime(timeStamp);
					allBlogs.add(blog);
				}
				System.out.println("博客列表已生成！");
				return allBlogs;
				
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				return null;
			}
		}
		//提取自己和好友的博客
		public  ArrayList<Blog> getBlog(String sNumber){
			Connection conn=oc.getCon();
			Statement stmt;
			try {
				stmt = conn.createStatement();
				String sql="select stunumber,text,picture,time from blog where stuNumber="
						+" '"+sNumber+"' or stuNumber in(select stuNumber2 from Contacts where stuNumber1 ='"+sNumber+"')"+" order by time desc ";
				ResultSet rs=stmt.executeQuery(sql);
				ArrayList<Blog> allBlogs=new ArrayList<Blog>();
				while(rs.next()){
					String stuNumber=rs.getString("stunumber");
					String blogText=rs.getString("text");
					String pictureUrl=rs.getString("picture");
					java.sql.Timestamp timeStamp=rs.getTimestamp("time");
					Blog blog=new Blog();
					blog.setStuNumber(stuNumber);
					blog.setBlogText(blogText);
					blog.setPictureUrl(pictureUrl);
					blog.setTime(timeStamp);
					allBlogs.add(blog);
				}
				System.out.println("博客列表已生成！");
				return allBlogs;
				
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				return null;
			}
		}
		//修改个人资料
		public boolean modifyPerProfile(User user,String stuNumber)
		{
			try {
				Connection	conn = oc.getCon();
				String sql = "update UserStu " +
						" set sex=?,age=?,major=?,grade=?,hobby=? where stuNumber=?";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, user.getSex());
				ps.setInt(2, user.getAge());
				ps.setString(3,user.getMajor());
				ps.setString(4,user.getGrade());
				ps.setString(5,user.getHobby());
				ps.setString(6, stuNumber);
				ps.execute();
				System.out.println("个人资料修改成功！");
				ps.close();
				return true;
			} catch (SQLException e) {
				System.out.println("个人资料修改失败！");
				e.printStackTrace();
				return false;
			}
		}
		
		//修改密码
		public boolean modifyPassword(String password,String stuNumber)
		{
			try {
				Connection	conn = oc.getCon();
				String sql = "update UserStu " +
						" set password=? where stuNumber=?";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, password);
				ps.setString(2, stuNumber);
				ps.execute();
				System.out.println("密码修改成功！");
				return true;
			} catch (SQLException e) {
				System.out.println("密码修改失败！");
				e.printStackTrace();
				return false;
			}
		}
		//查询原来密码
		public String searchPass(String stuNumber)
		{
			try {
				Connection	conn = oc.getCon();
				String sql = "select password from UserStu " +
						" where stuNumber=? ";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1,stuNumber);
				ResultSet rs = ps.executeQuery();
				String password = "";
				while(rs.next())
				{
					password = rs.getString("password");
				}
				System.out.println("查询密码成功！");
				return password;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("查询密码失败！");
				e.printStackTrace();
				return null;
			}
		}
		//查询原来学生姓名
		public String searchName(String stuNumber)
		{
			try {
				Connection	conn = oc.getCon();
				String sql = "select stuName from UserStu " +
						" where stuNumber=? ";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1,stuNumber);
				ResultSet rs = ps.executeQuery();
				String stuName = "";
				while(rs.next())
				{
					stuName = rs.getString("stuName");
				}
				System.out.println("查询学生姓名成功！");
				return stuName;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("查询学生姓名失败！");
				e.printStackTrace();
				return null;
			}
		}
		
		/**
		 * 得到帖子   按最新回复日期排序排序
		 */
		public ArrayList<Frog> getFrogs(String type){

			//首先得到所有的帖子数量
			ArrayList<Frog> al = new ArrayList<Frog>() ;
			try{
				String sql = "select * from Frog where type=? order by frogDate desc" ;
				Connection	conn = oc.getCon();
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, type);
				ResultSet rs=ps.executeQuery();
				System.out.println(sql);
				while(rs.next()){
					String frogNumber = rs.getString("frogNumeber");
					String frogTitle = rs.getString("frogTitle");
					String frogContent = rs.getString("frgContent");
					java.sql.Timestamp frogDate = rs.getTimestamp("frogDate");
					int replyContent = rs.getInt("replyCcount");
					String stuNumber  = rs.getString("stuNumber");
					java.sql.Timestamp newReply = rs.getTimestamp("newReply");
					Frog frog = new Frog();
					frog.setFrogNumber(frogNumber);
					frog.setForgTitle(frogTitle);
					frog.setFrogContent(frogContent);
					frog.setFrogDate(frogDate);
					frog.setReplyCount(replyContent);
					frog.setStuNumber(stuNumber);
					frog.setNewReply(newReply);
					frog.setType(type);
					al.add(frog);
				}
				return al;
			}catch(Exception ex){
			  return null ;
			}	
	
			
		}
			
		/**
		 * 得到某一个帖子详细信息
		 */
		public Frog getFrog(String frogNumber){
			
			String sql ="select * from Frog where frogNumeber = ?";
			try{
				System.out.println("bwueihweuibu");
				Connection	conn = oc.getCon();
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, frogNumber);
				ResultSet rs=ps.executeQuery();
				Frog frog = new Frog();
				if(rs.next()){
					String frogTitle = rs.getString("frogTitle");
					String frogContent = rs.getString("frgContent");
					java.sql.Timestamp frogDate = rs.getTimestamp("frogDate");
					int replyContent = rs.getInt("replyCcount");
					String stuNumber  = rs.getString("stuNumber");
					java.sql.Timestamp newReply = rs.getTimestamp("newReply");
					String type = rs.getString("type");
					frog.setFrogNumber(frogNumber);
					frog.setForgTitle(frogTitle);
					frog.setFrogContent(frogContent);
					frog.setFrogDate(frogDate);
					frog.setReplyCount(replyContent);
					frog.setStuNumber(stuNumber);
					frog.setNewReply(newReply);
					frog.setType(type);
				}
				return frog;
				
			}catch(Exception ex){
				return null;
			}	
		}
		/**
		 * 得到某个帖子的回复信息
		 */
		public ArrayList<FrogReply> getReply(String frogNumber){
			ArrayList<FrogReply> al = null ;
			String sql = "select * from FrogReply where frogNumeber=? order by replyDate desc" ;
			try{
				Connection	conn = oc.getCon();
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, frogNumber);
				ResultSet rs=ps.executeQuery();
				al = new ArrayList<FrogReply>() ;
				while(rs.next()){
					FrogReply reply = new FrogReply();
					reply.setFrogNumber(frogNumber);
					reply.setStuNumber(rs.getString("stuNumber"));
					reply.setReplyContent(rs.getString("replyContent"));
					reply.setReplyDate(rs.getTimestamp("replyDate"));
					al.add(reply) ;
				}
	 			return al;
			}catch(Exception ex){
				return null;
			}
		}
		/**
		 * 添加回复
		 */
		public boolean addReply(FrogReply reply){
			boolean flag  = false ;
			try{
				//插入新的回复
				String sql="insert into frogReply values(?,?,?,?)" ;
				Connection conn=oc.getCon();
				PreparedStatement ps=conn.prepareStatement(sql);
				ps.setString(1, reply.getFrogNumber());
				ps.setString(2,reply.getStuNumber());
				ps.setString(3, reply.getReplyContent());
				ps.setTimestamp(4,reply.getReplyDate());
				ps.execute();
				ps.close() ;
				flag = true;
				return flag;
			}catch(Exception ex){
				return flag ;
			}
		}
		/**
		 * 添加新的帖子
		 */
		public boolean addFrog(Frog frog){
			String sql = "insert into frog values(frog_number.nextval,?,?,?,0,?,?,?)" ;
			try{
				Connection conn=oc.getCon();
				PreparedStatement ps=conn.prepareStatement(sql);
				ps.setString(1,frog.getForgTitle());
				ps.setString(2, frog.getFrogContent());
				ps.setTimestamp(3, frog.getFrogDate());
				ps.setString(4, frog.getStuNumber());
				ps.setTimestamp(5, frog.getNewReply());
				ps.setString(6, frog.getType());
				ps.execute();
				return true;
			}catch(Exception ex){
				return false ;
			}
		}
		/**
		 * 获取回复帖子的人数
		 */
		public int replyCount(String frogNumber)
		{
			int count = 0;
			String sql = "select count(*) from FrogReply where frogNumeber=?" ;
			try{
				Connection	conn = oc.getCon();
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, frogNumber);
				ResultSet rs=ps.executeQuery();
				rs.next() ;
				count = rs.getInt(1) ;
	 			return count;
			}catch(Exception ex){
				return count;
			}
		}
		
		//修改个人资料
		public boolean modifyHead(String stuNumber,String head)
		{
			try {
				Connection	conn = oc.getCon();
				String sql = "update UserStu " +
								" set headPostrait=? where stuNumber=?";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1,head);
				ps.setString(2, stuNumber);
				ps.execute();
				System.out.println(sql);
				System.out.println("头像修改成功！");
				ps.close();
				return true;
				} catch (SQLException e) {
				System.out.println("头像修改失败！");
				e.printStackTrace();
				return false;
			}
		}
}