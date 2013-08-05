package com.fenghuang.web.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fenghuang.service.IcaiwusfkzhwhService;

@Controller
public class CaiwuskzhwhControll {
	@Autowired 
	IcaiwusfkzhwhService icaiwusfkzhwhService;
	@RequestMapping("fenghuang/caiwusfkzhwhselect.do")
	@ResponseBody
	public List<Map<String, Object>> getComboxs(HttpServletRequest request,
			HttpServletResponse response){
		try {
			return icaiwusfkzhwhService.getDictionaryComboboxs();
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return null;
		
	}
}
