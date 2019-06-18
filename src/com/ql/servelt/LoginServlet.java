package com.ql.servelt;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ql.bean.Admin;
import com.ql.bean.Student;
import com.ql.service.adminService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;
    private adminService adminservice = new adminService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int sid = Integer.valueOf(request.getParameter("acount"));
		String spwd = request.getParameter("apwd");
		Student student = new Student();
		List<Student> list = findstudent(sid);
		if(list !=null && list.get(0).getSpwd().equals(spwd)) {
			request.getSession().setAttribute("acount", list.get(0).getSid());
			request.getRequestDispatcher("/StudentModel").forward(request, response);
		} else {
			request.setAttribute("failMsg", "输入有误");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

	private List<Student> findstudent(int sid) {
		// TODO Auto-generated method stub
		List<Student> list = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","admin");
			PreparedStatement ps = con.prepareStatement("select * from student where sid = ?");
			ps.setInt(1, sid);
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
