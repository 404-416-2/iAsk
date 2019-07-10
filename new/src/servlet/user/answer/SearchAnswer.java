package servlet.user.answer;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.sun.xml.internal.bind.CycleRecoverable.Context;

import dao.AnswerQuesDao;
import entity.AnswerquesBean;

public class SearchAnswer extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		System.out.println("222");
		ArrayList<AnswerquesBean> answers = new ArrayList<AnswerquesBean>();
		AnswerQuesDao answerQuesDao = new AnswerQuesDao();
		req.setCharacterEncoding("utf-8");
		String keysString = req.getParameter("keys");
		
		//如果搜索字符为空，默认返回用户所有answer
		//如果不为空，则根据所提交过来的页面判断在用户所有回答下匹配关键字
		//如果从searchrersult 提交过来，默认判断匹配用户所有回答下的关键字
		//还是在问题的所有回答下匹配关键字
		//具体是：quesAnswerList过来的请求用post处理，在问题所有回答下匹配关键字
		//       userAnswerList过来的请求用户get处理，在用户所有回答下匹配关键字
		
		
		
		String uid = (String) req.getSession().getAttribute("uid");
		System.out.println(uid);
		if (keysString.equals("") || keysString == null) {
			answers = answerQuesDao.selectAnswerByUid(uid);
		}else {
			answers = answerQuesDao.selectUserAnswerByText(keysString, uid);
		}
		//System.out.println(answers.size());
		req.setAttribute("keyAnswers", answers);
		req.getRequestDispatcher("userPages/SearchAnswerResult.jsp").forward(req, resp);
		
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		ArrayList<AnswerquesBean> answers = new ArrayList<AnswerquesBean>();
		AnswerQuesDao answerQuesDao = new AnswerQuesDao();
		req.setCharacterEncoding("utf-8");
		String keysString = req.getParameter("keys");
		String qid = req.getParameter("q_id");
		
		//如果搜索字符为空，默认返回用户所有answer
		//如果不为空，则根据所提交过来的页面判断在用户所有回答下匹配关键字
		//还是在问题的所有回答下匹配关键字
		//具体是：quesAnswerList过来的请求用post处理，在问题所有回答下匹配关键字
		//       userAnswerList过来的请求用户get处理，在用户所有回答下匹配关键字
		
		String uid = (String) req.getSession().getAttribute("uid");
		if (keysString.equals("") || keysString == null) {
			answers = answerQuesDao.selectAnswerByUid(uid);
		}else {
			answers = answerQuesDao.selectQuesAnswerByText(keysString, Integer.parseInt(qid));
		}
		//System.out.println(answers.size());
		req.setAttribute("keyAnswers", answers);
		req.getRequestDispatcher("userPages/SearchAnswerResult.jsp").forward(req, resp);
		
	
	}
	
	
}
