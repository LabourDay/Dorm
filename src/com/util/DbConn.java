package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConn {
	private static String jdvcdriver = "com.mysql.jdbc.Driver";
	private static String url = "jdbc:mysql://127.0.0.1:3306/dorm";
	
	private static String username = "root";
	private static String pwd = "123456";
	
	public static Connection GetConnect(){
		Connection conn = null;
		 try{
			 Class.forName(jdvcdriver);
			 conn = DriverManager.getConnection(url, username, pwd);
		 } catch(ClassNotFoundException e){
			 
		 } catch(SQLException e){
			 
		 }
		 return conn;
	}
	
	public static void CloseConnect(Connection conn){
		try{
			conn.close();
		} catch(SQLException e){
			System.out.println(e.getMessage());
		}
	}
}
