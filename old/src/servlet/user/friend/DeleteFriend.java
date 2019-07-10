package servlet.user.friend;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserFriendDao;

/**
 * Servlet implementation class DeleteFriend
 */
@WebServlet("/DeleteFriend")
public class DeleteFriend extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteFriend() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String friendId = request.getParameter("friendId");
		String userId = (String)request.getSession().getAttribute("uid");
		UserFriendDao dao = new UserFriendDao();
		String context = request.getContextPath();
		if(dao.deleteUserFriend(userId, friendId))
		{
			request.setAttribute("jumpUrl", "ViewFriendList");
			request.setAttribute("alertInfo", "删除好友成功");
			request.getRequestDispatcher("userFriend/alert.jsp").forward(request, response);
		}
		else
		{
			request.setAttribute("jumpUrl", "ViewFriendList");
			request.setAttribute("alertInfo", "删除好友失败");
			request.getRequestDispatcher("userFriend/alert.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
