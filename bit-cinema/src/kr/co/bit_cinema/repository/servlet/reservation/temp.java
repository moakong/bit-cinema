package kr.co.bit_cinema.repository.servlet.reservation;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class temp {
	public static void main(String[] args) {
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
		String str = sdf.format(new Date());
		System.out.println(str);
		
		
		Calendar c = Calendar.getInstance();
		c.add(Calendar.DATE, 7);
//		c.add(Calendar.MONTH, 1);
		System.out.println("일주일 뒤 날짜 : " + c.get(Calendar.DATE));
		System.out.println("일주일 뒤 월 : " + (c.get(Calendar.MONTH) + 1));
		
//		System.out.println(c.get(Calendar.DATE) + c.get(Calendar.DATE)); // 숫자를 리턴함
		
		
		System.out.println();
		System.out.println(c);
	}
}
