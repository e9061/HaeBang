package net.haebang.vo;

public class QnAVo {

	public int q_no;
	public String q_title;
	public int m_no;
	public String q_content;
	public String q_regDate;
	public int q_viewCnt;
	public String q_oriName;
	public String q_saveName;
	public String q_flag;
	public int getQ_no() {
		return q_no;
	}
	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public String getQ_regDate() {
		return q_regDate;
	}
	public void setQ_regDate(String q_regDate) {
		this.q_regDate = q_regDate;
	}
	public int getQ_viewCnt() {
		return q_viewCnt;
	}
	public void setQ_viewCnt(int q_viewCnt) {
		this.q_viewCnt = q_viewCnt;
	}
	public String getQ_oriName() {
		return q_oriName;
	}
	public void setQ_oriName(String q_oriName) {
		this.q_oriName = q_oriName;
	}
	public String getQ_saveName() {
		return q_saveName;
	}
	public void setQ_saveName(String q_saveName) {
		this.q_saveName = q_saveName;
	}
	public String getQ_flag() {
		return q_flag;
	}
	public void setQ_flag(String q_flag) {
		this.q_flag = q_flag;
	}
	
	@Override
	public String toString() {
		return "QnAVO [q_no=" + q_no + ", q_title=" + q_title + ", m_no=" + m_no + ", q_content=" + q_content
				+ ", q_regDate=" + q_regDate + ", q_viewCnt=" + q_viewCnt + ", q_oriName=" + q_oriName + ", q_saveName="
				+ q_saveName + ", q_flag=" + q_flag + "]";
	}
	
	
	
}
