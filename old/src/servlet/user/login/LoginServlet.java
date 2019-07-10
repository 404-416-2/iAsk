package servlet.user.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;;

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
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		System.out.println("ID  " +  id);
		System.out.println("PWD " + pwd);

		UserDAO login = new UserDAO();
		ResultSet res = login.selectAccount(id, pwd);
		String responseText = "";
		try {
			if(res.next()){
				String uid = res.getString("usr_id");
				String isOk = res.getInt("is_ok") == 1 ? "is":"not";
				HttpSession session = request.getSession();
				session.setAttribute("uid", uid);
				//调试用
				request.getRequestDispatcher("userPages/home_yyz.jsp").forward(request, response);
				
				responseText = "{ \"code\" : \"success\" , "
								+ "\"isOk\" : \""+isOk+"\"}";
						System.out.println(responseText);
				return;
			}else{
				responseText = "{\"code\" : \"fail\"}";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(responseText);
		response.setContentType("application/json;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out =response.getWriter() ;
		out.write(responseText);
		out.close();
	}
}