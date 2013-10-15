package com.fenghuang.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.ISanpinzhongxinDao;
import com.fenghuang.dao.IUserDao;
import com.fenghuang.dao.IcaiwufkqrDao;
import com.fenghuang.entiey.Richeng;
import com.fenghuang.entiey.Sanpinzhongxin;
import com.fenghuang.entiey.TuanXianlu;
import com.fenghuang.entiey.Tuanbiao;
import com.fenghuang.entiey.Xianlu;
import com.fenghuang.service.IRichengService;
import com.fenghuang.service.ISanpinzhongxinService;
import com.fenghuang.service.IXianluService;
import com.fenghuang.service.ItuanXianluService;
import com.fenghuang.util.Pagination;
@Service
public class SanpinzhongxinServiceImpl implements ISanpinzhongxinService {
	@Autowired
	private ISanpinzhongxinDao isanpin;
	@Autowired
	 IXianluService ixls;
	@Autowired
	 ItuanXianluService itxls;
	@Autowired
	IcaiwufkqrDao icaiwu;
	@Autowired
	IRichengService iricheng;
	@Override
	public boolean AddSanpinzhongxin(Sanpinzhongxin sanpin,String areatypetext) throws Exception {
		// TODO Auto-generated method stub
		boolean bl=false;
		Sanpinzhongxin getsanpin = new Sanpinzhongxin();
		getsanpin.setTuanNo(sanpin.getTuanNo());
		if(sanpin.getTuanNo()!=null && !"".equals(sanpin.getTuanNo())){
		Pagination<Sanpinzhongxin> pagination = isanpin.getByQueryConditionPagination(1, 1, getsanpin);
		List<Map<String, Object>> testUsers = pagination.getResultList();
		if(testUsers.size()>0){
			isanpin.upSanpinzhongxin(sanpin);
		}
		}
		else{
		
		bl=isanpin.AddSanpinzhongxin(sanpin,areatypetext);
		if(bl){
			Xianlu x=new Xianlu();
			x.setGuojia((int)sanpin.getNumbercountry());
			x.setTianshu(sanpin.getNumberday());
			x.setXianluname(sanpin.getTuanName());
            ixls.AddXianlu(x);          
            TuanXianlu txl=new TuanXianlu();
            txl.setTuanNo(sanpin.getTuanNo());
            txl.setXlid(ixls.AddXianlu(x));
            bl=itxls.addTuanXianlu(txl);
            //添加财务
//            Tuanbiao b = new Tuanbiao();
//            b.setTeam(sanpin.getTuanName());
//            b.setTuanduimc(sanpin.getTuanNo());
//            b.setChutuantime(sanpin.getGroupdate());
//            b.setHuituantime(sanpin.getTourdate());
//            b.setRenshu(sanpin.getNumbermaster());
//            b.setYingshou(sanpin.getNumbermaster()*sanpin.getZhikejia());
//            b.setShenfenid(1);
//            b.setYsyfID(1);
//            b.setShanchu(1);
//            b.setHuilvID(1);
//            b.setCaiwuid(1);
//            icaiwu.savefkqr(b);
		}
		}
		
		return bl;
		
	}
	@Override
	public Pagination<Sanpinzhongxin> getByQueryConditionPagination(
			int currentPage, int numPerPage,Sanpinzhongxin s) throws Exception {
		// TODO Auto-generated method stub
		return isanpin.getByQueryConditionPagination(currentPage, numPerPage,s);
	}
	@Override
	public boolean upSanpinzhongxin(Sanpinzhongxin sanpin) throws Exception {
		// TODO Auto-generated method stub
		return isanpin.upSanpinzhongxin(sanpin);
	}
	@Override
	public boolean DeleteSanpinzhongxin(Sanpinzhongxin sanpin, String xianluid)
			throws Exception {
		// TODO Auto-generated method stub
		Richeng r=new Richeng();
		r.setXianluid(Long.parseLong(xianluid));
		boolean b = iricheng.delete(r);
		b = isanpin.DeleteSanpinzhongxin(sanpin, xianluid);
		return b; 
				
	}

}
