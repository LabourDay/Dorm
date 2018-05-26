package com.model;

public class Student {
	private String stu_id;
	private String stu_password;
	private String stu_name;
	private String stu_sex;
	private String stu_tel;
	private String stu_department;
	private String stu_marjority;
	private int dorm_num;
	private String stu_addr;
	
	public Student(){}
	
	public Student(String stu_id, String stu_password) {
		super();
		this.stu_id = stu_id;
		this.stu_password = stu_password;
	}
	
	public Student(String stu_id, String stu_name,
			String stu_sex, String stu_tel, String stu_department,
			String stu_marjority, int dorm_num, String stu_addr) {
		super();
		this.stu_id = stu_id;
		//this.stu_password = stu_password;
		this.stu_name = stu_name;
		this.stu_sex = stu_sex;
		this.stu_tel = stu_tel;
		this.stu_department = stu_department;
		this.stu_marjority = stu_marjority;
		this.dorm_num = dorm_num;
		this.stu_addr = stu_addr;
	}

	public String getStu_id() {
		return stu_id;
	}
	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}
	public String getStu_password() {
		return stu_password;
	}
	public void setStu_password(String stu_password) {
		this.stu_password = stu_password;
	}
	public String getStu_name() {
		return stu_name;
	}
	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}
	public String getStu_sex() {
		return stu_sex;
	}
	public void setStu_sex(String stu_sex) {
		this.stu_sex = stu_sex;
	}
	public String getStu_tel() {
		return stu_tel;
	}
	public void setStu_tel(String stu_tel) {
		this.stu_tel = stu_tel;
	}
	public String getStu_department() {
		return stu_department;
	}
	public void setStu_department(String stu_department) {
		this.stu_department = stu_department;
	}
	public String getStu_marjority() {
		return stu_marjority;
	}
	public void setStu_marjority(String stu_marjority) {
		this.stu_marjority = stu_marjority;
	}
	public int getDorm_num() {
		return dorm_num;
	}
	public void setDorm_num(int dorm_num) {
		this.dorm_num = dorm_num;
	}
	public String getStu_addr() {
		return stu_addr;
	}
	public void setStu_addr(String stu_addr) {
		this.stu_addr = stu_addr;
	}
}
