package net.haebang.vo;
/**
 * 	소비자VO
 * @author LEEJUHO
 *
 */
public class MemberVo {

	private int m_no;
	private String m_id;
	private String m_password;
	private String m_name;
	private String m_address;
	private String m_phone;
	private String m_cardNo;
	private String m_cardCVC;
	private String m_cardExp;
	private String m_owner;
	private String m_type;
	private String m_joinDate;
	
	

	
	public MemberVo(){
		
	}
	
	public MemberVo(int m_no, String m_id, String m_password, String m_name, String m_address, String m_phone,
			String m_cardNo, String m_cardCVC, String m_cardExp, String m_owner, String m_type, String m_joinDate) {
		super();
		this.m_no = m_no;
		this.m_id = m_id;
		this.m_password = m_password;
		this.m_name = m_name;
		this.m_address = m_address;
		this.m_phone = m_phone;
		this.m_cardNo = m_cardNo;
		this.m_cardCVC = m_cardCVC;
		this.m_cardExp = m_cardExp;
		this.m_owner = m_owner;
		this.m_type = m_type;
		this.m_joinDate = m_joinDate;
	}
	
	public String getM_joinDate() {
		return m_joinDate;
	}
	public void setM_joinDate(String m_joinDate) {
		this.m_joinDate = m_joinDate;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_password() {
		return m_password;
	}
	public void setM_password(String m_password) {
		this.m_password = m_password;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_address() {
		return m_address;
	}
	public void setM_address(String m_address) {
		this.m_address = m_address;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public String getM_cardNo() {
		return m_cardNo;
	}
	public void setM_cardNo(String m_cardNo) {
		this.m_cardNo = m_cardNo;
	}
	public String getM_cardCVC() {
		return m_cardCVC;
	}
	public void setM_cardCVC(String m_cardCVC) {
		this.m_cardCVC = m_cardCVC;
	}
	public String getM_cardExp() {
		return m_cardExp;
	}
	public void setM_cardExp(String m_cardExp) {
		this.m_cardExp = m_cardExp;
	}
	public String getM_owner() {
		return m_owner;
	}
	public void setM_owner(String m_owner) {
		this.m_owner = m_owner;
	}
	public String getM_type() {
		return m_type;
	}
	public void setM_type(String m_type) {
		this.m_type = m_type;
	}
	
	
	
	
}
