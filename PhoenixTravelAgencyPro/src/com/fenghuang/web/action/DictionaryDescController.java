/**
 * 
 */
package com.fenghuang.web.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.codehaus.jackson.JsonFactory;
import org.codehaus.jackson.JsonParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fenghuang.entiey.DictionaryDesc;
import com.fenghuang.service.IDictionaryDescService;
import com.fenghuang.util.Pagination;

/**
 * @author 鲍国浩
 * 
 *         版本 ： 1.0
 * 
 *         日期 ：2013-6-5
 * 
 *         描述 ：
 * 
 * 
 */
@Controller
public class DictionaryDescController {

	@Autowired
	private IDictionaryDescService iDictionaryDescService;
	@RequestMapping("fenghuang/getDictionaryDescs.do")
	@ResponseBody
	public Map<String,Object> getDictionaryDescPaginations(HttpServletRequest request,
			HttpServletResponse response, Integer page, Integer rows,String dicNo){
		Map<String,Object> result=new HashMap<String,Object>();
		try {
			DictionaryDesc dic=iDictionaryDescService.getDictionaryDesc(Integer.getInteger(dicNo));
			result.put("rows", dic);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return result;
	}
	@RequestMapping("fenghuang/getDictionaryDescs2.do")
	@ResponseBody
	public Map<String, Object> getDictionaryDescPaginations(HttpServletRequest request,
			HttpServletResponse response, Integer page, Integer rows,
			String dicType,String dicName,String dicHelp,String dicSortNo,String dicDesc) {

		int dicTypeCount = 0;
		if (dicType != null && !"".equals(dicType)) {
			dicTypeCount = Integer.valueOf(dicType);
		}
		DictionaryDesc ddDesc = new DictionaryDesc();
		ddDesc.setDicName(dicName);
		ddDesc.setDicDesc(dicDesc);
		ddDesc.setDicHelp(dicHelp);
		if(dicSortNo != null&&!"".equals(dicSortNo)){
			ddDesc.setDicSortNo(Integer.valueOf(dicSortNo));
		}else{
			ddDesc.setDicSortNo(-1);
		}
		ddDesc.setDicType(dicTypeCount);
		if(page==null){
			page=1;
		}
		if(rows==null){
			rows=2;
		}
		
		try {
			Pagination<DictionaryDesc> dicDescs = iDictionaryDescService.getDictionaryDescPaginations(page, rows, ddDesc);
			List<Map<String, Object>> dicDescRows = dicDescs.getResultList();
			Map<String, Object> returnValue = new HashMap<String, Object>();
			returnValue.put("total", dicDescs.getTotalRows());
			returnValue.put("rows", dicDescRows);
			return returnValue;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
    
	@RequestMapping("fenghuang/updatedictionary.do")
	@ResponseBody
	public Map<String,Object> updatedictionary(HttpServletRequest request,HttpServletResponse response,DictionaryDesc dic){
		Map<String,Object> result=new HashMap<String,Object>();
		boolean isSuccess=false;
		try{
			isSuccess=iDictionaryDescService.updateDictionaryDesc(dic);
		}catch(Exception e){
			e.printStackTrace();
		}
		result.put("success", isSuccess);
		return result;
	}
	
	@RequestMapping("fenghuang/updateDic.do")
	@ResponseBody
	public Map<String,Object> updateDic(HttpServletRequest request,
			HttpServletResponse response,String updateRows){
		Map<String,Object>  result = new HashMap<String, Object>();
		JSONArray jsonArray =  JSONArray.fromObject(updateRows);
		List<DictionaryDesc>  dics = JSONArray.toList(jsonArray, DictionaryDesc.class);	
		boolean isSuccess = false;
		
		try {
			iDictionaryDescService.updateDictionaryDescs(dics);
			isSuccess = true;
		} catch (Exception e) {
			isSuccess = false;
			e.printStackTrace();
		
		}		
		result.put("success", isSuccess);
		return result;
		
	}
	
	@RequestMapping("fenghuang/saveDic.do")
	@ResponseBody
	public Map<String,Object>  saveDic(HttpServletRequest request,HttpServletResponse response,String dicName,String dicHelp,String dicSortNo,String dicType,String dicDesc){
		Map<String,Object>  result = new HashMap<String, Object>();
		boolean  isSuccess = false;
		DictionaryDesc ddDesc = new DictionaryDesc();
		ddDesc.setDicName(dicName);
		ddDesc.setDicDesc(dicDesc);
		ddDesc.setDicHelp(dicHelp);
		if(dicSortNo!=null&&!"".equals(dicSortNo)){
		ddDesc.setDicSortNo(Integer.parseInt(dicSortNo));
		}
		if(dicType!=null && !"".equals(dicType)){
		ddDesc.setDicType(Integer.parseInt(dicType));
		}
		try {
			isSuccess = iDictionaryDescService.insertDictionaryDesc(ddDesc);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		result.put("success", isSuccess);
		
		return result;
	}
	
	@RequestMapping("fenghuang/deleteDics.do")
	@ResponseBody
	public Map<String,Object> deleteDics(HttpServletRequest request,
			HttpServletResponse response,String dicNo){
		Map<String,Object>  result = new HashMap<String, Object>();
			
		boolean isSuccess = false;
		try {
			isSuccess=iDictionaryDescService.deleteDictionaryDesc(Integer.parseInt(dicNo));
			
		} catch (Exception e) {
			isSuccess = false;
			e.printStackTrace();
		}	
		result.put("success", isSuccess);
	
		return result;
	}
	@RequestMapping("fenghuang/getDicByTypeComboboxs.do")
	@ResponseBody
	
	/*1.团队操作类型 2.团队级别3.团队状态4.合作级别5.币种
	 *6.旅游区域7.出访国家8.旅游城市9.是否10.性别
	 *11.销售12.计调13.客户经理14.签证标准15.导游报价标准
	 *16.酒店标准17.酒店报价标准18.车型19.巴士司导20.巴士报价标准
	 *21.用餐标准22.早餐标准23.午餐标准24.晚餐标准25.团队类型
	 *26.客户资信 27.客户价值  28.客户类别  29.客户VIP 30.目标人群
	 *31.产品类型 32.产品品牌
	 **/
	public List<Map<String, Object>> getComboxs(HttpServletRequest request,
			HttpServletResponse response,String dicType){
		
		try {
			return iDictionaryDescService.getDictionaryComboboxs(dicType);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return null;
	}
	
	
	
	
}
