package net.haebang.vo;

public class ScheduleVo {

	private int id;
	private String title;
	private String start;
	private String end;
	private boolean allDay=false;	
	private String color;
	
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
