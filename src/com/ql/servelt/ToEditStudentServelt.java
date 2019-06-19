package com.ql.servelt;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ToEditStudentServelt
 */
@WebServlet("/toeditstudent")
public class ToEditStudentServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ToEditStudentServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String sid = String.valueOf(request.getSession().getAttribute("acount"));
		String spwd = request.getParameter("spwd");
		String sroom = request.getParameter("sroom");
		String ssex = request.getParameter("ssex");
		String scollege = request.getParameter("scollege");
		String sql = "update student set spwd=?,sroom=?,ssex=?,scollege=? where sid=?";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/orcl","scott","admin");
			PreparedStatement pStatement = conn.prepareStatement(sql);
			pStatement.setObject(1, spwd);
			pStatement.setObject(2, sroom);
			pStatement.setObject(3, ssex);
			pStatement.setObject(4, scollege);
			pStatement.setObject(5, sid);
			pStatement.execute();
			response.sendRedirect("havechosen");
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
