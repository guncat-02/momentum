package vo;

public class CommVO {
	private int c_no; //댓글 번호
	private int no; //글 번호
	private String c_cont; // 댓글 내용
	
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
}
