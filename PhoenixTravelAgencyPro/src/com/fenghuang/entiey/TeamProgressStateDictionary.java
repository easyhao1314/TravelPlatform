package com.fenghuang.entiey;

/**
 * 团队进展状态字典
 */
public class TeamProgressStateDictionary {
	/**
	 * 编号
	 */
	public String tpsdNo;
	/**
	 * 名称
	 */
	public String tpsdName;
	/**
	 * 说明
	 */
	public String tpsdDesc;
	/**
	 * 帮助提示
	 */
	public String tpsdHelp;
	/**
	 * 显示顺序
	 */
	public long tpsdSort;
	
	
	
	public TeamProgressStateDictionary() {
	}
	
	
	public TeamProgressStateDictionary(String tpsdNo, String tpsdName,
			String tpsdHelp, long tpsdSort) {
		this.tpsdNo = tpsdNo;
		this.tpsdName = tpsdName;
		this.tpsdHelp = tpsdHelp;
		this.tpsdSort = tpsdSort;
	}


	public String getTpsdNo() {
		return tpsdNo;
	}
	public void setTpsdNo(String tpsdNo) {
		this.tpsdNo = tpsdNo;
	}
	public String getTpsdName() {
		return tpsdName;
	}
	public void setTpsdName(String tpsdName) {
		this.tpsdName = tpsdName;
	}
	public String getTpsdDesc() {
		return tpsdDesc;
	}
	public void setTpsdDesc(String tpsdDesc) {
		this.tpsdDesc = tpsdDesc;
	}
	public String getTpsdHelp() {
		return tpsdHelp;
	}
	public void setTpsdHelp(String tpsdHelp) {
		this.tpsdHelp = tpsdHelp;
	}
	public long getTpsdSort() {
		return tpsdSort;
	}
	public void setTpsdSort(long tpsdSort) {
		this.tpsdSort = tpsdSort;
	}
	
	
	
		
}