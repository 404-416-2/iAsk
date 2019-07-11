package servlet.user.information;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;

/**
 * Servlet implementation class SexUpdateServlet
 */
public class SexUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SexUpdateServlet() {
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
		// TODO Auto-generated method stub
		//System.out.println("hhhh");
		String uid = request.getParameter("id");
		String text = request.getParameter("text");
		System.out.println("Update"+text);
		String quesId = uid;
		String responseText = "";
	    UserDAO updateQ = new UserDAO();
	    int sex;
	    //System.out.println("hhhhh");
		if(text.equals("Female")) 
			sex = 1;
		else 
			sex = -1;
		System.out.println(sex);
	    if(updateQ.updateSex(quesId,sex)){
	    	responseText = "{ \"code\" : \"success\" , "
	    			+ "\"text\" : \""+text+"\" }";
	    }else{
	    	responseText = "{\"code\" : \"fail\" , "
	    			+ "\"text\" : \""+text+"\" }";
	    }
		
		response.setCharacterEncoding("UTF-8");  
		response.setContentType("application/json; charset=utf-8");  
		PrintWriter writer = response.getWriter();
		writer.append(responseText); 
	}

}
