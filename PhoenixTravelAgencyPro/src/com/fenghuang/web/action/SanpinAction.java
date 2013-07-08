
package com.fenghuang.web.action;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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

import com.fenghuang.entiey.Sanpinzhongxin;
import com.fenghuang.service.ISanpinzhongxinService;
import com.fenghuang.util.DateJsonValueProcessor;
import com.fenghuang.util.Pagination;

@Controller
public class SanpinAction {
	@Autowired
	private ISanpinzhongxinService iss;
	//添加散拼信息
	@RequestMapping("fenghuang/addsanpin.do")
	@ResponseBody
	public Map<String, Object> Addsanpin(HttpServletRequest request,
			HttpServletResponse response,String shenpijia,String dakehu,String zhikejia,
			String tonghang,String ertongzhanchuang,String ertongbuzhanchuang,String zibeiqianjia,
			String tuanname,String tuanno,String tianshu,String guojiashu,String groupdate,String numbermaster,
			String Tourdate,String Areatype,String airways,String targetpopulation,String groupflight,
			String Departurecity,String Tourflight,String TerminalCity,String hotel,String Producttypes,
			String zao,String zhong,String wan,String productbrand,String predict,String report,String visa,
			String teamexplains,String Servicesinclude,String servicenoinclude,String notes){
			Sanpinzhongxin sanpin = new Sanpinzhongxin();
			
		try {
			if(tuanno!=null && !"".equals(tuanno)){
				sanpin.setTuanNo(tuanno);
			}
			if(tuanname!=null && !"".equals(tuanname)){
				sanpin.setTuanName(tuanname);
			}
			if(shenpijia!=null && !"".equals(shenpijia)){				
				sanpin.setShenpijia(Integer.parseInt(shenpijia));
			}
			if(dakehu!=null && !"".equals(dakehu)){
				sanpin.setDakehujia(Float.parseFloat(dakehu));
			}
			if(zhikejia!=null && !"".equals(zhikejia)){
				sanpin.setZhikejia(Float.parseFloat(zhikejia));
			}
			if(tonghang!=null && !"".equals(tonghang)){
				sanpin.setTonghang(Float.parseFloat(tonghang));
			}
			if(ertongzhanchuang!=null && !"".equals(ertongzhanchuang)){
				sanpin.setErtongzhanchuang(Float.parseFloat(ertongzhanchuang));
			}
			if(ertongbuzhanchuang!=null && !"".equals(ertongbuzhanchuang)){
				sanpin.setErtongbuzhanchuang(Float.parseFloat(ertongbuzhanchuang));
			}
			if(zibeiqianjia!=null && !"".equals(zibeiqianjia)){
				sanpin.setZibeiqianjia(Float.parseFloat(zibeiqianjia));
			}
			if(tianshu!=null && !"".equals(tianshu)){
				sanpin.setNumberday(Integer.parseInt(tianshu));
			}
			if(guojiashu!=null && !"".equals(guojiashu)){
				sanpin.setNumbercountry(Integer.parseInt(guojiashu));
			}
			DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd"); 
			if(groupdate!=null && !"".equals(groupdate)){
				Date dategroupdate = format1.parse(groupdate);
				sanpin.setGroupdate(dategroupdate);
				
			}
			if(numbermaster!=null && !"".equals(numbermaster)){				
				sanpin.setNumbermaster(Integer.parseInt(numbermaster));
			}
			if(Tourdate!=null && !"".equals(Tourdate)){
				Date dateTourdate = format1.parse(Tourdate);
				sanpin.setTourdate(dateTourdate);
			}
			if(Areatype!=null && !"".equals(Areatype)){
				sanpin.setAreatype(Long.parseLong(Areatype));
			}
			if(airways!=null && !"".equals(airways)){
				sanpin.setAirways(airways);
			}
			if(targetpopulation!=null && !"".equals(targetpopulation)){
				sanpin.setTargetpopulation(Long.parseLong(targetpopulation));
			}
			if(groupflight!=null && !"".equals(groupflight)){
				sanpin.setGroupflight(groupflight);
			}
			if(Departurecity!=null && !"".equals(Departurecity)){
				sanpin.setDeparturecity(Long.parseLong(Departurecity));
			}
			if(Tourflight!=null && !"".equals(Tourflight)){
				sanpin.setTourflight(Tourflight);
			}
			if(TerminalCity!=null && !"".equals(TerminalCity)){
				sanpin.setTerminalCity(Long.parseLong(TerminalCity));
			}
			if(hotel!=null && !"".equals(hotel)){
				sanpin.setHotel(Long.parseLong(hotel));
			}
			if(Producttypes!=null && !"".equals(Producttypes)){
				sanpin.setProducttypes(Long.parseLong(Producttypes));
			}
			if(zao!=null && !"".equals(zao)){
				sanpin.setZao(Long.parseLong(zao));
			}
			if(zhong!=null && !"".equals(zhong)){
				sanpin.setZhong(Long.parseLong(zhong));
			}
			if(wan!=null && !"".equals(wan)){
				sanpin.setWan(Long.parseLong(wan));
			}
			if(productbrand!=null && !"".equals(productbrand)){
				sanpin.setProductbrand(Long.parseLong(productbrand));
			}
			if(predict!=null && !"".equals(predict)){
				sanpin.setPredict(Integer.parseInt(predict));
			}
			//续办签证 没写
			if(teamexplains!=null && !"".equals(teamexplains)){
				sanpin.setTeamexplains(teamexplains);
			}
			if(Servicesinclude!=null && !"".equals(Servicesinclude)){
				sanpin.setServicesinclude(Servicesinclude);
			}
			if(servicenoinclude!=null && !"".equals(servicenoinclude)){
				sanpin.setServicenoinclude(servicenoinclude);
			}
			if(notes!=null && !"".equals(notes)){
				sanpin.setNotes(notes);
			}
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			

			boolean isSuccess = false;
			Map<String,Object> result = new HashMap<String, Object>();
		try {
			iss.AddSanpinzhongxin(sanpin);
			isSuccess=true;
		} catch (Exception e) {
			isSuccess=false;
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		result.put("success", isSuccess);
		return result;
	}
	//分页散拼列表
	@RequestMapping("fenghuang/Sanpinliebiao.do")
	@ResponseBody
	public Map<String,Object> DantuanXunjia(HttpServletRequest request,
			HttpServletResponse response, Integer page,Integer rows
			) {
		try {

			DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");    
			Sanpinzhongxin s = new Sanpinzhongxin();
			String tuanName= request.getParameter("tuanName");
			String groupdate=request.getParameter("groupdate") ;
			
			String Tourdate= request.getParameter("Tourdate");
			String productbrand= request.getParameter("productbrand");

			if(tuanName!=null && !"".equals(tuanName)){
				s.setTuanName(tuanName);
			}
			if(groupdate!=null && !"".equals(groupdate)){
				s.setGroupdate(format1.parse(groupdate));
			}
			if(Tourdate!=null && !"".equals(Tourdate)){
				s.setTourdate(format1.parse(Tourdate));
			}
			if(productbrand!=null && !"".equals(productbrand)){
				s.setProductbrand(Long.parseLong(productbrand));
			}
			
			
			Pagination<Sanpinzhongxin> pagination=(Pagination<Sanpinzhongxin>)iss.getByQueryConditionPagination(page, rows,s);
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
	
	
}