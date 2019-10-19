package com.vrzww.service;

import java.util.List;
import java.util.Map;

import com.vrzww.po.UserCustom;
import com.vrzww.po.UserQueryVo;

/**
 * <p>descrption 用户的业务操作接口
 * @author user-hfc
 * @method findUserList 获取完整用户列表
 * @method getUserListExist 获取未被删除的用户的完整列表
 * @method getUserListDeleted 获取被删除的用户的完整列表
 * @method deleteById 根据id删除用户，实际只是把deleteState字段改为0
 * @method recoverById 根据id删除用户，实际只是把deleteState字段改为1
 * 
 */

public interface UserService 
{
	public List<UserCustom> findUserList() throws Exception;

	public List<UserCustom> getUserListExist(int pages) throws Exception;

	public List<UserCustom> getUserListDeleted(int pages) throws Exception;

	public void deleteById(int id) throws Exception;

	public void recoverById(int id) throws Exception;

	public Map<String,Object> userLogin(String account, String password) throws Exception;

	public int userRegister(String loginname, String username, String password,
			String question, String answer, String headportrait) throws Exception;

	public int checkLoginName(String loginname) throws Exception;

	public String setSelfInfo(String uid, String username, String headportrait,
			String oldpassword, String newpassword) throws Exception;
}
