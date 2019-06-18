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

/**
 * Servlet implementation class DeleteCourseServlet
 */
@WebServlet("/deletecourse")
public class DeleteCourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCourseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String sid = String.valueOf(request.getSession().getAttribute("acount"));
		String cid = request.getParameter("cid");
		String sql = "DELETE FROM course_sid WHERE course_cid=? AND student_sid=?";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/orcl","scott","admin");
			PreparedStatement pStatement = conn.prepareStatement(sql);
			pStatement.setObject(1, cid);
			pStatement.setObject(2, sid);
			pStatement.execute();
			int oldcum = Integer.valueOf(selectcum(cid)) - 1;
			if(oldcum < 0){
				oldcum = 0;
			}
			updatecum(oldcum,cid);
			response.sendRedirect("havechosen");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
