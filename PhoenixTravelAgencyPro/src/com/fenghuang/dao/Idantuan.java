package com.fenghuang.dao;

import java.util.List;
import java.util.Map;

import com.fenghuang.entiey.CitySettingDictionary;
import com.fenghuang.entiey.CountrySettingDictionary;
import com.fenghuang.entiey.DantuanXinXi;
import com.fenghuang.entiey.TestUser;
import com.fenghuang.entiey.Usersrr;
import com.fenghuang.util.Pagination;

public interface Idantuan {
	//添加
	public int add(DantuanXinXi dt);
	//分页查询全部
	public Pagination<DantuanXinXi> getByQueryConditionPagination(int currentPage,int numPerPage) throws Exception;
	//待审批报价团查询
	public Pagination<DantuanXinXi> getDantuanDaishen(int currentPage,int numPerPage) throws Exception;
	//是否成团
	public boolean updateChengtuan(String tuanNo);
	//是否审批
	public boolean updateshenqi(String tuanNo);
	//撤销审批
	public boolean updateChexiao(String tuanNo);
	//已确认审批报价团查询
	public Pagination<DantuanXinXi> getDantuanYiqueren(int currentPage,int numPerPage) throws Exception;
	//按id查询
	public List<Map<String, Object>> selectDantuanId(String tuanNo);
	//删除
	public boolean deleteDantuan(String tuanNo);
	//修改
	public boolean updateDantuan(DantuanXinXi dt);
	//查询国家
	public List<Map<String,Object>>  getCurrencySettingboboxs() throws Exception;
	//查询所属洲
	public List<Map<String,Object>>  getCountryState() throws Exception;
	//酒店星级HotleStardictionary
	public List<Map<String,Object>>  getHotleStar() throws Exception;
}