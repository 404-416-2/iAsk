package servlet.user.collect;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jdk.nashorn.internal.ir.RuntimeNode.Request;
import dao.CollectDao;
import entity.QuestionBean;

public class searchCollect extends HttpServlet{

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
		HttpSession session = req.getSession();
		req.setCharacterEncoding("utf-8");
		String keys = req.getParameter("keys");
		String uid = (String)session.getAttribute("uid");
		
		System.err.println(uid);
		
		
		CollectDao collectDao = new CollectDao();
		ArrayList<QuestionBean> collectionSearch = collectDao.searchCollectByText(keys, uid);
		req.setAttribute("collectSearchResult", collectionSearch);
		req.setAttribute("collectSearchNum", collectionSearch.size());
		req.getRequestDispatcher("userPages/questionCollectSearch.jsp").forward(req, resp);;
	}
	
}
