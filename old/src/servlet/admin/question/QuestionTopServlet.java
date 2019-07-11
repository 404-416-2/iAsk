package servlet.admin.question;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QuestionDAO;;

/**
 * Servlet implementation class UserDeleteServlet
 */
@WebServlet("/QuestionTopServlet")
public class QuestionTopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionTopServlet() {
        super();
        // TODO Auto-generated constructor stub
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("qId");
		int qId = Integer.parseInt(id);
		
		QuestionDAO qd = new QuestionDAO();
		int top = qd.searchByQId(qId).get(0).getIsTop();
		
		if (top == 1) {
			
		}else {
			qd.topquestion(qId);
		}
		
		request.getRequestDispatcher("QuestionManageServlet").forward(request, response);
	}
}