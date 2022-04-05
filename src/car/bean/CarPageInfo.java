package car.bean;

public class CarPageInfo {
	
	private int page;
	private int maxPage;
	private int startPage;
	private int endPage;
	private int listCount;
	private String fieldName;	
    private String word;

    
    
	public String getFieldName() {
		return fieldName;
	}
	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}

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

}
