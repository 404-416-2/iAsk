package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import utils.DBConn;
import entity.AnswerquesBean;

public class AnswerQuesDao {

	/**
	 * �������е�answer_ques �������û�������
	 * 
	 * @return
	 */
	public ArrayList<AnswerquesBean> selectAllAnswerquess() {
		ArrayList<AnswerquesBean> answerquess = new ArrayList<AnswerquesBean>();
		DBConn jdbc = DBConn.getInstance();
		jdbc.startConn();
		ResultSet rs = jdbc.query("select * from qiuwen_quesanswer");
		if (rs != null) {
			try {
				while (rs.next()) {
					AnswerquesBean answerques = new AnswerquesBean();
					answerques.setQid(rs.getInt("q_id"));
					answerques.setUid(rs.getString("u_id"));
					answerques.setAnsText(rs.getString("ans_text"));
					answerques.setAnsTime(rs.getString("ans_time"));
					answerquess.add(answerques);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		jdbc.close();
		return answerquess;
	}

	/**
	 * �����û�id�����������лش�
	 * 
	 * @return
	 */
	public ArrayList<AnswerquesBean> selectAnswerByUid(String Uid) {
		ArrayList<AnswerquesBean> answerquess = new ArrayList<AnswerquesBean>();
		DBConn jdbc = DBConn.getInstance();
		jdbc.startConn();
		ResultSet rs = jdbc.query("select * from qiuwen_quesanswer where u_id = '" + Uid + "'");
		if (rs != null) {
			try {
				while (rs.next()) {
					AnswerquesBean answerques = new AnswerquesBean();
					answerques.setQid(rs.getInt("q_id"));
					answerques.setUid(rs.getString("u_id"));
					answerques.setAnsText(rs.getString("ans_text"));
					answerques.setAnsTime(rs.getString("ans_time"));
					answerquess.add(answerques);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		jdbc.close();
		return answerquess;
	}

	/**
	 * ��������id�����������µ����лش�
	 * 
	 * @return
	 */
	public ArrayList<AnswerquesBean> selectAnswerByQid(int Qid) {
		ArrayList<AnswerquesBean> answerquess = new ArrayList<AnswerquesBean>();
		DBConn jdbc = DBConn.getInstance();
		jdbc.startConn();
		ResultSet rs = jdbc.query("select * from qiuwen_quesanswer where q_id = '" + String.valueOf(Qid) + "'");
		if (rs != null) {
			try {
				while (rs.next()) {
					AnswerquesBean answerques = new AnswerquesBean();
					answerques.setQid(rs.getInt("q_id"));
					answerques.setUid(rs.getString("u_id"));
					answerques.setAnsText(rs.getString("ans_text"));
					answerques.setAnsTime(rs.getString("ans_time"));
					answerquess.add(answerques);
					System.out.println("Fuwefjpowiejfpoji");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		jdbc.close();
		return answerquess;
	}

	public ArrayList<AnswerquesBean> selectByUid(String uid) {
		ArrayList<AnswerquesBean> answerquess = new ArrayList<AnswerquesBean>();
		DBConn jdbc = DBConn.getInstance();
		jdbc.startConn();
		ResultSet rs = jdbc.query("select * from qiuwen_quesanswer where u_id = '" + uid + "'");
		if (rs != null) {
			try {
				while (rs.next()) {
					AnswerquesBean answerques = new AnswerquesBean();
					answerques.setQid(rs.getInt("q_id"));
					answerques.setUid(rs.getString("u_id"));
					answerques.setAnsText(rs.getString("ans_text"));
					answerques.setAnsTime(rs.getString("ans_time"));
					answerquess.add(answerques);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		jdbc.close();
		return answerquess;
	}

	public ArrayList<AnswerquesBean> selectByText(String keys) {
		ArrayList<AnswerquesBean> answerquess = new ArrayList<AnswerquesBean>();
		DBConn jdbc = DBConn.getInstance();
		jdbc.startConn();
		ResultSet rs = jdbc.query("Select * from qiuwen_quesanswer where ans_text regexp '" + keys + "'");
		System.out.println(keys);
		if (rs != null) {
			try {
				while (rs.next()) {
					AnswerquesBean answerques = new AnswerquesBean();
					answerques.setQid(rs.getInt("q_id"));
					answerques.setUid(rs.getString("u_id"));
					answerques.setAnsText(rs.getString("ans_text"));
					answerques.setAnsTime(rs.getString("ans_time"));
					answerquess.add(answerques);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		jdbc.close();
		return answerquess;
	}

	public boolean insertAnswer(int qid, String uid, String ansText, String ansTime) {
		DBConn jdbc = DBConn.getInstance();
		jdbc.startTrans();
		String sql1 = "insert into qiuwen_quesanswer (q_id,u_text,a_text,ans_time) values('" + qid + "','" + uid + "','"
				+ ansText + "','" + ansTime + "')";
		boolean rs = jdbc.execute(sql1);
		jdbc.commit();
		return rs;
	}

	public boolean updateAnswerText(int qid, String uid, String ansText, String ansTime) {
		DBConn jdbc = DBConn.getInstance();
		jdbc.startTrans();
		String sql = "update qiuwen_quesanswer set ans_text = '" + ansText + "',ans_Time = '" + ansTime
				+ "' where u_id = '" + uid + "' and q_id = " + qid;
		boolean rs = jdbc.execute(sql);
		jdbc.commit();
		return rs;
	}

	public boolean deleteAnswer(int qid, String uid) {
		DBConn jdbc = DBConn.getInstance();
		jdbc.startTrans();
		String sql = "delete from qiuwen_quesanswer where u_id = '" + uid + "' and q_id = " + qid;
		boolean rs = jdbc.execute(sql);
		jdbc.commit();
		return rs;
	}

}
