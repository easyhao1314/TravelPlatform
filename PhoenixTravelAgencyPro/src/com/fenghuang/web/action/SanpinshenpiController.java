package com.fenghuang.web.action;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fenghuang.entiey.Sanpinshenpi;
import com.fenghuang.entiey.Sanpinzhongxin;
import com.fenghuang.service.ISanpinshenpiService;
import com.fenghuang.util.DateJsonValueProcessor;
import com.fenghuang.util.Pagination;

@Controller
public class SanpinshenpiController {
	@Resource
	ISanpinshenpiService ISanpinService;
	
	@RequestMapping("fenghuang/Sanpinshenpiinfo.do")
	@ResponseBody
	public Map<String,Object> customInfoList(HttpServletRequest request,HttpServletResponse response,Integer page,Integer rows
			,String shenhezhuangtai,String userId){
		try{
			if(page==null){page=1;}
			if(rows==null){rows=100;}
		Sanpinshenpi s = new Sanpinshenpi();
		if(shenhezhuangtai!=null && !"".equals(shenhezhuangtai)){
			s.setShenpizhuangtai(Integer.parseInt(shenhezhuangtai));
		}
		Long jiantuanren = null;
		if(userId!=null && !"".equals(userId)){
		jiantuanren = Long.parseLong(userId);
		}
		Pagination<Sanpinshenpi> pagination = ISanpinService.sanpinshenpiinfo(page, rows, s,jiantuanren);
		List<Map<String, Object>> testUsers = pagination.getResultList();
		Map<String,Object> returnValue  = new HashMap<String, Object>();
		for(int i = 0 ;i<testUsers.size();i++){
			for(Entry<String, Object> entry : testUsers.get(i).entrySet()){
				if(entry.getValue() == null){
					entry.setValue("") ;
				}
			}
		}
		returnValue.put("total", pagination.getTotalRows());
		returnValue.put("rows", testUsers);	
		JsonConfig config = new JsonConfig();
     	config.registerJsonValueProcessor(Timestamp.class,new DateJsonValueProcessor("yyyy-MM-dd"));
     			//把MAP转换成JSON，返回到前台
     	JSONObject fromObject = JSONObject.fromObject(returnValue,config);
     	System.out.println(fromObject+"执行");
		return fromObject;
	} catch (Exception e) {
		e.printStackTrace();
	}	
	return null;
	}
	
	@RequestMapping("fenghuang/addsanpinshenpi.do")
	@ResponseBody
	public Map<String,Object> addsanpinshenpi(HttpServletRequest request,HttpServletResponse response,String tuanNo,String beizhu) {
	Sanpinshenpi s= new Sanpinshenpi();
	s.setBeizhu(beizhu);
	s.setTuanNo(tuanNo);
	boolean isSuccess = false;
	Map<String,Object> result = new HashMap<String, Object>();
	try {
		ISanpinService.Addsanpinshenpi(s);
		isSuccess=true;
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		isSuccess=false;
	}
		result.put("success", isSuccess);
		return result;
	}
	
	@RequestMapping("fenghuang/upsanpinshenpi.do")
	@ResponseBody
	public Map<String,Object> Upsanpinshenpi(HttpServletRequest request,HttpServletResponse response,String id,String yijian,String jieguo,String shenpiren) {
	Sanpinshenpi s= new Sanpinshenpi();
	s.setId(Integer.parseInt(id));
	s.setShenpiyijian(yijian);
	s.setShenpiuserid(Long.parseLong(shenpiren));
	s.setShenpijieguo(Integer.parseInt(jieguo));
	boolean isSuccess = false;
	Map<String,Object> result = new HashMap<String, Object>();
	try {
		ISanpinService.upsanpinshenpi(s);
		isSuccess=true;
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		isSuccess=false;
	}
		result.put("success", isSuccess);
		return result;
	}
	
	
}
	

