package com.fenghuang.util;

import java.util.UUID;

/**
 * 
 * @author 鲍国浩
 *
 *  日期    @2013-6-25
 *  
 *  描述：公共的工作类
 *
 * 
 *
 */
public class CommonUtil {
	/**
	 * 产生唯一的uuid，并去掉”-“，用来表示唯一性
	 * grant5adde8b048284a0fa04972ba9c490028
	 * @param prefix 产生字符串的前缀
	 * @return
	 */
	public static String generateUUId(String prefix){
		UUID uuid = UUID.randomUUID();
		return uuid.toString().replace("-", "");
		
	}


}
