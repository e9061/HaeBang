package net.haebang.vo;

public class NoticeBoardVo {
	
	private int n_no;
	private String n_title;
	private String n_writer;
	private String n_content;
	private int n_viewCnt;
	private String n_regDate;
	private String n_type;		// 소비자'm' 사업자 'o'  by 주호
	private String n_fileOriName;
	private String n_fileSaveName;
	
	
	
	
	
	public String getN_fileOriName() {
		return n_fileOriName;
	}
	public void setN_fileOriName(String n_fileOriName) {
		this.n_fileOriName = n_fileOriName;
	}
	public String getN_fileSaveName() {
		return n_fileSaveName;
	}
	public void setN_fileSaveName(String n_fileSaveName) {
		this.n_fileSaveName = n_fileSaveName;
	}
	public String getN_type() {
		return n_type;
	}
	public void setN_type(String n_type) {
		this.n_type = n_type;
	}
	public int getN_no() {
		return n_no;
	}
	public void setN_no(int n_no) {
		this.n_no = n_no;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_writer() {
		return n_writer;
	}
	public void setN_writer(String n_writer) {
		this.n_writer = n_writer;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public int getN_viewCnt() {
		return n_viewCnt;
	}
	public void setN_viewCnt(int n_viewCnt) {
		this.n_viewCnt = n_viewCnt;
	}
	public String getN_regDate() {
		return n_regDate;
	}
	public void setN_regDate(String n_regDate) {
		this.n_regDate = n_regDate;
	}
	
	@Override
	public String toString() {
		return "NoticeBoardVo [n_no=" + n_no + ", n_title=" + n_title + ", n_writer=" + n_writer + ", n_content="
				+ n_content + ", n_viewCnt=" + n_viewCnt + ", n_regDate=" + n_regDate + ", n_type=" + n_type
				+ ", n_fileOriName=" + n_fileOriName + ", n_fileSaveName=" + n_fileSaveName + "]";
	}
	
	
	
	

	
}
