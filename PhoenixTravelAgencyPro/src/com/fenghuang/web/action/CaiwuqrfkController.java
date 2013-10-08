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
import com.fenghuang.util.DateJsonValueProcessor;
import com.fenghuang.util.Pagination;

@Controller
public class CaiwuqrfkController {
	@Autowired 
	private IcaiwuskqrSerice icaiwuskqrSerice;
	@RequestMapping("fenghuang/caiwuqrfkselect.do")
	@ResponseBody
	public Map<String, Object> getCurrencyList(HttpServletRequest request,
			HttpServletResponse response,HttpSession session,Integer page, Integer rows,String team,String caozuo,String caiwuid,
            String id,String ysyfid,String khmc,String shenfenid) {
		   Tuanbiao tuanbiao = new Tuanbiao();
		    try {
		    	if(team!=null&&!"".equals(team)){
		    		tuanbiao.setTeam(team);
		    	}
		    	if(caiwuid!=null&&!"".equals(caiwuid)){
		    		tuanbiao.setCaiwuid(Integer.parseInt(caiwuid));
		    	}
		    	if(caozuo!=null&&!"".equals(caozuo)){
		    		tuanbiao.setCaozuo(caozuo);
		    	}
		    	if(ysyfid!=null&&!"".equals(ysyfid)){
		    		tuanbiao.setYsyfID(Integer.parseInt(ysyfid));
		    	}
		    	if(khmc!=null&&!"".equals(khmc)){
		    		tuanbiao.setKhmc(khmc);
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
	     	config.registerJsonValueProcessor(Timestamp.class,new DateJsonValueProcessor("yyyy-MM-dd HH:mm"));
	     			//鎶奙AP杞崲鎴怞SON锛岃繑鍥炲埌鍓嶅彴
	     
	     	JSONObject fromObject = JSONObject.fromObject(returnValue,config);
			return fromObject;
		} catch (Exception e) {

			e.printStackTrace();
		}
	        return null;
	}
	
	@RequestMapping("fenghuang/updateqrfk.do")
	@ResponseBody
	public Map<String,Object> xiugai(HttpServletRequest request,
			HttpServletResponse response,String caiwuid,String id,String shanchu,String caiwuida
			
			){
		Map<String, Object> result = new HashMap<String, Object>();
		boolean isSuccess = false;
		Tuanbiao tuanbiao = new Tuanbiao();
		try {
			if(caiwuid!=null&&!"".equals(caiwuid)){
			tuanbiao.setCaiwuid(Integer.parseInt(caiwuid));
			}
			if(shanchu!=null&&!"".equals(shanchu)){
				tuanbiao.setShanchu(Integer.parseInt(shanchu));
			}
			tuanbiao.setId(Integer.parseInt(id));
			isSuccess = icaiwuskqrSerice.updateskqr(tuanbiao);
			isSuccess=true;
		} catch (Exception e) {
			e.printStackTrace();
		}	
		result.put("success", isSuccess);
		return result ; 
	}
	
	@RequestMapping("fenghuang/inserttuanbiao.do")
	@ResponseBody    
	public Map<String,Object> addCustom(HttpServletRequest request,HttpServletResponse response,
		   String team,String kxsm,String zhanghaoid,String khmc,String yushoutime,String yingshou,String huilvid,String beizhu,String ysyfid,String shanchu,String caiwuid,String shenfenid,String fuzeren,String tuanduimc,String yfk,String teamatest,String fukuantime,String chutuantime,String huituantime,String renshu,String ddje,String yishou,String caozuo,String xiaoshou){
		Map<String, Object> result = new HashMap<String, Object>();
		boolean isSuccess = false;
		try {
		Tuanbiao tuanbiao = new Tuanbiao();
		tuanbiao.setCaozuo(caozuo);
		tuanbiao.setXiaoshou(xiaoshou);
		if(yishou!=null && !"".equals(yishou)){
			tuanbiao.setYishou(Integer.parseInt(yishou));
		}
		if(teamatest!=null&&!"".equals(teamatest)){
			tuanbiao.setTeam(teamatest);
		}
		if(team!=null&&!"".equals(team)){
		tuanbiao.setTeam(team);
		}
		if(ddje!=null&&!"".equals(ddje)){
			tuanbiao.setDdje(Integer.parseInt(ddje));
		}
		if(kxsm!=null&&!"".equals(kxsm)){
		tuanbiao.setKxsm(kxsm);	
		}
		if(renshu!=null&&!"".equals(renshu)){
			tuanbiao.setRenshu(Integer.parseInt(renshu));
		}
		if(huituantime!=null&&!"".equals(huituantime)){
			DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd"); 
			Date dategroupdate = format1.parse(huituantime);
			tuanbiao.setHuituantime(dategroupdate);
		}
		if(chutuantime!=null&&!"".equals(chutuantime)){
			DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd"); 
			Date dategroupdate = format1.parse(chutuantime);
			tuanbiao.setChutuantime(dategroupdate);
		}
		if(ysyfid!=null&&!"".equals(ysyfid)){
			tuanbiao.setYsyfID(Integer.parseInt(ysyfid));
		}
		if(shanchu!=null&&!"".equals(shanchu)){
			tuanbiao.setShanchu(Integer.parseInt(shanchu));
		}
		
		if(zhanghaoid!=null&&!"".equals(zhanghaoid)){
		tuanbiao.setZhanghaoid(Integer.parseInt(zhanghaoid));
		}
		if(yfk!=null&&!"".equals(yfk)){
			tuanbiao.setYfk(Integer.parseInt(yfk));
		}
			
		if(khmc!=null&&!"".equals(khmc)){
		tuanbiao.setKhmc(khmc);
		}
		if(fukuantime!=null&&!"".equals(fukuantime)){
			DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd"); 
			Date dategroupdate = format1.parse(fukuantime);
			tuanbiao.setFukuantime(dategroupdate);
		}
		
			tuanbiao.setYushoutime(new Date());
		
		if(yingshou!=null&&!"".equals(yingshou)){
		    tuanbiao.setYingshou(Double.parseDouble(yingshou));
		}
		if(huilvid!=null&&!"".equals(huilvid)){
		    tuanbiao.setHuilvID(Integer.parseInt(huilvid));
		}
		if(beizhu!=null&&!"".equals(beizhu)){
		    tuanbiao.setBeizhu(beizhu);
		}
		if(caiwuid!=null&&!"".equals(caiwuid)){
			tuanbiao.setCaiwuid(Integer.parseInt(caiwuid));
		}
		if(shenfenid!=null&&!"".equals(shenfenid)){
			tuanbiao.setShenfenid(Integer.parseInt(shenfenid));
		}
		if(tuanduimc!=null&&!"".equals(tuanduimc)){
			tuanbiao.setTuanduimc(tuanduimc);
		}
		    tuanbiao.setFuzeren("财务部");
		    tuanbiao.setShanchu(1);
			isSuccess = icaiwuskqrSerice.saveskqr(tuanbiao);
			isSuccess=true;
		} catch (Exception e) {
			e.printStackTrace();
		}	
		result.put("success", isSuccess);
		return result ; 
	}
	
}
