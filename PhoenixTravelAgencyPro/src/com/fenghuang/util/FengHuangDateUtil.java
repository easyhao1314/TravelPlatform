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

}
