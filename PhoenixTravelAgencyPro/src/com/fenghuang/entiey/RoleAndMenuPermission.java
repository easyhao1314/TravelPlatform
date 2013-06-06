/***********************************************************************
 * Module:  RoleAndMenuPermission.java
 * Author:  baoguohao
 * Purpose: Defines the Class RoleAndMenuPermission
 ***********************************************************************/
package com.fenghuang.entiey;
import java.util.*;

/** 角色权限表
 * 
 * @pdOid 933ffc43-623b-4cda-9ffe-810946814a48 */
public class RoleAndMenuPermission {
   /** @pdOid 2568b0c0-8678-4e3a-887a-34821c4d8ff1 */
   public long id;
   
   /** @pdRoleInfo migr=no name=MenuPermission assc=menuPermissionRef mult=0..1 side=A */
   public MenuPermission menuPermission;
   /** @pdRoleInfo migr=no name=Role assc=roleRef mult=0..1 side=A */
   public Role role;
   
   
   /** @pdGenerated default parent getter */
   public MenuPermission getMenuPermission() {
      return menuPermission;
   }
   
   /** @pdGenerated default parent setter
     * @param newMenuPermission */
   public void setMenuPermission(MenuPermission newMenuPermission) {
      if (this.menuPermission == null || !this.menuPermission.equals(newMenuPermission))
      {
         if (this.menuPermission != null)
         {
            MenuPermission oldMenuPermission = this.menuPermission;
            this.menuPermission = null;
            oldMenuPermission.removeRoleAndMenuPermission(this);
         }
         if (newMenuPermission != null)
         {
            this.menuPermission = newMenuPermission;
            this.menuPermission.addRoleAndMenuPermission(this);
         }
      }
   }
   /** @pdGenerated default parent getter */
   public Role getRole() {
      return role;
   }
   
   /** @pdGenerated default parent setter
     * @param newRole */
   public void setRole(Role newRole) {
      if (this.role == null || !this.role.equals(newRole))
      {
         if (this.role != null)
         {
            Role oldRole = this.role;
            this.role = null;
            oldRole.removeRoleAndMenuPermission(this);
         }
         if (newRole != null)
         {
            this.role = newRole;
            this.role.addRoleAndMenuPermission(this);
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

}