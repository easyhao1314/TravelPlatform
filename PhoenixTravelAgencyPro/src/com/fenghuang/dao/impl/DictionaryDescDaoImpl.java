/**
 * 
 */
package com.fenghuang.dao.impl;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IDictionaryDescDao;
import com.fenghuang.entiey.DictionaryDesc;
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
@Repository
public class DictionaryDescDaoImpl extends BaseDao implements
		IDictionaryDescDao {
	@Autowired
	public DictionaryDescDaoImpl(@Qualifier("dataSource") DataSource dataSource) {
		super(dataSource);

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.fenghuang.dao.IDictionaryDescDao#insertDictionaryDesc(com.fenghuang
	 * .entiey.DictionaryDesc)
	 */
	@Override
	public boolean insertDictionaryDesc(DictionaryDesc ddesc) throws Exception {
		String sql = "insert into dictionarydesc (dicNo,dicName,dicHelp,dicSortNo,dicDesc,dicType) values(?,?,?,?,?,?)";
		int rs = this.update(sql, ddesc.getDicNo(), ddesc.getDicName(),
				ddesc.getDicHelp(), ddesc.getDicSortNo(), ddesc.getDicDesc(),
				ddesc.getDicType());
		return rs > 0;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.fenghuang.dao.IDictionaryDescDao#getDictionaryDesc(java.lang.String)
	 */
	@Override
	public DictionaryDesc getDictionaryDesc(String dicNo) throws Exception {
		String sql = "select * from dictionarydesc where dicNo=?";
		DictionaryDesc ddesc = this.queryForObject(sql, DictionaryDesc.class,
				dicNo);
		return ddesc;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.fenghuang.dao.IDictionaryDescDao#getDictionaryDescPaginations(int,
	 * int, int)
	 */
	@Override
	public Pagination<DictionaryDesc> getDictionaryDescPaginations(
			int currentPage, int numPerPage, int dicType) throws Exception {
		StringBuffer  sqlSb = new StringBuffer();
		sqlSb.append(" select * from dictionarydesc where 1=1");
		if(dicType!=0){
			sqlSb.append(" and dicType='");
			sqlSb.append(dicType);
			sqlSb.append("'");
		}
		Pagination<DictionaryDesc> pages= this.getPagination(currentPage, numPerPage, sqlSb.toString());
		return pages;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.fenghuang.dao.IDictionaryDescDao#updateDictionaryDesc(com.fenghuang
	 * .entiey.DictionaryDesc)
	 */
	@Override
	public boolean updateDictionaryDesc(DictionaryDesc ddesc) throws Exception {
		String sql = "update dictionarydesc set dicName=?,dicHelp=?,dicSortNo=?,dicDesc=?,dicNo=? where dicId=?";
		int rs = this.update(sql, ddesc.getDicName(),ddesc.getDicHelp(),ddesc.getDicSortNo(),ddesc.getDicDesc(),ddesc.getDicNo(),ddesc.getDicId());
		return rs>0;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.fenghuang.dao.IDictionaryDescDao#deleteDictionaryDesc(java.lang.String
	 * )
	 */
	@Override
	public boolean deleteDictionaryDesc(String dicNo) throws Exception {
	   String sql = "delete from dictionarydesc where dicNo = ?";
	   int  rs = this.update(sql, dicNo);
		return rs >0;
	}

	/* (non-Javadoc)
	 * @see com.fenghuang.dao.IDictionaryDescDao#getDictionaryDescPaginations(int, int, com.fenghuang.entiey.DictionaryDesc)
	 */
	@Override
	public Pagination<DictionaryDesc> getDictionaryDescPaginations(
			int currentPage, int numPerPage, DictionaryDesc ddDesc)
			throws Exception {
		StringBuffer  sqlSb = new StringBuffer();
		sqlSb.append(" select * from dictionarydesc where 1=1");
		if(ddDesc.getDicType()!=0){
			sqlSb.append(" and dicType='");
			sqlSb.append(ddDesc.getDicType());
			sqlSb.append("'");
		}
		if(ddDesc.getDicNo()!=null&&!"".equals(ddDesc.getDicNo())){
			sqlSb.append(" and dicNo  like '%");
			sqlSb.append(ddDesc.getDicNo());
			sqlSb.append("%'");
			
		}
		if(ddDesc.getDicDesc()!=null&&!"".equals(ddDesc.getDicDesc())){
			sqlSb.append(" and dicDesc  like '%");
			sqlSb.append(ddDesc.getDicDesc());
			sqlSb.append("%'");
			
		}
		if(ddDesc.getDicHelp()!=null&&!"".equals(ddDesc.getDicHelp())){
			sqlSb.append(" and dicHelp  like '%");
			sqlSb.append(ddDesc.getDicHelp());
			sqlSb.append("%'");
			
		}
		if(ddDesc.getDicName()!=null&&!"".equals(ddDesc.getDicName())){
			sqlSb.append(" and dicName  like '%");
			sqlSb.append(ddDesc.getDicName());
			sqlSb.append("%'");
			
		}
		
		if(ddDesc.getDicSortNo() != -1){
			sqlSb.append(" and dicSortNo  like %");
			sqlSb.append(ddDesc.getDicSortNo());
			sqlSb.append("%");
			
		}
		Pagination<DictionaryDesc> pages= this.getPagination(currentPage, numPerPage, sqlSb.toString());
		return pages;
	}

	/* 
	 * @see com.fenghuang.dao.IDictionaryDescDao#getDictionaryComboboxs(java.lang.String)
	 */
	@Override
	public List<Map<String, Object>> getDictionaryComboboxs(String dicType)
			throws Exception {
		String sql = "SELECT dicNo, dicName FROM dictionarydesc  where dicType=?";
		List<Map<String,Object>>  dics =this.queryForList(sql,dicType);
		return dics;
	}

}
