package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dao.StudentDao;
import com.model.Student;
import com.util.DbConn;

public class StudentDaoImpl implements StudentDao {
	private Connection conn = DbConn.GetConnect();
	private PreparedStatement pmst = null;
	@Override
	public boolean isLogin(Student student){
		boolean flag = false;
		String sql = "select * from stu_info where stu_id=? and stu_password=?";
		try{
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, student.getStu_id());
			psmt.setString(2, student.getStu_password());
			ResultSet rs = psmt.executeQuery();
			if(rs.next()){
				flag = true;
			}
		} catch(SQLException e){
			e.printStackTrace();
		}
		return flag;
	}
	@Override
	public ResultSet findStudentByid(String id) {
		ResultSet rs=null;
		String where = "";
		if (!("".equals(id)) || id != null) {
			where = " where stu_id=" + id;
		}

		String sql = "select * from stu_info" + where;

		conn = DbConn.GetConnect();
		try {
			pmst = conn.prepareStatement(sql);
			 rs = pmst.executeQuery();

		} catch (SQLException e) {
			System.out.println("fail");
		}
		return rs;
	}

	@Override
	public boolean addStudent(Student stu) {
		boolean flag = false;
		String sql = "insert into stu_info (stu_id,stu_password,stu_name,stu_sex,stu_tel,stu_department,stu_marjority,dorm_num,stu_addr)"
						+"values(?,?,?,?,?,?,?,?,?)";
		conn = DbConn.GetConnect();
		try{
			pmst = conn.prepareStatement(sql);
			pmst.setString(1, stu.getStu_id());
			pmst.setString(2, stu.getStu_password());
			pmst.setString(3, stu.getStu_name());
			pmst.setString(4, stu.getStu_sex());
			pmst.setString(5, stu.getStu_tel());
			pmst.setString(6, stu.getStu_department());
			pmst.setString(7, stu.getStu_marjority());
			pmst.setInt(8, stu.getDorm_num());
			pmst.setString(9, stu.getStu_addr());
			int i = pmst.executeUpdate();
			if(i == 1){
				flag = true;
			}
			if(pmst!=null){
				pmst.close();
			}
			if(conn!=null){
				conn.close();
			}
		} catch(SQLException e){
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean delStudent(String id) {
		boolean f = false;
		String sql = "delete from stu_info where stu_id=?";
		conn = DbConn.GetConnect();
		try{
			pmst = conn.prepareStatement(sql);
			pmst.setString(1, id);
			int i = pmst.executeUpdate();
			if(i > 0){
				f = true;
			}
		}catch(SQLException e){
			System.out.println("delete fail");
		}
		return f;
	}

	@Override
	public boolean updateStudent(Student stu) {
		boolean f = false;
		
		String sql = "update stu_info set stu_name=?,stu_sex=?,stu_tel=?,stu_department=?,stu_marjority=?,dorm_num=?,stu_addr=? where stu_id=?";
		conn = DbConn.GetConnect();
		try{
			pmst = conn.prepareStatement(sql);
			
			pmst.setString(1, stu.getStu_name());
			pmst.setString(2, stu.getStu_sex());
			pmst.setString(3, stu.getStu_tel());
			pmst.setString(4, stu.getStu_department());
			pmst.setString(5, stu.getStu_marjority());
			pmst.setInt(6, stu.getDorm_num());
			pmst.setString(7, stu.getStu_addr());
			pmst.setString(8, stu.getStu_id());
			int i = pmst.executeUpdate();
			if(i > 0){
				f = true;
			}
		}catch(SQLException e){
			System.out.println("update fail");
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List findStudentById(String id) {
		//Student stu = null;
		List<Student> list = new ArrayList<Student>();
		String where = "";
		if(!("".equals(id))){
			where = " where stu_id=" + id;
		}
		String sql = "select * from stu_info" + where;
		conn = DbConn.GetConnect();
		try{
			pmst = conn.prepareStatement(sql);
			ResultSet rs = pmst.executeQuery();
			while(rs.next()){
//				String stu_id = rs.getString("stu_id");
//				String stu_password = rs.getString("stu_password");
//				String stu_name = rs.getString("stu_name");
//				String stu_sex = rs.getString("stu_sex");
//				String stu_tel = rs.getString("stu_tel");
//				String stu_department = rs.getString("stu_department");
//				String stu_marjority = rs.getString("stu_marjority");
//				int dorm_num = rs.getInt("dorm_num");
//				String stu_addr = rs.getString("stu_addr");
//				
//				stu = new Student(stu_id, stu_name, stu_sex, stu_tel, stu_department, stu_marjority, dorm_num, stu_addr);
//				list.add(stu);
				Student stu = new Student();
				stu.setStu_id(rs.getString("stu_id"));
				stu.setStu_name(rs.getString("stu_name"));
				stu.setStu_sex(rs.getString("stu_sex"));
				stu.setStu_tel(rs.getString("stu_tel"));
				stu.setStu_department(rs.getString("stu_department"));
				stu.setStu_marjority(rs.getString("stu_marjority"));
				stu.setDorm_num(rs.getInt("dorm_num"));
				stu.setStu_addr(rs.getString("stu_addr"));
				System.out.println(rs.getString("stu_name"));
				list.add(stu);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return list;
	}
	
	public List select(int num){
		List<Student> list = new ArrayList<Student>();
		System.out.println(num);
		String sql = "select * from stu_info where dorm_num=?";
		conn = DbConn.GetConnect();
		try{
			
			pmst = conn.prepareStatement(sql);
			pmst.setInt(1, num);
			ResultSet rs = pmst.executeQuery();
			while(rs.next()){
				/*String stu_id = rs.getString("stu_id");
				//String stu_password = rs.getString("stu_password");
				String stu_name = rs.getString("stu_name");
				String stu_sex = rs.getString("stu_sex");
				String stu_tel = rs.getString("stu_tel");
				String stu_department = rs.getString("stu_department");
				String stu_marjority = rs.getString("stu_marjority");
				int dorm_num = rs.getInt("dorm_num");
				String stu_addr = rs.getString("stu_addr");
				System.out.println(stu_addr);
				Student stu = new Student(stu_id,stu_name,stu_sex,stu_tel,stu_department,stu_marjority,dorm_num,stu_addr);
				list.add(stu);*/
				Student stu = new Student();
				stu.setStu_id(rs.getString("stu_id"));
				stu.setStu_name(rs.getString("stu_name"));
				stu.setStu_sex(rs.getString("stu_sex"));
				stu.setStu_tel(rs.getString("stu_tel"));
				stu.setStu_department(rs.getString("stu_department"));
				stu.setStu_marjority(rs.getString("stu_marjority"));
				stu.setDorm_num(rs.getInt("dorm_num"));
				stu.setStu_addr(rs.getString("stu_addr"));
				System.out.println(rs.getString("stu_name"));
				list.add(stu);
				
			}
		}catch(SQLException e){
			
		}
		return list;
	}
	
	public boolean isExist(String id, int num){
		boolean flag = false;
		String sql = "select * from stu_info where stu_id=? and dorm_num=?";
		conn = DbConn.GetConnect();
		try{
			pmst = conn.prepareStatement(sql);
			pmst.setString(1,id);
			pmst.setInt(2, num);
			ResultSet rs = pmst.executeQuery();
			rs.next();
			System.out.println(rs.getString("stu_name"));
			
			if(rs.getRow()>0){
				flag = true;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		return flag;
	}
	
	@Override
	public boolean updatePassWord(Student student) {
		boolean flag=false;
		String sql="update stu_info set stu_password=? where stu_id=?";
		conn=DbConn.GetConnect();
		try{
			pmst=conn.prepareStatement(sql);
			pmst.setString(1, student.getStu_password());
			pmst.setString(2, student.getStu_id());
			int num=pmst.executeUpdate();
			if(num==1){
				flag=true;
			}
			if(pmst!=null){
				pmst.close();
			}
			if(conn!=null){
				conn.close();
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return flag;
	}

}
