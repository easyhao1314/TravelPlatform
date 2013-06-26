/**
 * 
 */
package com.fenghuang.service.impl;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IDictionaryDescDao;
import com.fenghuang.entiey.DictionaryDesc;
import com.fenghuang.service.IDictionaryDescService;
import com.fenghuang.util.Pagination;

/**
 * @author 鲍国浩
 * 
 *         版本 ： 1.0
 * 
 *         日期 ：2013-6-5
 * 
 *         描述 ：
 * 
 * 
 */
@Service
public class DictionaryDescServiceImpl implements IDictionaryDescService {

	@Autowired
	private IDictionaryDescDao iDictionaryDescDao;

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.fenghuang.service.IDictionaryDescService#insertDictionaryDesc(com
	 * .fenghuang.entiey.DictionaryDesc)
	 */
	@Override
	public boolean insertDictionaryDesc(DictionaryDesc ddesc) throws Exception {
		return iDictionaryDescDao.insertDictionaryDesc(ddesc);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.fenghuang.service.IDictionaryDescService#getDictionaryDesc(java.lang
	 * .String)
	 */
	@Override
	public DictionaryDesc getDictionaryDesc(String dicNo) throws Exception {
		return iDictionaryDescDao.getDictionaryDesc(dicNo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.fenghuang.service.IDictionaryDescService#getDictionaryDescPaginations
	 * (int, int, int)
	 */
	@Override
	public Pagination<DictionaryDesc> getDictionaryDescPaginations(
			int currentPage, int numPerPage, int dicType) throws Exception {
		return iDictionaryDescDao.getDictionaryDescPaginations(currentPage,
				numPerPage, dicType);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.fenghuang.service.IDictionaryDescService#updateDictionaryDesc(com
	 * .fenghuang.entiey.DictionaryDesc)
	 */
	@Override
	public boolean updateDictionaryDesc(DictionaryDesc ddesc) throws Exception {
		return iDictionaryDescDao.updateDictionaryDesc(ddesc);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.fenghuang.service.IDictionaryDescService#deleteDictionaryDesc(java
	 * .lang.String)
	 */
	@Override
	public boolean deleteDictionaryDesc(String dicNo) throws Exception {
		return iDictionaryDescDao.deleteDictionaryDesc(dicNo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.fenghuang.service.IDictionaryDescService#updateDictionaryDescs(java
	 * .util.List)
	 */
	@Override
	public void updateDictionaryDescs(List<DictionaryDesc> dicDescs)
			throws Exception {
		for (Iterator iterator = dicDescs.iterator(); iterator.hasNext();) {
			DictionaryDesc dictionaryDesc = (DictionaryDesc) iterator.next();
			if (dictionaryDesc.getDicId() == null) {
				iDictionaryDescDao.insertDictionaryDesc(dictionaryDesc);
			} else {
				iDictionaryDescDao.updateDictionaryDesc(dictionaryDesc);
			}
		}
	}

	/* (non-Javadoc)
	 * @see com.fenghuang.service.IDictionaryDescService#deleteDictionaryDescs(java.util.List)
	 */
	@Override
	public void deleteDictionaryDescs(List<DictionaryDesc> dicDescs)
			throws Exception {
		for (Iterator iterator = dicDescs.iterator(); iterator.hasNext();) {
			DictionaryDesc dictionaryDesc = (DictionaryDesc) iterator.next();
			if(dictionaryDesc.getDicId()!=null){
				iDictionaryDescDao.deleteDictionaryDesc(dictionaryDesc.getDicNo());
			}
		}
		
	}

	/* (non-Javadoc)
	 * @see com.fenghuang.service.IDictionaryDescService#getDictionaryDescPaginations(int, int, com.fenghuang.entiey.DictionaryDesc)
	 */
	@Override
	public Pagination<DictionaryDesc> getDictionaryDescPaginations(
			int currentPage, int numPerPage, DictionaryDesc ddDesc)
			throws Exception {
		return iDictionaryDescDao.getDictionaryDescPaginations(currentPage, numPerPage, ddDesc);
	}

	/* 
	 * @see com.fenghuang.service.IDictionaryDescService#getDictionaryComboboxs(java.lang.String)
	 */
	@Override
	public List<Map<String, Object>> getDictionaryComboboxs(String dicType)
			throws Exception {
		return iDictionaryDescDao.getDictionaryComboboxs(dicType);
	}

}
