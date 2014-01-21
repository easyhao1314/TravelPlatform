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

import com.fenghuang.entiey.Bizhonghuilv;
import com.fenghuang.entiey.Tuanbiao;
import com.fenghuang.service.IcaiwuhuilvService;
import com.fenghuang.service.IcaiwutdfylbService;
import com.fenghuang.util.DateJsonValueProcessor;
import com.fenghuang.util.Pagination;

@Controller
public class CaiwutdfylbControll {
	@Autowired 
	private IcaiwutdfylbService icaiwutdfylbService;
	@Autowired
	private	IcaiwuhuilvService icaiwuhuilvService;
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
			String yfk,String fukuantime,String ykfp,String fpxk,String syingshou,String syishou,String huilv,String yifu){
		Map<String, Object> result = new HashMap<String, Object>();
		boolean isSuccess = false;
		Tuanbiao tuanbiao = new Tuanbiao();
		
		try {
			Double c=null;
			Double b=null;
		    if(syingshou!=null&&!"".equals(syingshou)){
			yingshou=syingshou;
		    }
			if(huilvID!=null&&!"".equals(huilvID)){			
				Integer rows = 1;
				Integer page=1;
				Bizhonghuilv bizhonghuilv = new Bizhonghuilv();
				bizhonghuilv.setId(Integer.parseInt(huilvID));		
				Pagination<Bizhonghuilv> pagination = icaiwuhuilvService.getPaginationfkqr(page, rows, bizhonghuilv);
				List<Map<String, Object>> a = pagination.getResultList();
				Object a1 =a.get(0).get("huilv").toString();
				 c = Double.parseDouble(a1.toString());
				 if(Double.parseDouble(huilv)>c){
					 c=Double.parseDouble(huilv);
				 }
				 else if(Double.parseDouble(huilv)==c){
					  c=1.0;
				 }
				 else if(Double.parseDouble(huilv)!=c){
				if(c>=1){
					c=1/c;		
				}
				 }
				tuanbiao.setHuilvID(Integer.parseInt(huilvID));
			}
			if(fukuantime!=null&&!"".equals(fukuantime)){
			DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd"); 
			Date dategroupdate = format1.parse(fukuantime);
			tuanbiao.setFukuantime(dategroupdate);
			}
			if(yushoutime!=null&&!"".equals(yushoutime)){
				DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd"); 
				Date dategroupdate = format1.parse(yushoutime);
				tuanbiao.setYushoutime(dategroupdate);
				}
			if(yingshou!=null&&!"".equals(yingshou)){
				b=Double.parseDouble(yingshou)*c;	
			tuanbiao.setYingshou(b.floatValue());
			}
			if(yishou!=null&&!"".equals(yishou)){
				System.out.println(c);
				System.out.println(yishou);
				b=Double.parseDouble(yishou)*c;
				System.out.println(b);
				tuanbiao.setYishou(b.floatValue());
				System.out.println(tuanbiao.getYishou());
			}
			if(ykfp!=null&&!"".equals(ykfp)){
			tuanbiao.setYkfp(Integer.parseInt(ykfp));
			}
			if(fpxk!=null&&!"".equals(fpxk)){
			tuanbiao.setFpxk(Integer.parseInt(fpxk));
			}
			if(yifu!=null&&!"".equals(yifu)){
				b=Double.parseDouble(yifu)*c;
				tuanbiao.setYifu(b.floatValue());
			}
			if(beizhu!=null&&!"".equals(beizhu)){
			tuanbiao.setBeizhu(beizhu);
			}
			if(kxsm!=null&&!"".equals(kxsm)){
			tuanbiao.setKxsm(kxsm);
			}
			if(zhanghaoid!=null&&!"".equals(zhanghaoid)){
			tuanbiao.setZhanghaoid(Integer.parseInt(zhanghaoid));
			}
			if(khmc!=null&&!"".equals(khmc)){
			tuanbiao.setKhmc(khmc);
			}
			if(yfk!=null&&!"".equals(yfk)){
		    b=Double.parseDouble(yfk)*c;
		    tuanbiao.setYfk(b.floatValue());
			}
			
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
