package com.fenghuang.dao.impl;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IcaiwuskzhanghaoDao;
import com.fenghuang.entiey.Account;
import com.fenghuang.util.Pagination;
@Repository
public class CaiwuskzhanghaoDaoImpl extends BaseDao implements IcaiwuskzhanghaoDao {
	@Autowired
	public CaiwuskzhanghaoDaoImpl(DataSource dataSource) {
		super(dataSource);
		// TODO Auto-generated constructor stub
	}

	@Override
	public boolean saveaccount(Account account) throws Exception {
		// TODO Auto-generated method stub
		String sql="insert into tuanbiao (zhanghaoming,yongtu,bizhongid,huming,zhanghao,kaihuhang,shiyongshuoming) values(?,?,?,?,?,?,?)";
		int a=this.update(sql,account.getZhanghaoming(),account.getYongtu(),account.getBizhongid(),account.getHuming(),account.getZhanghao(),account.getKaihuhang(),account.getShiyongshuoming());
		return a>0;
	}

	@Override
	public boolean updateaccount(Account account) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteaccount(Long id) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Pagination<Account> getPaginationfkqr(int currentPage,
			int numPerPage, Account account) throws Exception {
		// TODO Auto-generated method stub
		StringBuffer sql=new StringBuffer("SELECT a.id,a.zhanghaoming,a.yongtu,a.bizhongid,a.huming,a.zhanghao,a.kaihuhang,a.shiyongshuoming,b.bizhong,b.riqi,b.xianjinhuilv,b.gongshou,b.zhonghang,b.zuidihuilv,b.huilv,b.jianxie,b.jianxiemingchen,b.danwei FROM account AS a INNER JOIN bizhonghuilv AS b ON a.bizhongid = b.id where 1=1 ");
		if(account.getId()!=0 && !"".equals(account.getId())){
			sql.append(" and t.id='");
			sql.append(account.getId());
			sql.append("'");
		
	   }
		 return this.getPagination(currentPage, numPerPage, sql.toString());
	}

	@Override
	public List<Map<String, Object>> getDictionaryComboboxs() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
