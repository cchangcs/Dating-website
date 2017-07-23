package LinkedIn.Login.JavaBean;
/**
 * ²©¿Í±í
 * @author Seavan_CC
 *
 */
public class Blog {
	private String stuNumber;
	private String blogText;
	private String pictureUrl;
	private java.sql.Timestamp time;
	public Blog(){}
	public String getStuNumber() {
		return stuNumber;
	}
	public void setStuNumber(String stuNumber) {
		this.stuNumber = stuNumber;
	}
	public String getBlogText() {
		return blogText;
	}
	public void setBlogText(String blogText) {
		this.blogText = blogText;
	}
	public String getPictureUrl() {
		return pictureUrl;
	}
	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}
	public java.sql.Timestamp getTime() {
		return time;
	}
	public void setTime(java.sql.Timestamp time) {
		this.time = time;
	}


	

}
