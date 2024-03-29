package servlet.homepage;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.*;
import utils.ResponseJsonUtils;
import dao.*;

/**
 * Servlet implementation class Index
 */
@WebServlet("/Index")
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Index() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//response data Map
		Map<String, Object> data = new HashMap<String, Object>();
		
		HttpSession session = request.getSession();
		if(session != null){

			if(session.getAttribute("uid") != null){
				int uid = (int) session.getAttribute("uid");
				System.out.println(uid);
				UserDAO isok = new UserDAO();
				ResultSet res = isok.selectIsOk(uid);
				try {
					if(res.next()){
						if(res.getInt("is_ok")==1){
							data.put("isOk", "is");
						}else{
							data.put("isOk", "not");
						}
					}
					data.put("login", "ok");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else{
				data.put("login", "fail");
				data.put("isOk", "not");
			}
		}
	
		UserQuesDAO test1 = new UserQuesDAO();
		ArrayList<UserStarBean> topItems = test1.selectLinkUserTopQues();
		ArrayList<UserStarBean> unTopItems = test1.selectLinkUserUnTopQues();
		
		data.put("feed", unTopItems);
		data.put("feedTop", topItems);
				
		ResponseJsonUtils.json(response, data);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
