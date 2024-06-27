package vo;

import java.util.Arrays;

public class PostVO {
	private int no; //글번호
	private int re_no; //리포스트 번호
	private String cont; //글 내용
	private int show; //조회수
	private String[] filename; //첨부 파일
	private int privacy; //글 공개 여부
	private int c_block; //댓글 차단 여부
	private String id; //작성자 id
	private String p_date; //글 작성일
	
	//getter
	public int getNo() {
		return no;
	}
	public int getRe_no() {
		return re_no;
	}
	public String getCont() {
		return cont;
	}
	public int getShow() {
		return show;
	}
	public String[] getFilename() {
		return filename;
	}
	public int getPrivacy() {
		return privacy;
	}
	public int getC_block() {
		return c_block;
	}
	public String getP_date() {
		return p_date;
	}
	public String getId() {
		return id;
	}
	
	//setter
	public void setNo(int no) {
		this.no = no;
	}
	public void setRe_no(int re_no) {
		this.re_no = re_no;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public void setShow(int show) {
		this.show = show;
	}
	public void setFilename(String[] filename) {
		this.filename = filename;
	}
	public void setPrivacy(int privacy) {
		this.privacy = privacy;
	}
	public void setC_block(int c_block) {
		this.c_block = c_block;
	}
	public void setP_date(String p_date) {
		this.p_date = p_date;
	}
	public void setId(String id) {
		this.id = id;
	}
}
