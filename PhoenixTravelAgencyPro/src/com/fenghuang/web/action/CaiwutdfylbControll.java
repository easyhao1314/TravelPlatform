package com.fenghuang.web.action;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.fenghuang.service.IcaiwutdfylbService;
import com.fenghuang.util.DateJsonValueProcessor;
import com.fenghuang.util.Pagination;

@Controller
public class CaiwutdfylbControll {
	@Autowired 
	private IcaiwutdfylbService icaiwutdfylbService;
	@RequestMapping("fenghuang/caiwutdfylbselect.do")
	@ResponseBody
	public Map<String, Object> getCurrencyList(HttpServletRequest request,
			HttpServletResponse response,HttpSession session,Integer page, Integer rows,String team,String caiwuid,String ysyfid,
            String id,String tuanduimc,String  shenfenid) {
		   Tuanbiao tuanbiao = new Tuanbiao();
		    try {
		    	if(ysyfid!=null&&!"".equals(ysyfid)){
		    		tuanbiao.setYsyfID(Integer.parseInt(ysyfid));
		    	}
		    	if(team!=null&&!"".equals(team)){
		    		tuanbiao.setTeam(team);
		    	}
		    	if(tuanduimc!=null&&!"".equals(tuanduimc)){
		    		tuanbiao.setTuanduimc(tuanduimc);
		    	}
		    	if(caiwuid!=null&&!"".equals(caiwuid)){
		    		tuanbiao.setCaiwuid(Integer.parseInt(caiwuid));
		    	}
		    	if(shenfenid!=null&&!"".equals(shenfenid)){
		    		tuanbiao.setShenfenid(Integer.parseInt(shenfenid));
		    	}
			 if(id!=null && !"".equals(id)){
		    	 tuanbiao.setId(Long.parseLong(id));
		     }
			if(page==null){
		    	 page=1;
		     }
		     if(rows==null){
		    	 rows=1;
		     }
			Pagination<Tuanbiao> pagination = icaiwutdfylbService.getPaginationfkqr(page, rows, tuanbiao);	
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
	@RequestMapping("fenghuang/caiwutdfylbupdate.do")
	@ResponseBody
	public Map<String,Object> xiugai(HttpServletRequest request,
			HttpServletResponse response,String id,String yingshou,String yishou,
			String kxsm,String zhanghaoid,String khmc,String yushoutime,String huilvID,String beizhu,
			String yfk,String fukuantime
			){
		Map<String, Object> result = new HashMap<String, Object>();
		boolean isSuccess = false;
		Tuanbiao tuanbiao = new Tuanbiao();
		try {
			if(fukuantime!=null&&!"".equals(fukuantime)){
			DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd"); 
			Date dategroupdate = format1.parse(fukuantime);
			tuanbiao.setYushoutime(dategroupdate);
			}
			if(fukuantime!=null&&!"".equals(fukuantime)){
				DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd"); 
				Date dategroupdate = format1.parse(fukuantime);
				tuanbiao.setYushoutime(dategroupdate);
				}
			if(yingshou!=null&&!"".equals(yingshou)){
			tuanbiao.setYingshou(Integer.parseInt(yingshou));
			}
			if(yishou!=null&&!"".equals(yishou)){
				tuanbiao.setYishou(Integer.parseInt(yishou));
			}
			tuanbiao.setHuilvID(Integer.parseInt(huilvID));
			tuanbiao.setBeizhu(beizhu);
			tuanbiao.setKxsm(kxsm);
			tuanbiao.setZhanghaoid(Integer.parseInt(zhanghaoid));
			tuanbiao.setKhmc(khmc);
			tuanbiao.setYfk(Integer.parseInt(yfk));
			tuanbiao.setId(Integer.parseInt(id));
			isSuccess = icaiwutdfylbService.updatetdfy(tuanbiao);
			isSuccess=true;
		} catch (Exception e) {
			e.printStackTrace();
		}	
		result.put("success", isSuccess);
		return result ; 
	}
}
