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

import com.fenghuang.entiey.TestUser;
import com.fenghuang.entiey.dantuan;
import com.fenghuang.service.IdantuanService;
import com.fenghuang.util.Pagination;

@Controller
public class dantuanAction {
	@Autowired
	public IdantuanService ids;
	
	@RequestMapping("/add.do")
	public String testUserAction(HttpServletRequest request,
			HttpServletResponse response) {
		 String id=request.getParameter("id");
		 String name=request.getParameter("name");
		 String lxr=request.getParameter("lxr");
		 String dh=request.getParameter("dh");
       dantuan dt=new dantuan();
       dt.setId(Integer.valueOf(id));
       dt.setName(name);
       dt.setLxr(lxr);
       dt.setDh(Integer.valueOf(dh));
       
		try {
			ids.add(dt);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "0000";
	}

	@RequestMapping("/dantuan.do")
	@ResponseBody
	/*public Map<String,Object> getUsersAction(HttpServletRequest request,
			HttpServletResponse response, Integer page,
			Integer rows) {

		try {
		dantuan pagination = ids.select();
			
			Map<String,Object>  t= new HashMap<String, Object>();
			t.put("id", pagination.getId());
			t.put("name", pagination.getName());
			t.put("lxr", pagination.getLxr());
			t.put("dh", pagination.getDh());
			
			List list = new ArrayList();
			list.add(t);
			List list=ids.select();
			
			
			
			Map<String,Object> returnValue  = new HashMap<String, Object>();
			returnValue.put("total",  list.size());
			returnValue.put("rows", list );
			return returnValue;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;

	}*/
	public Map<String,Object> getUsersAction(HttpServletRequest request,
			HttpServletResponse response, Integer page,
			Integer rows) {

		try {
			Pagination<dantuan> pagination = (Pagination<dantuan>) ids.getByQueryConditionPagination(page, rows);
			List<Map<String, Object>> testUsers = pagination.getResultList();
			Map<String,Object> returnValue  = new HashMap<String, Object>();
			returnValue.put("total",  pagination.getTotalRows());
			returnValue.put("rows", testUsers);
			
			return returnValue;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;

	}
	
	
}

