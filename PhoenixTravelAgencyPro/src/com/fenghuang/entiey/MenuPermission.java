/***********************************************************************
 * Module:  MenuPermission.java
 * Author:  baoguohao
 * Purpose: Defines the Class MenuPermission
 ***********************************************************************/
package com.fenghuang.entiey;
import java.util.*;

/** 菜单权限表
 * 
 * @pdOid b2c2d9e4-bbce-47fb-9546-1b504d0fa283 */
public class MenuPermission {
   /** 主键，自动增长
    * 
    * @pdOid 782d88e5-27ef-44c0-bab1-8a56f86a0ec4 */
   public long id;
   /** 菜单权限编号
    * 
    * @pdOid fa435387-37c7-4c26-bd40-15f5957ecd2b */
   public String mpNo;
   /** 名称
    * 
    * @pdOid 5c6e5be3-7200-424d-9938-4ca9677a2b93 */
   public String mpName;
   /** @pdOid f3ac4578-f847-43dc-b545-b2e47a06423c */
   public String mpDesc;
   
   /** @pdRoleInfo migr=no name=RoleAndMenuPermission assc=menuPermissionRef coll=java.util.Collection impl=java.util.HashSet mult=0..* */
   public java.util.Collection roleAndMenuPermission;
   /** @pdRoleInfo migr=no name=FunctionMenu assc=functionMenuRefMenuPer mult=0..1 side=A */
   public FunctionMenu functionMenu;
   
   
   /** @pdGenerated default getter */
   public java.util.Collection getRoleAndMenuPermission() {
      if (roleAndMenuPermission == null)
         roleAndMenuPermission = new java.util.HashSet();
      return roleAndMenuPermission;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIteratorRoleAndMenuPermission() {
      if (roleAndMenuPermission == null)
         roleAndMenuPermission = new java.util.HashSet();
      return roleAndMenuPermission.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newRoleAndMenuPermission */
   public void setRoleAndMenuPermission(java.util.Collection newRoleAndMenuPermission) {
      removeAllRoleAndMenuPermission();
      for (java.util.Iterator iter = newRoleAndMenuPermission.iterator(); iter.hasNext();)
         addRoleAndMenuPermission((RoleAndMenuPermission)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newRoleAndMenuPermission */
   public void addRoleAndMenuPermission(RoleAndMenuPermission newRoleAndMenuPermission) {
      if (newRoleAndMenuPermission == null)
         return;
      if (this.roleAndMenuPermission == null)
         this.roleAndMenuPermission = new java.util.HashSet();
      if (!this.roleAndMenuPermission.contains(newRoleAndMenuPermission))
      {
         this.roleAndMenuPermission.add(newRoleAndMenuPermission);
         newRoleAndMenuPermission.setMenuPermission(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param oldRoleAndMenuPermission */
   public void removeRoleAndMenuPermission(RoleAndMenuPermission oldRoleAndMenuPermission) {
      if (oldRoleAndMenuPermission == null)
         return;
      if (this.roleAndMenuPermission != null)
         if (this.roleAndMenuPermission.contains(oldRoleAndMenuPermission))
         {
            this.roleAndMenuPermission.remove(oldRoleAndMenuPermission);
            oldRoleAndMenuPermission.setMenuPermission((MenuPermission)null);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllRoleAndMenuPermission() {
      if (roleAndMenuPermission != null)
      {
         RoleAndMenuPermission oldRoleAndMenuPermission;
         for (java.util.Iterator iter = getIteratorRoleAndMenuPermission(); iter.hasNext();)
         {
            oldRoleAndMenuPermission = (RoleAndMenuPermission)iter.next();
            iter.remove();
            oldRoleAndMenuPermission.setMenuPermission((MenuPermission)null);
         }
      }
   }
   /** @pdGenerated default parent getter */
   public FunctionMenu getFunctionMenu() {
      return functionMenu;
   }
   
   /** @pdGenerated default parent setter
     * @param newFunctionMenu */
   public void setFunctionMenu(FunctionMenu newFunctionMenu) {
      if (this.functionMenu == null || !this.functionMenu.equals(newFunctionMenu))
      {
         if (this.functionMenu != null)
         {
            FunctionMenu oldFunctionMenu = this.functionMenu;
            this.functionMenu = null;
            oldFunctionMenu.removeMenuPermission(this);
         }
         if (newFunctionMenu != null)
         {
            this.functionMenu = newFunctionMenu;
            this.functionMenu.addMenuPermission(this);
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
 * @return the mpNo
 */
public String getMpNo() {
	return mpNo;
}

/**
 * @param mpNo the mpNo to set
 */
public void setMpNo(String mpNo) {
	this.mpNo = mpNo;
}

/**
 * @return the mpName
 */
public String getMpName() {
	return mpName;
}

/**
 * @param mpName the mpName to set
 */
public void setMpName(String mpName) {
	this.mpName = mpName;
}

/**
 * @return the mpDesc
 */
public String getMpDesc() {
	return mpDesc;
}

/**
 * @param mpDesc the mpDesc to set
 */
public void setMpDesc(String mpDesc) {
	this.mpDesc = mpDesc;
}

}