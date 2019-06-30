package com.ql.servelt;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ql.bean.CourseChoice;
import com.ql.bean.CourseTable;
import com.ql.bean.Score;
import com.ql.bean.Student;
import com.ql.dao.StudentDao;
import com.ql.implJdbc.StudentJdbc;
import com.ql.service.StudentService;


/**
 * Servlet implementation class StudentModel
 */
@WebServlet("/StudentModel")
public class StudentModel extends HttpServlet {
	private static final long serialVersionUID = 1L;
	StudentDao studentDao = new StudentJdbc();  
	StudentService studentService = new StudentService();
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
		 String action = request.getParameter("action");
		switch (action) {
		case "searchcourse":
			String search = request.getParameter("search");
			List<CourseChoice> list1 = studentService.searchcourse(sid,search);
			request.setAttribute("course", list1);
			request.getRequestDispatcher("student/coursechoice.jsp").forward(request, response);
			break;
		case "havechosen":
			List<CourseChoice> list2 = studentService.searchhavechosen(sid);
			request.setAttribute("course", list2);
			request.getRequestDispatcher("student/havechosen.jsp").forward(request, response);
			break;
		case "score":
			List<Score> list3 = studentService.score(sid);
			request.setAttribute("score", list3);
		    request.getRequestDispatcher("student/scoresearch.jsp").forward(request, response);
		    break;
		case "coursetable":
			List<CourseTable> list4 = studentService.coursetable(sid);
			request.setAttribute("course", list4);
			request.getRequestDispatcher("student/course_list.jsp").forward(request, response);
			break;
		case "editstudent":
			Student student = studentService.findstudent(sid);
			request.setAttribute("student", student);
			request.getRequestDispatcher("student/editstudent.jsp").forward(request, response);
			break;
		case "toeditstudent":
			int sid2 = Integer.valueOf(sid);
			String spwd = request.getParameter("spwd");
			String sroom = request.getParameter("sroom");
			String ssex = request.getParameter("ssex");
			String scollege = request.getParameter("scollege");
			Student student2 = new Student(sid2, spwd, ssex, sroom, scollege);
			studentService.toeditstudent(student2);
			response.sendRedirect("StudentModel?action=havechosen");
			break;
		case "addcourse":
			String err = "";
			String cid = request.getParameter("cid");
			String geterr = studentService.addcourse(cid, sid);
			if(geterr.equals("")){
				studentService.updatecount(cid);
				response.sendRedirect("StudentModel?action=havechosen");
			}else{
				// TODO Auto-generated catch block
				request.setAttribute("err", geterr);
				request.getRequestDispatcher("StudentModel?action=searchcourse").forward(request, response);
			}
			break;
		case "deletecourse":
			String cid2 = request.getParameter("cid");
			studentService.deletecourse(sid, cid2);
			response.sendRedirect("StudentModel?action=havechosen");
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
