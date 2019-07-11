package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import utils.DBConn;
import entity.AnswerquesBean;

public class AnswerQuesDao {

	/**
	 * 搜索所有的answer_ques 不限制用户和问题
	 * @return
	 */
	public ArrayList<AnswerquesBean> selectAllAnswerquess(){
		ArrayList<AnswerquesBean> answerquess = new ArrayList<AnswerquesBean>();
		DBConn jdbc = DBConn.getInstance();
		jdbc.startConn();
		ResultSet rs = jdbc.query("select * from qiuwen_quesanswer");
		if(rs != null){
			try{
				while(rs.next()){
					AnswerquesBean answerques = new AnswerquesBean();
					answerques.setQid(rs.getInt("q_id"));
					answerques.setUid(rs.getString("u_id"));
					answerques.setAnsText(rs.getString("ans_text"));
					answerques.setAnsTime(rs.getString("ans_time"));
					answerquess.add(answerques);
				}
			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		jdbc.close();
		return answerquess;
	}
	
	/**
	 * 根据用户id搜索他的所有回答
	 * @return
	 */
	public ArrayList<AnswerquesBean> selectAnswerByUid(String Uid){
		ArrayList<AnswerquesBean> answerquess = new ArrayList<AnswerquesBean>();
		DBConn jdbc = DBConn.getInstance();
		jdbc.startConn();
		ResultSet rs = jdbc.query("select * from qiuwen_quesanswer where u_id = '"+String.valueOf(Uid)+"'");
		if(rs != null){
			try{
				while(rs.next()){
					AnswerquesBean answerques = new AnswerquesBean();
					answerques.setQid(rs.getInt("q_id"));
					answerques.setUid(rs.getString("u_id"));
					answerques.setAnsText(rs.getString("ans_text"));
					answerques.setAnsTime(rs.getString("ans_time"));
					answerquess.add(answerques);
				}
			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		jdbc.close();
		return answerquess;
	}
	
	/**
	 * 根据问题id搜索该问题下的所有回答
	 * @return
	 */
	public ArrayList<AnswerquesBean> selectAnswerByQid(int Qid){
		ArrayList<AnswerquesBean> answerquess = new ArrayList<AnswerquesBean>();
		DBConn jdbc = DBConn.getInstance();
		jdbc.startConn();
		ResultSet rs = jdbc.query("select * from qiuwen_quesanswer where q_id = '"+String.valueOf(Qid)+"'");
		if(rs != null){
			try{
				while(rs.next()){
					AnswerquesBean answerques = new AnswerquesBean();
					answerques.setQid(rs.getInt("q_id"));
					answerques.setUid(rs.getString("u_id"));
					answerques.setAnsText(rs.getString("ans_text"));
					answerques.setAnsTime(rs.getString("ans_time"));
					answerquess.add(answerques);
				}
			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		jdbc.close();
		return answerquess;
	}
	
	/**
	 * 根据用户id搜索该用户所有回答
	 * @return
	 */
	public ArrayList<AnswerquesBean> selectByUid(String uid){
		ArrayList<AnswerquesBean> answerquess = new ArrayList<AnswerquesBean>();
		DBConn jdbc = DBConn.getInstance();
		jdbc.startConn();
		ResultSet rs = jdbc.query("select * from qiuwen_quesanswer where u_id = '"+uid+"'");
		if(rs != null){
			try{
				while(rs.next()){
					AnswerquesBean answerques = new AnswerquesBean();
					answerques.setQid(rs.getInt("q_id"));
					answerques.setUid(rs.getString("u_id"));
					answerques.setAnsText(rs.getString("ans_text"));
					answerques.setAnsTime(rs.getString("ans_time"));
					answerquess.add(answerques);
				}
			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		jdbc.close();
		return answerquess;
	}
	
	/**
	 * 在某一问题下插入一条回答
	 * @return
	 */
	public boolean insertAnswer(int qid, String uid, String ansText, String ansTime){
		DBConn jdbc=DBConn.getInstance();
		jdbc.startTrans();
		String sql1 = "insert into qiuwen_quesanswer (q_id,u_text,a_text,ans_time) values('"+qid+"','"+uid+"','"+ansText+"','"+ansTime+"')";
	    boolean rs = jdbc.execute(sql1);
	    jdbc.commit();
		return rs;
	}
	
	/**
	 * 根据qid和uid更新回答内容
	 * @return
	 */
	public boolean updateAnswerText(int qid,String uid,String ansText,String ansTime){
		DBConn jdbc=DBConn.getInstance();
		jdbc.startTrans();
		String sql = "update qiuwen_quesanswer set ans_text = '"+ansText+"',ans_time = '"+ansTime+"' where uid = '"+uid+"' and qid = " +qid;
	    boolean rs = jdbc.execute(sql);
	    jdbc.commit();
		return rs;
	}
	
	/**
	 * 用户根据qid uid删除其在qid问题下的回答
	 * @return
	 */
	public boolean deleteAnswer(int qid,String uid){
		DBConn jdbc=DBConn.getInstance();
		jdbc.startTrans();
		String sql = "delete from qiuwen_quesanswer where uid = '"+uid+"' and qid = " +qid;
	    boolean rs = jdbc.execute(sql);
	    jdbc.commit();
		return rs;
	}
	
	
}

	
