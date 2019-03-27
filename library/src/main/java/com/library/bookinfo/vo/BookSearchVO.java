package com.library.bookinfo.vo;

import java.io.Serializable;

/**
 * @author yeoni94
 */
public class BookSearchVO implements Serializable{

	private static final long serialVersionUID = -8822311920090847425L;

	private String searchCondition1;
	
	private String searchKeyword1;
	
	private String andOrCondition1;
	
	private String searchCondition2;
	
	private String searchKeyword2;
	
	private String andOrCondition2;	
	
	private String searchCondition3;
	
	private String searchKeyword3;	
	
	private String type;
	
	private String year1;
	
	private String year2;
	
	private String integratedSearchKeyword;

	private int bseq;
	
	public String getSearchCondition1() {
		return searchCondition1;
	}

	public void setSearchCondition1(String searchCondition1) {
		this.searchCondition1 = searchCondition1;
	}

	public String getSearchKeyword1() {
		return searchKeyword1;
	}

	public void setSearchKeyword1(String searchKeyword1) {
		this.searchKeyword1 = searchKeyword1;
	}

	public String getAndOrCondition1() {
		return andOrCondition1;
	}

	public void setAndOrCondition1(String andOrCondition1) {
		this.andOrCondition1 = andOrCondition1;
	}

	public String getSearchCondition2() {
		return searchCondition2;
	}

	public void setSearchCondition2(String searchCondition2) {
		this.searchCondition2 = searchCondition2;
	}

	public String getSearchKeyword2() {
		return searchKeyword2;
	}

	public void setSearchKeyword2(String searchKeyword2) {
		this.searchKeyword2 = searchKeyword2;
	}

	public String getAndOrCondition2() {
		return andOrCondition2;
	}

	public void setAndOrCondition2(String andOrCondition2) {
		this.andOrCondition2 = andOrCondition2;
	}

	public String getSearchCondition3() {
		return searchCondition3;
	}

	public void setSearchCondition3(String searchCondition3) {
		this.searchCondition3 = searchCondition3;
	}

	public String getSearchKeyword3() {
		return searchKeyword3;
	}

	public void setSearchKeyword3(String searchKeyword3) {
		this.searchKeyword3 = searchKeyword3;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getYear1() {
		return year1;
	}

	public void setYear1(String year1) {
		this.year1 = year1;
	}

	public String getYear2() {
		return year2;
	}

	public void setYear2(String year2) {
		this.year2 = year2;
	}

	public String getIntegratedSearchKeyword() {
		return integratedSearchKeyword;
	}

	public void setIntegratedSearchKeyword(String integratedSearchKeyword) {
		this.integratedSearchKeyword = integratedSearchKeyword;
	}

	public int getBseq() {
		return bseq;
	}

	public void setBseq(int bseq) {
		this.bseq = bseq;
	}

}
