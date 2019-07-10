package servlet.user.answer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jdk.nashorn.internal.ir.RuntimeNode.Request;
import dao.AnswerQuesDao;

public class deleteAnswer extends HttpServlet {
	
	public deleteAnswer(){
		super();
}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
			
			int qid = Integer.parseInt(req.getParameter("q_id"));
			String uid = req.getParameter("u_id"); 
			AnswerQuesDao answer = new AnswerQuesDao();
			answer.deleteAnswer(qid, uid);
            req.getRequestDispatcher("ViewUsrAnswer").forward(req, resp);

	}
}
	
