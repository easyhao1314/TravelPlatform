/***********************************************************************
 * Module:  Users.java
 * Author:  baoguohao
 * Purpose: Defines the Class Users
 ***********************************************************************/
package com.fenghuang.entiey;
import java.util.*;

/** 用户表，用来记录用户信息的
 * 
 * @pdOid b461777c-0892-4f48-a4a6-7bf8c3668f61 */
public class Users {
   /** @pdOid 37b92e84-0c55-4148-9340-389744805148 */
   public long id;
   /** 用户的编号，这个可以通过序列来产生 
    * 
    * @pdOid 3c7f5775-a997-4830-ab41-4b265c2bbdb0 */
   public String userNumber;
   /** 用户名
    * 
    * @pdOid a7d28b2e-6198-4b13-b444-d2382aaaddfb */
   public java.lang.String userName;
   /** 登陆名
    * 
    * @pdOid fbc81b75-953b-4518-a8a1-f3d61a6c40af */
   public java.lang.String loginName;
   /** 英文名
    * 
    * @pdOid b4f36206-e2ef-4e80-9ef8-c7d2849390c6 */
   public java.lang.String enName;
   /** 性别  1：男，0：女
    * 
    * @pdOid 746a647f-8cff-4e3a-8912-aada8237b505 */
   public java.lang.String sex;
   /** 座机 电话
    * 
    * @pdOid d9c357a4-5db0-4d07-82fa-dae161cfe2e2 */
   public java.lang.String telephone;
   /** 出生日期 
    * 
    * @pdOid eac63d43-55b7-44f2-9930-4418483d91b7 */
   public java.util.Date birthday;
   /** 座机分机号
    * 
    * @pdOid 6521d428-48ac-4f0e-b446-eebbe74fa0fd */
   public java.lang.String telephoneExt;
   /** 用户的email 
    * 
    * @pdOid 3036c7f8-3e48-406d-b52e-490974988b2b */
   public java.lang.String email;
   /** 手机号
    * 
    * @pdOid 0c23f365-6c0d-4a2b-accb-16b7b976d5c9 */
   public java.lang.String mobilePhone;
   /** @pdOid b625d8fa-e149-4c0e-b505-f2e49b2e92b8 */
   public java.lang.String msn;
   /** @pdOid 927630c3-458e-4154-ac9c-6cf01bf20781 */
   public java.lang.String fax;
   /** @pdOid 755c4d46-eecd-40e5-9977-2ead735dbb3f */
   public java.lang.String msn2;
   /** @pdOid 3a06d62e-d73e-41ab-92c3-c05c1ccdc9b2 */
   public java.lang.String skype;
   /** @pdOid a3e38f13-c0b4-4427-92c0-e20f4f9e9dce */
   public java.lang.String msn3;
   /** @pdOid dfbdce1d-621b-4cd0-b14e-b75f4000aa3a */
   public java.lang.String qq;
   /** 职位描述
    * 
    * @pdOid 0d63c638-75c2-45cb-a30e-7cced6e75d89 */
   public java.lang.String jobDescription;
   /** 员工排序号
    * 
    * @pdOid 912f9556-74ac-4077-a418-5282555cd3cc */
   public long sortNumber;
   /** 地址
    * 
    * @pdOid a055df5c-ae38-4bbf-b6ea-ae42d8d98d5a */
   public java.lang.String address;
   /** 邮编
    * 
    * @pdOid 2b1bc322-5726-4cc8-872e-d01069a4bc7c */
   public java.lang.String zip;
   /** 描述
    * 
    * @pdOid 8cf6e3e3-5faa-4c36-a41e-5c3e317dc6e5 */
   public java.lang.String remark;
   /** 个人图片的路径
    * 
    * @pdOid e64db7a5-aaa7-4d41-b7f2-79bfd6adaa7b */
   public java.lang.String imagePath;
   /** 用户的登陆密码
    * 
    * @pdOid cdd94f27-8726-46ef-bfa2-06b1ac045bf1 */
   public java.lang.String password;
   
   /** @pdRoleInfo migr=no name=PersonalEvent assc=userPersonalEventRef coll=java.util.Collection impl=java.util.HashSet mult=0..* */
   public java.util.Collection personalEvent;
   /** @pdRoleInfo migr=no name=Company assc=userRefCompany mult=0..1 side=A */
   public Company company;
   /** 用户部门关系 */
   /** @pdRoleInfo migr=no name=Department assc=userRefDepartment mult=0..1 side=A */
   public Department department;
   
   
   /** @pdGenerated default getter */
   public java.util.Collection getPersonalEvent() {
      if (personalEvent == null)
         personalEvent = new java.util.HashSet();
      return personalEvent;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIteratorPersonalEvent() {
      if (personalEvent == null)
         personalEvent = new java.util.HashSet();
      return personalEvent.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newPersonalEvent */
   public void setPersonalEvent(java.util.Collection newPersonalEvent) {
      removeAllPersonalEvent();
      for (java.util.Iterator iter = newPersonalEvent.iterator(); iter.hasNext();)
         addPersonalEvent((PersonalEvent)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newPersonalEvent */
   public void addPersonalEvent(PersonalEvent newPersonalEvent) {
      if (newPersonalEvent == null)
         return;
      if (this.personalEvent == null)
         this.personalEvent = new java.util.HashSet();
      if (!this.personalEvent.contains(newPersonalEvent))
      {
         this.personalEvent.add(newPersonalEvent);
         newPersonalEvent.setUsers(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param oldPersonalEvent */
   public void removePersonalEvent(PersonalEvent oldPersonalEvent) {
      if (oldPersonalEvent == null)
         return;
      if (this.personalEvent != null)
         if (this.personalEvent.contains(oldPersonalEvent))
         {
            this.personalEvent.remove(oldPersonalEvent);
            oldPersonalEvent.setUsers((Users)null);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllPersonalEvent() {
      if (personalEvent != null)
      {
         PersonalEvent oldPersonalEvent;
         for (java.util.Iterator iter = getIteratorPersonalEvent(); iter.hasNext();)
         {
            oldPersonalEvent = (PersonalEvent)iter.next();
            iter.remove();
            oldPersonalEvent.setUsers((Users)null);
         }
      }
   }
   /** @pdGenerated default parent getter */
   public Company getCompany() {
      return company;
   }
   
   /** @pdGenerated default parent setter
     * @param newCompany */
   public void setCompany(Company newCompany) {
      if (this.company == null || !this.company.equals(newCompany))
      {
         if (this.company != null)
         {
            Company oldCompany = this.company;
            this.company = null;
            oldCompany.removeUsers(this);
         }
         if (newCompany != null)
         {
            this.company = newCompany;
            this.company.addUsers(this);
         }
      }
   }
   /** @pdGenerated default parent getter */
   public Department getDepartment() {
      return department;
   }
   
   /** @pdGenerated default parent setter
     * @param newDepartment */
   public void setDepartment(Department newDepartment) {
      if (this.department == null || !this.department.equals(newDepartment))
      {
         if (this.department != null)
         {
            Department oldDepartment = this.department;
            this.department = null;
            oldDepartment.removeUsers(this);
         }
         if (newDepartment != null)
         {
            this.department = newDepartment;
            this.department.addUsers(this);
         }
      }
   }

}