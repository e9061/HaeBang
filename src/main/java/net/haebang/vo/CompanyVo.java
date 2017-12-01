package net.haebang.vo;

public class CompanyVo {

	private int c_no;
	private String c_name;
	private String c_address;

	private String c_phone;


	private String c_bizNo;
	private String c_accNo;


	private String c_signDate;  // default now()
	private String c_regDate;   // 처음엔 null이지만, 관리자 승인시 짜가 들어가면 정회원 



	private String c_bank;
	private String c_oriName;
	private String c_saveName;
	private String c_code;	// 부여된 난수code를 통해서 직원들 인증!
	private int c_empCnt;  //직원 한명 늘어날 때마다 카운트 1씩 증가.

	private String c_lon;	//경도
	private String c_lat;	//위도
	
	
	
	
	
	public String getC_lon() {
		return c_lon;
	}
	public void setC_lon(String c_lon) {
		this.c_lon = c_lon;
	}
	public String getC_lat() {
		return c_lat;
	}
	public void setC_lat(String c_lat) {
		this.c_lat = c_lat;
	}


	
	
	
	public int getC_empCnt() {
		return c_empCnt;
	}
	public void setC_empCnt(int c_empCnt) {
		this.c_empCnt = c_empCnt;
	}
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
	public String getC_phone() {
		return c_phone;
	}
	public void setC_phone(String c_phone) {
		this.c_phone = c_phone;
	}
	public String getC_signDate() {
		return c_signDate;
	}
	public void setC_signDate(String c_signDate) {
		this.c_signDate = c_signDate;
	}
	public String getC_regDate() {
		return c_regDate;
	}
	public void setC_regDate(String c_regDate) {
		this.c_regDate = c_regDate;
	}
	public String getC_bizNo() {
		return c_bizNo;
	}
	public void setC_bizNo(String c_bizNo) {
		this.c_bizNo = c_bizNo;
	}
	public String getC_accNo() {
		return c_accNo;
	}
	public void setC_accNo(String c_accNo) {
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
	
	
	
	
	



	
	
	
	@Override
	public String toString() {
		return "CompanyVo [c_no=" + c_no + ", c_name=" + c_name + ", c_address=" + c_address + ", c_phone=" + c_phone
				+ ", c_signDate=" + c_signDate + ", c_regDate=" + c_regDate + ", c_bizNo=" + c_bizNo + ", c_accNo="
				+ c_accNo + ", c_bank=" + c_bank + ", c_oriName=" + c_oriName + ", c_saveName=" + c_saveName
				+ ", c_code=" + c_code + ", c_empCnt=" + c_empCnt + "]";
	}
	
}

	

	
	
	
	
	
	



