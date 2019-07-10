package servlet.user.question;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jdk.nashorn.internal.ir.RuntimeNode.Request;
import dao.AnswerQuesDao;
import dao.QuestionDAO;
import entity.AnswerquesBean;
import entity.QuestionBean;

public class ViewQuestion extends HttpServlet {

	public ViewQuestion() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String uid = (String) req.getSession().getAttribute("uid");

		QuestionDAO questionDAO = new QuestionDAO();
		ArrayList<QuestionBean> quesBeans = questionDAO.selectQuesOfUser(uid);

		req.setAttribute("allOfQuestion", quesBeans);

		req.getRequestDispatcher("userPages/questionList.jsp").forward(req, resp);
	}
}
