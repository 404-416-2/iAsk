package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entity.AnswerquesBean;
import entity.QuestionBean;
import utils.DBConn;

public class QuestionDAO {

	// 鑾峰彇鎵�鏈夌殑闂鍒楄〃锛屾樉绀哄湪绠＄悊鍛樼
	public ArrayList<QuestionBean> selectAll() {
		ArrayList<QuestionBean> questions = new ArrayList<QuestionBean>();
		DBConn jdbc = DBConn.getInstance();
		jdbc.startConn();
		ResultSet rs = jdbc.query("select * from qiuwen_question join qiuwen_user on usr_id = u_id;");
		if (rs != null) {
			try {
				while (rs.next()) {
					QuestionBean question = new QuestionBean();
					question.setAge(rs.getInt("age"));
					question.setCategory(rs.getString("category"));
					question.setFollow(rs.getInt("follow"));
					question.setIsOk(rs.getInt("is_ok"));
					question.setIsTop(rs.getInt("is_top"));
					question.setNickname(rs.getString("nickname"));
					question.setQuesId(rs.getInt("q_id"));
					question.setQuesText(rs.getString("q_text"));
					question.setSchool(rs.getString("school"));
					question.setSex(rs.getInt("sex"));
					question.setStarNum(rs.getInt("star_num"));
					question.setSubTime(rs.getString("sub_time"));
					question.setText(rs.getString("text"));
					question.setUsrId(rs.getString("u_id"));
					questions.add(question);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		jdbc.close();
		return questions;
	}

	public ArrayList<QuestionBean> searchByQId(int qid) {
		ArrayList<QuestionBean> questions = new ArrayList<QuestionBean>();
		DBConn jdbc = DBConn.getInstance();
		jdbc.startConn();
		ResultSet rs = jdbc.query("select * from qiuwen_question on q_id = '" + qid + "';");
		if (rs != null) {
			try {
				while (rs.next()) {
					QuestionBean question = new QuestionBean();
					question.setCategory(rs.getString("category"));
					question.setFollow(rs.getInt("follow"));
					question.setIsTop(rs.getInt("is_top"));
					question.setQuesId(rs.getInt("q_id"));
					question.setQuesText(rs.getString("q_text"));
					question.setStarNum(rs.getInt("star_num"));
					question.setSubTime(rs.getString("sub_time"));
					questions.add(question);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		jdbc.close();
		return questions;
	}

	// 绠＄悊鍛樺垹闄ゆ煇涓棶棰�
	public boolean deleteQuestion(int id) {
		DBConn jdbc = DBConn.getInstance();
		jdbc.startTrans();

		String sql1 = "delete from qiuwen_quesanswer where q_id = '" + String.valueOf(id) + "';";
		String sql2 = "delete from qiuwen_question where q_id = '" + String.valueOf(id) + "';";
		String sql3 = "delete from qiuwen_userstar where q_id = '" + String.valueOf(id) + "';";

		boolean rs1 = jdbc.execute(sql1);
		boolean rs2 = jdbc.execute(sql2);
		boolean rs3 = jdbc.execute(sql3);
		jdbc.commit();
		return rs1 && rs2 && rs3;
	}

	// 绠＄悊鍛樼疆椤舵煇涓彁闂�
	public boolean topquestion(int id) {
		DBConn jdbc = DBConn.getInstance();
		jdbc.startTrans();
		String sql = "update qiuwen_question set is_top = 1 where q_id = '" + String.valueOf(id) + "'";
		boolean rs = jdbc.execute(sql);
		jdbc.commit();
		return rs;
	}

	// 绠＄悊鍛樺彇娑堢疆椤舵煇涓彁闂�
	public boolean untopquestion(int id) {
		DBConn jdbc = DBConn.getInstance();
		jdbc.startTrans();
		String sql = "update qiuwen_question set is_top = 0 where q_id = '" + String.valueOf(id) + "'";
		boolean rs = jdbc.execute(sql);
		jdbc.commit();
		return rs;
	}

	public ArrayList<QuestionBean> selectByText(String keys) {
		ArrayList<QuestionBean> quess = new ArrayList<QuestionBean>();
		DBConn jdbc = DBConn.getInstance();
		jdbc.startConn();
		ResultSet rs = jdbc.query("Select * from qiuwen_question where q_text regexp '" + keys + "'");
		System.out.println(keys);
		if (rs != null) {
			try {
				while (rs.next()) {
					QuestionBean ques = new QuestionBean();
					ques.setQuesId(rs.getInt("q_id"));
					ques.setQuesText(rs.getString("q_text"));
					ques.setUsrId(rs.getString("u_id"));
					ques.setFollow(rs.getInt("follow"));
					ques.setStarNum(rs.getInt("star_num"));
					ques.setIsTop(rs.getInt("is_top"));
					ques.setSubTime(rs.getString("sub_time"));
					ques.setCategory(rs.getString("category"));

					quess.add(ques);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		jdbc.close();
		return quess;
	}

	public ArrayList<QuestionBean> selectByTextAtUsr(String keys, String uid) {
		ArrayList<QuestionBean> quess = new ArrayList<QuestionBean>();
		DBConn jdbc = DBConn.getInstance();
		jdbc.startConn();
		ResultSet rs = jdbc
				.query("Select * from qiuwen_question where q_text regexp '" + keys + "' and u_id = '" + uid + "'");
		System.out.println(keys);
		if (rs != null) {
			try {
				while (rs.next()) {
					QuestionBean ques = new QuestionBean();
					ques.setQuesId(rs.getInt("q_id"));
					ques.setQuesText(rs.getString("q_text"));
					ques.setUsrId(rs.getString("u_id"));
					ques.setFollow(rs.getInt("follow"));
					ques.setStarNum(rs.getInt("star_num"));
					ques.setIsTop(rs.getInt("is_top"));
					ques.setSubTime(rs.getString("sub_time"));
					ques.setCategory(rs.getString("category"));

					quess.add(ques);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		jdbc.close();
		return quess;
	}

	// 绠＄悊鍛樻煡鎵炬煇涓彁闂�
	public ArrayList<QuestionBean> searchById(String id) {
		ArrayList<QuestionBean> questions = new ArrayList<QuestionBean>();
		DBConn jdbc = DBConn.getInstance();
		jdbc.startConn();
		ResultSet rs = jdbc.query("select * from qiuwen_question join qiuwen_user on usr_id = u_id where q_text like '%"
				+ id + "%'" + "or usr_id like '%" + id + "%';");
		if (rs != null) {
			try {
				while (rs.next()) {
					QuestionBean question = new QuestionBean();
					question.setAge(rs.getInt("age"));
					question.setCategory(rs.getString("category"));
					question.setFollow(rs.getInt("follow"));
					question.setIsOk(rs.getInt("is_ok"));
					question.setIsTop(rs.getInt("is_top"));
					question.setNickname(rs.getString("nickname"));
					question.setQuesId(rs.getInt("q_id"));
					question.setQuesText(rs.getString("q_text"));
					question.setSchool(rs.getString("school"));
					question.setSex(rs.getInt("sex"));
					question.setStarNum(rs.getInt("star_num"));
					question.setSubTime(rs.getString("sub_time"));
					question.setText(rs.getString("text"));
					question.setUsrId(rs.getString("u_id"));
					questions.add(question);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		jdbc.close();
		return questions;
	}

	public ArrayList<QuestionBean> selectQuesOfUser(String uid) {
		ArrayList<QuestionBean> questions = new ArrayList<QuestionBean>();
		DBConn jdbc = DBConn.getInstance();
		jdbc.startConn();
		ResultSet rs = jdbc.query("select * from qiuwen_question where u_id ='" + uid + "'");
		if (rs != null) {
			try {
				while (rs.next()) {
					QuestionBean question = new QuestionBean();
					question.setCategory(rs.getString("category"));
					question.setFollow(rs.getInt("follow"));
					question.setIsTop(rs.getInt("is_top"));
					question.setQuesId(rs.getInt("q_id"));
					question.setQuesText(rs.getString("q_text"));
					question.setStarNum(rs.getInt("star_num"));
					question.setSubTime(rs.getString("sub_time"));
					question.setUsrId(rs.getString("u_id"));
					questions.add(question);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		jdbc.close();
		return questions;
	}

	public ResultSet insertQues(String text, String subTime) {
		DBConn jdbc = DBConn.getInstance();
		jdbc.startTrans();
		String sql1 = "insert into qiuwen_question (q_text,follow,click_num,is_top,sub_time,category) values('" + text
				+ "',0,0,0,'" + subTime + "','鍏朵粬')";
		String sql2 = "select max(q_id) as qid from qiuwen_question";
		boolean rs = jdbc.execute(sql1);
		if (rs) {
			ResultSet res = jdbc.query(sql2);
			jdbc.commit();
			return res;
		} else {
			jdbc.rollback();
			return null;
		}
	}

	// 修改了uid类型
	public boolean insertItem(String uid, int qid) {
		DBConn jdbc = DBConn.getInstance();
		jdbc.startTrans();
		boolean rs = jdbc.execute(" insert into qiuwen_userques values(" + uid + "," + qid + ")");
		jdbc.commit();
		return rs;
	}

	public boolean updateText(int quesId, String text, String queTime, String category) {
		DBConn jdbc = DBConn.getInstance();
		jdbc.startTrans();
		boolean rs = jdbc.execute(" update qiuwen_question set q_text = '" + text + "', sub_time ='" + queTime
				+ "', category = '" + category + "' where q_id = " + quesId);
		jdbc.commit();
		return rs;

	}

	public boolean updateFollow(int qid) {
		DBConn jdbc = DBConn.getInstance();
		jdbc.startTrans();
		boolean rs = jdbc.execute("update qiuwen_question set follow = follow+1 where q_id = " + qid);
		jdbc.commit();
		return rs;
	}
}