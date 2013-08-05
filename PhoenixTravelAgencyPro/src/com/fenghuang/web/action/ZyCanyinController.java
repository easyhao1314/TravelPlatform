package com.fenghuang.web.action;

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

import com.fenghuang.entiey.Canyin;
import com.fenghuang.service.IZyCanyinService;
import com.fenghuang.util.DateJsonValueProcessor;
import com.fenghuang.util.Pagination;
@Controller
public class ZyCanyinController {
	@Autowired
	public IZyCanyinService izcs;
	private Object returnValue;
	// 查询
	@RequestMapping("fenghuang/canyinSelect.do")
	@ResponseBody
	public Map<String,Object> canyinSelect(HttpServletRequest request,
			HttpServletResponse response, Integer page,Integer rows,String name,String chengshiId,String hzjbId) {
		try {
			Pagination<Canyin> pagination=(Pagination<Canyin>)izcs.canyinSelect(page, rows,name,chengshiId,hzjbId);
			List<Map<String, Object>> canyinList = pagination.getResultList();
			Map<String,Object> returnValue  = new HashMap<String, Object>();
			for(int i = 0 ;i<canyinList.size();i++){
				for(Entry<String, Object> entry : canyinList.get(i).entrySet()){
					if(entry.getValue() == null){
						entry.setValue("") ;
					}
				}
			}
			returnValue.put("total",  pagination.getTotalRows());
			returnValue.put("rows", canyinList);	
			JsonConfig config = new JsonConfig();
	     	config.registerJsonValueProcessor(Timestamp.class,new DateJsonValueProcessor("yyyy-MM-dd"));
	     			//把MAP转换成JSON，返回到前台
	     	JSONObject fromObject = JSONObject.fromObject(returnValue,config);
	     	//System.out.println(fromObject);
			return fromObject;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	//添加
		@RequestMapping("fenghuang/canyinAdd.do")
		@ResponseBody
		public Map<String,Object> canyinAdd(HttpServletRequest request,HttpServletResponse response,
				String chengshiId,String name,String dizhi,String lianxiren,String dianhua,String shouji,
				String chuanzhen,String Email,String fkfsId,String hzjbId,String cbwu,String cbliu,String cbqi,String cbba,String yecf,
				String yenlsm,String etcf,String etcfsm,String cgczs,String rnrs,String mfzdsm,String sfxydw,String sffxdw,String beizhu){
			Canyin cy=new Canyin();	
			if(chengshiId != null && !"".equals(chengshiId)){
			cy.setChengshiId(Integer.parseInt(chengshiId));
			}
			cy.setName(name);
			cy.setDizhi(dizhi);
			cy.setLianxiren(lianxiren);
			cy.setDianhua(dianhua);
			cy.setShouji(shouji);
			cy.setChuanzhen(chuanzhen);
			cy.setEmail(Email);
			if(fkfsId != null && !"".equals(fkfsId)){
			cy.setFkfsId(Integer.parseInt(fkfsId));
			}
			if(hzjbId != null && !"".equals(hzjbId)){
			cy.setHzjbId(Integer.parseInt(hzjbId));
			}
			if(cbwu != null && !"".equals(cbwu)){
			cy.setCbwu(Integer.parseInt(cbwu));
			}
			if(cbliu != null && !"".equals(cbliu)){
            cy.setCbliu(Integer.parseInt(cbliu));
			}
			if(cbqi != null && !"".equals(cbqi)){
            cy.setCbqi(Integer.parseInt(cbqi));
			}
			if(cbba != null && !"".equals(cbba)){
            cy.setCbba(Integer.parseInt(cbba));
			}
			if(yecf != null && !"".equals(yecf)){
            cy.setYecf(Integer.parseInt(yecf));
			}
            cy.setYenlsm(yenlsm);
            cy.setYenlsm(yenlsm);
            if(etcf != null && !"".equals(etcf)){
            cy.setEtcf(Integer.parseInt(etcf));
            }
            cy.setEtcfsm(etcfsm);
            if(cgczs != null && !"".equals(cgczs)){
            cy.setCgczs(Integer.parseInt(cgczs));
            }
            if(rnrs != null && !"".equals(rnrs)){
            cy.setRnrs(Integer.parseInt(rnrs));
            }
            cy.setMfzdsm(mfzdsm);
            if(sfxydw != null && !"".equals(sfxydw)){
            cy.setSfxydw(Integer.parseInt(sfxydw));
            }
            if(sffxdw != null && !"".equals(sffxdw)){
            cy.setSffxdw(Integer.parseInt(sffxdw));
            }

            cy.setBeizhu(beizhu);

			  Map<String,Object> result=new HashMap<String,Object>();
			  boolean bl=false;
				try{
					izcs.canyinAdd(cy);
					bl=true;   
				}catch(Exception e){
					e.printStackTrace();
				}
				result.put("success", bl);
				return result;
			}
	  
		//删除
		@RequestMapping("fenghuang/canyinDelete.do")
		@ResponseBody
		public Map<String,Object> canyinDelete(HttpServletRequest request,HttpServletResponse response,long id){
			Map<String,Object> result=new HashMap<String,Object>();
			boolean bl=false;
			try{
			 bl=izcs.canyinDelete(id);
			}catch(Exception e){
				e.printStackTrace();
			}
			result.put("success", bl);
			return result;
		}
		//按id查询
		@RequestMapping("fenghuang/canyinSelectId.do")
		@ResponseBody
		public Map<String,Object> canyinSelectId(HttpServletRequest request,HttpServletResponse response,long id){
			Map<String,Object> result=new HashMap<String,Object>();
			try{
				 List<Map<String, Object>> cylist=izcs.canyinSelectId(id);
				 for(int i = 0 ;i<cylist.size();i++){
						for(Entry<String, Object> entry : cylist.get(i).entrySet()){
							if(entry.getValue() == null){
								entry.setValue("") ;
							}
						}
					}
					result.put("rows",cylist);
					JsonConfig config = new JsonConfig();
			     	config.registerJsonValueProcessor(Timestamp.class,new DateJsonValueProcessor("yyyy-MM-dd"));
			     			//把MAP转换成JSON，返回到前台
			     	JSONObject fromObject = JSONObject.fromObject(result,config);
					return fromObject;
			}catch(Exception e){
				e.printStackTrace();
			}
			return result;
		}
		// 修改
		@RequestMapping("fenghuang/canyinUpdate.do")
		@ResponseBody
		public Map<String,Object> canyinUpdate(HttpServletRequest request,HttpServletResponse response,
				String chengshiId,String name,String dizhi,String lianxiren,String dianhua,String shouji,
				String chuanzhen,String Email,String fkfsId,String hzjbId,String cbwu,String cbliu,String cbqi,String cbba,String yecf,
				String yenlsm,String etcf,String etcfsm,String cgczs,String rnrs,String mfzdsm,String sfxydw,String sffxdw,String beizhu,long id){
			   Canyin cy=new Canyin();

			  if(chengshiId != null && !"".equals(chengshiId)){
				cy.setChengshiId(Integer.parseInt(chengshiId));
				}
				cy.setName(name);
				cy.setDizhi(dizhi);
				cy.setLianxiren(lianxiren);
				cy.setDianhua(dianhua);
				cy.setShouji(shouji);
				cy.setChuanzhen(chuanzhen);
				cy.setEmail(Email);
				if(fkfsId != null && !"".equals(fkfsId)){
				cy.setFkfsId(Integer.parseInt(fkfsId));
				}
				if(hzjbId != null && !"".equals(hzjbId)){
				cy.setHzjbId(Integer.parseInt(hzjbId));
				}
				if(cbwu != null && !"".equals(cbwu)){
				cy.setCbwu(Integer.parseInt(cbwu));
				}
				if(cbliu != null && !"".equals(cbliu)){
	            cy.setCbliu(Integer.parseInt(cbliu));
				}
				if(cbqi != null && !"".equals(cbqi)){
	            cy.setCbqi(Integer.parseInt(cbqi));
				}
				if(cbba != null && !"".equals(cbba)){
	            cy.setCbba(Integer.parseInt(cbba));
				}
				if(yecf != null && !"".equals(yecf)){
	            cy.setYecf(Integer.parseInt(yecf));
				}
	            cy.setYenlsm(yenlsm);
	            cy.setYenlsm(yenlsm);
	            if(etcf != null && !"".equals(etcf)){
	            cy.setEtcf(Integer.parseInt(etcf));
	            }
	            cy.setEtcfsm(etcfsm);
	            if(cgczs != null && !"".equals(cgczs)){
	            cy.setCgczs(Integer.parseInt(cgczs));
	            }
	            if(rnrs != null && !"".equals(rnrs)){
	            cy.setRnrs(Integer.parseInt(rnrs));
	            }
	            cy.setMfzdsm(mfzdsm);
	            if(sfxydw != null && !"".equals(sfxydw)){
	            cy.setSfxydw(Integer.parseInt(sfxydw));
	            }
	            if(sffxdw != null && !"".equals(sffxdw)){
	            cy.setSffxdw(Integer.parseInt(sffxdw));
	            }

	            cy.setBeizhu(beizhu);

			cy.setId(id);

			 
			  Map<String,Object> result=new HashMap<String,Object>();
			  boolean bl=false;
				try{
					izcs.canyinUpdate(cy);
					bl=true;   
				}catch(Exception e){
					e.printStackTrace();
				}
				result.put("success", bl);
				return result;
			}
		


}
