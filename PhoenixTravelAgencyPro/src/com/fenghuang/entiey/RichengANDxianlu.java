/***********************************************************************
 * Module:  RichengANDxianlu.java
 * Author:  Administrator
 * Purpose: Defines the Class RichengANDxianlu
 ***********************************************************************/
package com.fenghuang.entiey;
import java.util.*;

/** 日程表线路表关联
 * 
 * @pdOid a7cb29a2-347a-45f1-b627-8eed8f3c0bf1 */
public class RichengANDxianlu {
   /** 自增ID
    * 
    * @pdOid 368aa09b-82c1-4522-a6b1-b200d13505ef */
   public long id;
   /** 线路ID
    * 
    * @pdOid b33e74de-dde8-4490-b46b-f642345eee54 */
   public long xianluid;
   /** 日程ID
    * 
    * @pdOid e348a859-a740-446b-9d27-8124f6db643e */
   public long richengid;
public long getId() {
	return id;
}
public void setId(long id) {
	this.id = id;
}
public long getXianluid() {
	return xianluid;
}
public void setXianluid(long xianluid) {
	this.xianluid = xianluid;
}
public long getRichengid() {
	return richengid;
}
public void setRichengid(long richengid) {
	this.richengid = richengid;
}

}