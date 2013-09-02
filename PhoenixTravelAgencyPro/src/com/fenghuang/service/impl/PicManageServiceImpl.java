/**
 * 
 */
package com.fenghuang.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IPicManageDao;
import com.fenghuang.entiey.PicManage;
import com.fenghuang.service.IPicManageService;
import com.fenghuang.util.Pagination;

/**
 * @author 鲍国浩
 * 
 * 版本 ： 1.0
 * 
 * 日期 ：2013-9-2
 *
 * 描述 ：
 *
 *
 */
@Service
public class PicManageServiceImpl implements IPicManageService {
	
	@Autowired
	private IPicManageDao  iPicManageDao;

	@Override
	public boolean insertPicManageDao(PicManage picManage) {
		return iPicManageDao.insertPicManageDao(picManage);
	}

	@Override
	public Pagination<PicManage> getPicManagePagination(int currentPage,
			int numPerPage, String searchName) {
		return iPicManageDao.getPicManagePagination(currentPage, numPerPage, searchName);
	}

}
