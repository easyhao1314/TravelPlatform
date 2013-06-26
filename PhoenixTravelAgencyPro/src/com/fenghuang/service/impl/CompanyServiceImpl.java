package com.fenghuang.service.impl;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.ICompanyDao;
import com.fenghuang.entiey.Company;
import com.fenghuang.service.ICompanyService;
import com.fenghuang.util.Pagination;

/**
 * 
 * @author 鲍国浩
 * 
 *         日期 @2013-6-18
 * 
 *         描述：
 * 
 * 
 * 
 */
@Service
public class CompanyServiceImpl implements ICompanyService {

	@Autowired
	private ICompanyDao iCompanyDao;

	@Override
	public boolean saveCompany(Company company) throws Exception {
		return iCompanyDao.saveCompany(company);
	}

	@Override
	public boolean updateCompany(Company company) throws Exception {
		return iCompanyDao.updateCompany(company);
	}

	@Override
	public boolean deleteCompanyById(Long id) throws Exception {
		return iCompanyDao.deleteCompanyById(id);
	}

	@Override
	public Pagination<Company> getPaginationCompanys(int currentPage,
			int numPerPage, Company company) throws Exception {
		return iCompanyDao.getPaginationCompanys(currentPage, numPerPage,
				company);
	}

	@Override
	public void updateCompanys(List<Company> companys) throws Exception {
		if (companys != null) {
			for (Iterator<Company> iterator = companys.iterator(); iterator
					.hasNext();) {
				Company company = (Company) iterator.next();
				if (company.getId() != null && company.getId() != 0l) {
					iCompanyDao.updateCompany(company);
				} else {
					iCompanyDao.saveCompany(company);
				}
			}
		}

	}

	@Override
	public void deleteCompanys(List<Company> companys) throws Exception {
		if (companys != null) {
			for (Iterator<Company> iterator = companys.iterator(); iterator
					.hasNext();) {
				Company company = (Company) iterator.next();
				if (company.getId() != null && company.getId() != 0l) {
					iCompanyDao.deleteCompanyById(company.getId());
				}
			}

		}

	}

	@Override
	public List<Map<String, Object>> getCompanyComboboxs() throws Exception {
		return iCompanyDao.getCompanyComboboxs();
	}

}
