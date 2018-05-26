package com.action;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.dao.StudentDao;
import com.dao.impl.StudentDaoImpl;
import com.model.Student;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport implements ServletRequestAware,SessionAware{
	private static final long serialVersionUID = 1L;
	private Student student;
	private HttpServletRequest request;
	private Map<String,Object> session;
	
	public String execute(){
		StudentDao sDao = new StudentDaoImpl();
		boolean flag = false;
		String name="";
		String stu_sex="";
		String dorm_num="";
		flag = sDao.isLogin(student);
		System.out.println(student.getStu_id());
		System.out.println(student.getStu_password());
		System.out.println(flag);
		if(flag){
			ResultSet rs = sDao.findStudentByid(student.getStu_id());
			try {
//				rs.last();
//				rs.beforeFirst();
				rs.next();
				name = rs.getString("stu_name");
				stu_sex = rs.getString("stu_sex");
				dorm_num = rs.getString("dorm_num");
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
			session.put("student", student);
			session.put("name", name);
			session.put("stu_sex", stu_sex);
			session.put("dorm_num", dorm_num);
			System.out.println(name);
			System.out.println(dorm_num);
			return SUCCESS;
		}
		return ERROR;
	}
	
	
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
		
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		
	}
	
}
