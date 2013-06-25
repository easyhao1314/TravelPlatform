package com.fenghuang.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IXialaLiebiao;
import com.fenghuang.service.IXialaLiebiaoService;
@Service
public class XialaLiebiaoServiceImpl implements IXialaLiebiaoService{
	
	@Autowired
	public  IXialaLiebiao xllb;
	@Override
	public List<Map<String,Object>> getCurrencySettingboboxs() throws Exception{
		// TODO 查询国家
		return xllb.getCurrencySettingboboxs();
	}

	@Override
	public List<Map<String, Object>> getCountryState() throws Exception {
		// TODO 查询所属洲
		return xllb.getCountryState();
	}

	@Override
	public List<Map<String, Object>> getHotleStar() throws Exception {
		// TODO 查询酒店星级
		return xllb.getHotleStar();
	}

}
