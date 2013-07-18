package com.fenghuang.service;



import com.fenghuang.entiey.CitySettingDictionary;
import com.fenghuang.entiey.Weihu;
import com.fenghuang.util.Pagination;

public interface IcaiwuweihuSerice {
public boolean saveCitySettingDictionary(CitySettingDictionary citySd) throws Exception;
	
public boolean saveweihu(Weihu weihu) throws Exception;

public boolean updateweihu(Weihu weihu) throws Exception;

public boolean deleteweihu(Long id) throws Exception;


public Pagination<Weihu> getPaginationweihu(int currentPage,
		int numPerPage,Weihu weihu)throws Exception;
}
