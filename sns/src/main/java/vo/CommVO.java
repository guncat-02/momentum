package vo;

public class CommVO {
	private int c_no; //댓글 번호
	private int no; //글 번호
	private int c_like; // 좋아요 수 // default 0
	private int c_dislike; // 싫어요 수 // default 0
	private String id; // 작성자
	private String c_cont; // 댓글 내용
	private String c_date; //댓글 날짜
	
	//getter
	public int getC_no() {
		return c_no;
	}
	public String getId() {
		return id;
	}
	public int getNo() {
		return no;
	}
	public String getC_cont() {
		return c_cont;
	}
	public String getC_date() {
		return c_date;
	}
	public int getC_like() {
		return c_like;
	}
	public int getC_dislike() {
		return c_dislike;
	}
	
	//setter
	public void setC_cont(String c_cont) {
		this.c_cont = c_cont;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public void setC_date(String c_date) {
		this.c_date = c_date;
	}
	public void setC_like(int c_like) {
		this.c_like = c_like;
	}
	public void setC_dislike(int c_dislike) {
		this.c_dislike = c_dislike;
	}
	
}
