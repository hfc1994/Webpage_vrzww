package com.vrzww.mapper;

import com.vrzww.po.Category;
import com.vrzww.po.CategoryCustom;
import com.vrzww.po.CategoryExample;
import com.vrzww.po.CategoryQueryVo;

import java.util.List;

import org.apache.ibatis.annotations.Param;

/**
 * <p>description 类别相关的映射表接口
 * @author user-hfc
 * @method getAId() 根据类别Id查询相关的所有文章Id
 * @method getLimitAId() 根据限制条件和类别Id查询相应数量相关的所有文章Id
 * @method getAIdAll() 查询完整的类别Id与文章Id的对应关系
 * 
 */

public interface CategoryMapperCustom 
{
	public List<CategoryCustom> getAId(int categoryId) throws Exception;

	public List<CategoryCustom> getLimitAId(int categoryId, int start, int offset) throws Exception;
	
	public List<CategoryCustom> getAIdAll() throws Exception;

	public void setCategory(int categoryId, Integer aId) throws Exception;
}