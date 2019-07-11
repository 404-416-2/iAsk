package servlet.admin.user;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QuestionDAO;
import dao.UserDAO;
import entity.QuestionBean;
import entity.UserBean;

@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet{
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
		ResultSet rs = udao.selectAccount(uid, pwd);
		try {
			if (rs.next()) {
				req.getSession().setAttribute("login_uid", uid);
				req.getSession().setAttribute("uid", uid);
				req.getSession().setAttribute("nickname", rs.getString("nickname"));

				req.getRequestDispatcher("NewHome.jsp").forward(req, resp);
			}else {
				resp.setCharacterEncoding("utf-8");
				resp.getWriter().print("<script> window.location.href='NewHome.jsp';alert(\"Please Check Whether Your Email Or Password Is Correctly!\"); </script>");
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		
	}
	
}
