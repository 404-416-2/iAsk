package servlet.admin.user;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import entity.UserBean;

@WebServlet("/UserRegisterServlet")
public class UserRegisterServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 自动生成的方法存根
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 自动生成的方法存根
		String uid = req.getParameter("uid");
		String pwd = req.getParameter("pwd");
		UserDAO udao = new UserDAO();
		try {
			int result = udao.insertAccount(uid, pwd);
			if (result == 1) {
				resp.setCharacterEncoding("utf-8");
				resp.getWriter().print("<script> window.location.href='NewHome.jsp';alert(\"Register Successfully, Please Login Now\"); </script>");
			} else {
				resp.setCharacterEncoding("utf-8");
				resp.getWriter().print("<script> window.location.href='NewHome.jsp';alert(\"Register Failed, Please Retry\"); </script>");
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}

}
