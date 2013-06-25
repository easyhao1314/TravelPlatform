/***********************************************************************
 * Module:  Department.java
 * Author:  baoguohao
 * Purpose: Defines the Class Department
 ***********************************************************************/
package com.fenghuang.entiey;
import java.util.*;

/** 部门表
 * 
 * @pdOid a9a165db-4c3b-43e5-9a26-883c4cab4d8d */
public class Department {
   /** 主键，自动增长
    * 
    * @pdOid 08d0b7cd-ad3e-455c-be90-7ed70364eab3 */
   public long id;
   /** 部门编号
    * 
    * @pdOid b242928b-1cf1-4772-9fb1-a762db44d6a7 */
   public String departNo;
   /** 部门名称
    * 
    * @pdOid 807f042b-badb-4f0b-948a-6d19db6c7621 */
   public String departName;
   /** 排序号
    * 
    * @pdOid 926ba4ae-6d8a-4861-82c0-96f9492d0474 */
   public long sortNo;
   
   /** 用户部门关系 */
   /** @pdRoleInfo migr=no name=Users assc=userRefDepartment coll=java.util.Collection impl=java.util.HashSet mult=0..* */
   public java.util.Collection users;
   
   
   /** @pdGenerated default getter */
   public java.util.Collection getUsers() {
      if (users == null)
         users = new java.util.HashSet();
      return users;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIteratorUsers() {
      if (users == null)
         users = new java.util.HashSet();
      return users.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newUsers */
   public void setUsers(java.util.Collection newUsers) {
      removeAllUsers();
      for (java.util.Iterator iter = newUsers.iterator(); iter.hasNext();)
         addUsers((Users)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newUsers */
   public void addUsers(Users newUsers) {
      if (newUsers == null)
         return;
      if (this.users == null)
         this.users = new java.util.HashSet();
      if (!this.users.contains(newUsers))
      {
         this.users.add(newUsers);
         newUsers.setDepartment(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param oldUsers */
   public void removeUsers(Users oldUsers) {
      if (oldUsers == null)
         return;
      if (this.users != null)
         if (this.users.contains(oldUsers))
         {
            this.users.remove(oldUsers);
            oldUsers.setDepartment((Department)null);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllUsers() {
      if (users != null)
      {
         Users oldUsers;
         for (java.util.Iterator iter = getIteratorUsers(); iter.hasNext();)
         {
            oldUsers = (Users)iter.next();
            iter.remove();
            oldUsers.setDepartment((Department)null);
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
 * @return the departNo
 */
public String getDepartNo() {
	return departNo;
}

/**
 * @param departNo the departNo to set
 */
public void setDepartNo(String departNo) {
	this.departNo = departNo;
}

/**
 * @return the departName
 */
public String getDepartName() {
	return departName;
}

/**
 * @param departName the departName to set
 */
public void setDepartName(String departName) {
	this.departName = departName;
}

/**
 * @return the sortNo
 */
public long getSortNo() {
	return sortNo;
}

/**
 * @param sortNo the sortNo to set
 */
public void setSortNo(long sortNo) {
	this.sortNo = sortNo;
}

}