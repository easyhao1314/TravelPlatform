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
import com.fenghuang.service.IRoleService;
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
	@Autowired
	private IRoleService iRoleService;
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
		if(id != null && !"".equals(id)){
			mp.setId(Long.valueOf(id));
		}
		
		
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
	@RequestMapping("fenghuang/getMenuPerssionsByRoleId.do")
	@ResponseBody
	public Map<String, Object> getMenuPerssionsByRoleId(HttpServletRequest request,
			HttpServletResponse response, Integer page, Integer rows,
			String roleId) {
		Long roleIdLong = 0l;
		if(roleId != null &&!"".endsWith(roleId)){
			roleIdLong = Long.valueOf(roleId);
			
			
		}
		try {
		 	Pagination<MenuPermission>  menuLists = iRoleService.getMenuPermissionsByRoleId(page.intValue(), rows.intValue(), roleIdLong);
			List<Map<String, Object>> menuPermissionRows = menuLists.getResultList();
			Map<String, Object> returnValue = new HashMap<String, Object>();
			returnValue.put("total", menuLists.getTotalRows());
			returnValue.put("rows", menuPermissionRows);
			return returnValue;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	@RequestMapping("fenghuang/getMenuPerssionsNotIncludeByRoleId.do")
	@ResponseBody
	public Map<String, Object> getMenuPerssionsNotIncludeByRoleId(HttpServletRequest request,
			HttpServletResponse response, Integer page, Integer rows,
			String roleId) {
		Long roleIdLong = 0l;
		if(roleId != null &&!"".endsWith(roleId)){
			roleIdLong = Long.valueOf(roleId);
			
			
		}
		try {
		 	Pagination<MenuPermission>  menuLists = iRoleService.getMenuPermissionsNotIncludeByRoleId(page.intValue(), rows.intValue(), roleIdLong);
			List<Map<String, Object>> menuPermissionRows = menuLists.getResultList();
			Map<String, Object> returnValue = new HashMap<String, Object>();
			returnValue.put("total", menuLists.getTotalRows());
			returnValue.put("rows", menuPermissionRows);
			return returnValue;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	@RequestMapping("fenghuang/saveMenuPerissionChange.do")
	@ResponseBody
	public Map<String,Object> saveMenuPerissionChange(HttpServletRequest request,
			HttpServletResponse response, String changesRows,String changesRowsdelete,String roleId){
		boolean isSuccess = false;
		Map<String, Object> result = new HashMap<String, Object>();
		try{

			JSONArray jsonArray = JSONArray.fromObject(changesRows);
			JSONArray jsonArray2 = JSONArray.fromObject(changesRowsdelete);
			List<MenuPermission>  mps = null;
			List<MenuPermission>  mps2 = null;
		
			if(jsonArray.size()>0){
				mps= JSONArray.toList(jsonArray,MenuPermission.class);
			}
			
			if(jsonArray2.size()>0){
				mps2 = JSONArray.toList(jsonArray2,MenuPermission.class);
			}
		if(roleId!=null && !"".equals(roleId)){
			iMenuPermissionService.saveMenuPerissionChange(mps, mps2, Long.valueOf(roleId));
		}
		isSuccess = true;
		}catch (Exception e) {
			e.printStackTrace();
			isSuccess = false;
		}
		result.put("success", isSuccess);
		return result;
	}
	
}
