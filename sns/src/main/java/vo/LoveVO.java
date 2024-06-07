package vo;

import java.util.List;

public class LoveVO {
	private List<String> no; //좋아요 한 글 번호
	private List<String> c_no; //좋아요 한 댓글 번호
	
	//getter
	public List<String> getNo() {
		return no;
	}
	public List<String> getC_no() {
		return c_no;
	}
	
	//setter
	public void setC_no(List<String> c_no) {
		this.c_no = c_no;
	}
	public void setNo(List<String> no) {
		this.no = no;
	}
}
