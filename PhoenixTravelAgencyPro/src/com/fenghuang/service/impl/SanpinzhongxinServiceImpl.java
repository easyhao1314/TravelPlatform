package com.fenghuang.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.ISanpinzhongxinDao;
import com.fenghuang.dao.IUserDao;
import com.fenghuang.entiey.Sanpinzhongxin;
import com.fenghuang.entiey.TuanXianlu;
import com.fenghuang.entiey.Xianlu;
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
	@Override
	public boolean AddSanpinzhongxin(Sanpinzhongxin sanpin) throws Exception {
		// TODO Auto-generated method stub
		boolean bl=isanpin.AddSanpinzhongxin(sanpin);
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

}
