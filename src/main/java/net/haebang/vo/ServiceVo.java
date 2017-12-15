package net.haebang.vo;

import java.util.Arrays;

/**
 * @author lvvvy
 *
 */
public class ServiceVo {
	private int s_no;
	private String s_style;
	private String s_name;
	private	String s_size;
	private int s_price;
	private String s_detail;
	private String s_type;
	private String s_place;
	private int s_duration;
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
	public String getS_size() {
		return s_size;
	}
	public void setS_size(String s_size) {
		this.s_size = s_size;
	}
	public int getS_price() {
		return s_price;
	}
	public void setS_price(int s_price) {
		this.s_price = s_price;
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
	@Override
	public String toString() {
		return "ServiceVo [s_no=" + s_no + ", s_style=" + s_style + ", s_name=" + s_name + ", s_size=" + s_size
				+ ", s_price=" + s_price + ", s_detail=" + s_detail + ", s_type=" + s_type + ", s_place=" + s_place
				+ ", s_duration=" + s_duration + "]";
	}
	
	
	
	
}
