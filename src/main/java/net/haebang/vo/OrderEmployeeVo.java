package net.haebang.vo;

/**
 * employee Order Vo
 * @author LEEJUHO
 *
 */

public class OrderEmployeeVo {
   
   private int mo_no;         
   private String eo_accDate;      // 서비스 요청 수락일
   private String eo_status;      // 진행 상태
   private String e_no;         
   private String eo_memo;         // 해방맨이 남기는 메모
   private String eo_startTime;   // 해방맨 출발시간
   private String eo_endTime;      // 해방맨 종료시간
   public int getMo_no() {
      return mo_no;
   }
   public void setMo_no(int mo_no) {
      this.mo_no = mo_no;
   }
   public String getEo_accDate() {
      return eo_accDate;
   }
   public void setEo_accDate(String eo_accDate) {
      this.eo_accDate = eo_accDate;
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
   public String getEo_startTime() {
      return eo_startTime;
   }
   public void setEo_startTime(String eo_startTime) {
      this.eo_startTime = eo_startTime;
   }
   public String getEo_endTime() {
      return eo_endTime;
   }
   public void setEo_endTime(String eo_endTime) {
      this.eo_endTime = eo_endTime;
   }
   
   public OrderEmployeeVo() {
   }
   public OrderEmployeeVo(int mo_no, String eo_accDate, String eo_status, String e_no, String eo_memo,
         String eo_startTime, String eo_endTime) {
      this.mo_no = mo_no;
      this.eo_accDate = eo_accDate;
      this.eo_status = eo_status;
      this.e_no = e_no;
      this.eo_memo = eo_memo;
      this.eo_startTime = eo_startTime;
      this.eo_endTime = eo_endTime;
   }
   @Override
   public String toString() {
      return "OrderEmployeeVo [mo_no=" + mo_no + ", eo_accDate=" + eo_accDate + ", eo_status=" + eo_status + ", e_no="
            + e_no + ", eo_memo=" + eo_memo + ", eo_startTime=" + eo_startTime + ", eo_endTime=" + eo_endTime + "]";
   }
   
   
   
   
   
   
}
