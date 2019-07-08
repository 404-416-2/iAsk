package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entity.UserBean;

import utils.DBConn;

public class UserDAO {
	// 管理员查看所有用户的界面
	public ArrayList<UserBean> selectAll() {
		ArrayList<UserBean> users = new ArrayList<UserBean>();
		DBConn jdbc = DBConn.getInstance();
		jdbc.startConn();
		ResultSet rs = jdbc.query(" select * from qiuwen_user;");
		if (rs != null) {
			try {
				while (rs.next()) {
					UserBean user = new UserBean();
					user.setUsrId(rs.getString("usr_id"));
					user.setNickname(rs.getString("nickname"));
					user.setText(rs.getString("text"));
					user.setUsrPwd(rs.getString("usr_pwd"));
					user.setIsOk(rs.getInt("is_ok"));
					user.setSex(rs.getInt("sex"));
					user.setAge(rs.getInt("age"));
					user.setSchool(rs.getString("school"));
					users.add(user);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		jdbc.close();
		return users;
	}

	// 管理员删除某个用户
	public boolean deleteAccount(String id) {
		DBConn jdbc = DBConn.getInstance();
		jdbc.startTrans();
		String sql1 = "delete from qiuwen_question where u_id = '" + id + "';";
		String sql2 = "delete from qiuwen_user where usr_id = '" + id + "'";
		boolean rs1 = jdbc.execute(sql1);
		boolean rs2 = jdbc.execute(sql2);
		jdbc.commit();
		return rs1 && rs2;
	}

	// 管理员锁定某个用户
	public boolean lockAccount(String id) {
		DBConn jdbc = DBConn.getInstance();
		jdbc.startTrans();
		String sql = "update qiuwen_user set is_ok = '0' where usr_id = '" + id + "'";
		boolean rs = jdbc.execute(sql);
		jdbc.commit();
		return rs;
	}

	// 管理员解锁某个用户
	public boolean unlockAccount(String id) {
		DBConn jdbc = DBConn.getInstance();
		jdbc.startTrans();
		String sql = "update qiuwen_user set is_ok = '1' where usr_id = '" + String.valueOf(id) + "'";
		boolean rs = jdbc.execute(sql);
		jdbc.commit();
		return rs;
	}

	// 管理员查找用户名中包含某关键字的用户
	public ArrayList<UserBean> searchById(String id) {
		ArrayList<UserBean> users = new ArrayList<UserBean>();
		DBConn jdbc = DBConn.getInstance();
		jdbc.startConn();
		ResultSet rs = jdbc.query("select * from qiuwen_user where usr_id like '%" + id + "%'" + " or nickname like '%"
				+ id + "%' or school like '%" + id + "%';");
		if (rs != null) {
			try {
				while (rs.next()) {
					UserBean user = new UserBean();
					user.setUsrId(rs.getString("usr_id"));
					user.setNickname(rs.getString("nickname"));
					user.setText(rs.getString("text"));
					user.setUsrPwd(rs.getString("usr_pwd"));
					user.setIsOk(rs.getInt("is_ok"));
					user.setSex(rs.getInt("sex"));
					user.setAge(rs.getInt("age"));
					user.setSchool(rs.getString("school"));
					users.add(user);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		jdbc.close();
		return users;
	}

	public ResultSet selectIsOk(int uid) {
		DBConn jdbc = DBConn.getInstance();
		jdbc.startConn();
		String sql = " select is_ok from qiuwen_user where usr_id=" + uid;
		ResultSet rs = jdbc.query(sql);
		jdbc.close();
		return rs;
	}

	public ResultSet selectAccount(String account, String pwd) {
		DBConn jdbc = DBConn.getInstance();
		jdbc.startConn();
		String sql = " select usr_id,nickname,is_ok from qiuwen_user where usr_id='" + account + "' and usr_pwd='" + pwd
				+ "'";
		ResultSet rs = jdbc.query(sql);
		jdbc.close();
		return rs;
	}

	public int insertAccount(String account, String pwd) throws SQLException {
		DBConn jdbc = DBConn.getInstance();
		jdbc.startTrans();
		String sql = "insert into qiuwen_user (usr_id,usr_pwd,is_ok,sex,age,school) values('" + account + "','" + pwd
				+ "',1,-1,-1,'未知学校')";
		boolean rs = jdbc.execute(sql);
		jdbc.commit();
		return rs ? 1 : 0;

	}

	public boolean updateSchool(int quesId, String text) {
		DBConn jdbc = DBConn.getInstance();
		jdbc.startTrans();
		boolean rs = jdbc.execute(" update qiuwen_user set school = '" + text + "' where usr_id = " + quesId);
		jdbc.commit();
		return rs;

	}
}