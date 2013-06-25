/***********************************************************************
 * Module:  PagePermission.java
 * Author:  baoguohao
 * Purpose: Defines the Class PagePermission
 ***********************************************************************/
package com.fenghuang.entiey;
import java.util.*;

/** 页面权限表
 * 
 * @pdOid 31bce3d5-8e66-437f-85fe-ecfcdd81277f */
public class PagePermission {
   /** 主键，自动增长
    * 
    * @pdOid f6f3748f-eba2-49a4-bd08-24e1944d9244 */
   public long id;
   /** 页面权限名称
    * 
    * @pdOid 06c34bff-55b7-41ff-b319-e97a03b2ff48 */
   public String ppName;
   /** @pdOid ee2b516e-3d42-464e-a242-a00dc1aa1107 */
   public String ppDesc;
   /** @pdOid 26bef41f-f4e6-457d-a2bc-5543b7baf00a */
   public String ppNO;
   
   /** @pdRoleInfo migr=no name=RoleAndPagePermission assc=pagePermissionRef coll=java.util.Collection impl=java.util.HashSet mult=0..* */
   public java.util.Collection roleAndPagePermission;
   
   
   /** @pdGenerated default getter */
   public java.util.Collection getRoleAndPagePermission() {
      if (roleAndPagePermission == null)
         roleAndPagePermission = new java.util.HashSet();
      return roleAndPagePermission;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIteratorRoleAndPagePermission() {
      if (roleAndPagePermission == null)
         roleAndPagePermission = new java.util.HashSet();
      return roleAndPagePermission.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newRoleAndPagePermission */
   public void setRoleAndPagePermission(java.util.Collection newRoleAndPagePermission) {
      removeAllRoleAndPagePermission();
      for (java.util.Iterator iter = newRoleAndPagePermission.iterator(); iter.hasNext();)
         addRoleAndPagePermission((RoleAndPagePermission)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newRoleAndPagePermission */
   public void addRoleAndPagePermission(RoleAndPagePermission newRoleAndPagePermission) {
      if (newRoleAndPagePermission == null)
         return;
      if (this.roleAndPagePermission == null)
         this.roleAndPagePermission = new java.util.HashSet();
      if (!this.roleAndPagePermission.contains(newRoleAndPagePermission))
      {
         this.roleAndPagePermission.add(newRoleAndPagePermission);
         newRoleAndPagePermission.setPagePermission(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param oldRoleAndPagePermission */
   public void removeRoleAndPagePermission(RoleAndPagePermission oldRoleAndPagePermission) {
      if (oldRoleAndPagePermission == null)
         return;
      if (this.roleAndPagePermission != null)
         if (this.roleAndPagePermission.contains(oldRoleAndPagePermission))
         {
            this.roleAndPagePermission.remove(oldRoleAndPagePermission);
            oldRoleAndPagePermission.setPagePermission((PagePermission)null);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllRoleAndPagePermission() {
      if (roleAndPagePermission != null)
      {
         RoleAndPagePermission oldRoleAndPagePermission;
         for (java.util.Iterator iter = getIteratorRoleAndPagePermission(); iter.hasNext();)
         {
            oldRoleAndPagePermission = (RoleAndPagePermission)iter.next();
            iter.remove();
            oldRoleAndPagePermission.setPagePermission((PagePermission)null);
         }
      }
   }

/**
 * @return the id
 */
public long getId() {
	return id;
}

/**
 * @param id the id to set
 */
public void setId(long id) {
	this.id = id;
}

/**
 * @return the ppName
 */
public String getPpName() {
	return ppName;
}

/**
 * @param ppName the ppName to set
 */
public void setPpName(String ppName) {
	this.ppName = ppName;
}

/**
 * @return the ppDesc
 */
public String getPpDesc() {
	return ppDesc;
}

/**
 * @param ppDesc the ppDesc to set
 */
public void setPpDesc(String ppDesc) {
	this.ppDesc = ppDesc;
}

/**
 * @return the ppNO
 */
public String getPpNO() {
	return ppNO;
}

/**
 * @param ppNO the ppNO to set
 */
public void setPpNO(String ppNO) {
	this.ppNO = ppNO;
}
   

}