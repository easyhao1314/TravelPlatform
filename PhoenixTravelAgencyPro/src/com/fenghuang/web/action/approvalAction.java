package com.fenghuang.web.action;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fenghuang.entiey.Approval;
import com.fenghuang.service.IApprovalService;
import com.fenghuang.util.DateJsonValueProcessor;
import com.fenghuang.util.Pagination;

@Controller
public class approvalAction {
	@Autowired
	private IApprovalService is;
	
	@RequestMapping("fenghuang/Approvalinfo.do")
	@ResponseBody
	public Map<String,Object> approvalinfo(HttpServletRequest request,
			HttpServletResponse response, Integer page,Integer rows,
			String approvalNo,String tuanNo,String approvalStauts,
			String shenpitype
			) {
		try {
			Approval a= new Approval();
			if(approvalNo!=null && !"".equals(approvalNo)){
				a.setApprovalNo(Long.parseLong(approvalNo));
			}
			if(shenpitype!=null && !"".equals(shenpitype)){
				a.setShenpitype(Integer.parseInt(shenpitype));
			}
			if(tuanNo!=null && !"".equals(tuanNo)){
				a.setApprovaltuanNo(tuanNo);
			}
			if(approvalStauts!=null && !"".equals(approvalStauts)){
				a.setApprovalStatus(Integer.parseInt(approvalStauts));
			}
			if(page==null){
				page=1;
			}
			if(rows==null){
				rows=1;
			}
			Pagination<Approval> pagination=(Pagination<Approval>)is.getByQueryConditionPagination(page, rows, a);
			List<Map<String, Object>> testUsers = pagination.getResultList();
			Map<String,Object> returnValue  = new HashMap<String, Object>();
			for(int i = 0 ;i<testUsers.size();i++){
				for(Entry<String, Object> entry : testUsers.get(i).entrySet()){
					if(entry.getValue() == null){
						entry.setValue("") ;
					}
				}
			}
			returnValue.put("total", pagination.getTotalRows());
			returnValue.put("rows", testUsers);	
			JsonConfig config = new JsonConfig();
	     	config.registerJsonValueProcessor(Timestamp.class,new DateJsonValueProcessor("yyyy-MM-dd"));
	     			//把MAP转换成JSON，返回到前台
	     	JSONObject fromObject = JSONObject.fromObject(returnValue,config);
	     	System.out.println(fromObject+"执行");
			return fromObject;
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return null;
	}
	
	@RequestMapping("fenghuang/addApproval.do")
	@ResponseBody
	public Map<String,Object> DantuanXunjia(HttpServletRequest request,
			HttpServletResponse response,String shiwu,String shenqingren,String shenpiren,String beizhu,String approvaltype
			,String tuanNo,String approvalStatus,String bmid){
		Approval a = new Approval();
		//中文转码
		try {
			if(tuanNo!=null && !"".equals(tuanNo)){
				String t = new String(tuanNo.getBytes("ISO-8859-1"),"UTF-8");
				a.setApprovaltuanNo(t);
			}
			if(shiwu!=null && !"".equals(shiwu)){
			String sw = new String(shiwu.getBytes("ISO-8859-1"),"UTF-8");
			a.setShiwu(sw);
			}
			if(approvaltype!=null && !"".equals(approvaltype)){
				a.setShenpitype(Integer.parseInt(approvaltype));
			}
			if(beizhu!=null && !"".equals(beizhu)){
				String bz = new String(beizhu.getBytes("ISO-8859-1"),"UTF-8");
				a.setBeizhu(bz);
			}
			if(shenqingren!=null && !"".equals(shenqingren)){
				a.setShenqingren(Long.parseLong(shenqingren));
			}
			if(shenpiren!=null && !"".equals(shenpiren)){
				a.setShenheren(Long.parseLong(shenpiren));
			}
			if(approvalStatus!=null && !"".equals(approvalStatus)){
				a.setApprovalStatus(Integer.parseInt(approvalStatus));
			}
			if(bmid!=null && !"".equals(bmid)){
				a.setBmid(Long.parseLong(bmid));
			}
			
			
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		boolean isSuccess = false;
		Map<String,Object> result = new HashMap<String, Object>();
		try {
			is.ApprovalAdd(a);
			isSuccess=true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			isSuccess=false;
			e.printStackTrace();
		}
		result.put("success", isSuccess);
		return result;
	}
}
