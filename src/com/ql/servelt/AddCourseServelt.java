package com.ql.servelt;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

/**
 * Servlet implementation class AddServelt
 */
@WebServlet("/addcourse")
public class AddCourseServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCourseServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String err = "";
		String sid = String.valueOf(request.getSession().getAttribute("acount"));
		String cid = request.getParameter("cid");
		String sql = "INSERT INTO  course_sid(course_cid,student_sid) VALUES(?, ?)";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/orcl","scott","admin");
			PreparedStatement pStatement = conn.prepareStatement(sql);
			pStatement.setObject(1, cid);
			pStatement.setObject(2, sid);
			pStatement.execute();
			int oldcum = Integer.valueOf(selectcum(cid)) + 1;
			updatecum(oldcum,cid);
			response.sendRedirect("havechosen");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			err = "您已经选过该课程了";
			request.getSession().setAttribute("err", err);
			response.sendRedirect("StudentModel");
		}
	}

	private void updatecum(int oldcum, String cid) {
		// TODO Auto-generated method stub
		String sql = "update  course set cum = ? where cid = ?";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/orcl","scott","admin");
			PreparedStatement pStatement = conn.prepareStatement(sql);
			pStatement.setObject(1, oldcum);
			pStatement.setObject(2, cid);
			pStatement.execute();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private String selectcum(String cid) {
		// TODO Auto-generated method stub
		String sql = "select cum from course where cid = ?";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","admin");
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setObject(1, cid);
			ResultSet resultSet = ps.executeQuery();
			while(resultSet.next()){
				return resultSet.getString("cum");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
