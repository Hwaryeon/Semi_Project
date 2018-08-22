package com.kh.sp.admin.model.vo;

public class PageInfo implements java.io.Serializable{
	private int currentPage;
	private int listCount;
	private int limit;
	private int maxPage;
	private int statPage;
	private int endPage;
	
	public PageInfo() {}

	public PageInfo(int currentPage, int listCount, int limit, int maxPage, int statPage, int endPage) {
		super();
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.limit = limit;
		this.maxPage = maxPage;
		this.statPage = statPage;
		this.endPage = endPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getStatPage() {
		return statPage;
	}

	public void setStatPage(int statPage) {
		this.statPage = statPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	@Override
	public String toString() {
		return "PageInfo [currentPage=" + currentPage + ", listCount=" + listCount + ", limit=" + limit + ", maxPage="
				+ maxPage + ", statPage=" + statPage + ", endPage=" + endPage + "]";
	}
	
}
