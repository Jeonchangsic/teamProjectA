package team.projectA.vo;

public class ReviewVO extends RoomVO{ 
	
	private int rvidx;
	private int uidx;
	private int lidx;
	private int ridx;
	private String rvTitle;
	private double rvSatisfaction;
	private double[] rvSatisfactionAry;
	private String rvContent;
	private String rvDate;
	private double avgrv;
	private int countrv;
	
	   
	public int getCountrv() {
		return countrv;
	}
	public void setCountrv(int countrv) {
		this.countrv = countrv;
	}
	public double[] getRvSatisfactionAry() {
		return rvSatisfactionAry;
	}
	public void setRvSatisfactionAry(double[] rvSatisfactionAry) {
		this.rvSatisfactionAry = rvSatisfactionAry;
	}	
	
	public double getAvgrv() {
		return avgrv;
	}
	public void setAvgrv(double avgrv) {
		this.avgrv = avgrv;
	}
	public double getRvSatisfaction() {
		return rvSatisfaction;
	}
	public void setRvSatisfaction(double rvSatisfaction) {
		this.rvSatisfaction = rvSatisfaction;
	}
	public int getRvidx() {
		return rvidx;
	}
	public void setRvidx(int rvidx) {
		this.rvidx = rvidx;
	}
	public int getUidx() {
		return uidx;
	}
	public void setUidx(int uidx) {
		this.uidx = uidx;
	}
	public int getLidx() {
		return lidx;
	}
	public void setLidx(int lidx) {
		this.lidx = lidx;
	}
	public String getRvTitle() {
		return rvTitle;
	}
	public void setRvTitle(String rvTitle) {
		this.rvTitle = rvTitle;
	}
	
	public int getRidx() {
		return ridx;
	}
	public void setRidx(int ridx) {
		this.ridx = ridx;
	}
	
	public String getRvContent() {
		return rvContent;
	}
	public void setRvContent(String rvContent) {
		this.rvContent = rvContent;
	}
	public String getRvDate() {
		return rvDate;
	}
	public void setRvDate(String rvDate) {
		this.rvDate = rvDate;
	}
	
	
	

}
