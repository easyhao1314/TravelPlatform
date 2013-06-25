package com.fenghuang.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.Idantuan;
import com.fenghuang.entiey.CitySettingDictionary;
import com.fenghuang.entiey.CountrySettingDictionary;
import com.fenghuang.entiey.DantuanXinXi;
import com.fenghuang.entiey.TestUser;
import com.fenghuang.service.IdantuanService;
import com.fenghuang.util.Pagination;

@Service
public class dantuanServiceImpl implements IdantuanService{
	
	@Autowired
	public Idantuan idt;

	@Override
	public int add(DantuanXinXi dt) {
		// TODO 添加
		return idt.add(dt);
	}

	@Override
	public Pagination<DantuanXinXi> getByQueryConditionPagination(int currentPage,
			int numPerPage) throws Exception {
		return (Pagination<DantuanXinXi>) idt.getByQueryConditionPagination(currentPage, numPerPage);
	}

	@Override
	public List<Map<String, Object>> selectDantuanId(String tuanNo) {
		// TODO 按id查询
		return idt.selectDantuanId(tuanNo);
	}

	@Override
	public boolean deleteDantuan(String tuanNo) {
		// TODO 删除
		return idt.deleteDantuan(tuanNo);
	}

	@Override
	public boolean updateDantuan(DantuanXinXi dt) {
		// TODO 修改
		return idt.updateDantuan(dt);
	}

	@Override
	public List<Map<String,Object>> getCurrencySettingboboxs() throws Exception{
		// TODO 查询国家
		return idt.getCurrencySettingboboxs();
	}

	@Override
	public List<Map<String, Object>> getCountryState() throws Exception {
		// TODO 查询所属洲
		return idt.getCountryState();
	}

	@Override
	public List<Map<String, Object>> getHotleStar() throws Exception {
		// TODO 查询酒店星级
		return idt.getHotleStar();
	}

	//待审批报价团查询
		public Pagination<DantuanXinXi> getDantuanDaishen(int currentPage,int numPerPage) throws Exception{
			return idt.getDantuanDaishen(currentPage, numPerPage);
		}
		//是否审批
		public boolean updateshenqi(String tuanNo){
			return idt.updateshenqi(tuanNo);
		}
		//已确认审批报价团查询
		public Pagination<DantuanXinXi> getDantuanYiqueren(int currentPage,int numPerPage) throws Exception{
			return idt.getDantuanYiqueren(currentPage, numPerPage);
		}

		@Override
		public boolean updateChengtuan(String tuanNo) {
			// TODO 是否成团
			return idt.updateChengtuan(tuanNo);
		}

		@Override
		public boolean updateChexiao(String tuanNo) {
			// TODO 撤销审批
			return idt.updateChexiao(tuanNo);
		}
	

}
