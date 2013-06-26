package com.fenghuang.web.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fenghuang.dao.IOperCenterDao;
import com.fenghuang.entiey.CustomerInfo;
import com.fenghuang.entiey.DantuanXinXi;
import com.fenghuang.service.IOperCenterService;
import com.fenghuang.util.DateJsonValueProcessor;
import com.fenghuang.util.Pagination;

/**
 * 操作中心
 * @author 陈家海
 *
 */
@Controller
public class OperateCenterController {

	@Resource
	private IOperCenterService iOperCenterService ;
	
	/**
	 * 操作团队查询
	 * @param request
	 * @param response
	 * @param page
	 * @param rows
	 * @param startTime 开始时间
	 * @param endTime 结束时间
	 * @param tuanhao 团号
	 * @param tuanming 团名
	 */
	@RequestMapping("/fenghuang/operTeamQueryCon.do")
	public void operTeamQuery(HttpServletRequest request,
			HttpServletResponse response, Integer page, Integer rows,
			String startTime , String endTime , String tuanhao,String tuanming){
		
		Pagination<DantuanXinXi> teams = iOperCenterService.getTeamsPaginations(page==null?1:page, rows==null?10:rows, startTime, endTime, tuanhao, tuanming);
		List<Map<String, Object>> teamsRows = teams.getResultList();
		Map<String, Object> returnValue = new HashMap<String, Object>();
		
		returnValue.put("total", teams.getTotalRows());
		returnValue.put("rows", teamsRows);
		//MAP中的Date类型转换成JSON格式不正确，需要转换时间格式
		JsonConfig config = new JsonConfig();
		config.registerJsonValueProcessor(Timestamp.class,new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
		//把MAP转换成JSON，返回到前台
		JSONObject fromObject = JSONObject.fromObject(returnValue,config);
		//System.out.println(fromObject);
		PrintWriter out =null ;
		try {
			out = response.getWriter();
			out.print(fromObject);
		} catch (IOException e) {
			e.printStackTrace();
		}
		out.flush();
	}
	
	/**
	 * 我派的订房任务，派单时间未确定。
	 * @param request
	 * @param response
	 * @param page 当前页数
	 * @param rows 每页显示的数据数
	 * @param chutuanStartTime 出团开始时间
	 * @param chutuanEndTime 出团结束时间
	 * @param kw 关键字
	 */
	@RequestMapping("/fenghuang/dingFangRenWu.do")
	public void dingFangRenWu(HttpServletRequest request,
			HttpServletResponse response, Integer page, Integer rows,
			String chutuanStartTime , String chutuanEndTime , String kw){
		
		Pagination<DantuanXinXi> teams = iOperCenterService.getDingFangRenWuPaginations(page==null?1:page, rows==null?10:rows,chutuanStartTime,chutuanEndTime,kw );
		
		List<Map<String, Object>> teamsRows = teams.getResultList();
		
		Map<String, Object> returnValue = new HashMap<String, Object>();
		
		//根据khId查询出客户name，把name存放到List中。
		for(int i = 0 ;i<teamsRows.size();i++){
			//System.out.println(teamsRows.get(i));
			for(Entry<String, Object> entrySet :teamsRows.get(i).entrySet()){
				if("khId".equals(entrySet.getKey())){
					String name = iOperCenterService.findCustomerNameById((Long)entrySet.getValue());
					teamsRows.get(i).put("name", name);
					//System.out.println(teamsRows.get(i));
					break;
				}
			}
		}
		
		returnValue.put("total", teams.getTotalRows());
		returnValue.put("rows", teamsRows);
		//MAP中的Date类型转换成JSON格式不正确，需要转换时间格式
		JsonConfig config = new JsonConfig();
		config.registerJsonValueProcessor(Timestamp.class,new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
		//把MAP转换成JSON，返回到前台
		JSONObject fromObject = JSONObject.fromObject(returnValue,config);
		//System.out.println(fromObject);
		PrintWriter out =null ;
		try {
			out = response.getWriter();
			out.print(fromObject);
		} catch (IOException e) {
			e.printStackTrace();
		}
		out.flush();
	}
	
}
