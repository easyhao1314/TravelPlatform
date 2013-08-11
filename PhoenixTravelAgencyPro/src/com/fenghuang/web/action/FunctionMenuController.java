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

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.fenghuang.entiey.FunctionMenu;
import com.fenghuang.service.IFunctionMenuService;
import com.fenghuang.util.Pagination;

/**
 * @author 鲍国浩
 * 
 *         版本 ： 1.0
 * 
 *         日期 ：2013-6-17
 * 
 *         描述 ：
 * 
 * 
 */
@Controller
public class FunctionMenuController {

	@Autowired
	private IFunctionMenuService iFunctionMenuService;

	@RequestMapping("fenghuang/getFunctionMenus.do")
	@ResponseBody
	public Map<String, Object> getFunctionMenus(HttpServletRequest request,
			HttpServletResponse response, Integer page, Integer rows, Long id,
			String menuNo, String meunName, String menuPath, Long parentId,String sortNo,String menuType) {
		try {
			Pagination<FunctionMenu> fmspagination = iFunctionMenuService
					.getPaginationFunctionMenu(page, rows, id, menuNo,
							meunName, menuPath, parentId,sortNo,menuType);
			Map<String, Object> returnValue = new HashMap<String, Object>();
			if (fmspagination != null) {
				List<Map<String, Object>> fmsRows = fmspagination
						.getResultList();

				returnValue.put("total", fmspagination.getTotalRows());
				returnValue.put("rows", fmsRows);
			} else {
				returnValue.put("total", 0);
				returnValue.put("rows", new ArrayList<Map<String, Object>>());
			}
			System.out.println(request.getSession().getAttribute("userId"));
			return returnValue;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	@RequestMapping("fenghuang/saveFunctionMeun.do")
	@ResponseBody
	public Map<String, Object> saveFunctionMeun(HttpServletRequest request,
			HttpServletResponse response, Integer page, Integer rows,
			String menuNo, String meunName, String menuPath, Long parentId,
			Long sortNo,String id,String menuType) {
		FunctionMenu fm = new FunctionMenu();
		fm.setMenuNo(menuNo);
		fm.setMeunName(meunName);
		fm.setMenuPath(menuPath);
		fm.setSortNo(sortNo);
		fm.setParentId(parentId);
		//kan
		if(menuType!=null && !"".equals(menuType))
		{
			fm.setMenuType(Long.valueOf(menuType));
		}
		boolean isSuccess = false;
		Map<String, Object> result = new HashMap<String, Object>();
		if(id != null&& !"".equals(id))
		{
			try {
				fm.setId(Long.valueOf(id));
				iFunctionMenuService.updateFunctionMenu(fm);
				isSuccess = true;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else{

			try {
				iFunctionMenuService.saveFunctionMenu(fm);
				isSuccess = true;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		result.put("success", isSuccess);
		return result;
	}

	@RequestMapping("fenghuang/updateFunctionMeun.do")
	@ResponseBody
	public Map<String, Object> updateFunctionMeun(HttpServletRequest request,
			HttpServletResponse response, String updateRow) {

		Map<String, Object> result = new HashMap<String, Object>();
		FunctionMenu fm = (FunctionMenu) JSONObject.toBean(
				JSONObject.fromObject(updateRow), FunctionMenu.class);
		boolean isSuccess = false;
		try {
			iFunctionMenuService.updateFunctionMenu(fm);
			isSuccess = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		result.put("success", isSuccess);
		return result;
	}

	@RequestMapping("fenghuang/deleteFunctionMeun.do")
	@ResponseBody
	public Map<String, Object> deleteFunctionMeun(HttpServletRequest request,
			HttpServletResponse response, String id) {
		Long parseId = null;
		Map<String, Object> result = new HashMap<String, Object>();
		boolean isSuccess = false;
		try {
			if (id != null) {
				parseId = Long.valueOf(id);
				iFunctionMenuService.deleteFunctionMeunById(parseId);
				isSuccess = true;
			}
		} catch (Exception e) {
			isSuccess = false;
			e.printStackTrace();
		}
		result.put("success", isSuccess);
		return result;
	}
	
	@RequestMapping("fenghuang/getFunctionMenuComboboxs.do")
	@ResponseBody
	public List<Map<String, Object>> getFunctionMenuComboboxs(){
		
		
		try {
			return iFunctionMenuService.getFunctionMenuComboboxs();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	

}
