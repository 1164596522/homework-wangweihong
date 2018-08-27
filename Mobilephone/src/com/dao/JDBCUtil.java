package com.dao;

import java.lang.reflect.*;
import java.sql.*;
import java.util.*;


public class JDBCUtil {
	

	public static String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";

	public static String url = "jdbc:sqlserver://localhost:1433;DatabaseName=mobilephoneDB";

	public static String name = "sa";

	public static String pwd = "";


	static{
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public static Connection getConn() {
		try {
			return DriverManager.getConnection(url, name, pwd);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}


	public static void close(Connection conn,Statement stmt,ResultSet rs) {
		try {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	

	public static int execUpdate(String sql){

		Connection conn = getConn();

		Statement stmt = null;
		
		try {

			stmt = conn.createStatement();

			return stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{

			close(conn,stmt,null);
		}
		
		return 0;
	}
	

	public static int preparedUpdate(String sql,Object...args){

		Connection conn = getConn();

		PreparedStatement stmt = null;
		
		try {

			stmt = conn.prepareStatement(sql);
			

			for (int i = 0; i < args.length; i++) {
				stmt.setObject(i+1, args[i]);
			}
			

			return stmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{

			close(conn,stmt,null);
		}
		
		return 0;
	}
	

	public static <T> List<T> preparedQuery(Class<T> classObj,String sql,Object...args){
				

		Connection conn = getConn();

		PreparedStatement stmt = null;

		ResultSet rs = null;
		
		try {

			stmt = conn.prepareStatement(sql);
			

			for (int i = 0; i < args.length; i++) {
				stmt.setObject(i+1, args[i]);
			}
			

			rs = stmt.executeQuery();
			

			ResultSetMetaData rsmd = rs.getMetaData();
			
			List<T> list = new ArrayList<T>();
			
			while(rs.next()){
				

				T obj = (T)classObj.getConstructor().newInstance();
				

				for (int i = 1; i <= rsmd.getColumnCount(); i++) {

					String fieldName = rsmd.getColumnName(i);

					Field field = classObj.getDeclaredField(fieldName);
					field.setAccessible(true);

					field.set(obj, rs.getObject(i));
					
				}
				
				list.add(obj);
			}
			
			return list;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally{

			close(conn,stmt,rs);
		}
		
		return null;
	}
}