package com.fenghuang.web.action;

import java.sql.Timestamp;
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
import com.fenghuang.service.IcaiwuskqrSerice;
import com.fenghuang.util.DateJsonValueProcessor;
import com.fenghuang.util.Pagination;

@Controller
public class CaiwufukuanshenpiController {
	@Autowired 
	private IcaiwuskqrSerice icaiwuskqrSerice;
	@RequestMapping("fenghuang/fkspselect.do")
	@ResponseBody
	public Map<String, Object> getCurrencyList(HttpServletRequest request,
			HttpServletResponse response,HttpSession session,Integer page, Integer rows,String team,String caozuo,String caiwuid,
            String id,String shenfenid,String ysyfid) {
		 Tuanbiao tuanbiao = new Tuanbiao();
		 
		    try {
		    	 if(id!=null && !"".equals(id)){
			    	 tuanbiao.setId(Long.parseLong(id));
			     }
		    	 if(shenfenid!=null && !"".equals(shenfenid)){
			    	 tuanbiao.setShenfenid(Integer.parseInt(shenfenid));
			     }
		    	 if(ysyfid!=null && !"".equals(ysyfid)){
			    	 tuanbiao.setYsyfID(Integer.parseInt(ysyfid));
			     }
		    	if(team!=null&&!"".equals(team)){
		    		tuanbiao.setTeam(team);
		    	}
		    	if(caiwuid!=null&&!"".equals(caiwuid)){
		    		tuanbiao.setCaiwuid(Integer.parseInt(caiwuid));
		    	}else{
		    		tuanbiao.setCaiwuid(2);
		    	}
		    	if(caozuo!=null&&!"".equals(caozuo)){
		    		tuanbiao.setCaozuo(caozuo);
		    	}
			
			if(page==null){
		    	 page=1;
		     }
		     if(rows==null){
		    	 rows=1;
		     }
			Pagination<Tuanbiao> pagination = icaiwuskqrSerice.getPaginationfkqr(page, rows, tuanbiao);	
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
	
	@RequestMapping("fenghuang/updatefksp.do")
	@ResponseBody
	public Map<String,Object> xiugai(HttpServletRequest request,
			HttpServletResponse response,String caiwuid,String id,String caiwuida){
		Map<String, Object> result = new HashMap<String, Object>();
	   if(caiwuid==null&&"".equals(caiwuid)){
		caiwuid = caiwuida;
	   }
		boolean isSuccess = false;  
		Tuanbiao tuanbiao = new Tuanbiao();
		tuanbiao.setCaiwuid(Integer.parseInt(caiwuid));
		tuanbiao.setId(Integer.parseInt(id));
		
		try {
			isSuccess = icaiwuskqrSerice.updateskqr(tuanbiao);
			isSuccess=true;
		} catch (Exception e) {
			e.printStackTrace();
		}	
		result.put("success", isSuccess);
		return result ; 
	}
	
}
