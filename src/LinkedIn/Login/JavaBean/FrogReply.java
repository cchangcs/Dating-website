package LinkedIn.Login.JavaBean;
/**
 * »Ø¸´±í
 */
import java.sql.SQLClientInfoException;

public class FrogReply {
	private String frogNumber;
	private String stuNumber;
	private String replyContent;
	private java.sql.Timestamp replyDate;
	public FrogReply()
	{
		
	}
	public String getFrogNumber() {
		return frogNumber;
	}
	public void setFrogNumber(String frogNumber) {
		this.frogNumber = frogNumber;
	}
	public String getStuNumber() {
		return stuNumber;
	}
	public void setStuNumber(String stuNumber) {
		this.stuNumber = stuNumber;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public java.sql.Timestamp getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(java.sql.Timestamp replyDate) {
		this.replyDate = replyDate;
	}
	
}
