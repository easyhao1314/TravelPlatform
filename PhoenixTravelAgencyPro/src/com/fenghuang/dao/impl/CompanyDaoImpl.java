package com.fenghuang.dao.impl;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.ICompanyDao;
import com.fenghuang.entiey.Company;
import com.fenghuang.util.Pagination;

@Repository
public class CompanyDaoImpl extends BaseDao implements ICompanyDao {

	@Autowired
	public CompanyDaoImpl(@Qualifier("dataSource") DataSource dataSource) {
		super(dataSource);

	}

	@Override
	public boolean saveCompany(Company company) throws Exception {
		String sql = "insert into company (companyNumber,companyName,parentNumber) values(?,?,?)";
		int rs = this.update(sql, company.getCompanyNumber(),
				company.getCompanyName(), company.getParentNumber());
		return rs > 0;
	}

	@Override
	public boolean updateCompany(Company company) throws Exception {
		String sql = "update company set companyNumber=?,companyName=?,parentNumber=? where id=?";
		int rs = this.update(sql, company.getCompanyNumber(),
				company.getCompanyName(), company.getParentNumber(),
				company.getId());
		return rs > 0;
	}

	@Override
	public boolean deleteCompanyById(Long id) throws Exception {
		String sql = "delete from company where id=?";
		int rs = this.update(sql, id);
		return rs > 0;
	}

	@Override
	public Pagination<Company> getPaginationCompanys(int currentPage,
			int numPerPage, Company company) throws Exception {
		StringBuffer sql = new StringBuffer(
				"SELECT com.id,com.companyNumber,com.companyName,com.parentNumber FROM company AS com where 1=1");
		if (company.getId() !=null && company.getId() != 0) {
			sql.append(" and com.id='");
			sql.append(company.getId());
			sql.append("'");
		}
		if (company.getCompanyName() != null
				&& !"".equals(company.getCompanyName())) {
			sql.append(" and com.companyName like '");
			sql.append(company.getCompanyName());
			sql.append("%'");
		}

		if (company.getCompanyNumber()!= null
				&& !"".equals(company.getCompanyNumber())) {
			sql.append(" and com.companyNumber like '");
			sql.append(company.getCompanyNumber());
			sql.append("%'");
		}

		if (company.getParentNumber() != null
				&& !"".equals(company.getParentNumber())) {
			sql.append(" and com.parentNumber like '");
			sql.append(company.getParentNumber());
			sql.append("%'");
		}
		
		Pagination<Company> pcs = this.getPagination(currentPage, numPerPage, sql.toString());
		return pcs;
	}

	@Override
	public List<Map<String, Object>> getCompanyComboboxs() throws Exception {
		String sql = " select companyNumber,companyName from company ";
		List<Map<String,Object>> comps = this.queryForList(sql);
		return comps;
	}

}
