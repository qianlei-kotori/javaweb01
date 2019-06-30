package com.ql.dao;

import java.util.List;

import com.ql.bean.CourseChoice;
import com.ql.bean.CourseCount;
import com.ql.bean.CourseTable;
import com.ql.bean.Score;
import com.ql.bean.Student;

public interface StudentDao {
	public void updatecum(int oldcum, String cid);
	public CourseCount selectcum(String cid) ;
	public List<CourseTable> coursetable(String sid);
	public List<CourseChoice> hascourse(String sid) ;
	public List<Score> scoresearch(String sid);
	public List<CourseChoice> studentcourse(String sid,String search);
	public void toeditstudent(Student student);
	public String addcourse(String cid,String sid);
	public void deletecourse(String cid,String sid);
	public Student findstudent(int sid) ;
}
