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

import com.fenghuang.entiey.Dijie;
import com.fenghuang.entiey.Jingdian;
import com.fenghuang.service.IZyDijieService;
import com.fenghuang.service.IZyJingdianService;
import com.fenghuang.util.DateJsonValueProcessor;
import com.fenghuang.util.Pagination;
@Controller
public class ZyDijieController {
	@Autowired
	public IZyDijieService izds;
	private Object returnValue;
	
	@RequestMapping("fenghuang/DijieSelect.do")
	@ResponseBody
	public Map<String,Object> dijieSelect(HttpServletRequest request,
			HttpServletResponse response, Integer page,Integer rows,String name,String chengshiId,String lianxiren,String hzjbId){
		 try{
	    	   Pagination<Dijie> pagination=(Pagination<Dijie>)izds.dijieSelect(page, rows,name,chengshiId,lianxiren,hzjbId);
				List<Map<String, Object>> dijieList = pagination.getResultList();
				Map<String,Object> returnValue  = new HashMap<String, Object>();
				for(int i = 0 ;i<dijieList.size();i++){
					for(Entry<String, Object> entry : dijieList.get(i).entrySet()){
						if(entry.getValue() == null){
							entry.setValue("") ;
						}
					}
				}
				returnValue.put("total",  pagination.getTotalRows());
				returnValue.put("rows", dijieList);	
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

	@RequestMapping("fenghuang/dijieAdd.do")
	@ResponseBody
	public Map<String,Object> dijieAdd(HttpServletRequest request,HttpServletResponse response,
			String name,String ywname,int chengshiId,String dizhi,int hzjbId,String lianxiren,String dianhua,String shouji,String chuanzhen,
			String email,String skype,String msn,String yahoo,String wangzhi,String kaihu,String dlrzh,String yhdz,String skrzh,String skrxm,
			String skrdz,int ywqyId,String djsms,String xjb,String youshi,String bz){
		Dijie dj=new Dijie();

		dj.setName(name);
		dj.setYwname(ywname);
		dj.setChengshiId(chengshiId);
		dj.setDizhi(dizhi);
		dj.setHzjbId(hzjbId);
		dj.setLianxiren(lianxiren);
		dj.setDianhua(dianhua);
		dj.setShouji(shouji);
		dj.setChuanzhen(chuanzhen);
		dj.setEmail(email);
		dj.setSkype(skype);
        dj.setMsn(msn);
		dj.setYahoo(yahoo);
		dj.setWangzhi(wangzhi);
		dj.setKaihu(kaihu);
		dj.setDlrzh(dlrzh);
		dj.setYhdz(yhdz);
		dj.setSkrzh(skrzh);
		dj.setSkrxm(skrxm);
		dj.setSkrdz(skrdz);
		dj.setYwqyId(ywqyId);
		dj.setDjsms(djsms);
		dj.setXjb(xjb);
		dj.setYoushi(youshi);
		dj.setBz(bz);
         Map<String,Object> result=new HashMap<String,Object>();
         boolean bl=false;
		try{
		  bl=izds.dijieAdd(dj);
		}catch(Exception e){
			e.printStackTrace();
		}
		result.put("success", bl);
		return result;
     }

	@RequestMapping("fenghuang/dijieDelete.do")
	@ResponseBody
	public Map<String,Object> dijieDelete(HttpServletRequest request,HttpServletResponse response,long id){
		Map<String,Object> result=new HashMap<String,Object>();
		boolean bl=false;
      try{
		 bl=izds.dijieDelete(id);
		}catch(Exception e){
			e.printStackTrace();
		}
      result.put("success", bl);
		return result;
	}
	@RequestMapping("fenghuang/dijieUpdate.do")
	@ResponseBody
	public Map<String,Object> dijieUpdate(HttpServletRequest request,HttpServletResponse response,
			String name,String ywname,int chengshiId,String dizhi,int hzjbId,String lianxiren,String dianhua,String shouji,String chuanzhen,
			String email,String skype,String msn,String yahoo,String wangzhi,String kaihu,String dlrzh,String yhdz,String skrzh,String skrxm,
			String skrdz,int ywqyId,String djsms,String xjb,String youshi,String bz,long id){
		Dijie dj=new Dijie();

		dj.setName(name);
		dj.setYwname(ywname);
		dj.setChengshiId(chengshiId);
		dj.setDizhi(dizhi);
		dj.setHzjbId(hzjbId);
		dj.setLianxiren(lianxiren);
		dj.setDianhua(dianhua);
		dj.setShouji(shouji);
		dj.setChuanzhen(chuanzhen);
		dj.setEmail(email);
		dj.setSkype(skype);
        dj.setMsn(msn);
		dj.setYahoo(yahoo);
		dj.setWangzhi(wangzhi);
		dj.setKaihu(kaihu);
		dj.setDlrzh(dlrzh);
		dj.setYhdz(yhdz);
		dj.setSkrzh(skrzh);
		dj.setSkrxm(skrxm);
		dj.setSkrdz(skrdz);
		dj.setYwqyId(ywqyId);
		dj.setDjsms(djsms);
		dj.setXjb(xjb);
		dj.setYoushi(youshi);
		dj.setBz(bz);
		dj.setId(id);
		
		Map<String,Object> result=new HashMap<String,Object>();
		boolean bl=false;
       try{
		bl=	izds.dijieUpdate(dj);
		}catch(Exception e){
			e.printStackTrace();
		} 
       result.put("success", bl);
		return result;
	}
	@RequestMapping("fenghuang/dijieSelectId.do")
	@ResponseBody
	public Map<String,Object> dijieSelectId(HttpServletRequest request,
			HttpServletResponse response, Integer page,Integer rows,long id){
		Map<String,Object> result=new HashMap<String,Object>();
		try{
			 List<Map<String, Object>> djlist=izds.dijieSelectId(id);
			 for(int i = 0 ;i<djlist.size();i++){
					for(Entry<String, Object> entry : djlist.get(i).entrySet()){
						if(entry.getValue() == null){
							entry.setValue("") ;
						}
					}
				}
				result.put("rows",djlist);
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


}
