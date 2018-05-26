package com.action;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.dao.StudentDao;
import com.dao.impl.StudentDaoImpl;
import com.model.Student;
import com.opensymphony.xwork2.ActionSupport;

public class MemberAction extends ActionSupport implements ServletRequestAware {
	private static final long serialVersionUID = 4266371927797749150L;
	private Student student;
	private HttpServletRequest request;
	private List<Student> list;
	public List<Student> getList() {
		return list;
	}

	public void setList(List<Student> list) {
		this.list = list;
	}

	public String  memberMsg(){
		int dorm_num=Integer.parseInt(request.getParameter("dorm_num"));
		//String dorm_num=request.getParameter("dorm_num");
		System.out.println(dorm_num);
		StudentDaoImpl sdao = new StudentDaoImpl();
		this.setList(sdao.select(dorm_num));
		//request.setAttribute("list", list);
		return "all";
	}
	
	public String addMember(){
		boolean flag = false;
		String sRet = "增加失败";
		StudentDao sdao = new StudentDaoImpl();
		flag = sdao.addStudent(student);
		System.out.println(flag);
		if(flag){
			sRet = "欢迎"+student.getStu_name()+"加入"+student.getDorm_num()+"宿舍";
			request.setAttribute("sRet", sRet);
			return "add_success";
		}
		request.setAttribute("sRet", sRet);
		request.setAttribute("dorm_num", student.getDorm_num());
		return "add_fail";
	}
	
	public String findMember(){
		String id = request.getParameter("select_id");
		System.out.println(id);
		StudentDao f_dao = new StudentDaoImpl();
		this.setList(f_dao.findStudentById(id));
		return "find";
	}
	
	public String delMember(){
		String id = request.getParameter("id");
		boolean flag = false;
		String sRet = "删除失败";
		StudentDao d_dao = new StudentDaoImpl();
		flag = d_dao.delStudent(id);
		if(flag){
			sRet = "删除成功";
			request.setAttribute("sRet", sRet);
			return "del_success";
		}
		request.setAttribute("sRet", sRet);
		return "del_fail";
	}
	
	public String transUpdate(){
		String id = request.getParameter("id");
		System.out.println(id);
		StudentDao f_dao = new StudentDaoImpl();
		this.setList(f_dao.findStudentById(id));
		return "transUpdate";
	}
	
	public String updateMember(){
		String sRet = "修改失败";
		boolean flag = false;
		StudentDao u_dao = new StudentDaoImpl();
		flag = u_dao.updateStudent(student);
		if(flag){
			sRet = "修改成功";
			request.setAttribute("sRet", sRet);
			return "update_success";
		}
		request.setAttribute("sRet", sRet);
		return "update_fail";
	}
	
	public String exist() {
		try {
			String responseText = "";
			// 读取请求的参数
			HttpServletRequest request = ServletActionContext.getRequest();
			String id = request.getParameter("id");
			int num = Integer.parseInt(request.getParameter("num"));
			System.out.println(id+"         "+num);
			StudentDaoImpl dao = new StudentDaoImpl();
			boolean flag = false;
			flag = dao.isExist(id, num);
			if (flag) {
				responseText = "该学生已在该宿舍！";
			} else {
				responseText = "通过！";
			}
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.println(responseText);
			out.flush();
			out.close();
		} catch (Exception e) {
			System.out.println("请输入学号！！");
		}
		return null;
	}
	
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		
	}

	
}
