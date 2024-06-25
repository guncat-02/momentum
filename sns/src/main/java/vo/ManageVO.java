package vo;

public class ManageVO {

	private String searchType;
	private String searchWord;
	private String stDate;
	private String ndDate;
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public String getStDate() {
		return stDate;
	}
	public void setStDate(String stDate) {
		this.stDate = stDate;
	}
	public String getNdDate() {
		return ndDate;
	}
	public void setNdDate(String ndDate) {
		this.ndDate = ndDate;
	}
	@Override
	public String toString() {
		return "ManageVO [searchType=" + searchType + ", searchWord=" + searchWord + ", stDate=" + stDate + ", ndDate="
				+ ndDate + "]";
	}
	
	
	
	
}
