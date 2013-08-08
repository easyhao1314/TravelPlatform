package com.fenghuang.web.action;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fenghuang.entiey.DantuanXinXi;
import com.fenghuang.service.IdantuanService;
import com.fenghuang.util.DateJsonValueProcessor;
import com.fenghuang.util.Pagination;

@Controller
public class dantuanAction {
	@Autowired
	public IdantuanService ids;
	private Object returnValue;
	//添加
	@RequestMapping("fenghuang/DantuanAdd.do")
	@ResponseBody
    //如果不是json格式的话 就去掉 不加	@ResponseBody(用到ajax提交的 就加上	@ResponseBody不用ajax 就不要加了啊)
	public Map<String,Object> dantuanAdd(HttpServletRequest request,HttpServletResponse response,
			String tuanNO,String tuanName,String khId,String tdczlx,String tdjb,String tdzt,String cfrs,String cfts,String cfgj,String lyqy,
			Date ctsj,Date htsj,String xsNo,String jdNo,String khjlNo,String qzlx,String xbqz,String xbyq,String jdbzNo,
			String zcNo,String zhongcNo,String wcNo,String bssdNo,
			String cheXingNo,String jdbjNo,String bsbjNo,String ycbjNo,String dybjNo,String qtdjDesc,String tsDesc) {

		DantuanXinXi dt=new DantuanXinXi();
        dt.setTuanNO(tuanNO);
        dt.setTuanName(tuanName);
        if(khId != null && !"".equals(khId)){
        dt.setKhId(Long.parseLong(khId));
        }
        if(tdczlx != null && !"".equals(tdczlx)){
        dt.setTdczlx(Long.parseLong(tdczlx));
        }
        if(tdjb != null && !"".equals(tdjb)){
        dt.setTdjb(Long.parseLong(tdjb));
        }
        if(tdzt != null && !"".equals(tdzt)){
        dt.setTdzt(Long.parseLong(tdzt));
        }
        if(cfrs != null && !"".equals(cfrs)){
        dt.setCfrs(Integer.parseInt(cfrs));
        }
        if(cfts != null && !"".equals(cfts)){
        dt.setCfts(Integer.parseInt(cfts));
        }
        if(cfgj != null && !"".equals(cfgj)){
        dt.setCfgj(Long.parseLong(cfgj));
        }
        if(lyqy != null && !"".equals(lyqy)){
        dt.setLyqy(Long.parseLong(lyqy));
        }
        dt.setCtsj(ctsj);
        dt.setHtsj(htsj);
        
        if(xsNo != null && !"".equals(xsNo)){
        dt.setXsNo(Long.parseLong(xsNo));
        }
        if(jdNo != null && !"".equals(jdNo)){
        dt.setJdNo(Long.parseLong(jdNo));
        }
        if(khjlNo != null && !"".equals(khjlNo)){
        dt.setKhjlNo(Long.parseLong(khjlNo));
        }
        if(qzlx != null && !"".equals(qzlx)){
        dt.setQzlx(Long.parseLong(qzlx));
        }
        if(xbqz != null && !"".equals(xbqz)){
        dt.setXbqz(Long.parseLong(xbqz));
        }
        if(xbyq != null && !"".equals(xbyq)){
        dt.setXbyq(Long.parseLong(xbyq));
        }
        if(jdbzNo != null && !"".equals(jdbzNo)){
        dt.setJdbzNo(Long.parseLong(jdbzNo));
        }
        if(zcNo != null && !"".equals(zcNo)){
        dt.setZcNo(Long.parseLong(zcNo));
        }
        if(zhongcNo != null && !"".equals(zhongcNo)){
        dt.setZhongcNo(Long.parseLong(zhongcNo));
        }
        if(wcNo != null && !"".equals(wcNo)){
        dt.setWcNo(Long.parseLong(wcNo));
        }
        if(bssdNo != null && !"".equals(bssdNo)){
        dt.setBssdNo(Long.parseLong(bssdNo));
        }
        if(cheXingNo != null && !"".equals(cheXingNo)){
        dt.setCheXingNo(Long.parseLong(cheXingNo));
        }
        if(jdbjNo != null && !"".equals(jdbjNo)){
        dt.setJdbjNo(Long.parseLong(jdbjNo));
        }
        if(bsbjNo != null && !"".equals(bsbjNo)){
        dt.setBsbjNo(Long.parseLong(bsbjNo));
        }
        if(ycbjNo != null && !"".equals(ycbjNo)){
        dt.setYcbjNo(Long.parseLong(ycbjNo));
        }
        if(dybjNo != null && !"".equals(dybjNo)){
        dt.setDybjNo(Long.parseLong(dybjNo));
        }
        dt.setQtdjDesc(qtdjDesc);
        dt.setTsDesc(tsDesc);
        
		Map<String,Object>  result = new HashMap<String, Object>();
		boolean isSuccess = false;
	try {
		
	   ids.add(dt);
		isSuccess = true;
		} catch (Exception e) {
			e.printStackTrace();	
		}		
	   result.put("success", isSuccess);
		return result;
}
	
