
package com.fenghuang.web.action;

import java.sql.Date;
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
import com.fenghuang.entiey.Sanpinzhongxin;
import com.fenghuang.service.ISanpinzhongxinService;
import com.fenghuang.util.DateJsonValueProcessor;
import com.fenghuang.util.Pagination;

@Controller
public class SanpinAction {
	@Autowired
	private ISanpinzhongxinService iss;
	
	@RequestMapping("fenghuang/addsanpin.do")
	@ResponseBody
	public Map<String, Object> Addsanpin(HttpServletRequest request,
			HttpServletResponse response,Integer shenpijia,Float dakehu,Float zhikejia,
			Float tonghang,Float ertongzhanchuang,Float ertongbuzhanchuang,Float zibeiqianjia,
			String tuanname,String tuanno,Integer tianshu,Integer guojiashu,Date groupdate,Integer numbermaster,
			Date Tourdate,Long Areatype,String airways,Long targetpopulation,String groupflight,
			Long Departurecity,String Tourflight,Long TerminalCity,Long hotel,Long Producttypes,
			Long zao,Long zhong,Long wan,Long productbrand,Integer predict,Integer report,Integer visa,
			String teamexplains,String Servicesinclude,String servicenoinclude,String notes){
		
		
			Sanpinzhongxin sanpin = new Sanpinzhongxin();
			sanpin.setShenpijia(shenpijia);
			sanpin.setDakehujia(dakehu);
			sanpin.setZhikejia(zhikejia);
			sanpin.setTonghang(tonghang);
			sanpin.setErtongzhanchuang(ertongzhanchuang);
			sanpin.setErtongbuzhanchuang(ertongbuzhanchuang);
			sanpin.setZibeiqianjia(zibeiqianjia);
			sanpin.setNumberday(tianshu);
			sanpin.setNumbercountry(guojiashu);
			sanpin.setGroupdate(groupdate);
			sanpin.setNumbermaster(numbermaster);
			sanpin.setTourdate(Tourdate);
			sanpin.setAreatype(Areatype);
			sanpin.setAirways(airways);
			sanpin.setTargetpopulation(targetpopulation);
			sanpin.setGroupflight(groupflight);
			sanpin.setDeparturecity(Departurecity);
			sanpin.setTourflight(Tourflight);
			sanpin.setTerminalCity(TerminalCity);
			sanpin.setHotel(hotel);
			sanpin.setProducttypes(Producttypes);
			sanpin.setZao(zao);
			sanpin.setZhong(zhong);
			sanpin.setWan(wan);
			sanpin.setProductbrand(productbrand);
			sanpin.setPredict(predict);
			//续办签证 没写
			sanpin.setTeamexplains(teamexplains);
			sanpin.setServicesinclude(Servicesinclude);
			sanpin.setServicenoinclude(servicenoinclude);
			sanpin.setNotes(notes);
			
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
	
	
}