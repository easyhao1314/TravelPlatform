package com.fenghuang.service;

import java.util.List;
import java.util.Map;

import com.fenghuang.entiey.CitySettingDictionary;
import com.fenghuang.entiey.Tuanbiao;
import com.fenghuang.util.Pagination;

public interface IcaiwutdfylbService {
public boolean saveCitySettingDictionary(CitySettingDictionary citySd) throws Exception;
	
	public boolean savetdfy(Tuanbiao tuanbiao) throws Exception;

	public boolean updatetdfy(Tuanbiao tuanbiao) throws Exception;

	public boolean deletetdfy(Long id) throws Exception;


	public Pagination<Tuanbiao> getPaginationfkqr(int currentPage,
			int numPerPage,Tuanbiao tuanbiao)throws Exception;
	 public List<Map<String,Object>>  getDictionaryComboboxs() throws Exception;


	

}
