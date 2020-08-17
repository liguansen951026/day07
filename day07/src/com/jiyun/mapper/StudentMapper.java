package com.jiyun.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jiyun.bean.Dept;
import com.jiyun.bean.Student;

public interface StudentMapper {

	List<Student> findAll();

	List<Dept> findDept();

	int addStudent(Student student);

	int updateStudent(Student student);

	int deleteStudent(@Param("ids")Integer[] ids);

}
