package com.pickmepetme.domain;


public class PageVO {

	private Criteria cri; //pageNum , amount
	private int total; // 총 페이지 수
	private boolean prev , next; // 이전 , 다음
	private int startPage;
	private int endPage;
	
	public Criteria getCri() {
		return cri;
	}
	
	public int getTotal() {
		return total;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	@Override
	public String toString() {
		return "PageVO [cri=" + cri + ", total=" + total + ", prev=" + prev + ", next=" + next + ", startPage="
				+ startPage + ", endPage=" + endPage + "]";
	}

	public PageVO (Criteria cri , int total) {
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int)(Math.ceil(cri.getPageNum() / 10.0)) * 10;  
		this.startPage = endPage - 9;
		
		int realEnd = (int)(Math.ceil((total * 1.0) / cri.getAmount()));  
		if( realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = realEnd > this.endPage;
		
		
	}


}
