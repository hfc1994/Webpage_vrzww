package com.vrzww.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.vrzww.po.CategoryCustom;
import com.vrzww.po.CategoryQueryVo;
import com.vrzww.service.CategoryService;

/**
 * <p>description 类别的controller
 * @author user-hfc
 * @RequestMapping "/categoryList" 获取全部类别文章对应表
 * 
 */

@Controller

@RequestMapping("/category")
public class CategoryController 
{
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping("/categoryList")
	public ModelAndView categoryList(HttpServletRequest request) throws Exception
	{
		List<CategoryCustom> categoryList = categoryService.getAIdAll();
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("categoryList", categoryList);
		modelAndView.setViewName("category/categoryList");
		
		return modelAndView;
	}
}
