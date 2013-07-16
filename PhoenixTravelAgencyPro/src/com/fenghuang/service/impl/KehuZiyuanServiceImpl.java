package com.fenghuang.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IKehuziyuanDao;
import com.fenghuang.entiey.KuhuZiyuan;
import com.fenghuang.service.IKehuZiyuanService;
import com.fenghuang.util.Pagination;
@Service
public class KehuZiyuanServiceImpl implements IKehuZiyuanService{
	@Autowired	
	public IKehuziyuanDao ikzd;

	@Override
	public Pagination<KuhuZiyuan> kehuSelect(int currentPage, int numPerPage,
			String name, String shuoming, String tishi,String type) throws Exception {
		// TODO Auto-generated method stub
		return ikzd.kehuSelect(currentPage, numPerPage, name, shuoming, tishi, type);
	}

	@Override
	public boolean kehuAdd(KuhuZiyuan khzy) throws Exception {
		// TODO Auto-generated method stub
		return ikzd.kehuAdd(khzy);
	}

	@Override
	public boolean kehuDelete(long id) throws Exception {
		// TODO Auto-generated method stub
		return ikzd.kehuDelete(id);
	}

	@Override
	public List<Map<String, Object>> kehuSelectId(long id) throws Exception {
		// TODO Auto-generated method stub
		return ikzd.kehuSelectId(id);
	}

	@Override
	public boolean kehuUpdate(KuhuZiyuan khzy) throws Exception {
		// TODO Auto-generated method stub
		return ikzd.kehuUpdate(khzy);
	}

}
