package com.fenghuang.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IUserDao;
import com.fenghuang.dao.IUsersAndRoleDao;
import com.fenghuang.entiey.FunctionMenu;
import com.fenghuang.entiey.Users;
import com.fenghuang.entiey.UsersAndRole;
import com.fenghuang.service.IRoleService;
import com.fenghuang.service.IUsersService;
import com.fenghuang.util.Pagination;
import com.fenghuang.util.ShowConstant;

@Service
public class UsersServiceImpl implements IUsersService {

	@Autowired
	private IUserDao iUserDao;
	@Autowired
	private IRoleService iRoleService;
	@Autowired
	private IUsersAndRoleDao iUsersAndRoleDao;

	@Override
	public boolean saveUsers(Users users) throws Exception {
		return iUserDao.saveUsers(users);
	}

	@Override
	public boolean updateUsers(Users users) throws Exception {
		return iUserDao.updateUsers(users);
	}

	@Override
	public boolean deleteUserById(Long id) throws Exception {
		return iUserDao.deleteUserById(id);
	}

	@Override
	public Pagination<Users> getPaginationUsers(int currentPage,
			int numPerPage, Users users) throws Exception {
		return iUserDao.getPaginationUsers(currentPage, numPerPage, users);
	}

	@Override
	public Users getUsersById(Long id) throws Exception {
		return iUserDao.getUsersById(id);
	}

	@Override
	public boolean updateUserPassword(Long id, String newPassword)
			throws Exception {
		return iUserDao.updateUserPassword(id, newPassword);
	}

	@Override
	public String getUsersPasswordById(Long id) throws Exception {
		return iUserDao.getUsersPasswordById(id);
	}

	/*
	 * @see
	 * com.fenghuang.service.IUsersService#isExistUserLoginName(java.lang.String
	 * )
	 */
	@Override
	public boolean isExistUserLoginName(String LoginName) throws Exception {
		return iUserDao.isExistUserLoginName(LoginName);
	}

	/*
	 * @see
	 * com.fenghuang.service.IUsersService#getUsersByLoginName(java.lang.String)
	 */
	@Override
	public Users getUsersByLoginName(String loginName) throws Exception {
		return iUserDao.getUsersByLoginName(loginName);
	}

	@Override
	public List<Map<String, Object>> getFunctionMenusByUserId(Long userId)
			throws Exception {
		List<FunctionMenu> fms = new ArrayList<FunctionMenu>();
		List<UsersAndRole> uars = iUsersAndRoleDao.getUsersAndRoles(userId);
		if (uars != null) {
			for (Iterator<UsersAndRole> iterator = uars.iterator(); iterator
					.hasNext();) {
				UsersAndRole usersAndRole = (UsersAndRole) iterator.next();
				List<FunctionMenu> singlFms = iRoleService
						.getFunctionMenuByRoleId(usersAndRole.getRoleId());
				fms.addAll(singlFms);
			}
		}
		Map<String, Object> fmsMap = new HashMap<String, Object>();
		List<Map<String, Object>> returnValue = new ArrayList<Map<String, Object>>();
		List<FunctionMenu> mainMenus = new ArrayList<FunctionMenu>();
		List<FunctionMenu> subMenus = new ArrayList<FunctionMenu>();
		// 说明集合里有菜单元素
		if (fms.size() > 0) {
			for (Iterator iterator = fms.iterator(); iterator.hasNext();) {
				FunctionMenu functionMenu = (FunctionMenu) iterator.next();
				if (functionMenu.getMenuType() == Long
						.valueOf(ShowConstant.MENU_TYPE_MAINMENU)) {
					if (!mainMenus.contains(functionMenu)) {
						mainMenus.add(functionMenu);
					}
				} else {
					if (!subMenus.contains(functionMenu)) {
						subMenus.add(functionMenu);
					}
				}
			}
			for (Iterator<FunctionMenu> iterator = mainMenus.iterator(); iterator
					.hasNext();) {
				FunctionMenu functionMenu = (FunctionMenu) iterator.next();
				Map<String,Object> mainMap = new HashMap<String, Object>();
				mainMap.put("id", functionMenu.getId());
				mainMap.put("text", functionMenu.getMeunName());
				List<Map<String,Object>> subList = new ArrayList<Map<String,Object>>();
				List<Map<String,Object>> attributesMap = null;
				Map<String,Object> attriMap = null;
			    for (Iterator<FunctionMenu> subIterator = subMenus.iterator(); subIterator
						.hasNext();){
			    	  FunctionMenu subMenu = (FunctionMenu) subIterator.next();
			    	  Map<String,Object> subMap = new HashMap<String, Object>();
			    	  if(subMenu.getParentId() == functionMenu.getId()){
			    		  subMap.put("id", subMenu.getId());
			    		  subMap.put("text", subMenu.getMeunName());
			    		  attributesMap = new ArrayList<Map<String,Object>>();
			    		  attriMap = new HashMap<String, Object>();
			    		  if(subMenu.getMenuPath().indexOf("?")>0){
			    		  attriMap.put("path", subMenu.getMenuPath()+"&userId="+userId);
			    		  }else{
			    		  attriMap.put("path", subMenu.getMenuPath()+"?userId="+userId);  
			    		  }
			    		  attributesMap.add(attriMap);
			    		  subMap.put("attributes", attributesMap);
			    		  subList.add(subMap);
			    	  }
			    }
				mainMap.put("children", subList);
			    returnValue.add(mainMap);
			}

		} else {
			returnValue.add(new HashMap<String, Object>());
		}
		return returnValue;
	}

	@Override
	public void deleteUsersByList(List<Users> users) throws Exception {
		if(users != null){
			for (Iterator iterator = users.iterator(); iterator.hasNext();) {
				Users users2 = (Users) iterator.next();
				if(users2.getId()!=null &&users2.getId()!=0l){
					iUserDao.deleteUserById(users2.getId());
				}
			}
			
		}
		
	}

	@Override
	public void updateUsersByList(List<Users> users) throws Exception {
	  if(users != null){
		  for (Iterator iterator = users.iterator(); iterator.hasNext();) {
			Users users2 = (Users) iterator.next();
			if(users2.getId()!=null &&users2.getId()!=0l){
				iUserDao.updateUsers(users2);
			}else{
				iUserDao.saveUsers(users2);
			}
		}  
	  }
	}

}
