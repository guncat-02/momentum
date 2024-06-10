package vo;

import java.util.List;

public class LoveVO {
	private int no; //좋아요 한 글 번호
	private int c_no; //좋아요 한 댓글 번호
	
	//getter
	public int getNo() {
		return no;
	}
	public int getC_no() {
		return c_no;
	}
	
	//setter
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public void setNo(int no) {
		this.no = no;
	}
}
