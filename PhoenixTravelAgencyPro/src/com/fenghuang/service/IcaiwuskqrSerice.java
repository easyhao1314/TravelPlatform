package com.fenghuang.service;

import com.fenghuang.entiey.CitySettingDictionary;
import com.fenghuang.entiey.Fukuanqueren;
import com.fenghuang.entiey.Tuanbiao;
import com.fenghuang.util.Pagination;

public interface IcaiwuskqrSerice {
	public boolean saveCitySettingDictionary(CitySettingDictionary citySd) throws Exception;
	
	public boolean saveskqr(Tuanbiao tuanbiao) throws Exception;

	public boolean updateskqr(Tuanbiao tuanbiao) throws Exception;

	public boolean deleteskqr(Long id) throws Exception;


	public Pagination<Tuanbiao> getPaginationfkqr(int currentPage,
			int numPerPage,Tuanbiao tuanbiao)throws Exception;
}
