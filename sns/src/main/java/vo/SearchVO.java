package vo;

public class SearchVO {
	private String keyWord; //검색어
	private String keyType; //검색 종류
	
	//getter
	public String getKeyWord() {
		return keyWord;
	}
	public String getKeyType() {
		return keyType;
	}
	
	//setter
	public void setKeyType(String keyType) {
		this.keyType = keyType;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
}
