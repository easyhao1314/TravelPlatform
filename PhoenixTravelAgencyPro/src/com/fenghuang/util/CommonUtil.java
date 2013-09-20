package com.fenghuang.util;

import java.util.HashMap;
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
	
	private static HashMap<String,String> tuanHaoMap = new HashMap<String,String>();
	/**
	 * 如果code，很多可以修改为数据库的形式来读取。
	 * 现在只是放在内存中。
	 */
	static {
		tuanHaoMap.put("s国内", "GN");
		tuanHaoMap.put("d国内", "GNS");
		tuanHaoMap.put("s亚太", "GY");
		tuanHaoMap.put("d亚太", "GNY");
		tuanHaoMap.put("s日韩", "GK");
		tuanHaoMap.put("d日韩", "GNK");
		tuanHaoMap.put("s欧美", "GT");
		tuanHaoMap.put("d欧美", "GNT");
		tuanHaoMap.put("s大客户", "GS");
		tuanHaoMap.put("d大客户", "GS");
		tuanHaoMap.put("s票务", "GP");
		tuanHaoMap.put("d票务", "GP");
		//请按这种方式来添加产生团号的code和前缀
		//tuanHaoMap.put("code", "前缀名");
	}
	
	
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
	
	public static String getTuanHao(String code){
		//团号格式。
		return "TH-"+tuanHaoMap.get(code)+FengHuangDateUtil.getDateTOString_TuanHao();
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
		System.out.println(getTuanHao("s国内"));
		
	}


}
