package com.jiyun.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiyun.bean.Dept;
import com.jiyun.bean.Student;
import com.jiyun.service.StudentService;

@Controller
public class StudentController {

	@Autowired
	private StudentService studentService;
	
	@RequestMapping("toShow")
	public String toShow(){
		return "show";
	}
	
	@RequestMapping("findAll")
	@ResponseBody
	public PageInfo<Student> findAll(Integer pageNum,Integer pageSize){
		PageHelper.startPage(pageNum, 3);
		List<Student> list = studentService.findAll();
		PageInfo<Student> pageInfo = new PageInfo<Student>(list);
		return pageInfo;
	}
	//跳转添加页面
	@RequestMapping("toAdd")
	public String toAdd(){
		return "add";
	}
	//查询班级列表findDept
	@ResponseBody
	@RequestMapping("findDept")
	public List<Dept> findDept(){
		List<Dept> clist = studentService.findDept();
		return clist;
	}
	//添加
	@ResponseBody
	@RequestMapping("addStudent")
	public int addStudent(@RequestBody Student student){
		int i = studentService.addStudent(student);
		return i;
	}
	//修改
	@ResponseBody
	@RequestMapping("updateStudent")
	public int updateStudent(@RequestBody Student student){
		int i = studentService.updateStudent(student);
		return i;
	}
	@ResponseBody
	@RequestMapping("deleteStudent")
	public int deleteStudent(@RequestBody Integer[] ids){
		int i = studentService.deleteStudent(ids);
		return i;
	}
}
