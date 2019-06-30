package com.ql.servelt;

import java.io.IOException;
import java.util.List;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ql.bean.Student;
import com.ql.dao.StudentDao;
import com.ql.implJdbc.StudentJdbc;


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;
	StudentDao studentDao = new StudentJdbc();
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
		Student student = studentDao.findstudent(sid);
		if(student !=null && student.getSpwd().equals(spwd)) {
			request.getSession().setAttribute("acount", student.getSid());
			request.getRequestDispatcher("StudentModel?action=searchcourse").forward(request, response);
		} else {
			request.setAttribute("failMsg", "输入有误");
			request.getRequestDispatcher("login.jsp").forward(request, response);
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
