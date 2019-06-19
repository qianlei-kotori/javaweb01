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

import org.eclipse.jdt.internal.compiler.ast.ArrayAllocationExpression;

import com.ql.bean.Score;

/**
 * Servlet implementation class ScoreSearchServlet
 */
@WebServlet("/scoresearch")
public class ScoreSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScoreSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String sid = String.valueOf(request.getSession().getAttribute("acount"));
		String sql= "select a.cid,a.cname,b.score from course a,course_sid b where b.student_sid=? and a.cid = b.course_cid";
		List<Score> list = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/orcl","scott","admin");
			PreparedStatement pStatement = conn.prepareStatement(sql);
			pStatement.setObject(1, sid);
			ResultSet resultSet = pStatement.executeQuery();
			list = new ArrayList<Score>();
			while(resultSet.next()){
				Score score = new Score();
				score.setCid(resultSet.getInt("cid"));
				score.setCname(resultSet.getString("cname"));
				score.setScore(resultSet.getInt("score"));
				list.add(score);
			}
			 request.setAttribute("score", list);
			 request.getRequestDispatcher("scoresearch.jsp").forward(request, response);
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
