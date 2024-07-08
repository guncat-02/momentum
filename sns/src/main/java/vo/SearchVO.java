package vo;

public class SearchVO {
	private String keyWord; //검색어
	private String keyType; //검색 종류
	private int keyResult; //결과 수
	
	//getter
	public String getKeyWord() {
		return keyWord;
	}
	public String getKeyType() {
		return keyType;
	}
	public int getKeyResult() {
		return keyResult;
	}
	
	//setter
	public void setKeyType(String keyType) {
		this.keyType = keyType;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	public void setKeyResult(int keyResult) {
		this.keyResult = keyResult;
	}
}
