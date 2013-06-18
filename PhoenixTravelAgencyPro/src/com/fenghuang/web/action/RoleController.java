/**
 * 
 */
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

import com.fenghuang.entiey.Role;
import com.fenghuang.service.IRoleService;
import com.fenghuang.util.Pagination;

/**
 * @author 鲍国浩
 * 
 *         版本 ： 1.0
 * 
 *         日期 ：2013-6-18
 * 
 *         描述 ：
 * 
 * 
 */
@Controller
public class RoleController {

	@Autowired
	private IRoleService iRoleService;

	@RequestMapping("fenghuang/getRoles.do")
	@ResponseBody
	public Map<String, Object> getRoles(HttpServletRequest request,
			HttpServletResponse response, Integer page, Integer rows,
			String roleNo, String roleName, String roleDesc) {

		try {
			Pagination<Role> roles = iRoleService.getPaginationRoles(page,
					rows, roleNo, roleName, roleDesc);
			List<Map<String, Object>> roleRows = roles.getResultList();
			Map<String, Object> returnValue = new HashMap<String, Object>();
			returnValue.put("total", roles.getTotalRows());
			returnValue.put("rows", roleRows);
			return returnValue;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping("fenghuang/updateRoleInfo.do")
	@ResponseBody
	public Map<String, Object> updateRoleInfo(HttpServletRequest request,
			HttpServletResponse response, String updateRows) {
		Map<String, Object> result = new HashMap<String, Object>();
		JSONArray jsonArray = JSONArray.fromObject(updateRows);
		List<Role> roles = jsonArray.toList(jsonArray, Role.class);
		boolean isSuccess = false;
		try {
			iRoleService.updateRoles(roles);
			isSuccess = true;
		} catch (Exception e) {
			isSuccess = false;
			e.printStackTrace();
		}
		result.put("success", isSuccess);
		return result;
	}

	@RequestMapping("fenghuang/saveRole.do")
	@ResponseBody
	public Map<String, Object> saveRoleInfo(HttpServletRequest request,
			HttpServletResponse response, String roleNo, String roleName,
			String roleDesc) {
		Map<String, Object> result = new HashMap<String, Object>();
		boolean isSuccess = false;
		Role role = new Role();
		role.setRoleNo(roleNo);
		role.setRoleName(roleName);
		role.setRoleDesc(roleDesc);
		try {
			iRoleService.saveRole(role);
			isSuccess = true;
		} catch (Exception e) {
			isSuccess = false;
			e.printStackTrace();
		}
		result.put("success", isSuccess);
		return result;
	}

	@RequestMapping("fenghuang/deleteRoles.do")
	@ResponseBody
	public Map<String, Object> deleteDics(HttpServletRequest request,
			HttpServletResponse response, String deleteRows) {
		Map<String, Object> result = new HashMap<String, Object>();
		JSONArray jsonArray = JSONArray.fromObject(deleteRows);
		List<Role> roles = JSONArray.toList(jsonArray, Role.class);
		boolean isSuccess = false;
		try {
			iRoleService.deleteRoles(roles);
			isSuccess = true;
		} catch (Exception e) {
			isSuccess = false;
			e.printStackTrace();
		}
		result.put("success", isSuccess);
		return result;
	}

}
