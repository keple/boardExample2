package org.exBoard.domain;

import java.util.Arrays;

public class Criteria {
	private int pageNum;
	private int size;
	private int option;
	private String type;
	private String keyword;
	private String[] types;
	public Criteria(){
		this.pageNum=1;
		this.size=10;
		this.keyword="";
		this.type="x";
	}
	public Criteria(int pageNum,int size, String type,String keyword){
		this.pageNum = pageNum;
		this.size = size;
		this.type=type;
		this.keyword=keyword;
	}
	public int getSkip(){
		return (this.pageNum-1)*this.size;
	}
	
	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public int getOption() {
		return option;
	}
	public void setOption(int option) {
		this.option = option;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public String[] getTypes() {
		return types;
	}
	public void setTypes(String[] types) {
		this.types = types;
	}
	@Override	
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", size=" + size + ", option=" + option + ", type=" + type
				+ ", keyword=" + keyword + ", types=" + Arrays.toString(types) + "]";
	}
	

	
	
}
