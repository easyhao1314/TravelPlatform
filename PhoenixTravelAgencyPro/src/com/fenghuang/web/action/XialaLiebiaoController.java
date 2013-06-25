package com.fenghuang.web.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fenghuang.service.IXialaLiebiaoService;
@Controller
public class XialaLiebiaoController {
	@Autowired
	public IXialaLiebiaoService xllbs;
	//查询国家
	@RequestMapping("fenghuang/CountrySetting.do")
	@ResponseBody
	public List<Map<String, Object>> Country(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			List<Map<String, Object>> currency=xllbs.getCurrencySettingboboxs();			
			return currency;
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return null;
	}
	//查询所属洲
	@RequestMapping("fenghuang/CountryState.do")
	@ResponseBody
	public List<Map<String,Object>> getCountryState(HttpServletRequest request,HttpServletResponse response){
		try{
		   List<Map<String,Object>> countrystate=xllbs.getCountryState();
		   return countrystate;
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	//查询酒店星级
	@RequestMapping("fenghuang/HotleStar.do")
	@ResponseBody
	public List<Map<String,Object>>  getHotleStar(HttpServletRequest request,HttpServletResponse response){
		try{
		   List<Map<String,Object>> countrystate=xllbs.getHotleStar();
		   return countrystate;
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}


}
