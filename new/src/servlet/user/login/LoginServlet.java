package servlet.user.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import utils.ResponseJsonUtils;;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");

		Map<String, Object> data = new HashMap<String, Object>();
		
		UserDAO login = new UserDAO();
		ResultSet res = login.selectAccount(id, pwd);
		try {
			if(res.next()){
				String uid = res.getString("usr_id");
				String nickname = res.getString("nickname");
				int isOk = res.getInt("is_ok");
				HttpSession session = request.getSession();
				session.setAttribute("uid", uid);
				System.out.println(session.getAttribute("uid"));
				
				data.put("code", "success");
				data.put("uId", uid);
				data.put("nickname", nickname);
				data.put("isOk", isOk);
				
			}else{
				data.put("code", "fail");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
				
		ResponseJsonUtils.json(response, data);
	}
}