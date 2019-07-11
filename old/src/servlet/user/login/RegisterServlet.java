package servlet.user.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		String psd = request.getParameter("psd");
	
		System.out.println(id+psd);
		
		UserDAO register = new UserDAO();
		int rs;
		try {
			rs = (int) register.insertAccount(id, psd);
			System.out.println(rs);
			String responseText = "";
			if(rs==1){
				System.out.println("success");
				responseText = "{\"code\" : \"success\"}";
			}else if(rs==-1){
				responseText = "{\"code\" : \"has\"}";
			}else{
				System.out.println("fail");
				responseText = "{\"code\":\"fail\"}";
			}
			response.setContentType("application/json;charset=utf-8");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out =response.getWriter() ;
			out.write(responseText);
			out.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

				

	}
}