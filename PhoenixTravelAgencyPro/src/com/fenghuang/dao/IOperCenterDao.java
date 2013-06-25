package com.fenghuang.dao;

import com.fenghuang.entiey.DantuanXinXi;
import com.fenghuang.util.Pagination;

public interface IOperCenterDao {

	/**
	 * 操作团队查询
	 * @param currentPage 当前页数
	 * @param numPerPage  每页显示多少条记录
	 * @param startTime 开始时间
	 * @param endTime 结束时间
	 * @param tuanhao 团号
	 * @param tuanming 团名
	 * @return
	 */
	public Pagination<DantuanXinXi>  getTeamsPaginations(int currentPage,int numPerPage,String startTime , String endTime,String tuanhao,String tuanming);
	
	
	/**
	 * 我派的订房任务 ，派单时间不确定，未做
	 * @param currentPage
	 * @param numPerPage
	 * @param chutuanStartTime 出团开始时间
	 * @param chutuanEndTime  出团结束时间
	 * @param kw 关键字
	 * @return
	 */
	public Pagination<DantuanXinXi>  getDingFangRenWuPaginations(int currentPage,int numPerPage,String chutuanStartTime , String chutuanEndTime,String kw);


	/**
	 * 根据客户Id查找客户信息
	 * @param khId
	 * @return
	 */
	public String findCustomerNameById(Long khId);
}
