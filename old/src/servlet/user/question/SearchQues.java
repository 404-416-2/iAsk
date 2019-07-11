package servlet.user.question;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import com.sun.xml.internal.bind.CycleRecoverable.Context;

import dao.AnswerQuesDao;
import dao.QuestionDAO;
import entity.AnswerquesBean;
import entity.QuestionBean;

public class SearchQues extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		ArrayList<QuestionBean> ques = new ArrayList<QuestionBean>();
		QuestionDAO questionDAO = new QuestionDAO();
		req.setCharacterEncoding("utf-8");
		String keysString = req.getParameter("keys");
		String uid = (String) req.getSession().getAttribute("uid");
		if (keysString.equals("")) {
			ques = questionDAO.searchById(uid);
		} else {
			ques = questionDAO.selectByTextAtUsr(keysString, uid);
		}
		// System.out.println(answers.size());
		req.setAttribute("keyQues", ques);
		req.getRequestDispatcher("userPages/SearchQuesResult.jsp").forward(req, resp);

	}

}
