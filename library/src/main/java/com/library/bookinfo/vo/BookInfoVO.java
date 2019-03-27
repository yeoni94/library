package com.library.bookinfo.vo;

import java.io.Serializable;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

/**
 * @author yeoni94
 */
public class BookInfoVO implements Serializable{

	private static final long serialVersionUID = 2837956665365520372L;

	/**
	 * 도서 정보 시퀀스
	 */
	private int bseq;
	
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
	 * 자료 유형
	 */
	private String type;
	
	/**
	 * 청구 기호
	 */
	private String call_number;
	
	/**
	 * 자료 위치
	 */
	private String location;
	
	/**
	 * 대출 상태
	 */
	private String state;
	
	/**
	 * 이미지
	 */
	private String image;
	
	/**
	 * 반납 예정일
	 */
	private Date return_date;
	
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
	 * 이미지
	 */
    private MultipartFile file;
	
	
	public int getBseq() {
		return bseq;
	}

	public void setBseq(int bseq) {
		this.bseq = bseq;
	}

	public String getBnum() {
		return bnum;
	}

	public void setBnum(String bnum) {
		this.bnum = bnum;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCall_number() {
		return call_number;
	}

	public void setCall_number(String call_number) {
		this.call_number = call_number;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Date getReturn_date() {
		return return_date;
	}

	public void setReturn_date(Date return_date) {
		this.return_date = return_date;
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

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
}
