package net.haebang.vo;

public class MapVo {
	
	private String m_name;
	private String m_address;
	private String e_name;
	private String eo_status;
	
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
	public String getE_name() {
		return e_name;
	}
	public void setE_name(String e_name) {
		this.e_name = e_name;
	}
	public String getEo_status() {
		return eo_status;
	}
	public void setEo_status(String eo_status) {
		this.eo_status = eo_status;
	}
	
	@Override
	public String toString() {
		return "MapVo [m_name=" + m_name + ", m_address=" + m_address + ", e_name=" + e_name + ", eo_status="
				+ eo_status + "]";
	}
	
	

}
