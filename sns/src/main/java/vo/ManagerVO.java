package vo;

public class ManagerVO {

	private String searchLoc; // 검색 위치 (ex.유저, 게시물, ...)
	private String searchType; // 검색 유형 (ex.유저 아이디, 기간, ...)
	private String searchWord; // 검색어
	private String stDate; // 시작 기간 (검색 유형 : 기간 검색 시)
	private String ndDate; // 종료 기간 (검색 유형 : 기간 검색 시)
	
	//getter
	public String getSearchLoc() {
		return searchLoc;
	}
	public String getSearchType() {
		return searchType;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public String getStDate() {
		return stDate;
	}
	public String getNdDate() {
		return ndDate;
	}
	
	//setter
	public void setSearchLoc(String searchLoc) {
		this.searchLoc = searchLoc;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public void setStDate(String stDate) {
		this.stDate = stDate;
	}

	public void setNdDate(String ndDate) {
		this.ndDate = ndDate;
	}

	
	
	
	
}
