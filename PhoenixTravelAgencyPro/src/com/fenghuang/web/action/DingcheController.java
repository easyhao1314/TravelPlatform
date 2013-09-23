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

import com.fenghuang.entiey.Dingche;
import com.fenghuang.entiey.Dingdaoyou;
import com.fenghuang.service.IdingcheService;
import com.fenghuang.util.DateJsonValueProcessor;
import com.fenghuang.util.Pagination;

@Controller
public class DingcheController {
	@Autowired
	public IdingcheService idingches;
	//添加
	@RequestMapping("fenghuang/dingcheAdd.do")
	@ResponseBody
	public Map<String,Object> dingdaoyouAdd(HttpServletRequest request,HttpServletResponse response,
			String cheName,String cheXinxi,String chePaihao,String siji,String sidao,String zuoweishu,String jiage,String gongyingshang,String chenianxian,String sijiphone){
		Dingche dc=new Dingche();
		dc.setChenianxian(chenianxian);
		dc.setSijiphone(sijiphone);
		dc.setCheName(cheName);
		dc.setChexinxi(cheXinxi);
		dc.setChepaihao(chePaihao);
		dc.setSiji(siji);
		if(gongyingshang!=null && !"".equals(gongyingshang)){
			dc.setGongyingshang(Integer.parseInt(gongyingshang));
		}
		if(sidao!=null && !"".equals(sidao)){
			dc.setSidao(Integer.parseInt(sidao));
		}
		if(zuoweishu!=null && !"".equals(zuoweishu)){
			dc.setZuoweishu(Integer.parseInt(zuoweishu));
		}
		if(jiage!=null && !"".equals(jiage)){
			dc.setJiage(Float.parseFloat(jiage));
		}
		
		
		Map<String,Object> reslut=new HashMap<String,Object>();
		boolean bl=false;
		try {
			idingches.dingcheAdd(dc);
			bl=true;
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
	public Map<String,Object> dingcheSelect(HttpServletRequest request,HttpServletResponse response,
			 Integer page,Integer rows,Dingche dc){
		try {
			Pagination<Dingche> pagination=(Pagination<Dingche>)idingches.dingcheSelect(page, rows, dc);
			List<Map<String, Object>> dingcheList = pagination.getResultList();
			Map<String,Object> returnValue  = new HashMap<String, Object>();
			for(int i = 0 ;i<dingcheList.size();i++){
				for(Entry<String, Object> entry : dingcheList.get(i).entrySet()){
					if(entry.getValue() == null){
						entry.setValue("") ;
					}
				}
			}
			returnValue.put("total",  pagination.getTotalRows());
			returnValue.put("rows", dingcheList);	
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

	


