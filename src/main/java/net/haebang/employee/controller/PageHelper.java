package net.haebang.employee.controller;

public class PageHelper {
	
	private int startRow;
    private int linePerPage;
  
    public PageHelper(int startRow, int linePerPage) {
        this.linePerPage = linePerPage;
        this.startRow = startRow;
    }
  
    public int getStartRow() {
        return startRow;
    }
    public void setStartRow(int startRow) {
        this.startRow = startRow;
    }
    public int getLinePerPage() {
        return linePerPage;
    }
    public void setLinePerPage(int linePerPage) {
        this.linePerPage = linePerPage;
    }

}
