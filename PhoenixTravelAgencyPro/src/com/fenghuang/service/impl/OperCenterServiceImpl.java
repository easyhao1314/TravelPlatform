/**
 * 
 */
package com.fenghuang.service.impl;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IDictionaryDescDao;
import com.fenghuang.dao.IOperCenterDao;
import com.fenghuang.dao.impl.OperCenterDaoImpl;
import com.fenghuang.entiey.DantuanXinXi;
import com.fenghuang.entiey.DictionaryDesc;
import com.fenghuang.service.IDictionaryDescService;
import com.fenghuang.service.IOperCenterService;
import com.fenghuang.util.Pagination;

/**
 * @author 陈家海
 */
@Service
public class OperCenterServiceImpl  implements IOperCenterService {

	@Autowired
	private IOperCenterDao iOperCenterDao;

	@Override
	public Pagination<DantuanXinXi> getTeamsPaginations(int currentPage,
			int numPerPage, String startTime, String endTime, String tuanhao,
			String tuanming) {
		return iOperCenterDao.getTeamsPaginations(currentPage, numPerPage, startTime, endTime, tuanhao, tuanming);
	}

	@Override
	public Pagination<DantuanXinXi> getDingFangRenWuPaginations(
			int currentPage, int numPerPage, String chutuanStartTime,
			String chutuanEndTime, String kw) {
		return iOperCenterDao.getDingFangRenWuPaginations(currentPage, numPerPage, chutuanStartTime, chutuanEndTime, kw);
	}

	@Override
	public String findCustomerNameById(Long khId) {
		return iOperCenterDao.findCustomerNameById(khId);
	}


}
