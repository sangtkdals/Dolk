package dolk.bean;

public class PostBean {
	
	private int pid; // post_id == p(post|게시글) + @
	private int bid; // board_id == b(board|게시판) + @
	private String mid;	// m_id == m(member|작성자) + @
	private String contents; // content_md == contents (본문 내용)
	private String title; // 제목
	private String visibility; // 글 공개범위
	private int vcount; // view_count == v(view|조회수) + @
	private int lcount; // like_count == l(like|좋아요수) + @
	private int ccount; // comment_count == c(comment|댓글수) + @
	
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getAid() {
		return mid;
	}
	public void setAid(String aid) {
		this.mid = aid;
	}
	public String getCmd() {
		return contents;
	}
	public void setCmd(String cmd) {
		this.contents = cmd;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getVisibility() {
		return visibility;
	}
	public void setVisibility(String visibility) {
		this.visibility = visibility;
	}
	public int getVcount() {
		return vcount;
	}
	public void setVcount(int vcount) {
		this.vcount = vcount;
	}
	public int getLcount() {
		return lcount;
	}
	public void setLcount(int lcount) {
		this.lcount = lcount;
	}
	public int getCcount() {
		return ccount;
	}
	public void setCcount(int ccount) {
		this.ccount = ccount;
	}
	
}
