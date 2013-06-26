package com.fenghuang.dao.impl;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IXialaLiebiao;
@Repository
public class XialaLiebiaoDaoImpl extends BaseDao implements IXialaLiebiao{
	@Autowired
	public XialaLiebiaoDaoImpl(DataSource dataSource) {
		super(dataSource);
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<Map<String,Object>> getCurrencySettingboboxs() throws Exception{
		String sql = "select csdNo,csdName from countrysettingdictionary";
		List<Map<String, Object>> currency = this.queryForList(sql);
		return currency ;
		
	}

	@Override
	public List<Map<String, Object>> getCountryState() throws Exception {
		// TODO所属 洲
		String sql="select id,csName from countrystate";
		List<Map<String,Object>> countryState=this.queryForList(sql);
		return countryState;
	}

	@Override
	public List<Map<String, Object>> getHotleStar() throws Exception {
		// TODO 酒店星级
		String sql="select hsdNo,hsbName from hotlestardictionary";
		List<Map<String,Object>> hotlestar=this.queryForList(sql);
		return hotlestar;
	}

}
