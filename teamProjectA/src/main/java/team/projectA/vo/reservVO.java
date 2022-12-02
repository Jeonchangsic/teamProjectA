package team.projectA.vo;

public class reservVO {
	private int reserv_idx;
	private int reserv_date;
	private int checkin;
	private int checkout;
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
