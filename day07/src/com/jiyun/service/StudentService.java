package com.jiyun.service;

import java.util.List;

import com.jiyun.bean.Dept;
import com.jiyun.bean.Student;

public interface StudentService {

	List<Student> findAll();

	List<Dept> findDept();

	int addStudent(Student student);

	int updateStudent(Student student);

	int deleteStudent(Integer[] ids);

}
