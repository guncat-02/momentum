package vo;

public class PostVO {
	private int no; //글번호
	private int re_no; //리포스트 번호
	private String cont; //글 내용
	private int show; //조회수
	private int loveCnt; //좋아요 수
	private String[] filename; //첨부 파일
	private int privacy; //글 공개 여부
	private int c_block; //댓글 차단 여부
	
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
	public int getLoveCnt() {
		return loveCnt;
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
	public void setLoveCnt(int loveCnt) {
		this.loveCnt = loveCnt;
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
}
