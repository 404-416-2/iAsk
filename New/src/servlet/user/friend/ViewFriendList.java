package servlet.user.friend;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.ObjectUtils.Null;

import dao.UserDAO;
import dao.UserFriendDao;
import entity.UserBean;

/**
 * Servlet implementation class ViewFriendList
 */
@WebServlet("/ViewFriendList")
public class ViewFriendList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewFriendList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//获取session检测用户登陆情况
		String user = (String)request.getSession().getAttribute("uid");
		if(user==null){
			user = (String)request.getParameter("uId");
//		String user = (String)request.getSession().getAttribute("uid");
			if(user==null || user.equals(""))
			{
				request.setAttribute("alertInfo", "please login first!");
				request.setAttribute("jumpUrl", "ViewFriendList");
				request.getRequestDispatcher("userFriend/alert.jsp").forward(request, response);
				return;
			}
			else {
				HttpSession session = request.getSession();
				session.setAttribute("uid", user);
			}
		}
		UserFriendDao dao = new UserFriendDao();
		UserDAO udao = new UserDAO();
		ArrayList<String> friendList = dao.selectALLUserFriend(user);
		UserBean usr = udao.searchById(user).get(0);
		request.setAttribute("userInfo", usr);
		request.setAttribute("friendList", friendList);
		request.setAttribute("friendNum", friendList.size());
		request.getRequestDispatcher("userFriend/friendList.jsp").forward(request, response);
//		response.sendRedirect("userFriend/friendList.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request,response);
	}

}
