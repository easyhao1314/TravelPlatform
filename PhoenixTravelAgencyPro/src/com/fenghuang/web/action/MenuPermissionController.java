package com.fenghuang.web.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fenghuang.entiey.MenuPermission;
import com.fenghuang.service.IMenuPermissionService;
import com.fenghuang.util.Pagination;

/**
 * 
 * @author 鲍国浩
 *
 *  日期    @2013-6-19
 *  
 *  描述：
 *
 *
 *
 */

@Controller
public class MenuPermissionController {

	@Autowired
	private IMenuPermissionService iMenuPermissionService;
	@RequestMapping("fenghuang/getMenuPermissions.do")
	@ResponseBody
	public Map<String,Object> getMenuPermissions(HttpServletRequest request,HttpServletResponse response,Integer page,Integer rows,String id,String mpNo,String mpName,String mpDesc,String functionNo){
		Long parseId = 0l;
		if(id!=null&&!"".equals(id)){
			parseId = Long.valueOf(id);
		}
		
		try {
			Pagination<MenuPermission>  pmPagins = iMenuPermissionService.getPaginationMenuPermissions(page, rows, parseId, mpNo, mpName, mpDesc, functionNo);
			List<Map<String, Object>> mpRows = pmPagins.getResultList();
			Map<String, Object> returnValue = new HashMap<String, Object>();
			returnValue.put("total", pmPagins.getTotalRows());
			returnValue.put("rows", mpRows);
			return returnValue;
		
		} catch (Exception e) {	
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping("fenghuang/updateMenuPermissionInfo.do")
	@ResponseBody
	public Map<String, Object> updateMenuPermissionInfo(HttpServletRequest request,
			HttpServletResponse response, String updateRows) {
		Map<String, Object> result = new HashMap<String, Object>();
		JSONArray jsonArray = JSONArray.fromObject(updateRows);
		List<MenuPermission>  mps = JSONArray.toList(jsonArray, MenuPermission.class);
		boolean isSuccess = false;
		
		try {
			iMenuPermissionService.updateMenuPermissions(mps);
			isSuccess = true;
		} catch (Exception e) {
			isSuccess = false;
			e.printStackTrace();
		}
		result.put("success", isSuccess);
		return result;
	}
	@RequestMapping("fenghuang/saveMenuPermissionInfo.do")
	@ResponseBody
	public Map<String,Object> saveMenuPermissionInfo(HttpServletRequest request,HttpServletResponse response,String id,String mpNo,String mpName,String mpDesc,String functionNo){
		Map<String, Object> result = new HashMap<String, Object>();
		boolean isSuccess = false;
		MenuPermission mp = new MenuPermission();
		mp.setMpNo(mpNo);
		mp.setMpName(mpName);
		mp.setFunctionNo(functionNo);
		mp.setMpDesc(mpDesc);
		
		try {
			iMenuPermissionService.saveMenuPermission(mp);
			isSuccess = true;
		} catch (Exception e) {
			isSuccess = false;
			e.printStackTrace();
		}
		result.put("success", isSuccess);
		return result;
	}
	
	@RequestMapping("fenghuang/deleteMenuPermissions.do")
	@ResponseBody
	public Map<String,Object>  deleteMenuPermissions(HttpServletRequest request,
			HttpServletResponse response, String deleteRows){
		
		Map<String, Object> result = new HashMap<String, Object>();
		JSONArray jsonArray = JSONArray.fromObject(deleteRows);
		List<MenuPermission>  mps = JSONArray.toList(jsonArray,MenuPermission.class);
		boolean isSuccess = false;
		try {
			iMenuPermissionService.deleteMenuPermissions(mps);
			isSuccess = true;
		} catch (Exception e) {
			isSuccess = false;
			e.printStackTrace();
		}
		result.put("success", isSuccess);
		return result;
	}
	
	
	
	
}
