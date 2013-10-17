
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
import com.fenghuang.util.CommonUtil;
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
			HttpServletResponse response,String Shenpijia,String dakehujia,String zhikejia,
			String tonghang,String ertongzhanchuang,String ertongbuzhanchuang,String zibeiqianjia,
			String tuanName,String tuanNo,String numberday,String numbercountry,String groupdate,String numbermaster,
			String Tourdate,String Areatype,String airways,String targetpopulation,String groupflight,
			String Departurecity,String Tourflight,String TerminalCity,String hotel,String Producttypes,
			String zao,String zhong,String wan,String productbrand,String predict,String report,String visa,
			String teamexplains,String Servicesinclude,String servicenoinclude,String notes,String master,String areatypetext,String beizhu){
			Sanpinzhongxin sanpin = new Sanpinzhongxin();
			
		try {
			sanpin.setTuanNo(tuanNo);
			
			
			if(tuanName!=null && !"".equals(tuanName)){
				sanpin.setTuanName(tuanName);
			}
			if(Shenpijia!=null && !"".equals(Shenpijia)){				
				sanpin.setShenpijia(Integer.parseInt(Shenpijia));
			}
			if(dakehujia!=null && !"".equals(dakehujia)){
				sanpin.setDakehujia(Float.parseFloat(dakehujia));
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
			if(numberday!=null && !"".equals(numberday)){
				sanpin.setNumberday(Integer.parseInt(numberday));
			}
			if(numbercountry!=null && !"".equals(numbercountry)){
				sanpin.setNumbercountry(Integer.parseInt(numbercountry));
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
			if(master!=null && !"".equals(master)){
				sanpin.setJiantuanren(Long.parseLong(master));
			}
			sanpin.setBeizhu(beizhu);
			sanpin.setFabustate(1);
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			

			boolean isSuccess = false;
			Map<String,Object> result = new HashMap<String, Object>();
		try {
			iss.AddSanpinzhongxin(sanpin,areatypetext);
			isSuccess=true;
		} catch (Exception e) {
			isSuccess=false;
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		result.put("success", isSuccess);
		return result;
	}
	@RequestMapping("fenghuang/upsanpin.do")
	@ResponseBody
	public Map<String,Object> Update(HttpServletRequest request,HttpServletResponse response,String fabustate,String tuanNo,
			String shoukestate,String tupian) {
		Sanpinzhongxin sanpin = new Sanpinzhongxin();
	if(fabustate!=null && !"".equals(fabustate)){
		sanpin.setFabustate(Integer.parseInt(fabustate));
	}
	if(tuanNo!=null && !"".equals(tuanNo)){
		sanpin.setTuanNo(tuanNo);
	}
	if(shoukestate!=null && !"".equals(shoukestate)){
		sanpin.setShoukestate(Integer.parseInt(shoukestate));
	}
	sanpin.setTupian(tupian);
		
	boolean isSuccess = false;
	Map<String,Object> result = new HashMap<String, Object>();
	try {
		iss.upSanpinzhongxin(sanpin);
		isSuccess=true;
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		isSuccess=false;
	}
		result.put("success", isSuccess);
		return result;
	}
	
	
	//分页散拼列表
	@RequestMapping("fenghuang/Sanpinliebiao.do")
	@ResponseBody
	public Map<String,Object> Sanpinliebiao(HttpServletRequest request,
			HttpServletResponse response, Integer page,Integer rows
			) {
		try {

			DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");    
			Sanpinzhongxin s = new Sanpinzhongxin();
			String tuanName= request.getParameter("tuanName");
			String groupdate=request.getParameter("groupdate") ;
			
			String Tourdate= request.getParameter("Tourdate");
			String productbrand= request.getParameter("productbrand");
			String tuanNo = request.getParameter("tuanNo");
			String fabustate = request.getParameter("fabustate");
			String master = request.getParameter("master");
			//发布状态
			if(fabustate!=null && !"".equals(fabustate)){
				s.setFabustate(Integer.parseInt(fabustate));
			}
			if(master!=null && !"".equals(master)){
				s.setJiantuanren(Long.parseLong(master));
			}
			
			
			
			if(tuanNo!=null && !"".equals(tuanNo)){
				s.setTuanNo(tuanNo);
			}
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
			
			
			if(page==null){
				page=1;
			}
			if(rows==null){
				rows=1;
			}
			
			
			
			Pagination<Sanpinzhongxin> pagination=(Pagination<Sanpinzhongxin>)iss.getByQueryConditionPagination(page,rows,s);
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
	
	
	@RequestMapping("fenghuang/deletesanpin.do")
	@ResponseBody
	public Map<String,Object> deletesanpin(HttpServletRequest request,HttpServletResponse response,String tuanNo,String xianluid) {
	Sanpinzhongxin sanpin = new Sanpinzhongxin();
	if(tuanNo!=null && !"".equals(tuanNo)){
		sanpin.setTuanNo(tuanNo);
	}
	boolean isSuccess = false;
	Map<String,Object> result = new HashMap<String, Object>();
	try {
		
		isSuccess=true;
		iss.DeleteSanpinzhongxin(sanpin, xianluid);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		isSuccess=false;
	}
		result.put("success", isSuccess);
		return result;
	}
	
	

	
	
	
}