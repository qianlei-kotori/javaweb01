package com.ql.service;

import java.util.List;

import com.ql.bean.CourseChoice;
import com.ql.bean.CourseTable;
import com.ql.bean.Score;
import com.ql.bean.Student;
import com.ql.dao.StudentDao;
import com.ql.implJdbc.StudentJdbc;

public class StudentService {
	StudentDao studentDao = new StudentJdbc();
	public List<CourseChoice> searchcourse(String sid,String search) {
		List<CourseChoice> list = studentDao.studentcourse(sid,search);
		return list;
	}
	public List<CourseChoice> searchhavechosen(String sid) {
		List<CourseChoice> list = studentDao.hascourse(sid);
		return list;
	}
	public  List<Score> score(String sid) {
		List<Score> list = studentDao.scoresearch(sid);
		return list;
	}
	
	public  List<CourseTable> coursetable(String sid) {
		List<CourseTable> list = studentDao.coursetable(sid) ;
		return list;
	}
	public  Student findstudent(String sid) {
		int sid2 = Integer.valueOf(sid);
		Student student = studentDao.findstudent(sid2);
		return student;
	}
	public  void toeditstudent(Student student){
		studentDao.toeditstudent(student);
	}
	public String addcourse(String cid,String sid){
		return studentDao.addcourse(cid, sid);
	}
	public void updatecount(String cid) {
		int oldcum = studentDao.selectcum(cid).getCum() + 1;
		studentDao.updatecum(oldcum, cid);
	}
	public void deletecourse(String sid,String cid){
		studentDao.deletecourse(cid, sid);
		int oldcum = studentDao.selectcum(cid).getCum() - 1;
		if(oldcum < 0){
			oldcum = 0;
		}
		studentDao.updatecum(oldcum,cid);
	}

}
