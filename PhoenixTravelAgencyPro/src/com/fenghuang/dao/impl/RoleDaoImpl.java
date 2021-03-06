package com.fenghuang.dao.impl;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IRoleDao;
import com.fenghuang.entiey.FunctionMenu;
import com.fenghuang.entiey.MenuPermission;
import com.fenghuang.entiey.Role;
import com.fenghuang.entiey.RoleAndMenuPermission;
import com.fenghuang.entiey.RoleAndPagePermission;
import com.fenghuang.util.Pagination;

@Repository
public class RoleDaoImpl extends BaseDao implements IRoleDao {

	@Autowired
	public RoleDaoImpl(@Qualifier("dataSource") DataSource dataSource) {
		super(dataSource);

	}

	@Override
	public boolean saveRole(Role role) throws Exception {
		String sql = "insert into role (roleNo,roleName,roleDesc) values (?,?,?)";
		int rs = this.update(sql, role.getRoleNo(), role.getRoleName(),
				role.getRoleDesc());
		return rs > 0;
	}

	@Override
	public boolean updateRole(Role role) throws Exception {
		String sql = "update role set roleNo=?,roleName=?,roleDesc=? where id=?";
		int rs = this.update(sql, role.getRoleNo(), role.getRoleName(),
				role.getRoleDesc(), role.getId());
		return rs > 0;
	}

	@Override
	public boolean deteleRoleById(Long id) throws Exception {
		String sql = "delete from role where id=?";
		int rs = this.update(sql, id);

		return rs > 0;
	}

	@Override
	public Pagination<Role> getPaginationRoles(int currentPage, int numPerPage,
			String roleNo, String roleName, String roleDesc) throws Exception {

		StringBuffer sql = new StringBuffer(
				"SELECT role.id,role.roleNo,role.roleName,role.roleDesc FROM role where 1=1 ");

		if (roleNo != null && !"".equals(roleNo)) {
			sql.append(" and  role.roleNo like '");
			sql.append(roleNo);
			sql.append("%'");
		}

		if (roleName != null && !"".equals(roleName)) {
			sql.append(" and  role.roleName like '");
			sql.append(roleName);
			sql.append("%'");
		}
		if (roleDesc != null && !"".equals(roleDesc)) {
			sql.append(" and  role.roleDesc like '");
			sql.append(roleDesc);
			sql.append("%'");
		}
		Pagination<Role> proles = this.getPagination(currentPage, numPerPage,
				sql.toString());
		return proles;
	}

	@Override
	public boolean saveRoleAndMenuPermission(
			RoleAndMenuPermission roleAndMenuPermission) throws Exception {
		String sql = "insert into roleandmenupermission(mpid,roleId) values(?,?)";

		int rs = this.update(sql, roleAndMenuPermission.getMpId(),
				roleAndMenuPermission.getRoleId());

		return rs > 0;
	}

	@Override
	public boolean deleteRoleAndMenuPermission(Long id) throws Exception {
		String sql = "delete from roleandmenupermission where id =?";
		int rs = this.update(sql, id);
		return rs > 0;
	}

	@Override
	public boolean saveRoleAndPagePermission(
			RoleAndPagePermission roleAndPagePermission) throws Exception {
		String sql = "insert into roleandpagepermission values(ppid,roleId)";
		int rs = this.update(sql, roleAndPagePermission.getPpId(),
				roleAndPagePermission.getRoleId());
		return rs > 0;
	}

	@Override
	public boolean deleteRoleAndPagePermission(Long id) throws Exception {
		String sql = "delete from roleandpagepermission where id =?";
		int rs = this.update(sql, id);
		return rs > 0;
	}

	@Override
	public Pagination<MenuPermission> getMenuPermissionsByRoleId(
			int currentPage, int numPerPage, Long roleId) throws Exception {
	   StringBuffer sql = new StringBuffer("SELECT menupermission.id, menupermission.mpNo,menupermission.mpName,menupermission.mpDesc,menupermission.functionNo,role.id AS roleid FROM menupermission ,role ,roleandmenupermission WHERE role.id =  roleandmenupermission.roleId AND roleandmenupermission.mpid =  menupermission.id");
	   if(roleId != null && roleId !=0){
		   sql.append(" and role.id='");
			sql.append(roleId);
			sql.append("'");
		   
	   }	
	   Pagination<MenuPermission> pMenuPermissions = this.getPagination(currentPage, numPerPage,
				sql.toString());
		return pMenuPermissions;
	}

	@Override
	public Pagination<MenuPermission> getMenuPermissionsNotIncludeByRoleId(
			int currentPage, int numPerPage, Long roleId) throws Exception {
		   StringBuffer sql = new StringBuffer("SELECT menupermission.id, menupermission.mpNo,menupermission.mpName,menupermission.mpDesc,menupermission.functionNo FROM menupermission where menupermission.id not in (select mpid from roleandmenupermission where roleid='"+roleId+"' )");
		   Pagination<MenuPermission> pMenuPermissions = this.getPagination(currentPage, numPerPage,
					sql.toString());
			return pMenuPermissions;
	}

	@Override
	public Pagination<Role> getHaveRoles(int currentPage, int numPerPage,
			Long userId) throws Exception {
		StringBuffer sb = new StringBuffer("SELECT role.roleNo,role.id,role.roleName,role.roleDesc FROM users ,usersandrole ,role WHERE users.id =  usersandrole.userId AND usersandrole.roleId =  role.id");
		if(userId != null && userId !=0l){
			sb.append(" and  users.id='");
			sb.append(userId);
			sb.append("'");
			
		}
		Pagination<Role>  roles = this.getPagination(currentPage, numPerPage, sb.toString());
		return roles;
	}

	@Override
	public Pagination<Role> getNotHaveRoles(int currentPage, int numPerPage,
			Long userId) throws Exception {
		StringBuffer sb = new StringBuffer("SELECT role.roleNo,role.id,role.roleName,role.roleDesc FROM role WHERE role.id not in (select usersandrole.roleId from usersandrole where usersandrole.userId ='"+userId+"' )");
		Pagination<Role>  roles = this.getPagination(currentPage, numPerPage, sb.toString());
		return roles;
		
	}



}
