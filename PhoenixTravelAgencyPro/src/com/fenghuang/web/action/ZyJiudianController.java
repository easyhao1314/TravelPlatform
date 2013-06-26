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

import com.fenghuang.entiey.DantuanXinXi;
import com.fenghuang.entiey.Jiudian;
import com.fenghuang.service.IZyJiudainService;
import com.fenghuang.service.IdantuanService;
import com.fenghuang.util.DateJsonValueProcessor;
import com.fenghuang.util.Pagination;


@Controller
public class ZyJiudianController {
	@Autowired
	public IZyJiudainService izyjd;
	private Object returnValue;
	
	@RequestMapping("fenghuang/ZiyuanJiudian.do")
	@ResponseBody
	public Map<String,Object> jiudainSelect(HttpServletRequest request,
			HttpServletResponse response, Integer page,Integer rows) {
		try {
			Pagination<Jiudian> pagination=(Pagination<Jiudian>)izyjd.jiudainSelect(page, rows);
			List<Map<String, Object>> jiudianList = pagination.getResultList();
			Map<String,Object> returnValue  = new HashMap<String, Object>();
			for(int i = 0 ;i<jiudianList.size();i++){
				for(Entry<String, Object> entry : jiudianList.get(i).entrySet()){
					if(entry.getValue() == null){
						entry.setValue("") ;
					}
				}
			}
			returnValue.put("total",  pagination.getTotalRows());
			returnValue.put("rows", jiudianList);	
			JsonConfig config = new JsonConfig();
	     	config.registerJsonValueProcessor(Timestamp.class,new DateJsonValueProcessor("yyyy-MM-dd"));
	     			//把MAP转换成JSON，返回到前台
	     	JSONObject fromObject = JSONObject.fromObject(returnValue,config);
	     	System.out.println(fromObject);
			return fromObject;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}


}
