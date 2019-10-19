package com.vrzww.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.vrzww.po.UserCustom;
import com.vrzww.po.UserQueryVo;

/**
 * <p>description 用户相关的映射表接口
 * @author user-hfc
 * @method findUserList() 查询全部用户
 * @method getUserListExist 获取未被删除的用户的完整列表
 * @method getUserListDeleted 获取被删除的用户的完整列表
 * @method deleteById 根据id删除用户，实际只是把deleteState字段改为0
 * 
 */

public interface UserMapperCustom 
{
	List<UserCustom> findUserList() throws Exception;

	List<UserCustom> getUserListExist(int start, int offset) throws Exception;

	List<UserCustom> getUserListDeleted(int start, int offset) throws Exception;

	void deleteById(int id) throws Exception;

	void recoverById(int id) throws Exception;

	UserCustom getUserByLoginName(String loginname) throws Exception;

	int insertUser(String username, String loginname, String password,
			String question, String answer, String headportrait) throws Exception;

	int checkByLoginName(String loginname) throws Exception;

	UserCustom getUserByUId(String uid) throws Exception;

	int updateUserInfo(@Param("uid") String uid,@Param("username") String username,@Param("insertpassword") String insertpassword,
			@Param("headportrait") String headportrait) throws Exception;
}
