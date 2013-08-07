package com.fenghuang.service.impl;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.Idantuan;
import com.fenghuang.entiey.CitySettingDictionary;
import com.fenghuang.entiey.CountrySettingDictionary;
import com.fenghuang.entiey.DantuanXinXi;
import com.fenghuang.entiey.FunctionMenu;
import com.fenghuang.entiey.TestUser;
import com.fenghuang.entiey.Xianlu;
import com.fenghuang.service.IXianluService;
import com.fenghuang.service.IdantuanService;
import com.fenghuang.util.Pagination;

@Service
public class dantuanServiceImpl implements IdantuanService{
	
	@Autowired
	public Idantuan idt;
	@Autowired
	 IXianluService ixls;
	@Override
	public int add(DantuanXinXi dt) {
		// TODO 添加
		int count=idt.add(dt);
		if(count>0){
			Xianlu x=new Xianlu();
			x.setGuojia((int)(dt.getCfgj()));
			x.setTianshu(dt.getCfts());
			x.setXianluname(dt.getTuanName());
			try {
				ixls.AddXianlu(x);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return count;
	}

	@Override
	public Pagination<DantuanXinXi> getByQueryConditionPagination(int currentPage,
			int numPerPage) throws Exception {
		//查询全部
		return (Pagination<DantuanXinXi>) idt.getByQueryConditionPagination(currentPage, numPerPage);
	}
	
	@Override
		public Pagination<DantuanXinXi>  getDantuanLike(int currentPage,
				int numPerPage,String ctsj,String lyqy,String tdzt,Long tdjb)throws Exception{
		//模糊查询
			return idt.getDantuanLike(currentPage, numPerPage, ctsj, lyqy, tdzt, tdjb);
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

		@Override
		public List<Map<String,Object>> getDate(String ctsj, String cfts) {
			return idt.getDate(ctsj,cfts);
		}
	

}
