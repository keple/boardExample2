package org.exBoard.domain;

public class Pager {

	private int start;
	private int end;
	private int curPage;
	private int tempEnd;
	private boolean prev;
	private boolean next;
	private Criteria cri;
	private int total;
	private int pageSize;
	public Pager(Criteria cri,int total){
		this.cri = cri;
		this.total = total;
		this.pageSize = 10;
		this.curPage = cri.getPageNum();
		calcPage();
	}
	
	private void calcPage(){
		int tempEnd = (int)Math.ceil(this.cri.getPageNum()/(pageSize/1.0))*pageSize;
		this.start = tempEnd-(cri.getSize()-1);
		this.end = tempEnd*this.cri.getSize() > this.total?(int)(Math.ceil(this.total/(double)this.cri.getSize())):tempEnd;
		this.prev = this.start ==1?false:true;
		this.next = this.total>this.end * this.cri.getSize()?true:false;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getTempEnd() {
		return tempEnd;
	}

	public void setTempEnd(int tempEnd) {
		this.tempEnd = tempEnd;
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

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	@Override
	public String toString() {
		return "Pager [start=" + start + ", end=" + end + ", curPage=" + curPage + ", tempEnd=" + tempEnd + ", prev="
				+ prev + ", next=" + next + ", cri=" + cri + ", total=" + total + ", pageSize=" + pageSize + "]";
	}
	
}
