package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entity.QuestionBean;
import utils.DBConn;

public class QuestionDAO {
	
	//获取所有的问题列表，显示在管理员端
	public ArrayList<QuestionBean> selectAll(){
		ArrayList<QuestionBean> questions = new ArrayList<QuestionBean>();
		ArrayList<QuestionBean> questions1 = new ArrayList<QuestionBean>();
		ArrayList<QuestionBean> questions2 = new ArrayList<QuestionBean>();
		DBConn jdbc = DBConn.getInstance();
		jdbc.startConn();
		ResultSet rs = jdbc.query("select * from qiuwen_question join qiuwen_user on usr_id = u_id;");
		if(rs != null){
			try{
				while(rs.next()){
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
			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		jdbc.close();

			}
		}
		for(QuestionBean ques : questions2){
				questions1.add(ques);//没有置顶的跟在置顶的后面			
		}

	}
	
	//管理员删除某个问题
	public boolean deleteQuestion(int id){
		DBConn jdbc=DBConn.getInstance();
		jdbc.startTrans();
		
		String sql1 = "delete from qiuwen_quesanswer where q_id = '"+String.valueOf(id)+"';";
		String sql2 = "delete from qiuwen_question where q_id = '"+String.valueOf(id)+"';";
		
		boolean rs1 = jdbc.execute(sql1);
		boolean rs2 = jdbc.execute(sql2);
		jdbc.commit();
		return rs1 && rs2;
	}
	
	//管理员置顶某个提问
	public boolean topquestion(int id){
		DBConn jdbc=DBConn.getInstance();
		jdbc.startTrans();
		String sql = "update qiuwen_question set is_top = 1 where q_id = '"+String.valueOf(id)+"'";
		boolean rs = jdbc.execute(sql);
		jdbc.commit();
		return rs;
	}
	
	//管理员取消置顶某个提问
	public boolean untopquestion(int id){
		DBConn jdbc=DBConn.getInstance();
		jdbc.startTrans();
		String sql = "update qiuwen_question set is_top = 0 where q_id = '"+String.valueOf(id)+"'";
		boolean rs = jdbc.execute(sql);
		jdbc.commit();
		return rs;
	}
	
	//管理员查找某个提问
	public ArrayList<QuestionBean> searchById(String id){
		ArrayList<QuestionBean> questions = new ArrayList<QuestionBean>();
		DBConn jdbc = DBConn.getInstance();
		jdbc.startConn();
		ResultSet rs = jdbc.query("select * from qiuwen_question join qiuwen_user on usr_id = u_id where q_text like '%"+id+"%'"
				+ "or usr_id like '%"+id+"%';");
		if(rs != null){
			try{
				while(rs.next()){
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
			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		jdbc.close();
		return questions;
	}

	public ArrayList<QuestionBean> selectQuesOfUser(int uid) {
		ArrayList<QuestionBean> questions = new ArrayList<QuestionBean>();
		DBConn jdbc = DBConn.getInstance();
		jdbc.startConn();
		ResultSet rs = jdbc.query("select * from qiuwen_question natural join qiuwen_userques where u_id = "+ uid);
		if(rs != null){
			try{
				while(rs.next()){
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
			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		jdbc.close();
		return questions;
	}
	
	public ResultSet insertQues(String text, String subTime){
		DBConn jdbc=DBConn.getInstance();
		jdbc.startTrans();
		String sql1 = "insert into qiuwen_question (q_text,follow,click_num,is_top,sub_time,category) values('"+text+"',0,0,0,'"+subTime+"','其他')";
		String sql2 = "select max(q_id) as qid from qiuwen_question";
		boolean rs = jdbc.execute(sql1);
		if(rs){
			ResultSet res = jdbc.query(sql2);
			jdbc.commit();
			return res;
		}else{
			jdbc.rollback();
			return null;
		}
	}

	public boolean insertItem(int uid , int qid){
		DBConn jdbc=DBConn.getInstance();
		jdbc.startTrans();
		boolean rs = jdbc.execute(" insert into qiuwen_userques values("+uid+","+qid+")");
		jdbc.commit();
		return rs;
	}

	public boolean updateText(int quesId,String text) {
		DBConn jdbc=DBConn.getInstance();
		jdbc.startTrans();
		boolean rs = jdbc.execute(" update qiuwen_question set q_text = '"+text+"' where q_id = "+quesId );
		jdbc.commit();
		return rs;
		
	}
	
	public boolean updateFollow(int qid){
		DBConn jdbc=DBConn.getInstance();
		jdbc.startTrans();
		boolean rs = jdbc.execute("update qiuwen_question set follow = follow+1 where q_id = "+qid);
		jdbc.commit();
		return rs;
	}
}