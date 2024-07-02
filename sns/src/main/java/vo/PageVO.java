package vo;

public class PageVO {
	private int startNo;			// 페이지에서 글 시작 번호.. 튜플의 시작번호
	private int endNo;				// 페이지에서 글 끝 번호.. 튜플의 끝..
	private int perPageNum=20;		// 페이지 당 출력될 튜플 수, 표시될 페이지 수
	//현재 페이지 번호
	private Integer page;			// Integer 웹에서 받은 페이지 정보(String)가 없으면 null인데 int는 null을 저장할 수 없다. 오류방지
	private int totalCount;
	//page, totalCount, perPageNum 3개 변수로 startNo, endNo 값 계산
	
	
	private int endPage;			//페이지가 속한 그룹의 끝 페이지 번호
	private int startPage;			//페이지가 속한 그룹의 시작페이지 번
	private boolean prev;
	private boolean next;
	// 검색용 변수 추가
	private String searchType;
	private String searchWord;
	private String searchLoc;
	private String stDate;
	private String ndDate;


	@Override
	public String toString() {
		return "PageVO [startNo=" + startNo + ", endNo=" + endNo + ", perPageNum=" + perPageNum + ", page=" + page
				+ ", totalCount=" + totalCount + ", endPage=" + endPage + ", startPage=" + startPage + ", prev=" + prev
				+ ", next=" + next + ",\nsearchType=" + searchType + ", searchWord=" + searchWord + ", searchLoc="
				+ searchLoc + "]";
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
	public String getSearchLoc() {
		return searchLoc;
	}
	public void setSearchLoc(String searchLoc) {
		this.searchLoc = searchLoc;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

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

	private void calcPage() {
		// DB쿼리에서 사용... 시작데이터번호 = (jsp클릭한 페이지번호-1)*페이지당 보여지는 개수
		startNo = (this.page - 1) * perPageNum +1;  // 6페이지 일 경우 시작글번호가 50부터..
		// page변수는 현재 jsp에서 클릭한 페이지번호
		int tempEnd = (int) (Math.ceil(page / (double) this.perPageNum) * this.perPageNum);
		                                // 6/10=0.6  > 1   10
		                                // 11/10=1.1  > 2   20
		// ceil함수는 천장 함수로 1.1 = 2, 2.1 = 3 으로 출력된다.
		// 반대되는 바닥함수로 floor(), 반올림 함수로 round()가 있다.
		// jsp에서 클릭한 페이지번호를 기준으로 끝 페이지를 계산한다.
		this.startPage = (tempEnd - this.perPageNum) + 1;
		        // 6       10   -  10 + 1  >>   1
		        // 11      20   -  10 + 1  >>  11
		// 시작 페이지 계산 클릭한page번호 10일때 까지 시작페이지는 1
		if (tempEnd * this.perPageNum > this.totalCount) {
			// 클릭한 page번호로 계산된 게시물수가 실제게시물개수 totalCount 클때
			this.endPage = (int) Math.ceil(this.totalCount / (double) this.perPageNum);
			//this.endNo = startNo + this.perPageNum - 1;	
			if(endPage!=page) {
				this.endNo = startNo + this.perPageNum - 1;	
			} else {
//				this.endNo = startNo + this.totalCount % 10 - 1;
				this.endNo = this.totalCount;
			}
		} else {
			// 클릭한 page번호로 계산된 게시물수가 실제게시물개수 totalCount 작을때
			this.endPage = tempEnd;
			this.endNo = startNo + this.perPageNum - 1;
			//this.endNo = startNo + this.totalCount % 10 - 1;
		}
		
		this.prev = this.startPage != 1;// 시작페이지 1보다 크면 무조건 이전 페이지가 있음. true
		this.next = this.endPage * this.perPageNum < this.totalCount;
		// 클릭한 page번호로 계산된 게시물수가 실제 게시물 개수보다 작다면 다음페이지가 있음. true
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcPage();// totalCount 전제게시물개수가 있어야지 페이지계산을 할 수 있기 때문에
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public int getStartNo() {

		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
}
