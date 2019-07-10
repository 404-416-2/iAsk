package servlet.user.answer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.ObjectUtils.Null;

import jdk.nashorn.internal.ir.RuntimeNode.Request;
import dao.AnswerQuesDao;
import entity.AnswerquesBean;

public class AddAnswer extends HttpServlet {
	
/**
 * ����������ӻش�
 */	
	
	public AddAnswer(){
		super();
	}
	
	@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp)
				throws ServletException, IOException {
			// TODO Auto-generated method stub
			//doGet(req, resp);
			doPost(req, resp);
		}
	
		@Override
			protected void doPost(HttpServletRequest req, HttpServletResponse resp)
					throws ServletException, IOException {
				// TODO Auto-generated method stub
				
				HttpSession session = req.getSession();
				
				String qid_str = req.getParameter("q_id");
				String uid = (String)session.getAttribute("uid");
				String ans_text = req.getParameter("answer_text");
				String ans_time = (String)session.getAttribute("ans_time");
				int qid = Integer.parseInt(qid_str);
				
				AnswerQuesDao answer = new AnswerQuesDao();
				answer.insertAnswer(qid, uid, ans_text, ans_time);
				req.setAttribute("q_id", qid);
				
				req.getRequestDispatcher("ViewQuesAnswer").forward(req, resp);
				
			}
}
