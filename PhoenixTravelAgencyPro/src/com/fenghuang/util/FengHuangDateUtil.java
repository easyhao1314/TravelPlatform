/**
 * 
 */
package com.fenghuang.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author 鲍国浩
 * 
 *         版本 ： 1.0
 * 
 *         日期 ：2013-5-27
 * 
 *         描述 ：处理日期的工具类
 * 
 * 
 */
public class FengHuangDateUtil {

	public static final String DEFAULT_DATE_PATTERN = "yyyy-MM-dd";

	public static final String DEFAULT_DATE_PATTERN_TUANHAO = "yyyyMMddS";
	
	public static Date getDateStringTODate(String dateString) {
		SimpleDateFormat sdf = new SimpleDateFormat(DEFAULT_DATE_PATTERN);
		Date date = null;
		try {
			date = sdf.parse(dateString);
		} catch (ParseException e) {

			e.printStackTrace();
		}
		return date;

	}
	public static String getDateTOString(Date date){
		String date_str = "";
		SimpleDateFormat sdf = new SimpleDateFormat(DEFAULT_DATE_PATTERN);
		try {
			date_str = sdf.format(date);
		} catch (Exception e) {

			e.printStackTrace();
		}
		return date_str;
	}
	
	public static String getDateTOString_TuanHao(){
		String date_str = "";
		SimpleDateFormat sdf = new SimpleDateFormat(DEFAULT_DATE_PATTERN_TUANHAO);
		try {
			date_str = sdf.format(new Date());
		} catch (Exception e) {

			e.printStackTrace();
		}
		return date_str;
	}
	
	
	public static String getTimeShow(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年 MM月dd日 ");
		
		return sdf.format(new Date());
		
	}
	public static void main(String[] args) {
		System.out.println(getTimeShow());
	}
	
}
