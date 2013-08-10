package com.fenghuang.web.action;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.persistence.criteria.CriteriaBuilder.In;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fenghuang.entiey.Account;
import com.fenghuang.entiey.Tuanbiao;
import com.fenghuang.service.IcaiwuskzhanghaoService;
import com.fenghuang.util.DateJsonValueProcessor;
import com.fenghuang.util.Pagination;
@Controller
public class CaiwuskzhanghaoControll {
	@Autowired 
	IcaiwuskzhanghaoService icaiwuskzhanghaoService;
	@RequestMapping("fenghuang/skzhanghaoselect.do")
	@ResponseBody
	public Map<String, Object> getCurrencyList(HttpServletRequest request,
			HttpServletResponse response,HttpSession session,Integer page, Integer rows,String id) {
		    try {
		    	Account account = new Account();
		    	if(id!=null&&!"".equals(id)){
		    		account.setId(Integer.parseInt(id));
		    	}
			
			if(page==null){
		    	 page=1;
		     }
		     if(rows==null){
		    	 rows=1;
		     }
			Pagination<Account> pagination = icaiwuskzhanghaoService.getPaginationfkqr(page, rows, account);
			List<Map<String, Object>> testUsers = pagination.getResultList();
			Map<String,Object> returnValue  = new HashMap<String, Object>();
			for(int i = 0 ;i<testUsers.size();i++){
				for(Entry<String, Object> entry : testUsers.get(i).entrySet()){
					if(entry.getValue() == null){
						entry.setValue("") ;
					}
				}
			}
			returnValue.put("total",  pagination.getTotalRows());
			returnValue.put("rows", testUsers);	
			JsonConfig config = new JsonConfig();
	     	config.registerJsonValueProcessor(Timestamp.class,new DateJsonValueProcessor("yyyy-MM-dd"));
	     			//把MAP转换成JSON，返回到前台
	     
	     	JSONObject fromObject = JSONObject.fromObject(returnValue,config);
			return fromObject;
		} catch (Exception e) {

			e.printStackTrace();
		}
	        return null;
	}
   
	
	
	@RequestMapping("fenghuang/skzhanghaoinsert.do")
	@ResponseBody
	public Map<String,Object> addCustom(HttpServletRequest request,HttpServletResponse response,
			String zhanghaoming,String yongtu,String bizhongid,String huming,
			String zhanghao,String kaihuhang,String shiyongshuoming){
		Map<String, Object> result = new HashMap<String, Object>();
		boolean isSuccess = false;
		Account account = new Account();
		try {
	      if(zhanghaoming!=null&&!"".equals(zhanghaoming)){
	    	  account.setZhanghaoming(zhanghaoming);
	      }
	      if(yongtu!=null&&!"".equals(yongtu)){
	    	  account.setYongtu(Integer.parseInt(yongtu));
	      }
	      if(bizhongid!=null&&!"".equals(bizhongid)){
	    	  account.setBizhongid(Integer.parseInt(bizhongid));
	      }
	      if(huming!=null&&!"".equals(huming)){
	    	  account.setHuming(huming);
	      }
	      if(zhanghao!=null&&!"".equals(zhanghao)){
	    	  account.setZhanghao(zhanghao);
	      }
	      if(kaihuhang!=null&&!"".equals(kaihuhang)){
	    	  account.setKaihuhang(kaihuhang);
	      }
	      if(shiyongshuoming!=null&&!"".equals(shiyongshuoming)){
	    	  account.setShiyongshuoming(shiyongshuoming);
	      }
	        isSuccess = icaiwuskzhanghaoService.saveaccount(account);
			isSuccess=true;
		} catch (Exception e) {
			e.printStackTrace();
		}	
		result.put("success", isSuccess);
		return result ; 
	}

}
