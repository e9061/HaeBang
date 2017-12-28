package net.haebang.vo;

/**
 *	회원 orderVO 
 * @author LEEJUHO
 *
 */

public class OrderMemberVo {
	
	private int mo_no; 			
	private int s_no;				// 서비스 번호
	private int m_no;				// 회원(소비자) 번호
	private String mo_orderNo;		// m_type + mo_startTime(년/월/일 까지만) + m_phone
	private String mo_regDate;		// 서비스 신청일 (서비스 받는 날짜 아님)
	private String mo_startTime; 	// 선택 날짜, 시간 (스케쥴에 잡히는 정보)
	private String mo_endTime;		// 예상 종료 시간
	private String mo_memo;			// 한줄 의견 - 소비자가 남기는 메모 
	private String mo_svcName;		// 일반 업체 서비스명		
	private String mo_cnt;			// 횟수					서비스 완료시 자동으로 cnt-- ? 
	private String mo_total;		// 총 횟수			   - 정기형 해당			
	private String mo_freq;			// 월단위, 주단위 결정 - 정기형 해당
	private String mo_star;			// 별점
	private String mo_starComment;	// 별점 코멘트
	private String mo_type;			// 신청타입(O), 취소타입(C)
	
	
	
	
	public String getMo_orderNo() {
		return mo_orderNo;
	}
	public void setMo_orderNo(String mo_orderNo) {
		this.mo_orderNo = mo_orderNo;
	}
	public int getMo_no() {
		return mo_no;
	}
	public void setMo_no(int mo_no) {
		this.mo_no = mo_no;
	}
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getMo_regDate() {
		return mo_regDate;
	}
	public void setMo_regDate(String mo_regDate) {
		this.mo_regDate = mo_regDate;
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
	public String getMo_freq() {
		return mo_freq;
	}
	public void setMo_freq(String mo_freq) {
		this.mo_freq = mo_freq;
	}
	public String getMo_star() {
		return mo_star;
	}
	public void setMo_star(String mo_star) {
		this.mo_star = mo_star;
	}
	public String getMo_starComment() {
		return mo_starComment;
	}
	public void setMo_starComment(String mo_starComment) {
		this.mo_starComment = mo_starComment;
	}
	public String getMo_type() {
		return mo_type;
	}
	public void setMo_type(String mo_type) {
		this.mo_type = mo_type;
	}
	
	public OrderMemberVo() {
	}
	public OrderMemberVo(int mo_no, int s_no, int m_no, String mo_orderNo, String mo_regDate, String mo_startTime,
			String mo_endTime, String mo_memo, String mo_svcName, String mo_cnt, String mo_total, String mo_freq,
			String mo_star, String mo_starComment, String mo_type) {
		super();
		this.mo_no = mo_no;
		this.s_no = s_no;
		this.m_no = m_no;
		this.mo_orderNo = mo_orderNo;
		this.mo_regDate = mo_regDate;
		this.mo_startTime = mo_startTime;
		this.mo_endTime = mo_endTime;
		this.mo_memo = mo_memo;
		this.mo_svcName = mo_svcName;
		this.mo_cnt = mo_cnt;
		this.mo_total = mo_total;
		this.mo_freq = mo_freq;
		this.mo_star = mo_star;
		this.mo_starComment = mo_starComment;
		this.mo_type = mo_type;
	}
	@Override
	public String toString() {
		return "OrderMemberVo [mo_no=" + mo_no + ", s_no=" + s_no + ", m_no=" + m_no + ", mo_orderNo=" + mo_orderNo
				+ ", mo_regDate=" + mo_regDate + ", mo_startTime=" + mo_startTime + ", mo_endTime=" + mo_endTime
				+ ", mo_memo=" + mo_memo + ", mo_svcName=" + mo_svcName + ", mo_cnt=" + mo_cnt + ", mo_total="
				+ mo_total + ", mo_freq=" + mo_freq + ", mo_star=" + mo_star + ", mo_starComment=" + mo_starComment
				+ ", mo_type=" + mo_type + "]";
	}

	
	
	
	
	
}