    //查询
	@RequestMapping("fenghuang/DantuanXunjia.do")
	@ResponseBody
	public Map<String,Object> DantuanXunjia(HttpServletRequest request,
			HttpServletResponse response, Integer page,Integer rows) {
		try {
			Pagination<DantuanXinXi> pagination=(Pagination<DantuanXinXi>)ids.getByQueryConditionPagination(page, rows);
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
	     	//System.out.println(fromObject);
			return fromObject;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;

	}
	//模糊查询
	@RequestMapping("fenghuang/DantuanLike.do")
	@ResponseBody
	public Map<String,Object> DantuanLike(HttpServletRequest request,
			HttpServletResponse response, Integer page,Integer rows ,
			String ctsj){
		
		try {
		Pagination<DantuanXinXi> pagination = ids.getDantuanLike(page, rows, ctsj, null, null, null);
		List<Map<String, Object>> dantuanList = pagination.getResultList();
		Map<String,Object> returnValue  = new HashMap<String, Object>();
		for(int i = 0 ;i<dantuanList.size();i++){
			for(Entry<String, Object> entry : dantuanList.get(i).entrySet()){
				if(entry.getValue() == null){
					entry.setValue("") ;
				}
			}
		}
		returnValue.put("total",  pagination.getTotalRows());
		returnValue.put("rows", dantuanList);	
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
	//待审批报价团查询
	@RequestMapping("fenghuang/DantuanDaishen.do")
	@ResponseBody
	public Map<String,Object> getDantuanDaishen(HttpServletRequest request,
			HttpServletResponse response, Integer page,Integer rows) {
		try {
			Pagination<DantuanXinXi> pagination=(Pagination<DantuanXinXi>)ids.getDantuanDaishen(page, rows);
			List<Map<String, Object>> listDtds = pagination.getResultList();
			Map<String,Object> returnValue  = new HashMap<String, Object>();
			for(int i = 0 ;i<listDtds.size();i++){
				for(Entry<String, Object> entry : listDtds.get(i).entrySet()){
					if(entry.getValue() == null){
						entry.setValue("") ;
					}
				}
			}
			returnValue.put("total",  pagination.getTotalRows());
			returnValue.put("rows", listDtds);	
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
	//是否成团
	@RequestMapping("fenghuang/chengtuan.do")
	@ResponseBody
	public Map<String ,Object> chengtuan(HttpServletRequest request,
			HttpServletResponse response,String querenRows) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		
		try {
			Boolean bl=ids.updateChengtuan(querenRows);

			result.put("success",bl);
			
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	//审批提交
		@RequestMapping("fenghuang/shenpi.do")
		@ResponseBody
		public Map<String ,Object> shenpi(HttpServletRequest request,
				HttpServletResponse response,String querenRows) {
			Map<String, Object> result = new HashMap<String, Object>();
			
			
			try {
				Boolean bl=ids.updateshenqi(querenRows);
	
				result.put("success",bl);
				
				return result;
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return null;
		}
		//撤销成团
		@RequestMapping("fenghuang/chexiao.do")
		@ResponseBody
		public Map<String ,Object> chexiao(HttpServletRequest request,
				HttpServletResponse response,String querenRows) {
			Map<String, Object> result = new HashMap<String, Object>();
			
			
			try {
				Boolean bl=ids.updateshenqi(querenRows);
	
				result.put("success",bl);
				
				return result;
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return null;
		}

		//已确认审批报价团查询
	@RequestMapping("fenghuang/DantuanQueren.do")
	@ResponseBody
	public Map<String,Object> getDantuanYiqueren(HttpServletRequest request,
			HttpServletResponse response, Integer page,Integer rows) {
		try {
			Pagination<DantuanXinXi> pagination=(Pagination<DantuanXinXi>)ids.getDantuanYiqueren(page, rows);
			List<Map<String, Object>> listDtqr = pagination.getResultList();
			Map<String,Object> returnValue  = new HashMap<String, Object>();
		
			for(int i = 0 ;i<listDtqr.size();i++){
				for(Entry<String, Object> entry : listDtqr.get(i).entrySet()){
					if(entry.getValue() == null){
						entry.setValue("") ;
					}
				}
			}
			returnValue.put("total",  pagination.getTotalRows());
			returnValue.put("rows", listDtqr);	
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

	//删除
	@RequestMapping("fenghuang/deleteDantuan.do")
	@ResponseBody
	public Map<String ,Object> deleteDantuanAction(HttpServletRequest request,
			HttpServletResponse response,String deleteRows) {
		Map<String ,Object> result = new HashMap<String, Object>();
		boolean isSuccess = false ; 
		try{
			isSuccess = ids.deleteDantuan(deleteRows);
		}catch(Exception e){
			e.printStackTrace();
		}
		result.put("success", isSuccess);
		return result ;
	}
	//通过Id查询
	@RequestMapping("fenghuang/DantuanSelectId.do")
	@ResponseBody
	public Map<String ,Object> DantuanSelectId(HttpServletRequest request,
			HttpServletResponse response,String updateTuanNO){
		Map<String, Object> result = new HashMap<String, Object>();

		try {
			List<Map<String,Object>> customInfo =ids.selectDantuanId(updateTuanNO);
			
			for(int i = 0 ;i<customInfo.size();i++){
				for(Entry<String, Object> entry : customInfo.get(i).entrySet()){
					if(entry.getValue() == null){
						entry.setValue("") ;
					}
				}
			}
			result.put("rows",customInfo);
			JsonConfig config = new JsonConfig();
	     	config.registerJsonValueProcessor(Timestamp.class,new DateJsonValueProcessor("yyyy-MM-dd"));
	     			//把MAP转换成JSON，返回到前台
	     	JSONObject fromObject = JSONObject.fromObject(result,config);
			return fromObject;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;

	}

	//修改
	@RequestMapping("fenghuang/DantuanUpdate.do")
	@ResponseBody
	public Map<String,Object> updateDt(HttpServletRequest request,
			HttpServletResponse response,String tuanNO,String tuanName,String khId,String tdczlx,String tdjb,String tdzt,String cfrs,String cfts,String cfgj,String lyqy,
			Date ctsj,Date htsj,String xsNo,String jdNo,String khjlNo,String qzlx,String xbqz,String xbyq,String jdbzNo,
			String zcNo,String zhongcNo,String wcNo,String bssdNo,
			String cheXingNo,String jdbjNo,String bsbjNo,String ycbjNo,String dybjNo,String qtdjDesc,String tsDesc){
		DantuanXinXi dt=new DantuanXinXi();
		dt.setTuanNO(tuanNO);
        dt.setTuanName(tuanName);
        if(khId != null && !"".equals(khId)){
        dt.setKhId(Long.parseLong(khId));
        }
        if(tdczlx != null && !"".equals(tdczlx)){
        dt.setTdczlx(Long.parseLong(tdczlx));
        }
        if(tdjb != null && !"".equals(tdjb)){
        dt.setTdjb(Long.parseLong(tdjb));
        }
        if(tdzt != null && !"".equals(tdzt)){
        dt.setTdzt(Long.parseLong(tdzt));
        }
        if(cfrs != null && !"".equals(cfrs)){
        dt.setCfrs(Integer.parseInt(cfrs));
        }
        if(cfts != null && !"".equals(cfts)){
        dt.setCfts(Integer.parseInt(cfts));
        }
        if(cfgj != null && !"".equals(cfgj)){
        dt.setCfgj(Long.parseLong(cfgj));
        }
        if(lyqy != null && !"".equals(lyqy)){
        dt.setLyqy(Long.parseLong(lyqy));
        }
        dt.setCtsj(ctsj);
        dt.setHtsj(htsj);
        
        if(xsNo != null && !"".equals(xsNo)){
        dt.setXsNo(Long.parseLong(xsNo));
        }
        if(jdNo != null && !"".equals(jdNo)){
        dt.setJdNo(Long.parseLong(jdNo));
        }
        if(khjlNo != null && !"".equals(khjlNo)){
        dt.setKhjlNo(Long.parseLong(khjlNo));
        }
        if(qzlx != null && !"".equals(qzlx)){
        dt.setQzlx(Long.parseLong(qzlx));
        }
        if(xbqz != null && !"".equals(xbqz)){
        dt.setXbqz(Long.parseLong(xbqz));
        }
        if(xbyq != null && !"".equals(xbyq)){
        dt.setXbyq(Long.parseLong(xbyq));
        }
        if(jdbzNo != null && !"".equals(jdbzNo)){
        dt.setJdbzNo(Long.parseLong(jdbzNo));
        }
        if(zcNo != null && !"".equals(zcNo)){
        dt.setZcNo(Long.parseLong(zcNo));
        }
        if(zhongcNo != null && !"".equals(zhongcNo)){
        dt.setZhongcNo(Long.parseLong(zhongcNo));
        }
        if(wcNo != null && !"".equals(wcNo)){
        dt.setWcNo(Long.parseLong(wcNo));
        }
        if(bssdNo != null && !"".equals(bssdNo)){
        dt.setBssdNo(Long.parseLong(bssdNo));
        }
        if(cheXingNo != null && !"".equals(cheXingNo)){
        dt.setCheXingNo(Long.parseLong(cheXingNo));
        }
        if(jdbjNo != null && !"".equals(jdbjNo)){
        dt.setJdbjNo(Long.parseLong(jdbjNo));
        }
        if(bsbjNo != null && !"".equals(bsbjNo)){
        dt.setBsbjNo(Long.parseLong(bsbjNo));
        }
        if(ycbjNo != null && !"".equals(ycbjNo)){
        dt.setYcbjNo(Long.parseLong(ycbjNo));
        }
        if(dybjNo != null && !"".equals(dybjNo)){
        dt.setDybjNo(Long.parseLong(dybjNo));
        }
        dt.setQtdjDesc(qtdjDesc);
        dt.setTsDesc(tsDesc);
		Map<String,Object>  result = new HashMap<String, Object>();
		boolean isSuccess = false;
	try {
	   ids.updateDantuan(dt);
		isSuccess = true;
		} catch (Exception e) {
			isSuccess = false;
			e.printStackTrace();		
		}		
	   result.put("success", isSuccess);
		return result;
       }
	
	
	@RequestMapping("fenghuang/getHtsjDate.do")
	@ResponseBody
	public JSONArray getHtsjDate(String ctsj ,String cfts){
		Map<String ,Object> result = new HashMap<String, Object>();
	
		if(cfts ==null || "".equals(cfts)){
			cfts = "0";
		}
		List<Map<String,Object>> date = ids.getDate(ctsj, cfts);
		
		//result.put("htsj", date);
		JSONArray fromOjbect = JSONArray.fromObject(date);
		//System.out.println(fromOjbect);
		return fromOjbect ;
	}

	}

