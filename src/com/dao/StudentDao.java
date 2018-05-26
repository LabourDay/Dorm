package com.dao;

import java.sql.ResultSet;
import java.util.List;

import com.model.Student;


public interface StudentDao {
	public boolean isLogin(Student student);
	public ResultSet findStudentByid(String id);
	public boolean addStudent(Student stu);
	public boolean delStudent(String id);
	public boolean updateStudent(Student stu);
	public List findStudentById(String id);
	public boolean updatePassWord(Student student);
}
