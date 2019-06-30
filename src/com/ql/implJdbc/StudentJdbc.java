package com.ql.implJdbc;

import java.util.List;

import com.ql.bean.CourseChoice;
import com.ql.bean.CourseCount;
import com.ql.bean.CourseTable;
import com.ql.bean.Score;
import com.ql.bean.Student;
import com.ql.dao.StudentDao;
import com.util.JdbcUtils;

public class StudentJdbc implements StudentDao{
	@Override
	public void updatecum(int oldcum, String cid) {
		// TODO Auto-generated method stub
		String sql = "update  course set cum = ? where cid = ?";
		try {
			JdbcUtils.update(sql, oldcum,cid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public CourseCount selectcum(String cid) {
		// TODO Auto-generated method stub
		String sql = "select cum from course where cid = ?";
		CourseCount coursecount = JdbcUtils.queryOne(sql, CourseCount.class, cid);
		return coursecount;
	}

	@Override
	public List<CourseTable> coursetable(String sid) {
		// TODO Auto-generated method stub
		String sql = "select a.cname,a.croom,b.tname,a.ctime from "
				+ "course a,teacher b,course_tid c,course_sid d,student f "
				+ "where b.tid=c.teacher_sid and a.cid=c.course_cid "
				+ "and a.cid=d.course_cid and f.sid=d.student_sid "
				+ "and b.tcollege = (select scollege from student "
				+ "where sid = ?)";
		List<CourseTable> list  = JdbcUtils.query(sql, CourseTable.class, sid);
		return list;
	}

	@Override
	public List<CourseChoice> hascourse(String sid) {
		// TODO Auto-generated method stub
		String sql = "select a.cid,a.cname,a.croom,a.ccount,a.cum,b.tname "
				+ "from course a,teacher b,course_tid c,course_sid d,student f "
				+ "where b.tid=c.teacher_sid and a.cid=c.course_cid and "
				+ "a.cid=d.course_cid and f.sid=d.student_sid and b.tcollege = "
				+ "(select scollege from student where sid = ?)";
		List<CourseChoice> list = JdbcUtils.query(sql, CourseChoice.class, sid);
		return list;
	}

	@Override
	public List<Score> scoresearch(String sid) {
		// TODO Auto-generated method stub
		String sql= "select a.cid,a.cname,b.score from course a,course_sid b where b.student_sid=? and a.cid = b.course_cid";
		List<Score> list = JdbcUtils.query(sql, Score.class, sid);
		return list;
	}

	@Override
	public List<CourseChoice> studentcourse(String sid,String search) {
		// TODO Auto-generated method stub
		String sql = "select a.cid,a.cname,a.croom,a.ccount,a.cum,b.tname from course a,teacher b,course_tid c "
				+ "where b.tid=c.teacher_sid and a.cid=c.course_cid and b.tcollege = "
				+ "(select scollege from student where sid = ?)";
		if(search != null && !search.equals("")){
			sql += " and a.cname like '%"+search+"%'";
		}
		List<CourseChoice> list = JdbcUtils.query(sql, CourseChoice.class, sid);
		return list;
	}

	@Override
	public void toeditstudent(Student student) {
		// TODO Auto-generated method stub
		String sql = "update student set spwd=?,sroom=?,ssex=?,scollege=? where sid=?";
		try {
			JdbcUtils.update(sql, student.getSpwd(),student.getSroom(),student.getSsex(),student.getScollege(),student.getSid());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public String addcourse(String cid, String sid) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO  course_sid(course_cid,student_sid) VALUES(?, ?)";
		try {
			JdbcUtils.update(sql, cid,sid);
			return "";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			String err = "您已经选过该课程了";
			return err;
		}
	}

	@Override
	public void deletecourse(String cid, String sid) {
		// TODO Auto-generated method stub
		String sql = "DELETE FROM course_sid WHERE course_cid=? AND student_sid=?";
		try {
			JdbcUtils.update(sql, cid,sid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public Student findstudent(int sid) {
		// TODO Auto-generated method stub
		String sql = "select sid,sname,ssex,spwd,sroom,scollege from student where sid = ?";
		Student student = JdbcUtils.queryOne(sql, Student.class, sid);
		return student;
	}

}
