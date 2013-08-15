package com.fenghuang.web.action;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import com.fenghuang.entiey.Canyin;
import com.fenghuang.entiey.Dingfang;
import com.fenghuang.service.IdingfangSerice;
import com.fenghuang.util.DateJsonValueProcessor;
import com.fenghuang.util.FengHuangDateUtil;
import com.fenghuang.util.Pagination;
@Controller
public class DingfangController {
	@Autowired
	public IdingfangSerice idfs;
	@RequestMapping("fenghuang/dingfangSelect.do")
	@ResponseBody
	public Map<String,Object> dingfangSelect(HttpServletRequest request,
			HttpServletResponse response, Integer page,Integer rows,Dingfang df){
		try {
			Pagination<Dingfang> pagination=(Pagination<Dingfang>)idfs.dingfangSelect(page, rows,df);
			List<Map<String, Object>> dfList = pagination.getResultList();
			Map<String,Object> returnValue  = new HashMap<String, Object>();
			for(int i = 0 ;i<dfList.size();i++){
				for(Entry<String, Object> entry : dfList.get(i).entrySet()){
					if(entry.getValue() == null){
						entry.setValue("") ;
					}
				}
			}
			returnValue.put("total",  pagination.getTotalRows());
			returnValue.put("rows", dfList);	
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

	@RequestMapping("fenghuang/updateDingfang.do")
	@ResponseBody
	public Map<String,Object> updateDingfang(HttpServletRequest request,HttpServletResponse response,
			String tuanNo,String jiudianId,String ruzhutime,String ruzhuDay,String zhifufangshi,String caozuoqingkuang,String zongjia,String beizhu,String id){
		  Map<String,Object> result=new HashMap<String,Object>();
		boolean bl=false;
		try {
			Dingfang df=new Dingfang();
			if(tuanNo !=null && !"".equals(tuanNo)){
			df.setTuanNo(tuanNo);
			}
			if(jiudianId !=null && !"".equals(jiudianId)){
			df.setJiudianId(Long.parseLong(jiudianId));
			}
			if(ruzhutime !=null && !"".equals(ruzhutime)){
			df.setRuzhutime(FengHuangDateUtil.getDateStringTODate(ruzhutime));
			}
			if(ruzhuDay !=null && !"".equals(ruzhuDay)){
			df.setRuzhuDay(Integer.parseInt(ruzhuDay));
			}
			if(zhifufangshi !=null && !"".equals(zhifufangshi)){
			df.setZhifufangshi(Long.parseLong(zhifufangshi));
			}
			if(caozuoqingkuang !=null && !"".equals(caozuoqingkuang)){
			df.setCaozuoqingkuang(caozuoqingkuang);
			}
			if(zongjia !=null && !"".equals(zongjia)){
			df.setZongjia(Float.parseFloat(zongjia));
			}
			if(beizhu !=null && !"".equals(beizhu)){
			df.setBeizhu(beizhu);
			}
			if(id != null && !"".equals(id)){
				df.setId(Integer.parseInt(id));
			}
			bl=idfs.updateDingfang(df);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		result.put("success", bl);
		return result;
	}

}
