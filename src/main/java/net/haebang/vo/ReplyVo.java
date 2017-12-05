package net.haebang.vo;

public class ReplyVo {

	private int r_no;
	private int q_no;
	private String r_content;
	private String r_writer;
	private String r_regDate;
	
	
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public int getQ_no() {
		return q_no;
	}
	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public String getR_writer() {
		return r_writer;
	}
	public void setR_writer(String r_writer) {
		this.r_writer = r_writer;
	}
	public String getR_regDate() {
		return r_regDate;
	}
	public void setR_regDate(String r_regDate) {
		this.r_regDate = r_regDate;
	}
	@Override
	public String toString() {
		return "ReplyVo [r_no=" + r_no + ", q_no=" + q_no + ", r_content=" + r_content + ", r_writer=" + r_writer
				+ ", r_regDate=" + r_regDate + "]";
	}

	
	
	
}
