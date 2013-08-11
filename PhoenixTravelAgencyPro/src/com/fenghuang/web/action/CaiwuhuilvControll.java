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
import com.fenghuang.service.IcaiwuhuilvService;
import com.fenghuang.util.DateJsonValueProcessor;
import com.fenghuang.util.Pagination;

@Controller
public class CaiwuhuilvControll {
	@Autowired 
	IcaiwuhuilvService icaiwuhuilvService;
	@RequestMapping("fenghuang/caiwuhuilvxiala.do")
	@ResponseBody
	public List<Map<String, Object>> getComboxs(HttpServletRequest request,
			HttpServletResponse response){
		try {
			return icaiwuhuilvService.getDictionaryComboboxs();
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return null;
		
	}
	@RequestMapping("fenghuang/bizhonghuilvdelete.do")
	@ResponseBody
	public Map<String,Object> canyinDelete(HttpServletRequest request,HttpServletResponse response,long id){

		Map<String,Object> result=new HashMap<String,Object>();
		boolean bl=false;
		try{
		 bl=icaiwuhuilvService.deletehuilv(id);
		 bl=true;
		}catch(Exception e){
			e.printStackTrace();
			bl=false;
		}
		result.put("success", bl);
		return result;
	}
	
	@RequestMapping("fenghuang/bizhonghuilv.do")
	@ResponseBody
	public Map<String, Object> getCurrencyList(HttpServletRequest request,
			HttpServletResponse response,HttpSession session,Integer page, Integer rows,String id,String bizhong) {
		    try {
		    	Bizhonghuilv bizhonghuilv = new Bizhonghuilv();
		    	if(id!=null&&!"".equals(id)){
		    		bizhonghuilv.setId(Integer.parseInt(id));
		    	}
		    	if(bizhong!=null&&!"".equals(bizhong)){
		    		bizhonghuilv.setBizhong(bizhong);
		    	}
			
			if(page==null){
		    	 page=1;
		     }
		     if(rows==null){
		    	 rows=1;
		     }
			Pagination<Bizhonghuilv> pagination = icaiwuhuilvService.getPaginationfkqr(page, rows, bizhonghuilv);
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
	@RequestMapping("fenghuang/bizhonghuilvupdate.do")
	@ResponseBody
	public Map<String,Object> xiugai(HttpServletRequest request,
			HttpServletResponse response,String bizhong,String riqi,String xianjinhuilv,String gongshou,
			String zhonghang,String zuidihuilv,String huilv,String jianxie,String jianxiemingchen,String danwei,long id){
		Map<String, Object> result = new HashMap<String, Object>();
		boolean isSuccess = false;
		Bizhonghuilv bizhonghuilv = new Bizhonghuilv();
		try {
			bizhonghuilv.setBizhong(bizhong);
			DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd"); 
		    Date dategroupdate = format1.parse(riqi);
			bizhonghuilv.setRiqi(dategroupdate);
			bizhonghuilv.setXianjinhuilv(Integer.parseInt(xianjinhuilv));
			bizhonghuilv.setGongshou(Integer.parseInt(gongshou));
			bizhonghuilv.setZhonghang(Integer.parseInt(zhonghang));
			bizhonghuilv.setZuidihuilv(Integer.parseInt(zuidihuilv));
			bizhonghuilv.setHuilv(Integer.parseInt(huilv));
			bizhonghuilv.setJianxie(jianxie);
			bizhonghuilv.setJianxiemingchen(jianxiemingchen);
			bizhonghuilv.setDanwei(Integer.parseInt(danwei));
			bizhonghuilv.setId(id);
			isSuccess = icaiwuhuilvService.updatehuilv(bizhonghuilv);
			isSuccess=true;
		} catch (Exception e) {
			e.printStackTrace();
		}	
		result.put("success", isSuccess);
		return result ; 
	}
	
	@RequestMapping("fenghuang/bizhonghuilvinsert.do")
	@ResponseBody
	public Map<String,Object> addCustom(HttpServletRequest request,HttpServletResponse response,
			String bizhong,String riqi,String xianjinhuilv,String gongshou,String zhonghang,String zuidihuilv,String huilv,String jianxie,String jianxiemingchen,String danwei
			){
		Map<String, Object> result = new HashMap<String, Object>();
		boolean isSuccess = false;
		Bizhonghuilv bizhonghuilv = new Bizhonghuilv();
		try {
			bizhonghuilv.setBizhong(bizhong);
			DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd"); 
		    Date dategroupdate = format1.parse(riqi);
			bizhonghuilv.setRiqi(dategroupdate);
			bizhonghuilv.setXianjinhuilv(Integer.parseInt(xianjinhuilv));
			bizhonghuilv.setGongshou(Integer.parseInt(gongshou));
			bizhonghuilv.setZhonghang(Integer.parseInt(zhonghang));
			bizhonghuilv.setZuidihuilv(Integer.parseInt(zuidihuilv));
			bizhonghuilv.setHuilv(Integer.parseInt(huilv));
			bizhonghuilv.setJianxie(jianxie);
			bizhonghuilv.setJianxiemingchen(jianxiemingchen);
			bizhonghuilv.setDanwei(Integer.parseInt(danwei));
	        isSuccess = icaiwuhuilvService.savehuilv(bizhonghuilv);
			isSuccess=true;
		} catch (Exception e) {
			e.printStackTrace();
		}	
		result.put("success", isSuccess);
		return result ; 
	}
}
