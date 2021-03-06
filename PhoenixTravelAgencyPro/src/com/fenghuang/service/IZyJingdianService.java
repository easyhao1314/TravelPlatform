package com.fenghuang.service;

import java.util.List;
import java.util.Map;

import com.fenghuang.entiey.Jingdian;
import com.fenghuang.util.Pagination;

public interface IZyJingdianService {
//分页查询全部
public Pagination<Jingdian> jingdianSelect(int currentPage,int numPerPage,String name,String chengsiId,String jiage) throws Exception;
//添加
public boolean jingdianAdd(Jingdian jd) throws Exception;
//删除 
public boolean jingdianDelete(long id) throws Exception;
//按id询
public List<Map<String,Object>> jingdianSelectId(long id) throws Exception;
//修改
public boolean jingdianUpdate(Jingdian jd) throws Exception;
//模糊查询 
public  Pagination<Jingdian> jingdianSelectLike(int currentPage,int numPerPage,String name,int chengshi) throws Exception;



}
