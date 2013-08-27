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

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fenghuang.entiey.Dingche;
import com.fenghuang.entiey.Dingdaoyou;
import com.fenghuang.service.IdingcheService;
import com.fenghuang.util.DateJsonValueProcessor;
import com.fenghuang.util.Pagination;

@Controller
public class DingcheController {
	public IdingcheService idcs;
	//添加
	@RequestMapping("fenghuang/dingcheAdd.do")
	@ResponseBody
	public Map<String,Object> dingdaoyouAdd(HttpServletRequest request,HttpServletResponse response,
			String tuanNo,String cheName,String cheXinxi,String chePaihao,String siji,String sidao,String tianshu,String zuoweishu,String zongjiage){
		Dingche dc=new Dingche();
		dc.setTuanNo(tuanNo);
		dc.setCheName(cheName);
		dc.setCheXinxi(cheXinxi);
		dc.setChePaihao(chePaihao);
		dc.setSiji(siji);
		dc.setSidao(sidao);
		dc.setTianshu(Integer.parseInt(tianshu));
		dc.setZongjiage(Float.parseFloat(zongjiage));
		dc.setZuoweishu(Integer.parseInt(zuoweishu));
		Map<String,Object> reslut=new HashMap<String,Object>();
		boolean bl=false;
		try {
			bl=idcs.dingcheAdd(dc);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		reslut.put("success", bl);
			return reslut;
		}
	//修改
	@RequestMapping("fenghuang/dingcheUpdate.do")
	@ResponseBody
	public Map<String,Object> dingdaoyouUpdate(HttpServletRequest request,HttpServletResponse response,
			String id,String tuanNo,String daoyouId,String beizhu){
			return null;
		}
	// 查询
	@RequestMapping("fenghuang/dingcheSelect.do")
	@ResponseBody
	public Map<String,Object> dingdaoyouSelect(HttpServletRequest request,HttpServletResponse response,
			 Integer page,Integer rows,Dingche dc){
		try {
			Pagination<Dingche> pagination=(Pagination<Dingche>)idcs.dingcheSelect(page, rows, dc);
			List<Map<String, Object>> dingdaoyouList = pagination.getResultList();
			Map<String,Object> returnValue  = new HashMap<String, Object>();
			for(int i = 0 ;i<dingdaoyouList.size();i++){
				for(Entry<String, Object> entry : dingdaoyouList.get(i).entrySet()){
					if(entry.getValue() == null){
						entry.setValue("") ;
					}
				}
			}
			returnValue.put("total",  pagination.getTotalRows());
			returnValue.put("rows", dingdaoyouList);	
			JsonConfig config = new JsonConfig();
	     	config.registerJsonValueProcessor(Timestamp.class,new DateJsonValueProcessor("yyyy-MM-dd"));
	     			//把MAP转换成JSON，返回到前台
	     	JSONObject fromObject = JSONObject.fromObject(returnValue,config);
	     	//System.out.println(fromObject);
			return fromObject;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	
		return null;
	}
}

	


