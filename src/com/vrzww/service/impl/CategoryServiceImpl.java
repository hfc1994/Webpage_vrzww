package com.vrzww.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.vrzww.mapper.CategoryMapper;
import com.vrzww.mapper.CategoryMapperCustom;
import com.vrzww.po.CategoryCustom;
import com.vrzww.po.CategoryQueryVo;
import com.vrzww.service.CategoryService;

/**
 * <p>descrption 类别的业务操作实现
 * @author user-hfc
 * @method getAId 根据类别Id获取全部对应的文章Id
 * @method getAIdAll 获取全部类别Id和文章Id的关系
 * 
 */

public class CategoryServiceImpl implements CategoryService
{
	@Autowired
	private CategoryMapperCustom categoryMapperCustom;
	
	@Autowired
	private CategoryMapper categoryMapper;

	@Override
	public List<CategoryCustom> getAId(int categoryId) throws Exception 
	{
		return categoryMapperCustom.getAId(categoryId);
	}

	@Override
	public List<CategoryCustom> getLimitAId(int categoryId, int start, int offset) throws Exception 
	{
		return categoryMapperCustom.getLimitAId(categoryId, start, offset);
	}

	@Override
	public List<CategoryCustom> getAIdAll() throws Exception 
	{
		return categoryMapperCustom.getAIdAll();
	}
	
}
