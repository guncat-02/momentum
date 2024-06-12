package vo;

public class MainVO {
	private int no; //글번호
	private int re_no; //리포스트 번호
	private String cont; //글 내용
	private int show; //조회수
	private int loveCnt; //좋아요 수
	private String filename; //첨부 파일
	private int privacy; //글 공개 여부
	private String followId; //팔로우 한 id
	private String id; //사용자를 팔로우한 id
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getRe_no() {
		return re_no;
	}
	public void setRe_no(int re_no) {
		this.re_no = re_no;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public int getShow() {
		return show;
	}
	public void setShow(int show) {
		this.show = show;
	}
	public int getLoveCnt() {
		return loveCnt;
	}
	public void setLoveCnt(int loveCnt) {
		this.loveCnt = loveCnt;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getPrivacy() {
		return privacy;
	}
	public void setPrivacy(int privacy) {
		this.privacy = privacy;
	}
	public String getFollowId() {
		return followId;
	}
	public void setFollowid(String followId) {
		this.followId = followId;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}
