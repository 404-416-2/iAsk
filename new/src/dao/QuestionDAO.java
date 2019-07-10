package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entity.QuestionBean;
import utils.DBConn;

public class QuestionDAO {

	public ArrayList<QuestionBean> selectAll() {
		ArrayList<QuestionBean> questions = new ArrayList<QuestionBean>();
		DBConn jdbc = DBConn.getInstance();

		try {
			Connection connection = jdbc.startConn();
			PreparedStatement pstmt = connection
					.prepareStatement("select * from qiuwen_question join qiuwen_user on usr_id = u_id");
			ResultSet rs = pstmt.executeQuery();

			if (rs != null) {
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
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		jdbc.close();
		return questions;
	}

	// 绠＄悊鍛樺垹闄ゆ煇涓棶棰�
	public boolean deleteQuestion(int id) {
		DBConn jdbc = DBConn.getInstance();

		try {
			Connection connection = jdbc.startConn();
			PreparedStatement pstmt1 = connection.prepareStatement("delete from qiuwen_quesanswer where q_id = ?");
			PreparedStatement pstmt2 = connection.prepareStatement("delete from qiuwen_question where q_id =  ?");
			pstmt1.setInt(1, id);
			pstmt2.setInt(1, id);
			int rs1 = pstmt1.executeUpdate();
			int rs2 = pstmt2.executeUpdate();

			if (rs2 == 0) {
				jdbc.rollback();
				System.err.println("删除失败！");
				return false;
			} else {
				jdbc.commit();
				System.err.println("删除成功！");
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		jdbc.close();
		System.err.println("你怎么执行到这里来了");
		return false;
	}

	// 绠＄悊鍛樼疆椤舵煇涓彁闂�
	public boolean topquestion(int id) {
		DBConn jdbc = DBConn.getInstance();
		try {
			Connection connection = jdbc.startConn();
			PreparedStatement pstmt = connection
					.prepareStatement("update qiuwen_question set is_top = 1 where q_id = ?");
			pstmt.setInt(1, id);
			int rs = pstmt.executeUpdate();

			if (rs == 0) {
				jdbc.rollback();
				return false;
			} else {
				jdbc.commit();
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		jdbc.close();
		;
		return false;
	}

	// 绠＄悊鍛樺彇娑堢疆椤舵煇涓彁闂�
	public boolean untopquestion(int id) {
		DBConn jdbc = DBConn.getInstance();
		try {
			Connection connection = jdbc.startConn();
			PreparedStatement pstmt = connection
					.prepareStatement("update qiuwen_question set is_top = 0 where q_id = ?");
			pstmt.setInt(1, id);
			int rs = pstmt.executeUpdate();

			if (rs == 0) {
				jdbc.rollback();
				return false;
			} else {
				jdbc.commit();
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		jdbc.close();
		;
		return false;

	}

	// 绠＄悊鍛樻煡鎵炬煇涓彁闂�
	public ArrayList<QuestionBean> searchById(String id) {
		ArrayList<QuestionBean> questions = new ArrayList<QuestionBean>();
		DBConn jdbc = DBConn.getInstance();

		try {
			Connection connection = jdbc.startConn();
			PreparedStatement pstmt = connection.prepareStatement(
					"select * from qiuwen_question join qiuwen_user on usr_id = u_id where q_text like ? or usr_id like ?");
			pstmt.setString(1, "%" + id + "%");
			pstmt.setString(2, "%" + id + "%");
			ResultSet rs = pstmt.executeQuery();

			if (rs != null) {
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
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		jdbc.close();
		return questions;
	}
	
	public ArrayList<QuestionBean> searchByQId(int qid) {
		ArrayList<QuestionBean> questions = new ArrayList<QuestionBean>();
		DBConn jdbc = DBConn.getInstance();

		try {
			Connection connection = jdbc.startConn();
			PreparedStatement pstmt = connection.prepareStatement(
					"select * from qiuwen_question where q_id = ?");
			pstmt.setInt(1, qid);
			ResultSet rs = pstmt.executeQuery();

			if (rs != null) {
				while (rs.next()) {
					QuestionBean question = new QuestionBean();
					question.setCategory(rs.getString("category"));
					question.setFollow(rs.getInt("follow"));
					question.setIsTop(rs.getInt("is_top"));
					question.setQuesId(rs.getInt("q_id"));
					question.setUsrId(rs.getString("u_id"));
					question.setQuesText(rs.getString("q_text"));
					question.setStarNum(rs.getInt("star_num"));
					question.setSubTime(rs.getString("sub_time"));
					questions.add(question);
				}
			}else System.err.println("没有查询到问题！");
		} catch (Exception e) {
			e.printStackTrace();
		}

		jdbc.close();
		return questions;
	}

	public ArrayList<QuestionBean> selectQuesOfUser(String uid) {

		ArrayList<QuestionBean> questions = new ArrayList<QuestionBean>();
		DBConn jdbc = DBConn.getInstance();

		try {
			Connection connection = jdbc.startConn();
			PreparedStatement pstmt = connection
					.prepareStatement("select * from qiuwen_question natural join qiuwen_user where u_id = ? and usr_id = ?");
			pstmt.setString(1, uid);
			pstmt.setString(2, uid);
			ResultSet rs = pstmt.executeQuery();

			if (rs != null) {
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
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		jdbc.close();
		return questions;
	}

	public boolean updateText(int quesId, String text, String queTime, String category) {

		DBConn jdbc = DBConn.getInstance();
		try {
			Connection connection = jdbc.startConn();
			PreparedStatement pstmt = connection.prepareStatement(
					"update qiuwen_question set q_text = ? , sub_time = ? , category = ? where q_id = ?");
			pstmt.setString(1, text);
			pstmt.setString(2, queTime);
			pstmt.setString(3, category);
			pstmt.setInt(4, quesId);

			int rs = pstmt.executeUpdate();
			if (rs == 0) {
				jdbc.rollback();
				return false;
			} else {
				jdbc.commit();
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		jdbc.close();
		return false;

	}

	public boolean updateFollow(int qid) {

		DBConn jdbc = DBConn.getInstance();
		try {
			Connection connection = jdbc.startConn();
			PreparedStatement pstmt = connection
					.prepareStatement("update qiuwen_question set follow = follow+1 where q_id = ?");
			pstmt.setInt(1, qid);

			int rs = pstmt.executeUpdate();
			if (rs == 0) {
				jdbc.rollback();
				return false;
			} else {
				jdbc.commit();
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		jdbc.close();
		return false;

	}

	public ArrayList<QuestionBean> selectByText(String keys) {
		ArrayList<QuestionBean> quess = new ArrayList<QuestionBean>();
		DBConn jdbc = DBConn.getInstance();

		try {
			Connection connection = jdbc.startConn();
			PreparedStatement pstmt = connection
					.prepareStatement("Select * from qiuwen_question where q_text regexp ?");
			pstmt.setString(1, keys);
			ResultSet rs = pstmt.executeQuery();

			if (rs != null) {
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
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		jdbc.close();
		return quess;
	}

	public ArrayList<QuestionBean> selectByTextAtUsr(String keys, String uid) {
		ArrayList<QuestionBean> quess = new ArrayList<QuestionBean>();
		DBConn jdbc = DBConn.getInstance();

		try {
			Connection connection = jdbc.startConn();
			PreparedStatement pstmt = connection
					.prepareStatement("Select * from qiuwen_question where q_text regexp ? and u_id = ?");
			pstmt.setString(1, keys);
			pstmt.setString(2, uid);
			ResultSet rs = pstmt.executeQuery();

			if (rs != null) {
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
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		jdbc.close();
		return quess;
	}

}