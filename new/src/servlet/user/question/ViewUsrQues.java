package servlet.user.question;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AnswerQuesDao;
import dao.QuestionDAO;
import entity.AnswerquesBean;
import entity.QuestionBean;

public class ViewUsrQues extends HttpServlet {

	public ViewUsrQues() {
		// TODO Auto-generated constructor stub
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

		HttpSession session = req.getSession();

		String uid = (String) session.getAttribute("uid");
		System.out.println(uid);
		QuestionDAO questionDAO = new QuestionDAO();
		ArrayList<QuestionBean> usrAllQues = questionDAO.selectQuesOfUser(uid);
		System.out.println(uid);
		System.out.println(usrAllQues.size());
		req.setAttribute("usrAllQues", usrAllQues);
		req.getRequestDispatcher("userPages/userQuesList.jsp").forward(req, resp);
		System.out.println(usrAllQues);
	}
}
