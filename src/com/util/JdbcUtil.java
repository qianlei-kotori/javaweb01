package com.util;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("all")
public class JdbcUtil {
	
	private Connection conn=null;
	private PreparedStatement psmt=null;
	private ResultSet rs=null;
	private String url="jdbc:mysql://localhost:3306/kkk?CharSet=utf8&useUnicode=true&characterEncoding=utf-8&autoReconnect=true&useSSL=false&serverTimezone=UTC";
	private String username="root";
	private String password=" ";
	
	static{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public Connection getConn(){
		try {
			conn = DriverManager.getConnection(url,username,password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	
	//增删改   ? ?  '7396' 'zhangsan'
	
	public void updatePreparedStatement(String sql,List params){
		getConn();
		
		try {
			psmt = conn.prepareStatement(sql);
			
			if(params!=null){
				for(int i=0;i<params.size();i++){
					psmt.setObject(i+1, params.get(i));
				}
			}
			
			psmt.execute();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//查询
	public List queryPreparedStatement(String sql,List params,Class clazz){
		
		getConn();
		
		try {
			psmt = conn.prepareStatement(sql);
			
			if(params!=null){
				for(int i=0;i<params.size();i++){
					psmt.setObject(i+1, params.get(i));
				}
			}
			
			rs = psmt.executeQuery();
			
			ResultSetMetaData rsmd = rs.getMetaData();
			
			//获取列的数量
			int count = rsmd.getColumnCount();
			//获取每列的名字
			List<String> cnames = new ArrayList();//empno  ename  job
			for(int i=0;i<count;i++){
				cnames.add(rsmd.getColumnName(i+1));
			}
			
			// empno  ename  job
			List result = new ArrayList();	
			while(rs.next()){
				//创建对象
				Object obj = clazz.newInstance();
				
				for(int i=0;i<count;i++){
					//获取结果集中每一列的名字
					String name = cnames.get(i).toLowerCase();
					//到clazz中找到与该name匹配的属性
					Field f = null;
					try{
						f = clazz.getDeclaredField(name);
					}catch(Exception e){
						e.printStackTrace();
					}
					
					if(f!=null){
						f.setAccessible(true);
	
						//判断该属性的类型
						String type = f.getType().getName();
						if(type.equals("int") || type.equals("java.lang.Integer")){
							int value = rs.getInt(name);
							//给obj对象的属性赋值
							f.set(obj, value);
						}else if(type.equals("double") || type.equals("java.lang.Double")){
							double value = rs.getDouble(name);
							f.set(obj, value);
						}else if(type.equals("java.lang.String")){
							String value = rs.getString(name);
							f.set(obj, value);
						}else if(type.equals("java.util.Date")){
							java.sql.Date value = rs.getDate(name);
							f.set(obj, value);
						}
					
					}
					
				}
				
				result.add(obj);
				
			}
			
			return result;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
		
	//关闭
	public void close(){
		
		try {
			if(psmt!=null){
				psmt.close();
			}
			if(conn!=null){
				conn.close();
			}
			if(rs!=null){
				rs.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}






