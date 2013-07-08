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

import com.fenghuang.entiey.Approval;
import com.fenghuang.service.IApprovalService;
import com.fenghuang.util.DateJsonValueProcessor;
import com.fenghuang.util.Pagination;

@Controller
public class approvalAction {
	@Autowired
	private IApprovalService is;
	
	@RequestMapping("fenghuang/tuituan.do")
	@ResponseBody
	public Map<String,Object> DantuanXunjia(HttpServletRequest request,
			HttpServletResponse response, Integer page,Integer rows
			) {
		try {
			Approval a= new Approval();
			Pagination<Approval> pagination=(Pagination<Approval>)is.getByQueryConditionPagination(page, rows, a);
			List<Map<String, Object>> testUsers = pagination.getResultList();
			Map<String,Object> returnValue  = new HashMap<String, Object>();
			for(int i = 0 ;i<testUsers.size();i++){
				for(Entry<String, Object> entry : testUsers.get(i).entrySet()){
					if(entry.getValue() == null){
						entry.setValue("") ;
					}
				}
			}
			returnValue.put("total", pagination.getTotalRows());
			returnValue.put("rows", testUsers);	
			JsonConfig config = new JsonConfig();
	     	config.registerJsonValueProcessor(Timestamp.class,new DateJsonValueProcessor("yyyy-MM-dd"));
	     			//把MAP转换成JSON，返回到前台
	     	JSONObject fromObject = JSONObject.fromObject(returnValue,config);
	     	System.out.println(fromObject+"执行");
			return fromObject;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;

	}
}