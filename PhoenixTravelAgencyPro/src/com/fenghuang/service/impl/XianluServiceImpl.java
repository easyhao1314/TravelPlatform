package com.fenghuang.service.impl;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IXianluDao;
import com.fenghuang.entiey.Richeng;
import com.fenghuang.entiey.Xianlu;
import com.fenghuang.service.IRichengService;
import com.fenghuang.service.IXianluService;
import com.fenghuang.util.Pagination;
@Service
public class XianluServiceImpl implements IXianluService{
	@Autowired 
	IXianluDao xldao;
	@Autowired 
	IRichengService richengs;
	@Override
	public Integer AddXianlu(Xianlu x) throws Exception {
		// TODO Auto-generated method stub
		 int count=0;
		count=xldao.AddXianlu(x);
		/*if(count>0){
			Richeng r=new Richeng();
			for(int i=0;i<x.getTianshu();i++){
			
				r.setXianluid(count);
			
			richengs.insert(r);
			}
		}*/
		return count;
	}

	@Override
	public boolean delXianlu(Xianlu x) throws Exception {
		// TODO Auto-generated method stub
		return xldao.delXianlu(x);
	}

	@Override
	public boolean updateXianlu(Xianlu x) throws Exception {
		// TODO Auto-generated method stub
		return xldao.updateXianlu(x);
	}

	@Override
	public Pagination<Xianlu> xianluinfo(int page, int rows, Long xianid)
			throws Exception {
		// TODO Auto-generated method stub
		return xldao.xianluinfo(page, rows, xianid);
	}

	@Override
	public List<Map<String, Object>> selectXianlu() throws Exception {
		// TODO Auto-generated method stub
		return xldao.selectXianlu();
	}

}
