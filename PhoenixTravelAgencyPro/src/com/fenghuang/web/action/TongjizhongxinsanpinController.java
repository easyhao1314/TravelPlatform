package com.fenghuang.web.action;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fenghuang.entiey.Tuanbiao;
import com.fenghuang.service.ItongjisanpinSerice;
import com.fenghuang.util.DateJsonValueProcessor;
import com.fenghuang.util.Pagination;

@Controller
public class TongjizhongxinsanpinController {
	@Autowired 
	private ItongjisanpinSerice itongjisanpinSerice;
	@RequestMapping("fenghuang/tongjizhongxinsanpinselect.do")
	@ResponseBody
	public Map<String, Object> getCurrencyList(HttpServletRequest request,
			HttpServletResponse response,HttpSession session,Integer page, Integer rows,String xiaoshouyuan) {
		 Tuanbiao tuanbiao = new Tuanbiao();
		 
		    try {
		    	if(xiaoshouyuan!=null&&!"".equals(xiaoshouyuan)){
		    		
		    	}
			if(page==null){
		    	 page=1;
		     }
		     if(rows==null){
		    	 rows=1;
		     }
			Pagination<Tuanbiao> pagination = itongjisanpinSerice.getPaginationsanpintongji(page, rows, tuanbiao);	
			List<Map<String, Object>> testUsers = pagination.getResultList();
			Map<String,Object> returnValue  = new HashMap<String, Object>();
			for(int i = 0 ;i<testUsers.size();i++){
				for(Entry<String, Object> entry : testUsers.get(i).entrySet()){
					if(entry.getValue() == null){
						entry.setValue("") ;
					}
				}
			}
			Integer renshu = 0;
			List<Map<String,Object>> l = new ArrayList();
			Map<String,Object> m=new HashMap<String,Object>();
			for (int i = 0; i < testUsers.size(); i++) {
				renshu =renshu+(Integer)testUsers.get(i).get("renshu");
				
			}
		
			m.put("renshu","总和:"+renshu);
			l.add(m);
			returnValue.put("footer", l);
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
}

