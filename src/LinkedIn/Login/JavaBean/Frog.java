package LinkedIn.Login.JavaBean;
/**
 * ª∞Ã‚¿‡
 * @author Seavan_CC
 *
 */
public class Frog {
	private String frogNumber;
	private String forgTitle;
	private String frogContent;
	private java.sql.Timestamp frogDate;
	private int replyCount;
	private String stuNumber;
	private java.sql.Timestamp newReply;
	private String type;
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Frog()
	{
		
	}

	public String getFrogNumber() {
		return frogNumber;
	}

	public void setFrogNumber(String frogNumber) {
		this.frogNumber = frogNumber;
	}

	public String getForgTitle() {
		return forgTitle;
	}

	public void setForgTitle(String forgTitle) {
		this.forgTitle = forgTitle;
	}

	public String getFrogContent() {
		return frogContent;
	}

	public void setFrogContent(String frogContent) {
		this.frogContent = frogContent;
	}

	public java.sql.Timestamp getFrogDate() {
		return frogDate;
	}

	public void setFrogDate(java.sql.Timestamp frogDate) {
		this.frogDate = frogDate;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	public String getStuNumber() {
		return stuNumber;
	}

	public void setStuNumber(String stuNumber) {
		this.stuNumber = stuNumber;
	}

	public java.sql.Timestamp getNewReply() {
		return newReply;
	}

	public void setNewReply(java.sql.Timestamp newReply) {
		this.newReply = newReply;
	}
}
