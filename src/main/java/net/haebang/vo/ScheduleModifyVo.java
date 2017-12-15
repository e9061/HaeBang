package net.haebang.vo;
/**
 * 	소비자VO
 * @author LEEJUHO
 *
 */
public class ScheduleModifyVo {

	private int m_no;
	private String m_name;
	private String m_address;
	private String m_phone;
	private String m_owner;
	private String m_type;
	private String m_lon;
	private String m_lat;
	private String m_gu;
	
	
	// m order 
	private int mo_no; 			
	private String mo_startTime; 	// 선택 날짜, 시간 (스케쥴에 잡히는 정보)
	private String mo_endTime;		// 예상 종료 시간
	private String mo_memo;			// 한줄 의견 - 소비자가 남기는 메모 
	private String mo_svcName;		// 일반 업체 서비스명		
	private String mo_cnt;			// 횟수					서비스 완료시 자동으로 cnt-- ? 
	private String mo_total;		// 총 횟수			   - 정기형 해당			
	private String mo_freqCycle;	// 월단위, 주단위 결정 - 정기형 해당
	
	
	// 서비스
	private String s_no;
	private String s_style;
	private String s_name;
	
	// e order
	private String eo_status;      // 진행 상태
	private String e_no;  
	private String eo_memo;         // 해방맨이 남기는 메모
	
	
	// 임시로 만듬
	private String mod_date;
	private String mod_startTime;
	private String mod_endTime;
	private String periodType;				// 스케쥴 case - 1회 , 정기 서비스 구분
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
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
	public String getM_lon() {
		return m_lon;
	}
	public void setM_lon(String m_lon) {
		this.m_lon = m_lon;
	}
	public String getM_lat() {
		return m_lat;
	}
	public void setM_lat(String m_lat) {
		this.m_lat = m_lat;
	}
	public String getM_gu() {
		return m_gu;
	}
	public void setM_gu(String m_gu) {
		this.m_gu = m_gu;
	}
	public int getMo_no() {
		return mo_no;
	}
	public void setMo_no(int mo_no) {
		this.mo_no = mo_no;
	}
	public String getMo_startTime() {
		return mo_startTime;
	}
	public void setMo_startTime(String mo_startTime) {
		this.mo_startTime = mo_startTime;
	}
	public String getMo_endTime() {
		return mo_endTime;
	}
	public void setMo_endTime(String mo_endTime) {
		this.mo_endTime = mo_endTime;
	}
	public String getMo_memo() {
		return mo_memo;
	}
	public void setMo_memo(String mo_memo) {
		this.mo_memo = mo_memo;
	}
	public String getMo_svcName() {
		return mo_svcName;
	}
	public void setMo_svcName(String mo_svcName) {
		this.mo_svcName = mo_svcName;
	}
	public String getMo_cnt() {
		return mo_cnt;
	}
	public void setMo_cnt(String mo_cnt) {
		this.mo_cnt = mo_cnt;
	}
	public String getMo_total() {
		return mo_total;
	}
	public void setMo_total(String mo_total) {
		this.mo_total = mo_total;
	}
	public String getMo_freqCycle() {
		return mo_freqCycle;
	}
	public void setMo_freqCycle(String mo_freqCycle) {
		this.mo_freqCycle = mo_freqCycle;
	}
	public String getS_no() {
		return s_no;
	}
	public void setS_no(String s_no) {
		this.s_no = s_no;
	}
	public String getS_style() {
		return s_style;
	}
	public void setS_style(String s_style) {
		this.s_style = s_style;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getEo_status() {
		return eo_status;
	}
	public void setEo_status(String eo_status) {
		this.eo_status = eo_status;
	}
	public String getE_no() {
		return e_no;
	}
	public void setE_no(String e_no) {
		this.e_no = e_no;
	}
	public String getEo_memo() {
		return eo_memo;
	}
	public void setEo_memo(String eo_memo) {
		this.eo_memo = eo_memo;
	}
	public String getMod_date() {
		return mod_date;
	}
	public void setMod_date(String mod_date) {
		this.mod_date = mod_date;
	}
	public String getMod_startTime() {
		return mod_startTime;
	}
	public void setMod_startTime(String mod_startTime) {
		this.mod_startTime = mod_startTime;
	}
	public String getMod_endTime() {
		return mod_endTime;
	}
	public void setMod_endTime(String mod_endTime) {
		this.mod_endTime = mod_endTime;
	}
	public String getPeriodType() {
		return periodType;
	}
	public void setPeriodType(String periodType) {
		this.periodType = periodType;
	}
	@Override
	public String toString() {
		return "ScheduleModifyVo [m_no=" + m_no + ", m_name=" + m_name + ", m_address=" + m_address + ", m_phone="
				+ m_phone + ", m_owner=" + m_owner + ", m_type=" + m_type + ", m_lon=" + m_lon + ", m_lat=" + m_lat
				+ ", m_gu=" + m_gu + ", mo_no=" + mo_no + ", mo_startTime=" + mo_startTime + ", mo_endTime="
				+ mo_endTime + ", mo_memo=" + mo_memo + ", mo_svcName=" + mo_svcName + ", mo_cnt=" + mo_cnt
				+ ", mo_total=" + mo_total + ", mo_freqCycle=" + mo_freqCycle + ", s_no=" + s_no + ", s_style="
				+ s_style + ", s_name=" + s_name + ", eo_status=" + eo_status + ", e_no=" + e_no + ", eo_memo="
				+ eo_memo + ", mod_date=" + mod_date + ", mod_startTime=" + mod_startTime + ", mod_endTime="
				+ mod_endTime + ", periodType=" + periodType + "]";
	}
	public ScheduleModifyVo(int m_no, String m_name, String m_address, String m_phone, String m_owner, String m_type,
			String m_lon, String m_lat, String m_gu, int mo_no, String mo_startTime, String mo_endTime, String mo_memo,
			String mo_svcName, String mo_cnt, String mo_total, String mo_freqCycle, String s_no, String s_style,
			String s_name, String eo_status, String e_no, String eo_memo, String mod_date, String mod_startTime,
			String mod_endTime, String periodType) {
		super();
		this.m_no = m_no;
		this.m_name = m_name;
		this.m_address = m_address;
		this.m_phone = m_phone;
		this.m_owner = m_owner;
		this.m_type = m_type;
		this.m_lon = m_lon;
		this.m_lat = m_lat;
		this.m_gu = m_gu;
		this.mo_no = mo_no;
		this.mo_startTime = mo_startTime;
		this.mo_endTime = mo_endTime;
		this.mo_memo = mo_memo;
		this.mo_svcName = mo_svcName;
		this.mo_cnt = mo_cnt;
		this.mo_total = mo_total;
		this.mo_freqCycle = mo_freqCycle;
		this.s_no = s_no;
		this.s_style = s_style;
		this.s_name = s_name;
		this.eo_status = eo_status;
		this.e_no = e_no;
		this.eo_memo = eo_memo;
		this.mod_date = mod_date;
		this.mod_startTime = mod_startTime;
		this.mod_endTime = mod_endTime;
		this.periodType = periodType;
	}
	public ScheduleModifyVo() {
	}
	
	
	
	
	
	
}
