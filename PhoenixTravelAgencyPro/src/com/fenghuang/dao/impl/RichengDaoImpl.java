package com.fenghuang.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IRichengDao;
import com.fenghuang.entiey.Richeng;
import com.fenghuang.util.Pagination;
@Repository
public class RichengDaoImpl extends BaseDao implements IRichengDao  {
	@Autowired
	public RichengDaoImpl(@Qualifier("dataSource") DataSource dataSource){
		super(dataSource);
	}
	@Override  	public boolean insert(Richeng r) throws Exception {
		// TODO Auto-generated method stub
		String sql = "insert into richeng(richenganpai,huodong,jiudian,chengshiid,jiaotong,zao,zhong,wan,xianluid) values(?,?,?,?,?,?,?,?,?)";
		int num = this.update(sql,r.getRichenganpai(),r.getHuodong(),r.getJiudian(),r.getChengshiid(),r.getJiaotong(),r.getZao(),r.getZhong(),r.getWan(),r.getXianluid());
		return num>0;
	}

	@Override
	public boolean delete(Richeng r) throws Exception {
		// TODO Auto-generated method stub
		String sql ="delete from richeng where 1=1 and riid=?";
		int update = this.update(sql,r.getRiid());
		return update>0;
	}

	@Override
	public boolean update(Richeng r) throws Exception {
		// TODO Auto-generated method stub
		String sql="UPDATE richeng SET jiudian=+1-1";
		List list = new ArrayList();
		StringBuffer sb = new StringBuffer(sql);
		if(r.getRichenganpai()!=null && !"".equals(r.getRichenganpai())){
			sb.append(",richenganpai=?");
			list.add(r.getRichenganpai());
		}
		if(r.getHuodong()!=null && !"".equals(r.getHuodong())){
			sb.append(",huodong=?");
			list.add(r.getHuodong());
		}
		if(r.getJiudian()!=null && !"".equals(r.getJiudian())){
			sb.append(",jiudian=?");
			list.add(r.getJiudian());
		}
		if(r.getJiaotong()!=0){
			sb.append(",jiaotong=?");
			list.add(r.getJiaotong());
		}
		if(r.getZao()!=null && !"".equals(r.getZao())){
			sb.append(",zao=?");
			list.add(r.getZao());
		}
		if(r.getZhong()!=null && !"".equals(r.getZhong())){
			sb.append(",zhong=?");
			list.add(r.getZhong());
		}
		if(r.getWan()!=null && !"".equals(r.getWan())){
			sb.append(",wan=?");
			list.add(r.getWan());
		}
		if(r.getJiaotongchengshi()!=null && !"".equals(r.getJiaotongchengshi())){
			sb.append(",jiaotongchengshi=?");
			list.add(r.getJiaotongchengshi());
		}
		if(r.getCheid()!=0){
			sb.append(",cheid=?");
			list.add(r.getCheid());
		}
		if(r.getGouwuid()!=0){
			sb.append(",gouwuid=?");
			list.add(r.getGouwuid());
		}
		if(r.getRiid()!=0){
			sb.append(" where riid=?");
			list.add(r.getRiid());
		}
		int num = this.update(sb.toString(),list.toArray());
	
		return num>0;
	}

	@Override
	public Pagination<Richeng> select(int currentPage, int numPerPage, Richeng r)
			throws Exception {
		// TODO Auto-generated method stub SELECT richeng.*,zao.dicName as zaos,zhong.dicName as zhongs,wan.dicName AS wans,che.*  FROM richeng LEFT JOIN dictionarydesc AS wan ON wan.dicNo=wan LEFT JOIN dictionarydesc AS zhong ON zhong.dicNo=zhong LEFT JOIN dictionarydesc AS zao ON zao.dicNo=zao LEFT JOIN dingche AS che ON che.id=richeng.cheid WHERE  1=1 
		String sql = "SELECT richeng.*,zao.dicName as zaos,zhong.dicName as zhongs,wan.dicName AS wans,che.*,jiaotong.`name` AS gongying,gouwu.`name` AS gname,gouwu.bz AS gbz, gouwu.lianxiren AS glianxiren,gouwu.shouji AS gshouji,gouwu.email AS gemail,gouwu.dizhi AS gdizhi  FROM richeng LEFT JOIN dictionarydesc AS wan ON wan.dicNo=wan LEFT JOIN dictionarydesc AS zhong ON zhong.dicNo=zhong LEFT JOIN dictionarydesc AS zao ON zao.dicNo=zao LEFT JOIN dingche AS che ON che.id=richeng.cheid LEFT JOIN jiaotong ON jiaotong.id=che.gongyingshang LEFT JOIN gouwu ON richeng.gouwuid=gouwu.id WHERE  1=1  ";
		StringBuffer sb = new StringBuffer(sql);
		if(r.getRiid()!=0 && !"".equals(r.getRiid())){
		sb.append("and riid='"+r.getRiid()+"' ");
		}	
		if(r.getXianluid()!=0 && !"".equals(r.getXianluid())){
			sb.append(" and  xianluid='");
			sb.append(r.getXianluid());
			sb.append("' ORDER BY xianluid DESC");
			
		}
		return this.getPagination(currentPage, numPerPage, sb.toString());
	}

}
