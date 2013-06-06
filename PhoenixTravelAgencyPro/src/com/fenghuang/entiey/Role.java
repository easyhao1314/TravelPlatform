/***********************************************************************
 * Module:  Role.java
 * Author:  baoguohao
 * Purpose: Defines the Class Role
 ***********************************************************************/
package com.fenghuang.entiey;
import java.util.*;

/** 角色表
 * 
 * @pdOid f6e49850-a663-4a3c-89ad-b8bb5b5e0630 */
public class Role {
   /** 主键，自动增长列
    * 
    * @pdOid 4eacdfa0-9c8a-485b-95ab-55039e01b145 */
   public long id;
   /** 角色编号
    * 
    * @pdOid 45c07416-a549-407d-9052-606944c734ea */
   public String roleNo;
   /** 角色名称
    * 
    * @pdOid bba2f8dc-87d0-4580-8318-9070dc70dfb4 */
   public String roleName;
   /** 角色描述
    * 
    * @pdOid 9c2be168-654c-4390-88a1-94dd002b6166 */
   public String roleDesc;
   
   /** @pdRoleInfo migr=no name=RoleAndMenuPermission assc=roleRef coll=java.util.Collection impl=java.util.HashSet mult=0..* */
   public java.util.Collection roleAndMenuPermission;
   /** @pdRoleInfo migr=no name=RoleAndPagePermission assc=roleRefPP coll=java.util.Collection impl=java.util.HashSet mult=0..* */
   public java.util.Collection roleAndPagePermission;
   
   
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
         newRoleAndMenuPermission.setRole(this);      
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
            oldRoleAndMenuPermission.setRole((Role)null);
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
            oldRoleAndMenuPermission.setRole((Role)null);
         }
      }
   }
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
         newRoleAndPagePermission.setRole(this);      
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
            oldRoleAndPagePermission.setRole((Role)null);
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
            oldRoleAndPagePermission.setRole((Role)null);
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
 * @return the roleNo
 */
public String getRoleNo() {
	return roleNo;
}

/**
 * @param roleNo the roleNo to set
 */
public void setRoleNo(String roleNo) {
	this.roleNo = roleNo;
}

/**
 * @return the roleName
 */
public String getRoleName() {
	return roleName;
}

/**
 * @param roleName the roleName to set
 */
public void setRoleName(String roleName) {
	this.roleName = roleName;
}

/**
 * @return the roleDesc
 */
public String getRoleDesc() {
	return roleDesc;
}

/**
 * @param roleDesc the roleDesc to set
 */
public void setRoleDesc(String roleDesc) {
	this.roleDesc = roleDesc;
}

}