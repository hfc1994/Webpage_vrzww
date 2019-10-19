package com.vrzww.po;

import java.util.List;

/**
 * <p>description 类别包装对象
 * @author user-hfc
 *
 */

public class CategoryQueryVo 
{
	private Category category;
	
	private CategoryCustom categoryCustom;
	
	private List<CategoryCustom> categoryList;

	public Category getCategory() 
	{
		return category;
	}

	public void setCategory(Category category) 
	{
		this.category = category;
	}

	public CategoryCustom getCategoryCustom() 
	{
		return categoryCustom;
	}

	public void setCategoryCustom(CategoryCustom categoryCustom) 
	{
		this.categoryCustom = categoryCustom;
	}

	public List<CategoryCustom> getCategoryList() 
	{
		return categoryList;
	}

	public void setCategoryList(List<CategoryCustom> categoryList) 
	{
		this.categoryList = categoryList;
	}
	
	
}
