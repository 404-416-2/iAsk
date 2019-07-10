package servlet.user.collect;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CollectDao;

public class deleteCollect extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		String qidString = req.getParameter("q_id");

		String uid = (String)req.getSession().getAttribute("uid");
		int qid = Integer.parseInt(qidString);
		
		
		System.err.println(uid);
		System.err.println(qid);

		CollectDao collectDao = new CollectDao();
		collectDao.deleteCollection(qid, uid);
		req.getRequestDispatcher("manageCollect").forward(req, resp);
				
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
		
	}
}
