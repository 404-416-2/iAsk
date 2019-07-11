package servlet.user.answer;

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
import entity.AnswerquesBean;
import entity.QuestionBean;

public class ViewQuesAnswer extends HttpServlet{
	
	public ViewQuesAnswer(){
		super();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
			System.out.println((String)req.getAttribute("q_id"));
			
			int qid = Integer.parseInt((String)req.getAttribute("q_id"));
			
			AnswerQuesDao answerQuesDao = new AnswerQuesDao();
			ArrayList<AnswerquesBean> answerquesBeans = answerQuesDao.selectAnswerByQid(qid);
			
			req.setAttribute("allAnswersOfQuestion", answerquesBeans);
			
			req.getRequestDispatcher("userPages/quesAnswerList.jsp").forward(req, resp);
	}
}
