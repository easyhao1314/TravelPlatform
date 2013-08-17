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
	 * 
	 * 城市
	 */
	public long chengshiId;

	public long getChengshiId() {
		return chengshiId;
	}
	public void setChengshiId(long chengshiId) {
		this.chengshiId = chengshiId;
	}
	/**
	 * 酒店Id
	 */
	public String jiudianId;
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
	public Date getYudingDay() {
		return yudingDay;
	}
	/**
	 * 预定时间
	 */
	public Date  yudingDay;
	/**
	 * 支付方式
	 */
	public long zhifufangshi;
	/**
	 * 卡号
	 */
	public String kahao;
	/**
	 * 货币单位
	 */
	public long huobi;
	public String getKahao() {
		return kahao;
	}
	public void setKahao(String kahao) {
		this.kahao = kahao;
	}
	public long getHuobi() {
		return huobi;
	}
	public void setHuobi(long huobi) {
		this.huobi = huobi;
	}
	public float getHuilv() {
		return huilv;
	}
	public void setHuilv(float huilv) {
		this.huilv = huilv;
	}
	public void setYudingDay(Date yudingDay) {
		this.yudingDay = yudingDay;
	}
	/**
	 * 汇率
	 */
	public float huilv;
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
	
	public String getJiudianId() {
		return jiudianId;
	}
	public void setJiudianId(String jiudianId) {
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
