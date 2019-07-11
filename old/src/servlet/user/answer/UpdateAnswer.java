package servlet.user.answer;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AnswerQuesDao;
import entity.AnswerquesBean;
import jdk.nashorn.internal.ir.RuntimeNode.Request;

public class UpdateAnswer  extends HttpServlet{
	public UpdateAnswer(){
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
		
		    Date d = new Date();
		    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		    String ansTime = sdf.format(d);
			
		    int qid = Integer.parseInt(req.getParameter("q_id"));
			String uid = req.getParameter("u_id");
			String ansText = req.getParameter("update_text");
			String text = new String(ansText.getBytes("iso-8859-1"),"UTF-8");
			System.out.println(text);
			AnswerQuesDao answerQuesDao = new AnswerQuesDao();
			answerQuesDao.updateAnswerText(qid, uid, text, ansTime);
			
			req.setAttribute("q_id",String.valueOf(qid));
			
			req.getRequestDispatcher("ViewQuesAnswer").forward(req, resp);
	}
}
