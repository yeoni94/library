package com.library.bookhistory.vo;

import java.io.Serializable;
import java.util.Date;

/**
 * @author yeoni94
 */
public class BookHistoryVO implements Serializable{

	private static final long serialVersionUID = 175629421610312512L;

	/**
	 * 도서 대출 기록 시퀀스
	 */
	private int hseq;
	
	/**
	 * 등록 번호
	 */
	private String bnum;
	
	/**
	 * 서명
	 */
	private String title;
	
	/**
	 * 저자
	 */
	private String writer;
	
	/**
	 * 아이디
	 */
	private String id;
	
	/**
	 * 대출일
	 */
	private Date out_day;
	
	/**
	 * 반납 예정일
	 */
	private Date will_day;
	
	/**
	 * 반납일
	 */
	private Date in_day;
	
	/**
	 * 생성자
	 */
	private String create_user;
	
	/**
	 * 생성일
	 */
	private Date create_date;
	
	/**
	 * 수정자
	 */
	private String update_user;
	
	/**
	 * 수정일
	 */
	private Date update_date;

	public int getHseq() {
		return hseq;
	}

	public void setHseq(int hseq) {
		this.hseq = hseq;
	}

	public String getBnum() {
		return bnum;
	}

	public void setBnum(String bnum) {
		this.bnum = bnum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getOut_day() {
		return out_day;
	}

	public void setOut_day(Date out_day) {
		this.out_day = out_day;
	}

	public Date getWill_day() {
		return will_day;
	}

	public void setWill_day(Date will_day) {
		this.will_day = will_day;
	}

	public Date getIn_day() {
		return in_day;
	}

	public void setIn_day(Date in_day) {
		this.in_day = in_day;
	}

	public String getCreate_user() {
		return create_user;
	}

	public void setCreate_user(String create_user) {
		this.create_user = create_user;
	}

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}

	public String getUpdate_user() {
		return update_user;
	}

	public void setUpdate_user(String update_user) {
		this.update_user = update_user;
	}

	public Date getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

}
