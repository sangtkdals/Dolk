package dolk.bean;

public class CommentBean {

	private int cid; // comment_id == c(comment|답변) + @
	private int pid; // post_id == p(post|게시글) + @
	private String mid; // m_id == m(member|작성자) + @
	private String comments; // coment_md == comments (답글 내용)
	private String visibility; // 글 공개범위
	private int lcount; // like_count == l(like|좋아요수) + @
	
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getVisibility() {
		return visibility;
	}
	public void setVisibility(String visibility) {
		this.visibility = visibility;
	}
	public int getLcount() {
		return lcount;
	}
	public void setLcount(int lcount) {
		this.lcount = lcount;
	} 
}
