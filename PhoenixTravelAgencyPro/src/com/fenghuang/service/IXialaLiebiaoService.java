package com.fenghuang.service;

import java.util.List;
import java.util.Map;

public interface IXialaLiebiaoService {
	//国家查询
			public List<Map<String,Object>> getCurrencySettingboboxs() throws Exception;
			//查询所属洲
			public List<Map<String,Object>>  getCountryState() throws Exception;
			//酒店星级HotleStardictionary
			public List<Map<String,Object>>  getHotleStar() throws Exception;

}
