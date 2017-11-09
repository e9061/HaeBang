package net.haebang.vo;

import java.util.Date;


public class CompanyVo {

	private int c_no;
	private String c_name;
	private String c_address;
	private int c_phone;
	private Date c_signDate;  // default now()
	private Date c_regDate;   // 처음엔 null이지만, 관리자 승인시 날짜가 들어가면 정회원 
	private int c_bizNo;
	private int c_accNo;
	private String c_bank;
	private String c_oriName;
	private String c_saveName;
	private String c_code;	// 부여된 난수code를 통해서 직원들 인증! 

	
	
	
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_address() {
		return c_address;
	}
	public void setC_address(String c_address) {
		this.c_address = c_address;
	}
	public int getC_phone() {
		return c_phone;
	}
	public void setC_phone(int c_phone) {
		this.c_phone = c_phone;
	}
	public Date getC_signDate() {
		return c_signDate;
	}
	public void setC_signDate(Date c_signDate) {
		this.c_signDate = c_signDate;
	}
	public Date getC_regDate() {
		return c_regDate;
	}
	public void setC_regDate(Date c_regDate) {
		this.c_regDate = c_regDate;
	}
	public int getC_bizNo() {
		return c_bizNo;
	}
	public void setC_bizNo(int c_bizNo) {
		this.c_bizNo = c_bizNo;
	}
	public int getC_accNo() {
		return c_accNo;
	}
	public void setC_accNo(int c_accNo) {
		this.c_accNo = c_accNo;
	}
	public String getC_bank() {
		return c_bank;
	}
	public void setC_bank(String c_bank) {
		this.c_bank = c_bank;
	}
	public String getC_oriName() {
		return c_oriName;
	}
	public void setC_oriName(String c_oriName) {
		this.c_oriName = c_oriName;
	}
	public String getC_saveName() {
		return c_saveName;
	}
	public void setC_saveName(String c_saveName) {
		this.c_saveName = c_saveName;
	}
	public String getC_code() {
		return c_code;
	}
	public void setC_code(String c_code) {
		this.c_code = c_code;
	}
	
	
	
	
	
	

	
	
	
	
	
	
}

