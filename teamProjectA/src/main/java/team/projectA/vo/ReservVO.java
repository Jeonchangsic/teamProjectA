package team.projectA.vo;

public class ReservVO {
	private int reserv_idx; //시퀀스
	private int uidx;
	private int ridx;
	private String reserv_num;	//예약번호
	private int reserv_date; //예약날짜
	private String reserv_startDate; //예약 시작날짜
	private String reserv_endDate; // 예약 종료날짜
	
		
	
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
	public int getReserv_date() {
		return reserv_date;
	}
	public void setReserv_date(int reserv_date) {
		this.reserv_date = reserv_date;
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
