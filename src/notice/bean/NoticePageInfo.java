package notice.bean;

public class NoticePageInfo {
	
	private int page;
	private int maxPage;
	private int startPage;
	private int endPage;
	private int listCount;
	private String noticeSearch;
	
	public int getPage() {
		return page;
	}
	
	public void setPage(int page) {
		this.page = page;
	}
	
	public int getMaxPage() {
		return maxPage;
	}
	
	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}
	
	public int getStartPage() {
		return startPage;
	}
	
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	
	public int getEndPage() {
		return endPage;
	}
	
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	public int getListCount() {
		return listCount;
	}
	
	public void setListCount(int listCount) {
		this.listCount = listCount;
	}
	public String getNoticeSearch() {
		return noticeSearch;
	}
	public void setNoticeSearch(String noticeSearch) {
		this.noticeSearch = noticeSearch;
	}

}
