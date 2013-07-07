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

import com.fenghuang.entiey.Rixingcheng;
import com.fenghuang.service.IRixingchengService;
import com.fenghuang.util.DateJsonValueProcessor;
import com.fenghuang.util.Pagination;

@Controller
public class RixingchengAction {
	@Autowired
	private IRixingchengService ir;
	//分页查询列表
		@RequestMapping("fenghuang/selectrixingcheng.do")
		@ResponseBody
		public Map<String,Object> DantuanXunjia(HttpServletRequest request,
				HttpServletResponse response, Integer page,Integer rows
				) {
			try {
				Rixingcheng r = new Rixingcheng();
				Pagination<Rixingcheng> pagination=(Pagination<Rixingcheng>)ir.getByQueryConditionPagination(page, rows,r);
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
				e.printStackTrace();
			}
			
			return null;

		}
		@RequestMapping("fenghuang/insertrixingcheng.do")
		@ResponseBody
		public Map<String,Object> insert(HttpServletRequest request,
				HttpServletResponse response, Integer page,Integer rows
				) {
			
				Rixingcheng r = new Rixingcheng();
				if(request.getParameter("id")!=null && !"".equals(request.getParameter("id"))){
							r.setId(Integer.parseInt(request.getParameter("id")));
				}
				String richenganpai = request.getParameter("richenganpai");
				if(!"".equals(richenganpai) && richenganpai!=null){
					r.setRichenganpai(richenganpai);
				}    
				String moren = request.getParameter("moren");
				if(!"".equals(moren)&& moren!=null){
					r.setMoren(Integer.parseInt(moren));
				}
				String caiyong = request.getParameter("caiyong");
				if(!"".equals(caiyong) && caiyong!=null){
					r.setCaiyong(Integer.parseInt(caiyong));
				}
				String chengshiid = request.getParameter("tujingchengshiid");
				if(!"".equals(chengshiid) && null != chengshiid){
					r.setTujingchengshiid(Long.parseLong(chengshiid));
				}
				boolean isSuccess = false;
				Map<String,Object> result = new HashMap<String, Object>();
				
				try {
				ir.insert(r);
				isSuccess=true;
			
				} catch (Exception e) {
				e.printStackTrace();
				isSuccess=false;
				}
			
				result.put("success", isSuccess);
				return result;

			}
}
