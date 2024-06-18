package vo;

public class CommVO {
	private int c_no; //댓글 번호
	private int no; //글 번호
	private String c_cont; // 댓글 내용
	private String c_date; //댓글 날짜
	
	//getter
	public int getC_no() {
		return c_no;
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
	
	//setter
	public void setC_cont(String c_cont) {
		this.c_cont = c_cont;
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
}
