package com.util;

import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

public class Conversion {

	public static void convert(Object obj, HttpServletRequest request) {
		// TODO Auto-generated method stub
		try {
			Class clazz = obj.getClass();
			//获取所有的属性
			Field[] fields = clazz.getDeclaredFields();
			//遍历每一个属性
			for(Field f : fields){
				//设置属性可访问
				f.setAccessible(true);
				//获取属性名
				String name = f.getName();
				//获取属性类型
				Class cls = f.getType();
				//判断属性是否为数组类型  当cls.isArray()=true时，表示是一个数组
				if(!cls.isArray()){
					//根据属性名，从请求中获取指定的值
					String val = request.getParameter(name);
					//获取属性的类型的字符串名字
					String type = cls.getName();
					if("int".equals(type) || "java.lang.Integer".equals(type)){
						f.set(obj, Integer.parseInt(val));
					}else if("double".equals(type) || "java.lang.Double".equals(type)){
						f.set(obj, Double.parseDouble(val));
					}else if("java.lang.String".equals(type)){
						f.set(obj, val);
					}else if("java.util.Date".equals(type)){
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
						f.set(obj, sdf.parse(val));
					} 
				}else{
					String[] array = request.getParameterValues(name);
					if(int[].class==cls || Integer[].class==cls){
						
						int[] int_arr = new int[array.length];
						for(int i=0;i<array.length;i++){
							int_arr[i] = Integer.parseInt(array[i]) ;
						}
						f.set(obj, int_arr);
						
					}else if(double[].class==cls || Double[].class==cls){
						double[] dbl_arr = new double[array.length];
						for(int i=0;i<array.length;i++){
							dbl_arr[i] = Double.parseDouble(array[i]) ;
						}
						f.set(obj, dbl_arr);
						
					}else if(Date[].class==cls){
						Date[] date_arr = new Date[array.length];
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
						for(int i=0;i<array.length;i++){
							date_arr[i] = sdf.parse(array[i]);
						}
						f.set(obj, date_arr);
						
					}else if(String[].class==cls){
						f.set(obj, array);
					}
					
				}
				
			}
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
