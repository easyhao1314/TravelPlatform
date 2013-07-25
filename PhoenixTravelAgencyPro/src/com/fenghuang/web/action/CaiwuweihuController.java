package com.fenghuang.web.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.fenghuang.entiey.Weihu;
import com.fenghuang.service.ICurrencyService;
import com.fenghuang.service.IcaiwuweihuSerice;
import com.fenghuang.util.Pagination;

@Controller
public class CaiwuweihuController {
	@Autowired
	private IcaiwuweihuSerice serice;

	@RequestMapping("fenghuang/caiwuweihu.do")
	@ResponseBody
	public Map<String, Object> getCurrencyList(HttpServletRequest request,
			HttpServletResponse response,HttpSession session,Integer page, Integer rows,
            String bianhao,String xingzhi,Long id) {
	    
		     Weihu k = new Weihu();
		     if(bianhao!=null&&!"".equals(bianhao)){
		    	  k.setBianhao(bianhao);
		     }
                  if(xingzhi!=null&&!"".equals(xingzhi)){
                	  k.setXingzhi(xingzhi);
		     }
		     if(id!=null && !"".equals(id)){
		    	 k.setId(id);
		     }

		try {
			if(page==null){
		    	 page=1;
		     }
		     if(rows==null){
		    	 rows=1;
		     }
			Pagination<Weihu> currencyPagings = serice.getPaginationweihu(page, rows, k);
					
			List<Map<String, Object>> currencyRows = currencyPagings.getResultList();
			Map<String, Object> returnValue = new HashMap<String, Object>();
			returnValue.put("total", currencyPagings.getTotalRows());
			returnValue.put("rows", currencyRows);
			return returnValue;
		} catch (Exception e) {

			e.printStackTrace();
		}
		return null;   
	}
	@RequestMapping("fenghuang/weihutianjia.do")
	@ResponseBody
	public Map<String,Object> addCustom(HttpServletRequest request,HttpServletResponse response,
			String bianhao,String xingzhi,String shouzhi,String shuoming,String liucheng,String fulei){
		
		boolean isSuccess = false;
		Weihu wh=new Weihu();
		wh.setBianhao(bianhao);
		wh.setXingzhi(xingzhi);
		wh.setShouzhi(shouzhi);
		wh.setShuoming(shuoming);
		wh.setLiucheng(liucheng);
		wh.setFulei(fulei);
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			
			isSuccess = serice.saveweihu(wh);
			isSuccess=true;
		} catch (Exception e) {
			e.printStackTrace();
		}	
		result.put("success", isSuccess);
		return result ; 
	}
	@RequestMapping("fenghuang/deleteweihu.do")
	@ResponseBody
	public Map<String,Object> canyinDelete(HttpServletRequest request,HttpServletResponse response,long id){

		Map<String,Object> result=new HashMap<String,Object>();
		boolean bl=false;
		try{
		 bl=serice.deleteweihu(id);
		 bl=true;
		}catch(Exception e){
			e.printStackTrace();
			bl=false;
		}
		result.put("success", bl);
		return result;
	}
	
	
	@RequestMapping("fenghuang/weihuxiugai.do")
	@ResponseBody
	public Map<String,Object> xiugai(HttpServletRequest request,
			HttpServletResponse response,String bianhao,String xingzhi,String shouzhi,String shuoming,String liucheng,String fulei,long id){
		Map<String, Object> result = new HashMap<String, Object>();
		boolean isSuccess = false;
		Weihu wh=new Weihu();
		wh.setBianhao(bianhao);
		wh.setXingzhi(xingzhi);
		wh.setShouzhi(shouzhi);
		wh.setShuoming(shuoming);
		wh.setLiucheng(liucheng);	
		wh.setFulei(fulei);
		wh.setId(id);
		try {
			isSuccess = serice.updateweihu(wh);
			isSuccess=true;
		} catch (Exception e) {
			e.printStackTrace();
		}	
		result.put("success", isSuccess);
		return result ; 
	}
	
}
