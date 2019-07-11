package servlet.user.friend;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserFriendDao;
import entity.UserBean;

/**
 * Servlet implementation class FindFriendList
 */
@WebServlet("/FindUserList.do")
public class FindUserList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindUserList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String keyword = request.getParameter("keyword");
		String uid = (String)request.getSession().getAttribute("uid");
		UserFriendDao dao = new UserFriendDao();
		ArrayList<UserBean> userList = new ArrayList<UserBean>();
		if(keyword!=null)
		{
			userList = dao.findUserByKeyword(keyword);
		}
		ArrayList<String> fidList = dao.selectALLUserFriend(uid);
		ArrayList<UserBean> friendList = new ArrayList<UserBean>();
		for(int i = 0;i<fidList.size();i++)
		{
			for(int j = 0; j<userList.size();j++ )
			{
				if(userList.get(j).getUsrId().equals(fidList.get(i)))
				{
					friendList.add(userList.get(j));
					userList.remove(j);
				}
			}
		}
		request.setAttribute("userList", userList);
		request.setAttribute("friendList", friendList);
		request.getRequestDispatcher("userFriend/findUserList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
