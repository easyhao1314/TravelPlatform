package com.fenghuang.web.action;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fenghuang.entiey.Baomingshenpi;
import com.fenghuang.entiey.Richeng;
import com.fenghuang.service.IBaomingshenpiService;
import com.fenghuang.util.DateJsonValueProcessor;
import com.fenghuang.util.Pagination;
@Controller
public class BaomingshenpiController {
	@Autowired
	private IBaomingshenpiService is;
	@RequestMapping("fenghuang/shenpikehu.do")
	@ResponseBody
	public Map<String,Object> selectshenpiCustomerCenter(HttpServletRequest request,
			HttpServletResponse response, Integer page,Integer rows,String shenpitype,String abmid,String tuanNo
			) {
		Baomingshenpi b = new Baomingshenpi();
		Integer bmid=0;
		Integer type=0;
		String tuanNof=null;
		if(tuanNo!=null && !"".equals(tuanNo)){
			tuanNof = tuanNo;
		}
		if(shenpitype!=null && !"".equals(shenpitype)){
			type=Integer.parseInt(shenpitype);
		}
		if(abmid!=null && !"".equals(abmid)){
				bmid=Integer.parseInt(abmid);
		}
		if(!"".equals(tuanNo) && tuanNo!=null){
			tuanNof=tuanNo;
		}
		try {
			Pagination<Baomingshenpi> pagination = is.bmingandapproval(b, type, tuanNof, bmid);
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
	     	System.out.println(fromObject+"执行");
			return fromObject;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
	@RequestMapping("fenghuang/baomingshenpiinfo.do")
	@ResponseBody
	public Map<String,Object> DantuanXunjia(HttpServletRequest request,
			HttpServletResponse response, Integer page,Integer rows,String tuanNo,String type,String xiaoshou
			) {
		Baomingshenpi b = new Baomingshenpi();
		Integer ftype=0;
		Long xiaos=0L;
		if(type!=null && !"".equals(type)){
			 ftype = Integer.parseInt(type);
		}
		if(xiaoshou!=null && !"".equals(xiaoshou)){
			xiaos = Long.parseLong(xiaoshou);
		}
		
		try {
			Pagination<Baomingshenpi> pagination = is.baominginfo(page, rows, b, tuanNo, ftype,xiaos);
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
	     	System.out.println(fromObject+"执行");
			return fromObject;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@RequestMapping("fenghuang/updatebaomingshenpi.do")
	@ResponseBody
	public Map<String, Object> updatericheng(HttpServletRequest request,HttpServletResponse response,
			String bmid,String zhuantuan,String baoming,String tuituan
			){
		boolean isSuccess = false;
		Map<String,Object> result = new HashMap<String, Object>();	
		Baomingshenpi b = new Baomingshenpi();
		if(bmid!=null && !"".equals(bmid)){
			b.setBmid(Long.parseLong(bmid));
		}
		if(baoming!=null && !"".equals(baoming)){
		b.setBaomingsp(Integer.parseInt(baoming));
		}
		if(zhuantuan!=null && !"".equals(zhuantuan)){
			b.setZhuantuanshenpi(Integer.parseInt(zhuantuan));
		}
		if(tuituan!=null && !"".equals(tuituan)){
			b.setTuituanshenpi(Integer.parseInt(tuituan));
		}
		try {
			is.updatebaoming(b);
			isSuccess=true;
		} catch (Exception e) {
			isSuccess=false;
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		result.put("success", isSuccess);
		return result;
	}
	
}
