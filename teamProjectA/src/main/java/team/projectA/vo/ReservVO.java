package team.projectA.vo;

public class ReservVO {
	private int reserv_idx; //������
	private String reserv_num;	//�����ȣ
	private int reserv_date; //���೯¥
	private String reserv_lodging; //�����̸�
	private String reserv_name; //������
	private String reserv_startDate; //���� ���۳�¥
	private String reserv_endDate; // ���� ���ᳯ¥
	private String reserv_price;	//����
	
	
	
	public String getReserv_num() {
		return reserv_num;
	}
	public void setReserv_num(String reserv_num) {
		this.reserv_num = reserv_num;
	}
	public String getReserv_price() {
		return reserv_price;
	}
	public void setReserv_price(String reserv_price) {
		this.reserv_price = reserv_price;
	}
	private int checkin;
	private int checkout;
	
	
	public String getReserv_lodging() {
		return reserv_lodging;
	}
	public void setReserv_lodging(String reserv_lodging) {
		this.reserv_lodging = reserv_lodging;
	}
	public String getReserv_name() {
		return reserv_name;
	}
	public void setReserv_name(String reserv_name) {
		this.reserv_name = reserv_name;
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
	public int getReserv_idx() {
		return reserv_idx;
	}
	public void setReserv_idx(int reserv_idx) {
		this.reserv_idx = reserv_idx;
	}
	public int getReserv_date() {
		return reserv_date;
	}
	public void setReserv_date(int reserv_date) {
		this.reserv_date = reserv_date;
	}
	public int getCheckin() {
		return checkin;
	}
	public void setCheckin(int checkin) {
		this.checkin = checkin;
	}
	public int getCheckout() {
		return checkout;
	}
	public void setCheckout(int checkout) {
		this.checkout = checkout;
	}
}
