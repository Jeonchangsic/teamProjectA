package team.projectA.vo;

public class RoomVO extends LodgingVO{
	
	private int ridx;
	private String rtype;
	private int rnum;
	private int rprice;
	private String rimage1;
	private String rimage2;
	private String rimage3;
	private String rimage4;
	private String rimage5;
	private String bed;
	private String[] bedArr;
	private int stdmen;
	public int getStdmen() {
		return stdmen;
	}
	public void setStdmen(int stdmen) {
		this.stdmen = stdmen;
	}
	private int maxmen; 
	
	//�씠誘몄� �뾽濡쒕뱶
	private String gdsThumbImg;
	
	
	public String getGdsThumbImg() {
		return gdsThumbImg;
	}
	public void setGdsThumbImg(String gdsThumbImg) {
		this.gdsThumbImg = gdsThumbImg;
	}
	public int getMaxmen() {
		return maxmen;
	}
	public void setMaxmen(int maxmen) {
		this.maxmen = maxmen;
	}
	public int getRidx() {
		return ridx;
	}
	public void setRidx(int ridx) {
		this.ridx = ridx;
	}
	public String getRtype() {
		return rtype;
	}
	public void setRtype(String rtype) {
		this.rtype = rtype;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getRprice() {
		return rprice;
	}
	public void setRprice(int rprice) {
		this.rprice = rprice;
	}
	public String getRimage1() {
		return rimage1;
	}
	public void setRimage1(String rimage1) {
		this.rimage1 = rimage1;
	}
	public String getRimage2() {
		return rimage2;
	}
	public void setRimage2(String rimage2) {
		this.rimage2 = rimage2;
	}
	public String getRimage3() {
		return rimage3;
	}
	public void setRimage3(String rimage3) {
		this.rimage3 = rimage3;
	}
	public String getRimage4() {
		return rimage4;
	}
	public void setRimage4(String rimage4) {
		this.rimage4 = rimage4;
	}
	public String getRimage5() {
		return rimage5;
	}
	public void setRimage5(String rimage5) {
		this.rimage5 = rimage5;
	}
	public String getBed() {
		return bed;
	}
	public void setBed(String bed) {
		this.bed = bed;
	}
	public String[] getBedArr() {
		return bedArr;
	}
	public void setBedArr(String[] bedArr) {
		this.bedArr = bedArr;
	}
	
}
