/**
 * 
 */
package com.fenghuang.service;

import java.util.List;
import java.util.Map;

import com.fenghuang.entiey.DictionaryDesc;
import com.fenghuang.util.Pagination;

/**
 * @author 鲍国浩
 * 
 * 版本 ： 1.0
 * 
 * 日期 ：2013-6-5
 *
 * 描述 ：
 *
 *
 */
public interface IDictionaryDescService {
	/**
	 * 新增一个字段记录
	 * @param ddesc  字段对象类型
	 * @return
	 * @throws Exception
	 */
	public boolean insertDictionaryDesc(DictionaryDesc ddesc) throws Exception;
	/**
	 * 根据字段编号，得到字段对象
	 * @param dicNo
	 * @return
	 * @throws Exception
	 */
	public DictionaryDesc getDictionaryDesc(Integer dicNo) throws Exception;
	
	/**
	 * 根据dicType 查询不同类型字典的条目
	 * @param currentPage  当前页数 1
	 * @param numPerPage   每页显示几条
	 * @param dicType   字段类型
	 * @return
	 * @throws Exception
	 */
	public Pagination<DictionaryDesc>  getDictionaryDescPaginations(int currentPage,int numPerPage,int dicType)throws Exception;
	
	/**
	 * 更新字段记录
	 * @param ddesc
	 * @return
	 * @throws Exception
	 */
	public boolean updateDictionaryDesc(DictionaryDesc ddesc) throws Exception;
	
	
	/**
	 * 根据字典编号，删除字段记录
	 * @param dicNo
	 * @return
	 * @throws Exception
	 */
     public boolean deleteDictionaryDesc(Integer dicNo)throws Exception;
	    
     public void updateDictionaryDescs(List<DictionaryDesc> dicDescs)throws Exception;
     
     public void deleteDictionaryDescs(List<DictionaryDesc> dicDescs)throws Exception;
     
     public Pagination<DictionaryDesc>  getDictionaryDescPaginations(int currentPage,int numPerPage,DictionaryDesc ddDesc)throws Exception;
     public List<Map<String,Object>>  getDictionaryComboboxs(String dicType) throws Exception;
}
