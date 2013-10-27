package com.fenghuang.entiey;

import java.util.Date;

public class Sanpinshenpi {
	//自增id
	private int id;
	//团号
	private String tuanNo;
	//提交人
	private long tijiaouserid;
	//备注
	private String beizhu;
	//提交时间
	private Date tijiaotime;
	//审批状态
	private int shenpizhuangtai;
	//审批结果
	private int shenpijieguo;
	//审批意见
	private String shenpiyijian;
	//审批人
	private long shenpiuserid;
	//审批时间
	private Date shenpishijian;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTuanNo() {
		return tuanNo;
	}
	public void setTuanNo(String tuanNo) {
		this.tuanNo = tuanNo;
	}
	public long getTijiaouserid() {
		return tijiaouserid;
	}
	public void setTijiaouserid(long tijiaouserid) {
		this.tijiaouserid = tijiaouserid;
	}
	public String getBeizhu() {
		return beizhu;
	}
	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}
	public Date getTijiaotime() {
		return tijiaotime;
	}
	public void setTijiaotime(Date tijiaotime) {
		this.tijiaotime = tijiaotime;
	}
	public int getShenpizhuangtai() {
		return shenpizhuangtai;
	}
	public void setShenpizhuangtai(int shenpizhuangtai) {
		this.shenpizhuangtai = shenpizhuangtai;
	}
	public int getShenpijieguo() {
		return shenpijieguo;
	}
	public void setShenpijieguo(int shenpijieguo) {
		this.shenpijieguo = shenpijieguo;
	}
	public String getShenpiyijian() {
		return shenpiyijian;
	}
	public void setShenpiyijian(String shenpiyijian) {
		this.shenpiyijian = shenpiyijian;
	}
	public long getShenpiuserid() {
		return shenpiuserid;
	}
	public void setShenpiuserid(long shenpiuserid) {
		this.shenpiuserid = shenpiuserid;
	}
	public Date getShenpishijian() {
		return shenpishijian;
	}
	public void setShenpishijian(Date shenpishijian) {
		this.shenpishijian = shenpishijian;
	}
	
	
	
}
