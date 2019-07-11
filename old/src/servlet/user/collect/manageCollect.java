package servlet.user.collect;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import dao.CollectDao;
import entity.QuestionBean;
import jdk.nashorn.internal.ir.RuntimeNode.Request;

public class manageCollect extends HttpServlet{
	
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
		String uid = (String)session.getAttribute("uid");
		
		CollectDao collectDao = new CollectDao();
		ArrayList<QuestionBean> collectList = collectDao.selectAllById(uid);
		req.setAttribute("mycollection", collectList);
		req.getRequestDispatcher("userPages/questionCollectManage.jsp").forward(req, resp);
		
	}
	
	
}
