package com.fenghuang.dao.impl;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IMenuPermissionDao;
import com.fenghuang.entiey.MenuPermission;
import com.fenghuang.util.Pagination;

@Repository
public class MenuPermissionDaoImpl extends BaseDao implements
		IMenuPermissionDao {

	@Autowired
	public MenuPermissionDaoImpl(@Qualifier("dataSource")DataSource dataSource) {
		super(dataSource);
		
	}

	@Override
	public boolean saveMenuPermission(MenuPermission meunPermission)
			throws Exception {
		String sql = "insert into menupermission (mpNo,mpName,mpDesc,functionNo) values (?,?,?,?)";
		int rs = this.update(sql, meunPermission.getMpNo(),meunPermission.getMpName(),meunPermission.getMpDesc(),meunPermission.getFunctionNo());
		return rs >0;
	}

	@Override
	public boolean updateMenuPermission(MenuPermission menuPermission)
			throws Exception {
		String sql = "update menupermission set mpNo=?,mpName=?,mpDesc=?,functionNo=? where id=?";
		int rs = this.update(sql, menuPermission.getMpNo(),menuPermission.getMpName(),menuPermission.getMpDesc(),menuPermission.getFunctionNo(),menuPermission.getId());
		
		return rs > 0;
	}

	@Override
	public boolean deleteMenuPermissionById(Long id) throws Exception {
		String sql = "delete from menupermission where id=?";
		int rs = this.update(sql, id);
		return rs > 0;
	}

	@Override
	public Pagination<MenuPermission> getPaginationMenuPermissions(
			int currentPage, int numPerPage, Long id, String mpNo,
			String mpName, String mpDesc, String functionNo) throws Exception {
		StringBuffer sql = new StringBuffer("SELECT menupermission.id,menupermission.mpNo,menupermission.mpName,menupermission.mpDesc,menupermission.functionNo FROM menupermission where 1=1");
		if(id != null && id !=0){
			sql.append(" and menupermission.id ='");
			sql.append(id);
			sql.append("'");
		}
		if (mpNo != null && !"".equals(mpNo)) {
			sql.append(" and  menupermission.mpNo like '");
			sql.append(mpNo);
			sql.append("%'");
		}
		if (mpName != null && !"".equals(mpName)) {
			sql.append(" and  menupermission.mpName like '");
			sql.append(mpName);
			sql.append("%'");
		}
		if (mpDesc != null && !"".equals(mpDesc)) {
			sql.append(" and  menupermission.mpDesc like '");
			sql.append(mpDesc);
			sql.append("%'");
		}
		if (functionNo != null && !"".equals(functionNo)) {
			sql.append(" and  menupermission.functionNo like '");
			sql.append(functionNo);
			sql.append("%'");
		}
		
		Pagination<MenuPermission>  pmps = this.getPagination(currentPage, numPerPage, sql.toString());
		
		return pmps;
	}

	@Override
	public MenuPermission getMenuPermissionById(Long id) throws Exception {
		String sql = "SELECT menupermission.id,menupermission.mpNo,menupermission.mpName,menupermission.mpDesc,menupermission.functionNo FROM menupermission where menupermission.id=?";
		MenuPermission mp  = this.queryForObject(sql, MenuPermission.class, id);
		return mp;
	}

}
