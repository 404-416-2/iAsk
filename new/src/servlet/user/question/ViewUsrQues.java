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
import dao.UserDAO;
import entity.AnswerquesBean;
import entity.QuestionBean;
import entity.UserBean;

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
		if(uid==null){
			uid = (String)req.getParameter("uId");
//		String user = (String)request.getSession().getAttribute("uid");
			if(uid==null || uid.equals(""))
			{
				req.setAttribute("alertInfo", "please login first!");
				req.setAttribute("jumpUrl", "home");
				req.getRequestDispatcher("userFriend/alert.jsp").forward(req, resp);
				return;
			}
			else {
				session.setAttribute("uid", uid);
			}
		}
		UserBean user = new UserBean();
		UserDAO  udao = new UserDAO();
		user = udao.selectByUId(uid);
		req.setAttribute("nickname", user.getNickname());
		QuestionDAO questionDAO = new QuestionDAO();
		ArrayList<QuestionBean> usrAllQues = questionDAO.selectQuesOfUser(uid);
		req.setAttribute("usrAllQues", usrAllQues);
		req.getRequestDispatcher("userPages/userQuesList.jsp").forward(req, resp);
	}
}
