package com.fenghuang.entiey;
import java.util.*;


public class KuhuZiyuan {
	 /** 编号
	    * 
	    * @pdOid c506d7b0-50cd-4f2f-8bd4-1303b4bb060f */
	   public long id;
	   /** 名称
	    * 
	    * @pdOid 1fdab2cc-9ac7-4bd3-b05e-74697f82e42e */
	   public java.lang.String name;
	   /** 说明
	    * 
	    * @pdOid 49619d1c-a3f6-4f78-add9-298fc0a0edf6 */
	   public java.lang.String shuoming;
	   /** 帮助提示
	    * 
	    * @pdOid eedb7602-52ce-484b-9549-4c7a3f5f830c */
	   public int tishi;
	   /** 资源类型
	    * 1.VIP 2.区域 3.资信  4.价值  5.合作  6.大区经理
	    * @pdOid 37e63d12-c1cb-47c8-bdcd-235ba8a35543 */
	   public int type;

	   public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public java.lang.String getName() {
		return name;
	}
	public void setName(java.lang.String name) {
		this.name = name;
	}
	public java.lang.String getShuoming() {
		return shuoming;
	}
	public void setShuoming(java.lang.String shuoming) {
		this.shuoming = shuoming;
	}
	public int getTishi() {
		return tishi;
	}
	public void setTishi(int tishi) {
		this.tishi = tishi;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
}
