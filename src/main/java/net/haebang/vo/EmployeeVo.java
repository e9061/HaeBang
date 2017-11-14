package net.haebang.vo;

import java.util.Date;

import net.haebang.exception.IdPasswordNotMatchingException;

/**
 * 	직원VO (사장 포함)
 * 
 * @author Jinhwa
 *
 */
public class EmployeeVo {

	
	// c_no 회사 번호참조!
	private int e_no;  //increment
	private String e_id;
	private String e_name;
	private String e_password;
	private int e_phone;
	private String e_type; //default 'E'(직원일경우), 사장 'C'
	private String e_oriName;
	private String e_saveName;
	private Date e_registerDate;  //테이블 추가!,  default now()

	private int c_no;
	
	
	
	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public void changePassword(String oldPassword, String newPassword) {
		
		if(!e_password.equals(oldPassword))
			throw new IdPasswordNotMatchingException();
		this.e_password = newPassword;
		
	}
	
	public boolean matchPassword(String pwd) {
		return this.e_password.equals(pwd);
	}
	
	
	
	public Date getE_registerDate() {
		return e_registerDate;
	}
	public void setE_registerDate(Date e_registerDate) {
		this.e_registerDate = e_registerDate;
	}
	public int getE_no() {
		return e_no;
	}
	public void setE_no(int e_no) {
		this.e_no = e_no;
	}
	public String getE_id() {
		return e_id;
	}
	public void setE_id(String e_id) {
		this.e_id = e_id;
	}
	public String getE_name() {
		return e_name;
	}
	public void setE_name(String e_name) {
		this.e_name = e_name;
	}
	public String getE_password() {
		return e_password;
	}
	public void setE_password(String e_password) {
		this.e_password = e_password;
	}
	public int getE_phone() {
		return e_phone;
	}
	public void setE_phone(int e_phone) {
		this.e_phone = e_phone;
	}
	public String getE_type() {
		return e_type;
	}
	public void setE_type(String e_type) {
		this.e_type = e_type;
	}
	public String getE_oriName() {
		return e_oriName;
	}
	public void setE_oriName(String e_oriName) {
		this.e_oriName = e_oriName;
	}
	public String getE_saveName() {
		return e_saveName;
	}
	public void setE_saveName(String e_saveName) {
		this.e_saveName = e_saveName;
	}

	@Override
	public String toString() {
		return "EmployeeVo [e_no=" + e_no + ", e_id=" + e_id + ", e_name=" + e_name + ", e_password=" + e_password
				+ ", e_phone=" + e_phone + ", e_type=" + e_type + ", e_oriName=" + e_oriName + ", e_saveName="
				+ e_saveName + ", e_registerDate=" + e_registerDate + ", c_no=" + c_no + "]";
	}

	

	
	
	
	
}



