package vo;

public class ReportVO {
	private int no; //글 번호
	private String id; // 작성자
	private String reportId; // 신고자
	private String r_date; // 신고날짜
	private String r_loc; // 신고 위치
	private String st_type; // 신고 사유
	private String nd_type; // 사유 2
	private String r_cont; // 신고 내용
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getReportId() {
		return reportId;
	}
	public void setReportId(String reportId) {
		this.reportId = reportId;
	}
	public String getSt_type() {
		return st_type;
	}
	public void setSt_type(String st_type) {
		this.st_type = st_type;
	}
	public String getNd_type() {
		return nd_type;
	}
	public void setNd_type(String nd_type) {
		this.nd_type = nd_type;
	}
	public String getR_cont() {
		return r_cont;
	}
	public void setR_cont(String r_cont) {
		this.r_cont = r_cont;
	}
	public String getR_loc() {
		return r_loc;
	}
	public void setR_loc(String r_loc) {
		this.r_loc = r_loc;
	}
	public String getR_date() {
		return r_date;
	}
	public void setR_date(String r_date) {
		this.r_date = r_date;
	}

	
}
