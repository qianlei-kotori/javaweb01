package com.ql.servelt;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ql.bean.CourseTable;

/**
 * Servlet implementation class CourseTableServelt
 */
@WebServlet("/coursetable")
public class CourseTableServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseTableServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String sid = String.valueOf(request.getSession().getAttribute("acount")) ;
		String sql = "select a.cname,a.croom,b.tname,a.ctime from "
				+ "course a,teacher b,course_tid c,course_sid d,student f "
				+ "where b.tid=c.teacher_sid and a.cid=c.course_cid "
				+ "and a.cid=d.course_cid and f.sid=d.student_sid "
				+ "and b.tcollege = (select scollege from student "
				+ "where sid = ?)";
		List<CourseTable> list = null ;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","admin");
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setObject(1, sid);
			ResultSet resultSet = ps.executeQuery();
			list = new ArrayList<CourseTable>();
			while(resultSet.next()){
				CourseTable coursetable = new CourseTable();
				coursetable.setCname(resultSet.getString("cname"));
				coursetable.setCroom(resultSet.getString("croom"));
				coursetable.setTname(resultSet.getString("tname"));
				coursetable.setCtime(resultSet.getString("ctime"));
				list.add(coursetable);
			}
			request.setAttribute("course", list);
			 request.getRequestDispatcher("course_list.jsp").forward(request, response);		 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
