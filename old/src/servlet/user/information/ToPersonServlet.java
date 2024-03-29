package servlet.user.information;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.ArrayList;

import entity.QuestionBean;
import dao.QuestionDAO;

/**
 * Servlet implementation class ToPersonServlet
 */
@WebServlet("/ToPersonServlet")
public class ToPersonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ToPersonServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String u_id = "";
		if(session != null){
			if(session.getAttribute("uid")!= null && session.getAttribute("uid")!= ""){
				u_id =(String)session.getAttribute("uid");
			}
		}
	
		QuestionDAO qd = new QuestionDAO();
		ArrayList<QuestionBean> questions = qd.selectQuesOfUser(u_id);

		request.setAttribute("QuesUserAll", questions);
		request.getRequestDispatcher("userPages/personPage.jsp").forward(request, response);

	}

}