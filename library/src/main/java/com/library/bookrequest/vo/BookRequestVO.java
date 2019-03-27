package com.library.bookrequest.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @author yeoni94
 */
public class BookRequestVO implements Serializable{

	private static final long serialVersionUID = 4385046123483097627L;

    /**
     * 희망 도서 신청 시퀀스 	
     */
	private int rseq;
	
	/**
	 * id
	 */
	private String id;
	
	/**
	 * 서명
	 */
	private String title;
	
	/**
	 * 저자
	 */
	private String writer;
	
	/**
	 * 출판사
	 */
	private String publisher;
	
	/**
	 * 출판일
	 */
	private Date publish_date;
	
	/**
	 * ISBN
	 */
	private String isbn;
	
	/**
	 * ISSN
	 */
	private String issn;
	
	/**
	 * 신청 이유
	 */
    private String request_reason;
    
    /**
     * 처리 상태
     */
    private String state;
    
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
	
	/**
	 * 신청 승인 여부
	 */
	private String registApprove;
	
	private List<BookRequestVO> bookRequestVOList;
	
	public List<BookRequestVO> getBookRequestVOList() {
		return bookRequestVOList;
	}

	public void setBookRequestVOList(List<BookRequestVO> bookRequestVOList) {
		this.bookRequestVOList = bookRequestVOList;
	}

	public int getRseq() {
		return rseq;
	}

	public void setRseq(int rseq) {
		this.rseq = rseq;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public Date getPublish_date() {
		return publish_date;
	}

	public void setPublish_date(Date publish_date) {
		this.publish_date = publish_date;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	
	public String getIssn() {
		return issn;
	}

	public void setIssn(String issn) {
		this.issn = issn;
	}	

	public String getRequest_reason() {
		return request_reason;
	}

	public void setRequest_reason(String request_reason) {
		this.request_reason = request_reason;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
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
	
	public String getRegistApprove() {
		return registApprove;
	}

	public void setRegistApprove(String registApprove) {
		this.registApprove = registApprove;
	}	
}
