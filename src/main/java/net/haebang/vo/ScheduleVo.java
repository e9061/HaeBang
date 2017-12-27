package net.haebang.vo;

public class ScheduleVo {

	private int id;
	private String title;
	private String start;
	private String end;
	private boolean allDay=false;	
	private String color;
	
	private String m_lon;				// 주호 추가 - 사업자 main 화면 calendar의 회원 위치 맵에 나타내려고 
 	private String m_lat;
	private String m_name;
	private int mo_no;
	private String startDay;
	private String e_name;
	
	
	
	
	
	
	public int getMo_no() {
		return mo_no;
	}

	public void setMo_no(int mo_no) {
		this.mo_no = mo_no;
	}

	public String getE_name() {
		return e_name;
	}

	public void setE_name(String e_name) {
		this.e_name = e_name;
	}

	public String getStartDay() {
		return startDay;
	}

	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}

	public String getM_lat() {
		return m_lat;
	}

	public void setM_lat(String m_lat) {
		this.m_lat = m_lat;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_lon() {
		return m_lon;
	}

	public void setM_lon(String m_lon) {
		this.m_lon = m_lon;
	}

	public ScheduleVo() {
	}
	
	public ScheduleVo(int id, String title, String start, String end, String color) {
		this.color =color;
		this.id = id;
		this.title = title;
		this.start = start;
		this.end = end;
		
	}
	
	public ScheduleVo(int id, String title, String start, String end) {
		this.id = id;
		this.title = title;
		this.start = start;
		this.end = end;
		
	}
	
	
	
	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public boolean isAllDay() {
		return allDay;
	}
	public void setAllDay(boolean allDay) {
		this.allDay = allDay;
	}

	@Override
	public String toString() {
		return "ScheduleVo [id=" + id + ", title=" + title + ", start=" + start + ", end=" + end + ", allDay=" + allDay
				+ ", color=" + color + "]";
	}

	
	
	
	
}
