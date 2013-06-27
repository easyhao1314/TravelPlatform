/**
 * 
 */
package com.fenghuang.web.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fenghuang.entiey.Department;
import com.fenghuang.service.IDepartmentService;
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
public class DepartmentController {

	@Autowired
	private IDepartmentService iDepartmentService;

	@RequestMapping("fenghuang/saveOrUpdateDepartment.do")
	@ResponseBody
	public Map<String, Object> saveOrUpdateDepartment(
			HttpServletRequest request, HttpServletResponse response,
			String departNo, String departName, String sortNo, String id) {
		Map<String, Object> result = new HashMap<String, Object>();
		boolean isSuccess = false;
		try {
			Department dtt = new Department();
			dtt.setDepartName(departName);
			dtt.setDepartNo(departNo);
			dtt.setSortNo(Long.valueOf(sortNo));
			// 如果id不为0 说明是更新操作
			if (id != null && !"".equals(id)) {
				dtt.setId(Long.valueOf(id));
				iDepartmentService.updateDepartment(dtt);
				isSuccess = true;
			} else {// 保存操作
				iDepartmentService.saveDepartment(dtt);
				isSuccess = true;
			}
		} catch (Exception e) {
			isSuccess = false;
			e.printStackTrace();
		}
		result.put("success", isSuccess);

		return result;
	}

	@RequestMapping("fenghuang/getDepartments.do")
	@ResponseBody
	public Map<String, Object> getDepartments(HttpServletRequest request,
			HttpServletResponse response, Integer page, Integer rows,
			String departNo, String departName) {

		try {
			Pagination<Department> departPagins = iDepartmentService
					.getPaginationDepartments(page, rows, departNo, departName);
			Map<String, Object> returnValue = new HashMap<String, Object>();
			if (departPagins != null) {
				List<Map<String, Object>> dttRows = departPagins
						.getResultList();

				returnValue.put("total", departPagins.getTotalRows());
				returnValue.put("rows", dttRows);
			} else {
				returnValue.put("total", 0);
				returnValue.put("rows", new ArrayList<Map<String, Object>>());
			}
			return returnValue;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping("fenghuang/deleteDepartmentById.do")
	@ResponseBody
	public Map<String, Object> deleteDepartmentById(HttpServletRequest request,
			HttpServletResponse response, String id) {
		Map<String, Object> result = new HashMap<String, Object>();
		boolean isSuccess = false;
		Long parseId = null;
		try {
			if (id != null) {
				parseId = Long.valueOf(id);
				iDepartmentService.deleteDepartmentById(parseId);
				isSuccess = true;
			}
		} catch (Exception e) {
			isSuccess = false;
			e.printStackTrace();
		}
		result.put("success", isSuccess);
		return result;
	}
	@RequestMapping("fenghuang/getDepartmentComboboxs.do")
	@ResponseBody
	public List<Map<String, Object>> getDepartmentComboboxs(){
		
		try {
			return iDepartmentService.getDepartmentComboboxs();
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return null;
	}
}
