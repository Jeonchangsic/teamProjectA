package team.projectA.vo;

public class Criteria2 { 
	
	 private int page2;
	 private int perPageNum2;
	 private int rowStart2;
	 private int rowEnd2;
	 
	 public Criteria2()
	 {
	  this.page2 = 1;
	  this.perPageNum2 = 5;
	 }

	 public void setPage2(int page2)
	 {
	  if (page2 <= 0)
	  {
	   this.page2 = 1;
	   return;
	  }
	  this.page2 = page2;
	 }

	 public void setPerPageNum2(int perPageNum2)
	 {
	  if (perPageNum2 <= 0 || perPageNum2 > 100)
	  {
	   this.perPageNum2 = 5;
	   return;
	  }
	  this.perPageNum2 = perPageNum2;
	 }

	 public int getpage2()
	 {
	  return page2;
	 }

	 public int getPageStart2()
	 {
	  return (this.page2 - 1) * perPageNum2;
	 }

	 public int getPerPageNum2()
	 {
	  return this.perPageNum2;
	 }

	 @Override
	 public String toString() {
	  return "Criteria2 [page2=" + page2 + ", perPageNum2=" + perPageNum2 + ""
	    + ", rowStart2=" +  getRowStart2() + ", rowEnd2=" + getRowEnd2()
	    + "]";
	 }

	 public int getRowStart2() {
	  rowStart2 = ((page2 - 1) * perPageNum2) + 1;
	  return rowStart2;
	 }

	 public int getRowEnd2() {
	  rowEnd2 = rowStart2 + perPageNum2 - 1;
	  return rowEnd2;
	 }
	}