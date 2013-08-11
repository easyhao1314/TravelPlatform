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
		String sql="insert into bizhonghuilv (bizhong,riqi,xianjinhuilv,gongshou,zhonghang,zuidihuilv,huilv,jianxie,jianxiemingchen,danwei) values(?,?,?,?,?,?,?,?,?,?)";
		int a=this.update(sql,bizhonghuilv.getBizhong(),bizhonghuilv.getRiqi(),bizhonghuilv.getXianjinhuilv(),bizhonghuilv.getGongshou(),bizhonghuilv.getZhonghang(),bizhonghuilv.getZuidihuilv(),bizhonghuilv.getHuilv(),bizhonghuilv.getJianxie(),bizhonghuilv.getJianxiemingchen(),bizhonghuilv.getDanwei());
		return a>0;
	}

	@Override
	public boolean updatehuilv(Bizhonghuilv bizhonghuilv) throws Exception {
		// TODO Auto-generated method stub
		String sql = "update bizhonghuilv set bizhong=?,riqi=?,xianjinhuilv=?,gongshou=?,zhonghang=?,zuidihuilv=?,huilv=?,jianxie=?,jianxiemingchen=?,danwei=? where id=?";
		int rs=this.update(sql,bizhonghuilv.getBizhong(),bizhonghuilv.getRiqi(),bizhonghuilv.getXianjinhuilv(),bizhonghuilv.getGongshou(),bizhonghuilv.getZhonghang(),bizhonghuilv.getZuidihuilv(),bizhonghuilv.getHuilv(),bizhonghuilv.getJianxie(),bizhonghuilv.getJianxiemingchen(),bizhonghuilv.getDanwei(),bizhonghuilv.getId());
		return rs>0;
		 
	}

	@Override
	public boolean deletehuilv(Long id) throws Exception {
		// TODO Auto-generated method stub
		 String sql="delete from bizhonghuilv where id=?";
			
		 int rs=this.update(sql,id);
		 return rs>0;
	}
	@Override
	public Pagination<Bizhonghuilv> getPaginationfkqr(int currentPage,
			int numPerPage, Bizhonghuilv bizhonghuilv) throws Exception {
		// TODO Auto-generated method stub
		
		StringBuffer sql=new StringBuffer("select * from bizhonghuilv where 1=1 ");
		if(bizhonghuilv.getId()!=0 && !"".equals(bizhonghuilv.getId())){
			sql.append(" and id='");
			sql.append(bizhonghuilv.getId());
			sql.append("'");
		
	   }
		if(bizhonghuilv.getBizhong()!=null && !"".equals(bizhonghuilv.getBizhong())){
			sql.append(" and bizhong like'");
			sql.append(bizhonghuilv.getBizhong());
			sql.append("%'");
		
	   }
		 return this.getPagination(currentPage, numPerPage, sql.toString());

	}

	@Override
	public List<Map<String, Object>> getDictionaryComboboxs() throws Exception {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM bizhonghuilv";
		List<Map<String,Object>>  dics =this.queryForList(sql);
		return dics;
	}

}
