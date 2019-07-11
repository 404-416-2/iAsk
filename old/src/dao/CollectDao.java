package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.hibernate.dialect.pagination.SQL2008StandardLimitHandler;

import com.sun.crypto.provider.RSACipher;
import com.sun.org.apache.regexp.internal.recompile;

import utils.DBConn;
import entity.QuestionBean;
import entity.CollectBean;
import entity.QuestionBean;
import entity.UserBean;

public class CollectDao {

	// 杩斿洖璇ョ敤鎴锋墍鏈夋敹钘�
	public ArrayList<QuestionBean> selectAllById(String uid) {
		DBConn jdbc = DBConn.getInstance();
		ArrayList<QuestionBean> collectList = new ArrayList<>();
		try {
			Connection connection = jdbc.startConn();
			PreparedStatement pstmt = connection.prepareStatement(
					"select* from qiuwen_question where q_id in (select q_id from qiuwen_userstar where u_id = ?");
			pstmt.setString(1, uid);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				System.out.println("pppp");
				QuestionBean questionBean = new QuestionBean();

				questionBean.setQuesId(rs.getInt("q_id"));
				questionBean.setUsrId(rs.getString("u_id"));
				questionBean.setQuesText(rs.getString("q_text"));
				questionBean.setFollow(rs.getInt("follow"));
				questionBean.setStarNum(rs.getInt("star_num"));
				questionBean.setIsTop(rs.getInt("is_top"));
				questionBean.setSubTime(rs.getString("sub_time"));
				questionBean.setCategory(rs.getString("category"));

				collectList.add(questionBean);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		jdbc.close();
		return collectList;
	}

	// 鏍规嵁鐢ㄦ埛id鍜岄棶棰榠d鍒犻櫎鏀惰棌
	public boolean deleteCollection(int qid, String uid) {

		DBConn jdbc = DBConn.getInstance();

		try {
			Connection connection = jdbc.startConn();
			PreparedStatement pstmt1 = connection
					.prepareStatement("delete from qiuwen_userstar where u_id = ? and q_id = ?");
			PreparedStatement pstmt2 = connection
					.prepareStatement("update qiuwen_question set star_num = star_num - 1 where q_id = ?");
			pstmt1.setString(1, uid);
			pstmt1.setInt(2, qid);
			pstmt2.setInt(3, qid);
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
		jdbc.close();
		return false;

	}

	public boolean addCollection(int qid, String uid) {

		DBConn jdbc = DBConn.getInstance();

		try {
			Connection connection = jdbc.startConn();
			PreparedStatement pstmt = connection
					.prepareStatement("insert into qiuwen_userstar (q_id,u_id) values(?,?)");
			pstmt.setInt(1, qid);
			pstmt.setString(2, uid);
			int rs1 = pstmt.executeUpdate();
			boolean rs = false;
			if (rs1 == 0) {
				jdbc.rollback();
			} else {
				jdbc.commit();
				rs = true;
			}
			return rs;

		} catch (Exception e) {
			e.printStackTrace();
		}

		jdbc.close();
		return false;

	}

	public ArrayList<QuestionBean> searchCollectByText(String keys, String uid) {

		ArrayList<QuestionBean> quesCollect = new ArrayList<QuestionBean>();
		DBConn jdbc = DBConn.getInstance();

		try {
			Connection connection = jdbc.startConn();
			PreparedStatement pstmt = connection.prepareStatement(
					"select * from qiuwen_question where q_id in (select q_id from qiuwen_userstar where u_id = ? and q_text regexp ?");
			pstmt.setString(1, uid);
			pstmt.setString(2, keys);
			ResultSet rs1 = pstmt.executeQuery();

			while (rs1.next()) {
				QuestionBean questionBean = new QuestionBean();
				questionBean.setQuesId(rs1.getInt("q_id"));
				questionBean.setUsrId(rs1.getString("u_id"));
				questionBean.setQuesText(rs1.getString("q_text"));
				questionBean.setFollow(rs1.getInt("follow"));
				questionBean.setStarNum(rs1.getInt("star_num"));
				questionBean.setIsTop(rs1.getInt("is_top"));
				questionBean.setSubTime(rs1.getString("sub_time"));
				questionBean.setCategory(rs1.getString("category"));
				quesCollect.add(questionBean);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return quesCollect;

//		String keysString="";
//
//			char[] keyArray = keys.toCharArray();
//			
//			for(int i = 0;i<keyArray.length;i++ ){
//				
//				if(keyArray[i]=='*'||keyArray[i]=='?'||keyArray[i]=='+'){
//					String s = "\\\\"+String.valueOf(keyArray[i]);
//					keysString = keysString + s;
//				}
//				else{
//					String s = String.valueOf(keyArray[i]);
//					keysString = keysString + s;
//				}

	}
}
