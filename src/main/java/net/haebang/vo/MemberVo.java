package net.haebang.vo;
/**
 * 	소비자VO
 * @author LEEJUHO
 *
 */
public class MemberVo {

	public int m_no;
	public String m_id;
	public String m_password;
	public String m_name;
	public String m_address;
	public int m_phone;
	public int m_cardNo;
	public int m_cardCVC;
	public String m_cardExp;
	public String m_owner;
	public String m_type;
	
	public MemberVo() {
		
	}

	public MemberVo(int m_no, String m_id, String m_password, String m_name, String m_address, int m_phone,
			int m_cardNo, int m_cardCVC, String m_cardExp, String m_owner, String m_type) {
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
	}
	
	@Override
	public String toString() {
		return "MemberVo [m_no=" + m_no + ", m_id=" + m_id + ", m_password=" + m_password + ", m_name=" + m_name
				+ ", m_address=" + m_address + ", m_phone=" + m_phone + ", m_cardNo=" + m_cardNo + ", m_cardCVC="
				+ m_cardCVC + ", m_cardExp=" + m_cardExp + ", m_owner=" + m_owner + ", m_type=" + m_type + "]";
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
	public int getM_phone() {
		return m_phone;
	}
	public void setM_phone(int m_phone) {
		this.m_phone = m_phone;
	}
	public int getM_cardNo() {
		return m_cardNo;
	}
	public void setM_cardNo(int m_cardNo) {
		this.m_cardNo = m_cardNo;
	}
	public int getM_cardCVC() {
		return m_cardCVC;
	}
	public void setM_cardCVC(int m_cardCVC) {
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
