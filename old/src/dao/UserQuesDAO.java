package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entity.UserStarBean;
import utils.DBConn;

public class UserQuesDAO {
//select
	public ArrayList<UserStarBean> selectLinkUserTopQues() {
		ArrayList<UserStarBean> quesTop = new ArrayList<UserStarBean>();
		DBConn jdbc = DBConn.getInstance();
		jdbc.startConn();
		ResultSet res = jdbc.query(" select * from qiuwen_question" + " s1,qiuwen_user s3 "
				+ "where s1.u_id=s3.usr_id order by s1.sub_time desc");
		if (res != null) {
			try {
				while (res.next()) {
					UserStarBean ques = new UserStarBean();
					ques.setQid(res.getInt("q_id"));
					ques.setUid(res.getString("u_id"));
					ques.setSubTime(res.getString("sub_time"));
					ques.setText(res.getString("q_text"));
					ques.setFollow(res.getInt("follow"));
					ques.setClickNum(res.getInt("star_num"));
					ques.setIs_top(res.getInt("is_top"));
					ques.setCategory(res.getString("category"));
					//
					ques.setAccount(res.getString("nickname"));
					ques.setSchool(res.getString("school"));
					ques.setSex(res.getInt("sex"));
					ques.setAge(res.getInt("age"));
					if (res.getInt("is_top") == 1) {
						quesTop.add(ques);
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		jdbc.close();
		return quesTop;
	}

	public ArrayList<UserStarBean> selectLinkUserUnTopQues() {
		ArrayList<UserStarBean> quesList = new ArrayList<UserStarBean>();
		DBConn jdbc = DBConn.getInstance();
		jdbc.startConn();
		ResultSet res = jdbc.query(" select * from qiuwen_question" + " s1,qiuwen_user s3 "
				+ "where s1.u_id=s3.usr_id order by s1.sub_time desc");
		if (res != null) {
			try {
				while (res.next()) {
					UserStarBean ques = new UserStarBean();
					ques.setQid(res.getInt("q_id"));
					ques.setUid(res.getString("u_id"));
					ques.setSubTime(res.getString("sub_time"));
					ques.setText(res.getString("q_text"));
					ques.setFollow(res.getInt("follow"));
					ques.setClickNum(res.getInt("star_num"));
					ques.setIs_top(res.getInt("is_top"));
					ques.setCategory(res.getString("category"));
					//
					ques.setAccount(res.getString("nickname"));
					ques.setSchool(res.getString("school"));
					ques.setSex(res.getInt("sex"));
					ques.setAge(res.getInt("age"));
					if (res.getInt("is_top") == 0) {
						quesList.add(ques);
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		jdbc.close();
		return quesList;
	}

	public ArrayList<UserStarBean> selectBySearch(String searchText) {
		ArrayList<UserStarBean> quesList = new ArrayList<UserStarBean>();
		DBConn jdbc = DBConn.getInstance();
		jdbc.startConn();
		ResultSet res = jdbc.query(" select * from qiuwen_question" + " s1,qiuwen_userques s2,qiuwen_user s3 "
				+ "where s1.q_id=s2.q_id and s2.u_id = s3.usr_id and s1.q_text like '%" + searchText
				+ "%'  order by s1.sub_time desc");
		if (res != null) {
			try {
				while (res.next()) {
					UserStarBean ques = new UserStarBean();
					ques.setQid(res.getInt("q_id"));
					ques.setUid(res.getString("u_id"));
					ques.setSubTime(res.getString("sub_time"));
					ques.setText(res.getString("q_text"));
					ques.setFollow(res.getInt("follow"));
					ques.setClickNum(res.getInt("click_num"));
					ques.setIs_top(res.getInt("is_top"));
					ques.setCategory(res.getString("category"));
					//
					ques.setAccount(res.getString("usr_account"));
					ques.setSchool(res.getString("school"));
					ques.setSex(res.getInt("sex"));
					ques.setAge(res.getInt("age"));

					quesList.add(ques);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		jdbc.close();
		return quesList;
	}

	public ArrayList<UserStarBean> selectByCate(String category) {
		ArrayList<UserStarBean> quesList = new ArrayList<UserStarBean>();
		DBConn jdbc = DBConn.getInstance();
		jdbc.startConn();
		ResultSet res = jdbc.query(" select * from qiuwen_question" + " s1,qiuwen_userques s2,qiuwen_user s3 "
				+ "where s1.q_id=s2.q_id and s2.u_id = s3.usr_id and s1.category = '" + category
				+ "'  order by s1.sub_time desc");
		if (res != null) {
			try {
				while (res.next()) {
					UserStarBean ques = new UserStarBean();
					ques.setQid(res.getInt("q_id"));
					ques.setUid(res.getString("u_id"));
					ques.setSubTime(res.getString("sub_time"));
					ques.setText(res.getString("q_text"));
					ques.setFollow(res.getInt("follow"));
					ques.setClickNum(res.getInt("click_num"));
					ques.setIs_top(res.getInt("is_top"));
					ques.setCategory(res.getString("category"));
					//
					ques.setAccount(res.getString("usr_account"));
					ques.setSchool(res.getString("school"));
					ques.setSex(res.getInt("sex"));
					ques.setAge(res.getInt("age"));

					quesList.add(ques);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		jdbc.close();
		return quesList;
	}

	public ArrayList<UserStarBean> selectByCateOth() {
		ArrayList<UserStarBean> quesList = new ArrayList<UserStarBean>();
		DBConn jdbc = DBConn.getInstance();
		jdbc.startConn();
		ResultSet res = jdbc.query(" select * from qiuwen_question" + " s1,qiuwen_userques s2,qiuwen_user s3 "
				+ "where s1.q_id=s2.q_id and s2.u_id = s3.usr_id and s1.category != '人文' and s1.category != '计算机'  order by s1.sub_time desc");
		if (res != null) {
			try {
				while (res.next()) {
					UserStarBean ques = new UserStarBean();
					ques.setQid(res.getInt("q_id"));
					ques.setUid(res.getString("u_id"));
					ques.setSubTime(res.getString("sub_time"));
					ques.setText(res.getString("q_text"));
					ques.setFollow(res.getInt("follow"));
					ques.setClickNum(res.getInt("click_num"));
					ques.setIs_top(res.getInt("is_top"));
					ques.setCategory(res.getString("category"));
					//
					ques.setAccount(res.getString("usr_account"));
					ques.setSchool(res.getString("school"));
					ques.setSex(res.getInt("sex"));
					ques.setAge(res.getInt("age"));

					quesList.add(ques);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		jdbc.close();
		return quesList;
	}
}