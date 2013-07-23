package com.fenghuang.service;

import com.fenghuang.entiey.CitySettingDictionary;
import com.fenghuang.entiey.Fukuanfangshi;
import com.fenghuang.util.Pagination;



public interface IcaiwufukuanService {
	
		public boolean saveCitySettingDictionary(CitySettingDictionary citySd) throws Exception;
			
		public boolean savefukuan(Fukuanfangshi fukuanfangshi) throws Exception;

		public boolean updatefukuan(Fukuanfangshi fukuanfangshi) throws Exception;

		public boolean deletefukuan(Long id) throws Exception;


		public Pagination<Fukuanfangshi> getPaginationweihu(int currentPage,
				int numPerPage,Fukuanfangshi fukuanfangshi)throws Exception;
}
