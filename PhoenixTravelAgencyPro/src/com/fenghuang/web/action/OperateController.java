package com.fenghuang.web.action;

import java.sql.Timestamp;

import java.util.Date;
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

import com.fenghuang.entiey.Operate;
import com.fenghuang.service.IOperateService;
import com.fenghuang.util.DateJsonValueProcessor;
import com.fenghuang.util.FengHuangDateUtil;
import com.fenghuang.util.Pagination;

@Controller
public class OperateController {
	@Autowired
	private IOperateService is;
	
	@RequestMapping("fenghuang/addOperate.do")
	@ResponseBody
	public Map<String, Object> addOperate(HttpServletRequest request,
			HttpServletResponse response,String userId,String chutuantime,String huituantime,String jiedanren,String paidanren,String tuanNo,String tuanName,String jinzhan,
			String shenpiren,String beizhu){
			
			Operate o = new Operate();
			if(chutuantime != null && !"".equals(chutuantime)){
				o.setChutuantime(FengHuangDateUtil.getDateStringTODate(chutuantime));
			}
			if(huituantime!=null && !"".equals(huituantime)){
				o.setHuituantime(FengHuangDateUtil.getDateStringTODate(huituantime));
			}
			if(paidanren!=null && !"".equals(paidanren)){
				o.setPaidanren(Long.parseLong(paidanren));
			}
			if(shenpiren!=null && !"".equals(shenpiren)){
				o.setJiedanren(Long.parseLong(shenpiren));
			}
			o.setBeizhu(beizhu);
			o.setPaidantime(new Date());
			o.setTuanNo(tuanNo);
			o.setTuanName(tuanName);
			//新派单 1
			o.setJinzhan(1);

			boolean isSuccess = false;
			Map<String,Object> result = new HashMap<String, Object>();
		try {
			is.AddOperate(o);
			isSuccess=true;
		} catch (Exception e) {
			isSuccess=false;
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		result.put("success", isSuccess);
		return result;
	}
	
	@RequestMapping("fenghuang/Operateinfo.do")
	@ResponseBody
	public Map<String,Object> Operateinfo(HttpServletRequest request,HttpServletResponse response,
			Integer page,Integer rows,Operate o) {
			try {
			Pagination<Operate> pagination = is.OperateInfo(page, rows, o);
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
}
