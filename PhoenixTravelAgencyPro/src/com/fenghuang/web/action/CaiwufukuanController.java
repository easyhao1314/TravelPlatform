package com.fenghuang.web.action;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fenghuang.entiey.Fukuanfangshi;
import com.fenghuang.entiey.Weihu;
import com.fenghuang.service.IcaiwufukuanService;
import com.fenghuang.util.DateJsonValueProcessor;
import com.fenghuang.util.Pagination;



@Controller
public class CaiwufukuanController {
	@Autowired
	private IcaiwufukuanService icaiwufukuanService;
	
	@RequestMapping("fenghuang/caiwufukuanselect.do")
	@ResponseBody
	public Map<String, Object> getCurrencyList(HttpServletRequest request,
			HttpServletResponse response,HttpSession session,Integer page, Integer rows,
            String id) {
		Fukuanfangshi f= new Fukuanfangshi();
		try {
			 if(id!=null && !"".equals(id)){
		    	 f.setId(Long.parseLong(id));
		     }
			if(page==null){
		    	 page=1;
		     }
		     if(rows==null){
		    	 rows=1;
		     }
			Pagination<Fukuanfangshi> currencyPagings = icaiwufukuanService.getPaginationweihu(page, rows,f );					
			List<Map<String, Object>> currencyRows = currencyPagings.getResultList();
			Map<String, Object> returnValue = new HashMap<String, Object>();
			returnValue.put("total", currencyPagings.getTotalRows());
			returnValue.put("rows", currencyRows);
			JsonConfig config = new JsonConfig();
	     	config.registerJsonValueProcessor(Timestamp.class,new DateJsonValueProcessor("yyyy-MM-dd"));
	     			//把MAP转换成JSON，返回到前台
	     	JSONObject fromObject = JSONObject.fromObject(returnValue,config);
	     	System.out.println(fromObject);
			return fromObject;
		} catch (Exception e) {

			e.printStackTrace();
		}
				return null;
	
	}
	@RequestMapping("fenghuang/deletefukuan.do")
	@ResponseBody
	public Map<String,Object> canyinDelete(HttpServletRequest request,HttpServletResponse response,long id){

		Map<String,Object> result=new HashMap<String,Object>();
		boolean bl=false;
		try{
		 bl=icaiwufukuanService.deletefukuan(id);
		 bl=true;
		}catch(Exception e){
			e.printStackTrace();
			bl=false;
		}
		result.put("success", bl);
		return result;
	}
	@RequestMapping("fenghuang/updatefukuan.do")
	@ResponseBody
	public Map<String,Object> xiugai(HttpServletRequest request,
			HttpServletResponse response,String fukuanfangshi,String miaoshu,String id){
		Map<String, Object> result = new HashMap<String, Object>();
		boolean isSuccess = false;
		Fukuanfangshi f=new Fukuanfangshi();
		f.setFukuanfangshi(fukuanfangshi);
		f.setMiaoshu(miaoshu);
		f.setId(Long.parseLong(id));
		try {
			isSuccess = icaiwufukuanService.updatefukuan(f);
			isSuccess=true;
		} catch (Exception e) {
			e.printStackTrace();
		}	
		result.put("success", isSuccess);
		return result ; 
	}
	
	@RequestMapping("fenghuang/insertfukuan.do")
	@ResponseBody
	public Map<String,Object> addCustom(HttpServletRequest request,HttpServletResponse response,
			String fukuanfangshi,String miaoshu){
		Map<String, Object> result = new HashMap<String, Object>();
		boolean isSuccess = false;
		Fukuanfangshi f = new Fukuanfangshi();
		f.setFukuanfangshi(fukuanfangshi);
		f.setMiaoshu(miaoshu);

		try {
			isSuccess = icaiwufukuanService.savefukuan(f);
			isSuccess=true;
		} catch (Exception e) {
			e.printStackTrace();
		}	
		result.put("success", isSuccess);
		return result ; 
	}
	
	}
