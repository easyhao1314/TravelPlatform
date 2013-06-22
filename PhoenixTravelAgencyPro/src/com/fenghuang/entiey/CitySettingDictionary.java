package com.fenghuang.entiey;

/**
 * 旅游城市设置
 * 
 * @pdOid 9dbd5064-b759-44c6-9cb0-ee287cd8daf0
 */
public class CitySettingDictionary {
	/**
	 * 主键，自动增长
	 * 
	 * @pdOid d7250734-1b32-4f2f-ab08-ff5c631a3669
	 */
	public long id;
	/**
	 * 城市名称
	 * 
	 * @pdOid 9c6493f6-186f-4e7d-9841-f41b5fbe2917
	 */
	public String cityName;
	/**
	 * 城市英文名字
	 * 
	 * @pdOid 2f81c129-da9f-4ca7-ba52-fefe06712115
	 */
	public String cityEnName;
	/**
	 * 经纬度，这个要和赵阳商量怎么解决
	 * 
	 * @pdOid 2799faba-6bf4-457a-9bc2-c9d3c759720a
	 */
	public String coordinates;
	/**
	 * 是否口岸 1：是，0：否
	 * 
	 * @pdOid b732772a-0130-45bb-afa8-e7d6eb9202bb
	 */
	public String isPort;
	/**
	 * 是否常用 1：是，0：否
	 * 
	 * @pdOid a06a494c-2984-47f0-bb38-03ebc8aec7a9
	 */
	public String isUserd;
    /**
     * 国家编号
     */
	public String csdNo;
	/**
	 * 报价区域id，也就是CountryArea表的caType=0的id
	 */
	public Long caId;
	/**
	 * 省份id
	 */
	public Long psdId;
	/**
	 * 城市默认币种
	 */
	public Long currencyId;
	
	/**
	 * @return the id
	 */
	public long getId() {
		return id;
	}

	public String getCsdNo() {
		return csdNo;
	}

	public void setCsdNo(String csdNo) {
		this.csdNo = csdNo;
	}

	public Long getCaId() {
		return caId;
	}

	public void setCaId(Long caId) {
		this.caId = caId;
	}

	public Long getPsdId() {
		return psdId;
	}

	public void setPsdId(Long psdId) {
		this.psdId = psdId;
	}

	public Long getCurrencyId() {
		return currencyId;
	}

	public void setCurrencyId(Long currencyId) {
		this.currencyId = currencyId;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(long id) {
		this.id = id;
	}

	/**
	 * @return the cityName
	 */
	public String getCityName() {
		return cityName;
	}

	/**
	 * @param cityName
	 *            the cityName to set
	 */
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	/**
	 * @return the cityEnName
	 */
	public String getCityEnName() {
		return cityEnName;
	}

	/**
	 * @param cityEnName
	 *            the cityEnName to set
	 */
	public void setCityEnName(String cityEnName) {
		this.cityEnName = cityEnName;
	}

	/**
	 * @return the coordinates
	 */
	public String getCoordinates() {
		return coordinates;
	}

	/**
	 * @param coordinates
	 *            the coordinates to set
	 */
	public void setCoordinates(String coordinates) {
		this.coordinates = coordinates;
	}

	/**
	 * @return the isPort
	 */
	public String getIsPort() {
		return isPort;
	}

	/**
	 * @param isPort
	 *            the isPort to set
	 */
	public void setIsPort(String isPort) {
		this.isPort = isPort;
	}

	/**
	 * @return the isUserd
	 */
	public String getIsUserd() {
		return isUserd;
	}

	/**
	 * @param isUserd
	 *            the isUserd to set
	 */
	public void setIsUserd(String isUserd) {
		this.isUserd = isUserd;
	}

}