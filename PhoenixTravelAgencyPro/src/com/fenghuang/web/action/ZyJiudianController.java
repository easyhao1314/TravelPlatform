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
	// 查询
	@RequestMapping("fenghuang/ZiyuanJiudian.do")
	@ResponseBody
	public Map<String,Object> jiudianSelect(HttpServletRequest request,
			HttpServletResponse response, Integer page,Integer rows) {
		try {
			Pagination<Jiudian> pagination=(Pagination<Jiudian>)izyjd.jiudianSelect(page, rows);
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
	     	//System.out.println(fromObject);
			return fromObject;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	  //模糊查询
	@RequestMapping("fenghuang/ZyjiudianSelectLike.do")
	@ResponseBody
		public Map<String,Object> jiudianSelectLike(HttpServletRequest request,HttpServletResponse response,
				Integer page,Integer rows,String name,int chengshi){
			try{
				Pagination<Jiudian> pagination=(Pagination<Jiudian>)izyjd.jiudianSelectLike(page, rows, name, chengshi);
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
		     	//System.out.println(fromObject);
				return fromObject;
			}catch(Exception e){
				e.printStackTrace();
			}
			return null;
	}
	//添加
	@RequestMapping("fenghuang/ZiyuanJiudianAdd.do")
	@ResponseBody
	public Map<String,Object> jiudianAdd(HttpServletRequest request,HttpServletResponse response,
		   Long	id,Long chengshi,String name,Long fangjian,String hzjb,String whr,String xjbz,String dianhua,
		   String chuanzhen,String email,String guanwang,String dizhi,String pingjia,String tishi,
		   int danjijia,int wangjijia,String jgsm,String bz){
		
		  Jiudian jd=new Jiudian();
		  jd.setId(id);
		  jd.setChengshi(chengshi);
		  jd.setName(name);
		  jd.setFangjian(fangjian);
		  jd.setHzjb(hzjb);
		  jd.setWhr(whr);
		  jd.setXjbz(xjbz);
		  jd.setDianhua(dianhua);
		  jd.setChuanzhen(chuanzhen);
		  jd.setEmail(email);
		  jd.setGuanwang(guanwang);
		  jd.setDizhi(dizhi);
		  jd.setPingjia(pingjia);
		  jd.setTishi(tishi);
		  jd.setDanjijia(danjijia);
		  jd.setWangjijia(wangjijia);
		  jd.setJgsm(jgsm);
		  jd.setBz(bz);
		  
		  Map<String,Object> result=new HashMap<String,Object>();
		  boolean bl=false;
			try{
				izyjd.jiudianAdd(jd);
				bl=true;   
			}catch(Exception e){
				e.printStackTrace();
			}
			result.put("success", bl);
			return result;
		}
  
	//删除
	@RequestMapping("fenghuang/ZiyuanJiudianDelete.do")
	@ResponseBody
	public Map<String,Object> jiudianDelete(HttpServletRequest request,HttpServletResponse response,long id){
		Map<String,Object> result=new HashMap<String,Object>();
		boolean bl=false;
		try{
		 bl=izyjd.jiudianDelete(id);
		}catch(Exception e){
			e.printStackTrace();
		}
		result.put("success", bl);
		return result;
	}
	//按id查询
	@RequestMapping("fenghuang/ZiyuanJiudianSelectId.do")
	@ResponseBody
	public Map<String,Object> jiudianSelectId(HttpServletRequest request,HttpServletResponse response,long id){
		Map<String,Object> result=new HashMap<String,Object>();
		try{
			 List<Map<String, Object>> jdlist=izyjd.jiudianSelectId(id);
			 for(int i = 0 ;i<jdlist.size();i++){
					for(Entry<String, Object> entry : jdlist.get(i).entrySet()){
						if(entry.getValue() == null){
							entry.setValue("") ;
						}
					}
				}
				result.put("rows",jdlist);
				JsonConfig config = new JsonConfig();
		     	config.registerJsonValueProcessor(Timestamp.class,new DateJsonValueProcessor("yyyy-MM-dd"));
		     			//把MAP转换成JSON，返回到前台
		     	JSONObject fromObject = JSONObject.fromObject(result,config);
				return fromObject;
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	// 修改
	@RequestMapping("fenghuang/ZiyuanJiudianUpdate.do")
	@ResponseBody
	public Map<String,Object> jiudianUpdate(HttpServletRequest request,HttpServletResponse response,Long chengshi,String name,Long fangjian,String hzjb,String whr,String xjbz,String dianhua,
			   String chuanzhen,String email,String guanwang,String dizhi,String pingjia,String tishi,
			   int danjijia,int wangjijia,String jgsm,String bz,Long id){

		  Jiudian jd=new Jiudian();
		  jd.setChengshi(chengshi);
		  jd.setName(name);
		  jd.setFangjian(fangjian);
		  jd.setHzjb(hzjb);
		  jd.setWhr(whr);
		  jd.setXjbz(xjbz);
		  jd.setDianhua(dianhua);
		  jd.setChuanzhen(chuanzhen);
		  jd.setEmail(email);
		  jd.setGuanwang(guanwang);
		  jd.setDizhi(dizhi);
		  jd.setPingjia(pingjia);
		  jd.setTishi(tishi);
		  jd.setDanjijia(danjijia);
		  jd.setWangjijia(wangjijia);
		  jd.setJgsm(jgsm);
		  jd.setBz(bz);
		  jd.setId(id);
		  Map<String,Object> result=new HashMap<String,Object>();
		  boolean bl=false;
			try{
				izyjd.jiudianUpdate(jd);
				bl=true;   
			}catch(Exception e){
				e.printStackTrace();
			}
			result.put("success", bl);
			return result;
		}
	


}
