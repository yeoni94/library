package com.library.user.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @author yeoni94
 */
public class UserVO implements Serializable{

	private static final long serialVersionUID = -3489913404893654846L;
	
	/**
	 * 이용자 시퀀스
	 */
	private int useq;
	
	/**
	 * 이용자 등급
	 */
	private String grade;
	
	/**
	 * 아이디
	 */
	private String id;
	
	/**
	 * 비밀번호 정답
	 */
	private String pw;
	
	/**
	 * 입력한 비밀번호
	 */
	private String enterPw;
	
	/**
	 * 이름
	 */
	private String name;
	
	/**
	 * 생년월일
	 */
	private Date birth;

	/**
	 * 연락처
	 */
	private String phone;
	
	/**
	 * 이메일
	 */
	private String email;
	
	/**
	 * 이용자 패널티
	 */
	private int penalty;
	
	/**
	 * 생성자
	 */
	private String createUser;
	
	/**
	 * 생성일
	 */
	private Date createDate;
	
	/**
	 * 수정자
	 */
	private String updateUser;
	
	/**
	 * 수정일
	 */
	private Date updateDate;
	
	/**
	 * 가입 승인 여부
	 */
	private String registApprove;
	
	private List<UserVO> userVOList;
	
	public List<UserVO> getUserVOList() {
		return userVOList;
	}

	public void setUserVOList(List<UserVO> userVOList) {
		this.userVOList = userVOList;
	}

	public int getUseq() {
		return useq;
	}

	public void setUseq(int useq) {
		this.useq = useq;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getEnterPw() {
		return enterPw;
	}

	public void setEnterPw(String enterPw) {
		this.enterPw = enterPw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPenalty() {
		return penalty;
	}

	public void setPenalty(int penalty) {
		this.penalty = penalty;
	}

	public String getCreateUser() {
		return createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getUpdateUser() {
		return updateUser;
	}

	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getRegistApprove() {
		return registApprove;
	}

	public void setRegistApprove(String registApprove) {
		this.registApprove = registApprove;
	}
	
}

