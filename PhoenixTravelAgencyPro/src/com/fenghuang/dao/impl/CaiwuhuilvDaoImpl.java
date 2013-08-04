package com.fenghuang.dao.impl;
import java.util.List;
import java.util.Map;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IcaiwuhuilvDao;
import com.fenghuang.entiey.Bizhonghuilv;
import com.fenghuang.util.Pagination;

@Repository
public class CaiwuhuilvDaoImpl extends BaseDao implements IcaiwuhuilvDao {
	@Autowired
	public CaiwuhuilvDaoImpl(DataSource dataSource) {
		super(dataSource);
		// TODO Auto-generated constructor stub
	}

	@Override
	public boolean savehuilv(Bizhonghuilv bizhonghuilv) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updatehuilv(Bizhonghuilv bizhonghuilv) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deletehuilv(Long id) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Pagination<Bizhonghuilv> getPaginationfkqr(int currentPage,
			int numPerPage, Bizhonghuilv bizhonghuilv) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Map<String, Object>> getDictionaryComboboxs() throws Exception {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM bizhonghuilv";
		List<Map<String,Object>>  dics =this.queryForList(sql);
		return dics;
	}

}
