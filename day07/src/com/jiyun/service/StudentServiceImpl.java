package com.jiyun.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiyun.bean.Dept;
import com.jiyun.bean.Student;
import com.jiyun.mapper.StudentMapper;

@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	private StudentMapper studentMapper;

	public List<Student> findAll() {
		List<Student> list = studentMapper.findAll();
		return list;
	}

	public List<Dept> findDept() {
		List<Dept> clist = studentMapper.findDept();
		return clist;
	}

	public int addStudent(Student student) {
		int i = studentMapper.addStudent(student);
		return i;
	}

	public int updateStudent(Student student) {
		int i = studentMapper.updateStudent(student);
		return i;
	}

	public int deleteStudent(Integer[] ids) {
		int i = studentMapper.deleteStudent(ids);
		return i;
	}
	
}
