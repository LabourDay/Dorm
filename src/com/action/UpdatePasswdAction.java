package com.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.dao.StudentDao;
import com.dao.impl.StudentDaoImpl;
import com.model.Student;
import com.opensymphony.xwork2.ActionSupport;

public class UpdatePasswdAction extends ActionSupport implements ServletRequestAware{

	
	private static final long serialVersionUID = -7731983687808315313L;
	private HttpServletRequest request;
	
	public String execute(){
		String id = request.getParameter("id");
		String old_pw = request.getParameter("oldpw");
		String input_pw = request.getParameter("pwd1");
		String new_pw = request.getParameter("pwd2");
		System.out.println(id);
		System.out.println(old_pw);
		System.out.println(new_pw);
		
		if(input_pw.equals(old_pw)){
			Student student = new Student();
			student.setStu_id(id);
			student.setStu_password(new_pw);
			StudentDao dao = new StudentDaoImpl();
			boolean flag = false;
			flag = dao.updatePassWord(student);
			System.out.println(flag);
			if(flag){
				return SUCCESS;
			}
		}
		return null;
	}
	
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		
	}
}
