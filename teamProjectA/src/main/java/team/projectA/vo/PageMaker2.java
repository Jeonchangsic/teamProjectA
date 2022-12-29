package team.projectA.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker2{ 
	
	 private int totalCount2;
	 private int startPage2;
	 private int endPage2;
	 private boolean prev2;
	 private boolean next2;

	 private int displayPageNum2 = 5;

	 private Criteria2 cri2;
	 
	 public void setCri2(Criteria2 cri2) {
	  this.cri2 = cri2;
	 }

	 public void setTotalCount2(int totalCount2) {
	  this.totalCount2 = totalCount2;
	  calcData2();
	 }

	 public int getTotalCount2() {
	  return totalCount2;
	 }

	 public int getStartPage2() {
	  return startPage2;
	 }

	 public int getEndPage2() {
	  return endPage2;
	 }

	 public boolean isPrev2() {
	  return prev2;
	 }

	 public boolean isNext2() {
	  return next2;
	 }

	 public int getDisplayPageNum2() {
	  return displayPageNum2;
	 }

	 public Criteria2 getCri2() {
	  return cri2;
	 }
	 
	 private void calcData2() {
	  endPage2 = (int) (Math.ceil(cri2.getpage2() / (double)displayPageNum2) * displayPageNum2);
	  startPage2 = (endPage2 - displayPageNum2) + 1;
	  
	  int tempEndPage2 = (int) (Math.ceil(totalCount2 / (double)cri2.getPerPageNum2()));
	  if (endPage2 > tempEndPage2)
	  {
	   endPage2 = tempEndPage2;
	  }
	  prev2 = startPage2 == 1 ? false : true;
	  next2 = endPage2 * cri2.getPerPageNum2() >= totalCount2 ? false : true;
	 }
	 
	}