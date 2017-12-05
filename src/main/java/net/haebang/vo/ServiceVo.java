package net.haebang.vo;
	/**
	 * 	서비스 vo 
	 * @author LEEJUHO
	 *
	 */

public class ServiceVo {

	private int s_no;
	private String s_style;
	private String s_name;
	private int size;
	private int price;
	private String s_detail;
	private String s_type;
	private String s_place;
	private int s_duration;
	
	
	public ServiceVo() {
	}
	
	public ServiceVo(int s_no, String s_style, String s_name, int size, int price, String s_detail, String s_type,
			String s_place, int s_duration) {
		this.s_no = s_no;
		this.s_style = s_style;
		this.s_name = s_name;
		this.size = size;
		this.price = price;
		this.s_detail = s_detail;
		this.s_type = s_type;
		this.s_place = s_place;
		this.s_duration = s_duration;
	}

	@Override
	public String toString() {
		return "ServiceVo [s_no=" + s_no + ", s_style=" + s_style + ", s_name=" + s_name + ", size=" + size + ", price="
				+ price + ", s_detail=" + s_detail + ", s_type=" + s_type + ", s_place=" + s_place + ", s_duration="
				+ s_duration + "]";
	}



	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
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
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getS_detail() {
		return s_detail;
	}
	public void setS_detail(String s_detail) {
		this.s_detail = s_detail;
	}
	public String getS_type() {
		return s_type;
	}
	public void setS_type(String s_type) {
		this.s_type = s_type;
	}
	public String getS_place() {
		return s_place;
	}
	public void setS_place(String s_place) {
		this.s_place = s_place;
	}
	public int getS_duration() {
		return s_duration;
	}
	public void setS_duration(int s_duration) {
		this.s_duration = s_duration;
	}
	
	
	
}
