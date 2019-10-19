package com.vrzww.service;

import java.util.List;

import com.vrzww.po.CategoryCustom;
import com.vrzww.po.CategoryQueryVo;

/**
 * <p>descrption 类别的业务操作接口
 * @author user-hfc
 * @method getAId 根据类别Id获取全部对应的文章Id
 * @method getLimitAId 根据类别Id和限定条件获取限定数量的全部对应的文章Id
 * @method getAIdAll 获取全部类别Id和文章Id的关系
 * 
 */

public interface CategoryService 
{
	public List<CategoryCustom> getAId(int categoryId) throws Exception;

	public List<CategoryCustom> getLimitAId(int categoryId, int start, int offset) throws Exception;
	
	public List<CategoryCustom> getAIdAll() throws Exception;
}
