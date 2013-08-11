package com.fenghuang.util;

import java.util.Random;
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
	
	public static String getTuanHao(){
		//团号格式。
		return "";
	}
	//产生5-6位 不一样的数字
	public static String getCode(){
		int[] array = {0,1,2,3,4,5,6,7,8,9};
		Random rand = new Random();
		for (int i = 10; i > 1; i--) {
		    int index = rand.nextInt(i);
		    int tmp = array[index];
		    array[index] = array[i - 1];
		    array[i - 1] = tmp;
		}
		int result = 0;
		for(int i = 0; i < 6; i++)
		    result = result * 10 + array[i];
		
		return String.valueOf(result);
	}
	public static void main(String[] args) {
		for(int i=0;i<100;i++){
		System.out.println(getCode());
		}
	}


}
