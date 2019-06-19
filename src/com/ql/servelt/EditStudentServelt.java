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

import com.ql.bean.Student;

/**
 * Servlet implementation class EditStudentServelt
 */
@WebServlet("/editstudent")
public class EditStudentServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditStudentServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String sid = String.valueOf(request.getSession().getAttribute("acount")) ;
		String sql = "select * from student where sid = ?";
		List<Student> list = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","admin");
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setObject(1, sid);
			ResultSet resultSet = ps.executeQuery();
			list = new ArrayList<Student>();
			while(resultSet.next()){
				Student student = new Student();
				student.setSid(resultSet.getInt("sid"));
				student.setSname(resultSet.getString("sname"));
				student.setSpwd(resultSet.getString("spwd"));
				student.setSroom(resultSet.getString("sroom"));
				student.setSsex(resultSet.getString("ssex"));
				student.setScollege(resultSet.getString("scollege"));
				list.add(student);
			}
			request.setAttribute("student", list);
			request.getRequestDispatcher("editstudent.jsp").forward(request, response);
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
