package team.projectA.vo;

import java.util.Date;

public class ReservVO extends RoomVO {
	private int reserv_idx; //������
	private int uidx;
	private int ridx;
	private String reserv_num;	//�����ȣ
	private String reserv_date; //���೯¥
	private String reserv_startDate; //���� ���۳�¥
	private Date reserv_startDate2;
	private String reserv_endDate; // ���� ���ᳯ¥
	private Date reserv_endDate2;
	private String reviewCheck;
	private String schedulerCheck;
	private int cnt; 
	
	
	public Date getReserv_endDate2() {
		return reserv_endDate2;
	}
	public void setReserv_endDate2(Date reserv_endDate2) {
		this.reserv_endDate2 = reserv_endDate2;
	}
	public String getSchedulerCheck() {
		return schedulerCheck;
	}
	public void setSchedulerCheck(String schedulerCheck) {
		this.schedulerCheck = schedulerCheck;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public Date getReserv_startDate2() {
		return reserv_startDate2;
	}
	public void setReserv_startDate2(Date reserv_startDate1) {
		this.reserv_startDate2 = reserv_startDate1;
	}
	public String getReviewCheck() {
		return reviewCheck;
	}
	public void setReviewCheck(String reviewCheck) {
		this.reviewCheck = reviewCheck;
	}
	public String getReserv_date() {
		return reserv_date;
	}
	public void setReserv_date(String reserv_date) {
		this.reserv_date = reserv_date;
	}
	public int getReserv_idx() {
		return reserv_idx;
	}
	public void setReserv_idx(int reserv_idx) {
		this.reserv_idx = reserv_idx;
	}
	public int getUidx() {
		return uidx;
	}
	public void setUidx(int uidx) {
		this.uidx = uidx;
	}
	public int getRidx() {
		return ridx;
	}
	public void setRidx(int ridx) {
		this.ridx = ridx;
	}
	public String getReserv_num() {
		return reserv_num;
	}
	public void setReserv_num(String reserv_num) {
		this.reserv_num = reserv_num;
	}
	
	public String getReserv_startDate() {
		return reserv_startDate;
	}
	public void setReserv_startDate(String reserv_startDate) {
		this.reserv_startDate = reserv_startDate;
	}
	public String getReserv_endDate() {
		return reserv_endDate;
	}
	public void setReserv_endDate(String reserv_endDate) {
		this.reserv_endDate = reserv_endDate;
	}
	
	
	
	

}
