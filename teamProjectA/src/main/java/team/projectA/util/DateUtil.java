package team.projectA.util;

import java.time.LocalDate;

public class DateUtil
{
	public static String GetToday() //오늘
	{
	
		String today = "";

        //LocalDate now = LocalDate.now(); 원래식
		String now = LocalDate.now().toString(); //LocalDate 객체 생성(현재 시간)
		
		today = now;
		
		return today;
		
	}

	public static String GetTomorrow() //내일
	{
		
		String today = "";
		
		String now = LocalDate.now().plusDays(1).toString(); //오늘에 하루를 더하면 내일이 됨
		
		today = now;
		
		return today;
	}	

	//오늘을 기준으로 day 이후의 날짜를 얻는다.
	public static String GetDate(int day)
	{
		return "";
	}
}
