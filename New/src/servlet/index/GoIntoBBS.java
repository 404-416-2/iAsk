package servlet.index;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.bcel.internal.generic.NEW;

import dao.CollectDao;
import dao.QuestionDAO;
import entity.QuestionBean;

@WebServlet("/goIntoBBS")
public class GoIntoBBS extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 自动生成的方法存根
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 自动生成的方法存根
		QuestionDAO questionDAO = new QuestionDAO();
		ArrayList<QuestionBean> AllQues = questionDAO.selectAll();
		//对结果进行排序，将置顶问题放在队列前方
		AllQues = sort(AllQues);
		req.setAttribute("AllQues", AllQues);
		
		//获取用户收藏的问题列表
		ArrayList<QuestionBean> collectedQuess = new ArrayList<>();
		CollectDao cdao = new CollectDao();
		collectedQuess = cdao.selectAllById((String) req.getSession().getAttribute("uid"));
		ArrayList<Integer> qids = new ArrayList<>();
		for (int i = 0; i < collectedQuess.size(); i++) {
			qids.add(collectedQuess.get(i).getQuesId());

		}
		req.setAttribute("col_ques", qids);
		req.getRequestDispatcher("/userPages/NewHome_BBS.jsp").forward(req, resp);

	}

	public ArrayList<QuestionBean> sort(ArrayList<QuestionBean> quess) {
		if (quess == null || quess.size() == 0) {
			return null;
		}
		ArrayList<QuestionBean> q1 = new ArrayList<>();
		ArrayList<QuestionBean> q2 = new ArrayList<>();
		ArrayList<QuestionBean> re = new ArrayList<>();
		for (int i = 0; i < quess.size(); i++) {
			if(quess.get(i).getIsTop() == 1) {
				q1.add(quess.get(i));
			}else {
				q2.add(quess.get(i));
			}
		}
		int j = 0;
		for (int i = 0; i < q1.size(); i++) {
			re.add(j, q1.get(i));
			j++;
		}
		for (int i = 0; i < q2.size(); i++) {
			re.add(j, q2.get(i));	
			j++;
		}
		for (int i = 0; i < re.size(); i++) {
			System.out.print(re.get(i).getIsTop());
		}
		System.out.println("----------");
		return re;
		
	}


}
