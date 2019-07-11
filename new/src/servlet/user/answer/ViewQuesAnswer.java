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
import dao.QuestionDAO;
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
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
			//System.out.println((String)req.getAttribute("q_id"));
			
			//int qid = Integer.parseInt((String)req.getAttribute("q_id"));
			int qid = Integer.parseInt(req.getParameter("q_id"));
			
			QuestionBean que = new QuestionBean();
			QuestionDAO qdao = new QuestionDAO();
			que = qdao.searchByQId(qid).get(0);
			
			AnswerQuesDao adao = new AnswerQuesDao();
			ArrayList<AnswerquesBean> answers = adao.selectAnswerByQid(qid);
			
			
			
			System.err.println("qid="+qid + "num=" + answers.size());
			req.setAttribute("ques", que);
			req.setAttribute("answer_num", answers.size());
			req.setAttribute("allAnswersOfQuestion", answers);
			
			req.getRequestDispatcher("userPages/quesAnswerList.jsp").forward(req, resp);
	}
}
