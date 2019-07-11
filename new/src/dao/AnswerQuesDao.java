package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import utils.DBConn;
import entity.AnswerquesBean;

public class AnswerQuesDao {

	/**
	 * 锟斤拷锟斤拷锟斤拷锟叫碉拷answer_ques 锟斤拷锟斤拷锟斤拷锟矫伙拷锟斤拷锟斤拷锟斤拷
	 * 
	 * @return
	 */
	public ArrayList<AnswerquesBean> selectAllAnswerquess() {
		ArrayList<AnswerquesBean> answerquess = new ArrayList<AnswerquesBean>();
		DBConn jdbc = DBConn.getInstance();

		try {
			Connection connection = jdbc.startConn();
			PreparedStatement pstmt = connection.prepareStatement("select * from qiuwen_quesanswer");
			ResultSet rs = pstmt.executeQuery();

			if (rs != null) {
				while (rs.next()) {
					AnswerquesBean answerques = new AnswerquesBean();
					answerques.setQid(rs.getInt("q_id"));
					answerques.setUid(rs.getString("u_id"));
					answerques.setAnsText(rs.getString("ans_text"));
					answerques.setAnsTime(rs.getString("ans_time"));
					answerquess.add(answerques);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		jdbc.close();
		return answerquess;
	}

	/**
	 * 锟斤拷锟斤拷锟矫伙拷id锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟叫回达拷
	 * 
	 * @return
	 */
	public ArrayList<AnswerquesBean> selectAnswerByUid(String Uid) {
		ArrayList<AnswerquesBean> answerquess = new ArrayList<AnswerquesBean>();
		DBConn jdbc = DBConn.getInstance();

		try {
			Connection connection = jdbc.startConn();
			PreparedStatement pstmt = connection.prepareStatement("select * from qiuwen_quesanswer where u_id = ?");
			pstmt.setString(1, Uid);
			ResultSet rs = pstmt.executeQuery();

			if (rs != null) {
				while (rs.next()) {
					AnswerquesBean answerques = new AnswerquesBean();
					answerques.setQid(rs.getInt("q_id"));
					answerques.setUid(rs.getString("u_id"));
					answerques.setAnsText(rs.getString("ans_text"));
					answerques.setAnsTime(rs.getString("ans_time"));
					answerquess.add(answerques);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		jdbc.close();
		return answerquess;
	}

	/**
	 * 锟斤拷锟斤拷锟斤拷锟斤拷id锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟铰碉拷锟斤拷锟叫回达拷
	 * 
	 * @return
	 */
	public ArrayList<AnswerquesBean> selectAnswerByQid(int Qid) {
		ArrayList<AnswerquesBean> answerquess = new ArrayList<AnswerquesBean>();
		DBConn jdbc = DBConn.getInstance();

		try {
			Connection connection = jdbc.startConn();
			PreparedStatement pstmt = connection.prepareStatement("select * from qiuwen_quesanswer where q_id = ?");
			pstmt.setInt(1, Qid);
			ResultSet rs = pstmt.executeQuery();

			if (rs != null) {
				while (rs.next()) {
					AnswerquesBean answerques = new AnswerquesBean();
					answerques.setQid(rs.getInt("q_id"));
					answerques.setUid(rs.getString("u_id"));
					answerques.setAnsText(rs.getString("ans_text"));
					answerques.setAnsTime(rs.getString("ans_time"));
					answerquess.add(answerques);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		jdbc.close();
		return answerquess;
	}

//	public ArrayList<AnswerquesBean> selectByUid(String uid){
//		ArrayList<AnswerquesBean> answerquess = new ArrayList<AnswerquesBean>();
//		DBConn jdbc = DBConn.getInstance();
//		
//		jdbc.startConn();
//		ResultSet rs = jdbc.query("select * from qiuwen_quesanswer where u_id = '"+uid+"'");
//		if(rs != null){
//			try{
//				while(rs.next()){
//					AnswerquesBean answerques = new AnswerquesBean();
//					answerques.setQid(rs.getInt("q_id"));
//					answerques.setUid(rs.getString("u_id"));
//					answerques.setAnsText(rs.getString("ans_text"));
//					answerques.setAnsTime(rs.getString("ans_time"));
//					answerquess.add(answerques);
//				}
//			}catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
//		jdbc.close();
//		return answerquess;
//	}

	// 鍦ㄥ搴旈棶棰樼殑鎵�鏈夊洖绛斾笅鏌ユ壘锛屽搴斾簬quesAnswerList
	public ArrayList<AnswerquesBean> selectQuesAnswerByText(String keys, int qid) {
		ArrayList<AnswerquesBean> answerquess = new ArrayList<AnswerquesBean>();
		DBConn jdbc = DBConn.getInstance();

		try {

			Connection connection = jdbc.startConn();
			PreparedStatement pstmt = connection
					.prepareStatement("Select * from qiuwen_quesanswer where q_id = ? and ans_text like ?");
			pstmt.setInt(1, qid);
			pstmt.setString(2, "%" + keys + "%");
			ResultSet rs = pstmt.executeQuery();

			if (rs != null) {
				while (rs.next()) {
					AnswerquesBean answerques = new AnswerquesBean();
					answerques.setQid(rs.getInt("q_id"));
					answerques.setUid(rs.getString("u_id"));
					answerques.setAnsText(rs.getString("ans_text"));
					answerques.setAnsTime(rs.getString("ans_time"));
					answerquess.add(answerques);
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

//		String keysString = "";
//		char[] keyArray = keys.toCharArray();
//		
//		for(int i = 0;i<keyArray.length;i++ ){
//			
//			if(keyArray[i]=='*'||keyArray[i]=='?'||keyArray[i]=='+'){
//				String s = "\\\\"+String.valueOf(keyArray[i]);
//				keysString = keysString + s;
//			}
//			else{
//				String s = String.valueOf(keyArray[i]);
//				keysString = keysString + s;
//			}
//		}

		jdbc.close();
		return answerquess;
	}

	// 鍦ㄥ搴旂敤鎴风殑鎵�鏈夊洖绛斾笅鏌ユ壘锛屽搴斾簬quesAnswerList
	public ArrayList<AnswerquesBean> selectUserAnswerByText(String keys, String uid) {
		ArrayList<AnswerquesBean> answerquess = new ArrayList<AnswerquesBean>();
		DBConn jdbc = DBConn.getInstance();

		try {

			Connection connection = jdbc.startConn();
			PreparedStatement pstmt = connection
					.prepareStatement("Select * from qiuwen_quesanswer where u_id = ? and ans_text regexp ?");
			pstmt.setString(1, uid);
			pstmt.setString(2, keys);
			ResultSet rs = pstmt.executeQuery();

			if (rs != null) {
				while (rs.next()) {
					AnswerquesBean answerques = new AnswerquesBean();
					answerques.setQid(rs.getInt("q_id"));
					answerques.setUid(rs.getString("u_id"));
					answerques.setAnsText(rs.getString("ans_text"));
					answerques.setAnsTime(rs.getString("ans_time"));
					answerquess.add(answerques);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		jdbc.close();
		return answerquess;

//		String keysString = "";
//		char[] keyArray = keys.toCharArray();
//		
//		for(int i = 0;i<keyArray.length;i++ ){
//			
//			if(keyArray[i]=='*'||keyArray[i]=='?'||keyArray[i]=='+'){
//				String s = "\\\\"+String.valueOf(keyArray[i]);
//				keysString = keysString + s;
//			}
//			else{
//				String s = String.valueOf(keyArray[i]);
//				keysString = keysString + s;
//			}		
//		}

	}

	public boolean insertAnswer(int qid, String uid, String ansText, String ansTime) {
		DBConn jdbc = DBConn.getInstance();

		try {

			Connection connection = jdbc.startConn();
			PreparedStatement pstmt1 = connection
					.prepareStatement("update qiuwen_question set follow = follow+1 where q_id = ?");
			PreparedStatement pstmt2 = connection
					.prepareStatement("insert into qiuwen_quesanswer (q_id,u_id,ans_text,ans_time) values(?,?,?,?)");
			pstmt1.setInt(1, qid);
			pstmt2.setInt(1, qid);
			pstmt2.setString(2, uid);
			pstmt2.setString(3, ansText);
			pstmt2.setString(4, ansTime);

			int rs1 = pstmt1.executeUpdate();
			int rs2 = pstmt2.executeUpdate();

			boolean rs = false;
			if (rs1 * rs2 == 0) {
				jdbc.rollback();
			} else {
				jdbc.commit();
				rs = true;
			}
			return rs;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean updateAnswerText(int qid, String uid, String ansText, String ansTime) {
		DBConn jdbc = DBConn.getInstance();

		try {

			Connection connection = jdbc.startConn();
			PreparedStatement pstmt = connection.prepareStatement(
					"update qiuwen_quesanswer set ans_text = ? ,ans_Time = ? where u_id = ? and q_id = ?");
			pstmt.setString(1, ansText);
			pstmt.setString(2, ansTime);
			pstmt.setString(3, uid);
			pstmt.setInt(4, qid);

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

		return false;
	}

	public boolean deleteAnswer(int qid, String uid) {
		DBConn jdbc = DBConn.getInstance();

		try {

			Connection connection = jdbc.startConn();
			PreparedStatement pstmt1 = connection
					.prepareStatement("delete from qiuwen_quesanswer where u_id = ? and q_id = ?");
			PreparedStatement pstmt2 = connection
					.prepareStatement("update qiuwen_question set follow = follow-1 where q_id = ?");
			pstmt1.setString(1, uid);
			pstmt1.setInt(2, qid);
			pstmt2.setInt(1, qid);

			int rs1 = pstmt1.executeUpdate();
			int rs2 = pstmt2.executeUpdate();

			boolean rs = false;
			if (rs1 * rs2 == 0) {
				jdbc.rollback();
			} else {
				jdbc.commit();
				rs = true;
			}
			return rs;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}
}
