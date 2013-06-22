/**
 * 
 */
package com.fenghuang.service;

import com.fenghuang.entiey.HotelGuestRoomDictionary;

/**
 * @author 鲍国浩
 * 
 * 版本 ： 1.0
 * 
 * 日期 ：2013-6-22
 *
 * 描述 ：
 *
 *
 */
public interface IHotelGuestRoomDictionaryService {
	
	public boolean saveHotelGuestRoomDictionary(HotelGuestRoomDictionary hgrd)throws Exception;
	public boolean updateHotelGuestRoomDictionary(HotelGuestRoomDictionary hgrd)throws Exception;

}
