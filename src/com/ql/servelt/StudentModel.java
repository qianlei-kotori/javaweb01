package com.ql.servelt;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ql.bean.CourseChoice;


/**
 * Servlet implementation class StudentModel
 */
@WebServlet("/StudentModel")
public class StudentModel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentModel() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String sid = String.valueOf(request.getSession().getAttribute("acount")) ;
		 List<CourseChoice> list = studentcourse(sid);
		 request.setAttribute("course", list);
		 request.getRequestDispatcher("coursechoice.jsp").forward(request, response);		 
	}

	private List<CourseChoice> studentcourse(String sid) {
		// TODO Auto-generated method stub
		List<CourseChoice> list = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","admin");
			PreparedStatement ps = con.prepareStatement("select a.cid,a.cname,a.croom,a.ccount,a.cum,b.tname from course a,teacher b,course_tid c "
					+ "where b.tid=c.teacher_sid and a.cid=c.course_cid and b.tcollege = "
					+ "(select scollege from student where sid = ?)");
			ps.setObject(1, sid);
			ResultSet resultSet = ps.executeQuery();
			list = new ArrayList<CourseChoice>();
			while(resultSet.next()){
				CourseChoice coursechoice = new CourseChoice();
				coursechoice.setCid(resultSet.getInt("cid"));
				coursechoice.setCname(resultSet.getString("cname"));
				coursechoice.setCroom(resultSet.getString("croom"));
				coursechoice.setCcount(resultSet.getInt("ccount"));
				coursechoice.setCum(resultSet.getInt("cum"));
				coursechoice.setTname(resultSet.getString("tname"));
				list.add(coursechoice);
			}
			return list;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
