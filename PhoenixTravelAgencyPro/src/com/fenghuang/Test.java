package com.fenghuang;
import org.springframework.http.converter.json.MappingJacksonHttpMessageConverter;
public class Test {
	
	public static void main(String[] args) {
//		String luxian = "^1:@1:^2:^2";
//		String [] split = luxian.split(":");
//		System.out.println(luxian.split(":"));
		  String str = "^1:@1:^2:^2";
		  String[] arr = str.split(":");
		  for (int i = 0; i < arr.length; i++){
			  if(arr[i].equals("^1")){
				  System.out.println("轮船");
			  }
			  
			  if(arr[i].equals("^2")){
				  System.out.println("飞机");
			  }
		  }
		
	}

}
