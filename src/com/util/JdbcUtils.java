package com.util;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.List;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class JdbcUtils {
	private static ComboPooledDataSource ds = new ComboPooledDataSource("orcale");

	/*
	 * 获取数据库连接对象 Connection
	 * */
	public static Connection getConnection() throws Exception {
		return ds.getConnection();
	}
	
	/*
	 * 通用的增删改方法。----不考虑事务
	 * */
	public static int update(String sql,Object... args) throws Exception {		
		int row = 0;
			Connection conn = getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			for (int i = 0;i < args.length; i++) {
				ps.setObject(i+1, args[i]);
			}
			row = ps.executeUpdate();	
			return row;
	}
	
	/*
	 * 考虑事务的通用增删改
	 * */
	public static int update(Connection conn,String sql,Object... args) {		
		int row = 0;
		try(
				PreparedStatement ps = conn.prepareStatement(sql);
				){
			for (int i = 0;i < args.length; i++) {
				ps.setObject(i+1, args[i]);
			}
			row = ps.executeUpdate();	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return row;
	}
	
	
	
	/*
	 * 通用的查询-----不考虑事务
	 * */
	public static <T> T queryOne(String sql,Class<T> clazz,Object... args) {
		List<T> list = query(sql,clazz,args);
		return list.size() == 0? null : list.get(0); 
	}
	
	public static <T> List<T> query(String sql,Class<T> clazz,Object... args){
		List<T> list = new ArrayList<>();
		try(Connection conn = JdbcUtils.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql);
				){
			for(int i = 0; i < args.length; i++) {
				ps.setObject(i+1, args[i]);
			}
			ResultSet rs = ps.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();//获取结果集元数据。---描述结果的数据
			int columnCount = rsmd.getColumnCount();//获取结果集一共几列
			while(rs.next()) {				
				T t = clazz.newInstance();
				for(int i = 0; i < columnCount; i++) {
					String fieldName = rsmd.getColumnLabel(i+1).toLowerCase();
					Field field = clazz.getDeclaredField(fieldName);
					String type = field.getType().getName();
					if(field !=null){
					field.setAccessible(true);
					if(type.equals("int") || type.equals("java.lang.Integer")){
						int value = rs.getInt(fieldName);
						//给obj对象的属性赋值
						field.set(t, value);
					}else if(type.equals("double") || type.equals("java.lang.Double")){
						double value = rs.getDouble(fieldName);
						field.set(t, value);
					}else if(type.equals("java.lang.String")){
						String value = rs.getString(fieldName);
						field.set(t, value);
					}else if(type.equals("java.util.Date")){
						java.sql.Date value = rs.getDate(fieldName);
						field.set(t, value);
					}
					}
					
				}
				list.add(t);
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return list;
	}
	
	/*
	 * 考虑事务的通用查询
	 * */
	
	public static <T> T queryOne(Connection conn,String sql,Class<T> clazz,Object... args) {
		List<T> list = query(conn,sql,clazz,args);
		return list.size() == 0? null : list.get(0); 
	}
	public static <T> List<T> query(Connection conn,String sql,Class<T> clazz,Object... args){
		List<T> list = new ArrayList<>();
		try(
				PreparedStatement ps = conn.prepareStatement(sql);
				){
			for(int i = 0; i < args.length; i++) {
				ps.setObject(i+1, args[i]);
			}
			ResultSet rs = ps.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();//获取结果集元数据。---描述结果的数据
			int columnCount = rsmd.getColumnCount();//获取结果集一共几列
			while(rs.next()) {				
				T t = clazz.newInstance();
				for(int i = 0; i < columnCount; i++) {
					String fieldName = rsmd.getColumnLabel(i+1);
					Field field = clazz.getDeclaredField(fieldName);
					field.setAccessible(true);
					Object value = rs.getObject(fieldName);
					if(value != null) {
						field.set(t, value);
					}
				}
				list.add(t);
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return list;
	}
}
