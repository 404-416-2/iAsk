package servlet.user.answer;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AnswerQuesDao;
import entity.AnswerquesBean;

public class ViewUsrAnswer extends HttpServlet{
	
	public ViewUsrAnswer() {
		// TODO Auto-generated constructor stub
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
		
		HttpSession session = req.getSession();
		
		String uid = (String)session.getAttribute("uid");
		AnswerQuesDao answerQuesDao = new AnswerQuesDao();
		ArrayList<AnswerquesBean> usrAllAnswers =  answerQuesDao.selectAnswerByUid(uid);
	
		req.setAttribute("answerNum",usrAllAnswers.size() );
		req.setAttribute("usrAllAnswer", usrAllAnswers);
		req.getRequestDispatcher("userPages/userAnswerList.jsp").forward(req, resp);
		System.out.println(usrAllAnswers);
	}
}
