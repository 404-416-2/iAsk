package servlet.user.question;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QuestionDAO;

public class UpdateQues extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = -2458757308333131341L;

	public UpdateQues() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String queTime = sdf.format(d);

		int qid = Integer.parseInt(req.getParameter("q_id"));
		String cate = req.getParameter("cate");
		String category = new String(cate.getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
		String queText = req.getParameter("update_text");
		String text = new String(queText.getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
		QuestionDAO questionDAO = new QuestionDAO();
		questionDAO.updateText(qid, text, queTime, category);

		req.setAttribute("q_id", String.valueOf(qid));

		req.getRequestDispatcher("ViewUsrQues").forward(req, resp);
	}
}
