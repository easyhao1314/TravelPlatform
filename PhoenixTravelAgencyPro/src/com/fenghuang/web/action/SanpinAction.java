
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
//			sanpin.setShenpijia(shenpijia);
//			sanpin.setDakehujia(dakehu);
//			sanpin.setZhikejia(zhikejia);
//			sanpin.setTonghang(tonghang);
//			sanpin.setErtongzhanchuang(ertongzhanchuang);
//			sanpin.setErtongbuzhanchuang(ertongbuzhanchuang);
//			sanpin.setZibeiqianjia(zibeiqianjia);
//			sanpin.setNumberday(tianshu);
//			sanpin.setNumbercountry(guojiashu);
//			sanpin.setGroupdate(groupdate);
//			sanpin.setNumbermaster(numbermaster);
//			sanpin.setTourdate(Tourdate);
//			sanpin.setAreatype(Areatype);
//			sanpin.setAirways(airways);
//			sanpin.setTargetpopulation(targetpopulation);
//			sanpin.setGroupflight(groupflight);
//			sanpin.setDeparturecity(Departurecity);
//			sanpin.setTourflight(Tourflight);
//			sanpin.setTerminalCity(TerminalCity);
//			sanpin.setHotel(hotel);
//			sanpin.setProducttypes(Producttypes);
//			sanpin.setZao(zao);
//			sanpin.setZhong(zhong);
//			sanpin.setWan(wan);
//			sanpin.setProductbrand(productbrand);
//			sanpin.setPredict(predict);
			//续办签证 没写
			sanpin.setTeamexplains(teamexplains);
			sanpin.setServicesinclude(Servicesinclude);
			sanpin.setServicenoinclude(servicenoinclude);
			sanpin.setNotes(notes);
			DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd"); 
			try {
				Date date = format1.parse(Tourdate);
				
				
				
				
				System.out.println(date);
				sanpin.setTourdate(date);
				System.out.println(format1.format(date));
			    System.out.println("dddddd"+sanpin.getTourdate());
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			sanpin.setTuanName(tuanname);
			sanpin.setTuanNo(tuanno);
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