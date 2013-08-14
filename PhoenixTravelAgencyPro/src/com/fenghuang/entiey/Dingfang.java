package com.fenghuang.entiey;

import java.util.Date;

public class Dingfang {
	/**
	 * id
	 */
	public int id;
	/**
	 *团号
	 */
	public String tuanNo;
	/**
	 * 酒店Id
	 */
	public long jiudianId;
	public String getCaozuoqingkuang() {
		return caozuoqingkuang;
	}
	public void setCaozuoqingkuang(String caozuoqingkuang) {
		this.caozuoqingkuang = caozuoqingkuang;
	}
	/**
	 * 入住时间
	 */
	public Date ruzhutime;
	/**
	 * 入住天数
	 */
	public int ruzhuDay;
	/**
	 * 预定时间
	 */
	public int yudingDay;
	/**
	 * 支付方式
	 */
	public long zhifufangshi;
	/**
	 * 操作情况
	 */
	public String caozuoqingkuang;
	/**
	 * 总价
	 */
	public  Float zongjia;
	/**
	 * 备注
	 */
	public String beizhu;
	/**
	 * id
	 */
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
	public long getJiudianId() {
		return jiudianId;
	}
	public void setJiudianId(long jiudianId) {
		this.jiudianId = jiudianId;
	}
	public Date getRuzhutime() {
		return ruzhutime;
	}
	public void setRuzhutime(Date ruzhutime) {
		this.ruzhutime = ruzhutime;
	}
	public int getRuzhuDay() {
		return ruzhuDay;
	}
	public void setRuzhuDay(int ruzhuDay) {
		this.ruzhuDay = ruzhuDay;
	}
	public int getYudingDay() {
		return yudingDay;
	}
	public void setYudingDay(int yudingDay) {
		this.yudingDay = yudingDay;
	}
	public long getZhifufangshi() {
		return zhifufangshi;
	}
	public void setZhifufangshi(long zhifufangshi) {
		this.zhifufangshi = zhifufangshi;
	}
	
	public Float getZongjia() {
		return zongjia;
	}
	public void setZongjia(Float zongjia) {
		this.zongjia = zongjia;
	}
	public String getBeizhu() {
		return beizhu;
	}
	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}
	

}
