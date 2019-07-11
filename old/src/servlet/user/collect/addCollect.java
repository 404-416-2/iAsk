package servlet.user.collect;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CollectDao;

public class addCollect extends HttpServlet {

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
		
		String q_id = (String)req.getAttribute("q_id");
		String u_id = (String)req.getAttribute("u_id");
		
		CollectDao collectDao = new CollectDao();
		collectDao.addCollection(Integer.parseInt(q_id), u_id);
		
		req.getRequestDispatcher("manageCollect").forward(req, resp);
		
		
	}
}
