package com.fenghuang.dao.impl;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IdingfangDao;
import com.fenghuang.entiey.Dingfang;
import com.fenghuang.util.Pagination;
@Repository
public class DingfangDaoImpl extends BaseDao implements IdingfangDao{
	@Autowired
	public DingfangDaoImpl(DataSource dataSource) {
		super(dataSource);
		// TODO Auto-generated constructor stub
	}

	@Override
	public boolean addDingfang(Dingfang df) throws Exception {
		// TODO Auto-generated method stub
		String sql="insert into dingfang (tuanNo,jiudianId,ruzhutime,ruzhuDay,yudingDay,zhifufangshi,kahao,huobi,huilv,caozuoqingkuang,zongjia,beizhu) values(?,?,?,?,?,?,?,?,?,?,?,?) ";
		int count=this.update(sql,df.getTuanNo(),df.getJiudianId(),df.getRuzhutime(),df.getRuzhuDay(),df.getYudingDay(),df.getZhifufangshi(),df.getKahao(),df.getHuobi(),df.getHuilv(),df.getCaozuoqingkuang(),df.getZongjia(),df.getBeizhu());
		return count>0;
	}

	@Override
	public boolean deleteDingfang(int id) throws Exception {
		// TODO Auto-generated method stub
		String sql="delete from dingfang where id=?";
		int count=this.update(sql,id);
		return count>0;
	}

	@Override
	public boolean updateDingfang(Dingfang df) throws Exception {
		// TODO Auto-generated method stub
		String sql="update dingfang set tuanNo=?,chengshiId=?,jiudianId=?,ruzhutime=?,ruzhuDay=?,yudingDay=?,zhifufangshi=?,kahao=?,huobi=?,huilv=?,caozuoqingkuang=?,zongjia=?,beizhu=?  where id=?";
		int count=this.update(sql,df.getTuanNo(),df.getChengshiId(),df.getJiudianId(),df.getRuzhutime(),df.getRuzhuDay(),df.getYudingDay(),df.getZhifufangshi(),df.getKahao(),df.getHuobi(),df.getHuilv(),df.getCaozuoqingkuang(),df.getZongjia(),df.getBeizhu(),df.getId());
		return count>0;
	}

	@Override
	public Pagination<Dingfang> dingfangSelect(int currentPage, int numPerPage ,Dingfang df)
			throws Exception {
		// TODO Auto-generated method stub
		StringBuffer sql=new StringBuffer("select df.id,df.tuanNo,df.chengshiId,df.caozuoqingkuang,df.ruzhuDay,df.ruzhuTime,df.zhifufangshi,df.zongjia,df.beizhu,dx.cfgj,dx.tuanName,dx.jdNo from dingfang as df,dantuanxinxi as dx  where df.tuanNo=dx.tuanNO AND 1=1");
		if(df.getTuanNo()!=null && !"".equals(df.getTuanNo())){
			sql.append(" and df.tuanNo ='");
			sql.append(df.getTuanNo());
			sql.append("'");
		}
		
		return this.getPagination(currentPage, numPerPage, sql.toString());
	}
	

}
