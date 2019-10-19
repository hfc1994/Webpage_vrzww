package com.vrzww.bean;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

public class Upload 
{
	public void picUpload(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		String path = request.getSession().getServletContext().getRealPath("/uploadImg");
		System.out.println("..........................."+path);
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH) + 1;
		//根据年月存储图片
		path = path + "/" + year + "/" + month +"/";

		File file = new File(path);
		if (!file.exists())
			file.mkdirs();
		String fileName = "";// 文件名称
		String suffix = "";//文件后缀
		String[] allowSuffix = {".jpg",".png",".gif",".jpeg"};

		/** 上传文件处理内容 **/
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload sfu = new ServletFileUpload(factory);
		sfu.setHeaderEncoding("UTF-8"); // 处理中文问题
		sfu.setSizeMax(1024 * 1024); // 限制文件大小
		try {
			//List fileItems = sfu.parseRequest((RequestContext) request); // 解码请求
			List<FileItem> fileItems = (List<FileItem>)sfu.parseRequest(new ServletRequestContext(request));
			for (int i=0; i<fileItems.size(); i++) 
			{
				suffix = fileItems.get(i).getName().substring(fileItems.get(i).getName().lastIndexOf("."),
						fileItems.get(i).getName().length());

				boolean allowed = Arrays.asList(allowSuffix).contains(suffix);

				if(!allowed) return;

				fileName = UUID.randomUUID() + suffix;
				fileItems.get(i).write(new File(path, fileName));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		/**********************/

		// 获取图片url地址
		String imgUrl =request.getContextPath() + "/uploadImg/" + 
						year + "/" + month + "/" + fileName;
		response.setContentType("text/text;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(imgUrl); // 返回url地址
		out.flush();
		out.close();
	}
}
