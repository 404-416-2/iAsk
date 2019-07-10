package servlet.user.answer;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import com.sun.xml.internal.bind.CycleRecoverable.Context;

import dao.AnswerQuesDao;
import entity.AnswerquesBean;

public class SearchAnswer extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		ArrayList<AnswerquesBean> answers = new ArrayList<AnswerquesBean>();
		AnswerQuesDao answerQuesDao = new AnswerQuesDao();
		req.setCharacterEncoding("utf-8");
		String keysString = req.getParameter("keys");
		String uid = (String) req.getSession().getAttribute("uid");
		if (keysString.equals("") || keysString == null) {
			answers = answerQuesDao.selectByUid(uid);
		}else {
			answers = answerQuesDao.selectByText(keysString);
		}
		//System.out.println(answers.size());
		req.setAttribute("keyAnswers", answers);
		req.getRequestDispatcher("userPages/SearchAnswerResult.jsp").forward(req, resp);
		
	
	}
	
	
}
