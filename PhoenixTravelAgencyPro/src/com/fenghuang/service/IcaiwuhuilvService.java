package com.fenghuang.service;

import java.util.List;
import java.util.Map;

import com.fenghuang.entiey.Bizhonghuilv;
import com.fenghuang.entiey.CitySettingDictionary;

import com.fenghuang.util.Pagination;

public interface IcaiwuhuilvService {
public boolean saveCitySettingDictionary(CitySettingDictionary citySd) throws Exception;
	
	public boolean savehuilv(Bizhonghuilv bizhonghuilv) throws Exception;

	public boolean updatehuilv(Bizhonghuilv bizhonghuilv) throws Exception;

	public boolean deletehuilv(Long id) throws Exception;


	public Pagination<Bizhonghuilv> getPaginationfkqr(int currentPage,
			int numPerPage,Bizhonghuilv bizhonghuilv)throws Exception;
	 public List<Map<String,Object>>  getDictionaryComboboxs() throws Exception;

}
