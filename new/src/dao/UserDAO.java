package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.JDBC42CallableStatement;

import entity.UserBean;

import utils.DBConn;

public class UserDAO {
	// 管理员查看所有用户的界面
	public ArrayList<UserBean> selectAll() {
		ArrayList<UserBean> users = new ArrayList<UserBean>();
		try {
			DBConn jdbc = DBConn.getInstance();
			Connection connection = jdbc.startConn();
			PreparedStatement pstmt = connection.prepareStatement("select * from qiuwen_user");
			ResultSet rs = pstmt.executeQuery();

			if (rs != null) {
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
			}
			jdbc.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return users;
	}

	// 管理员删除某个用户
	public boolean deleteAccount(String id) {
		DBConn jdbc = DBConn.getInstance();
		try {
			Connection connection = jdbc.startConn();
			PreparedStatement pstmt1 = connection.prepareStatement("delete from qiuwen_question where u_id = ?");
			PreparedStatement pstmt2 = connection.prepareStatement("delete from qiuwen_user where usr_id = ?");
			PreparedStatement pstmt3 = connection.prepareStatement("delete from qiuwen_quesanswer where u_id = ?");
			pstmt1.setString(1, id);
			pstmt2.setString(1, id);
			pstmt3.setString(1, id);
			int rs2 = pstmt2.executeUpdate();
			boolean rs = false;
			if (rs2 == 0) {
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

	// 管理员锁定某个用户
	public boolean lockAccount(String id) {
		DBConn jdbc = DBConn.getInstance();
		try {
			Connection connection = jdbc.startConn();
			PreparedStatement pstmt = connection
					.prepareStatement("update qiuwen_user set is_ok = '0' where usr_id = ? ");
			pstmt.setString(1, id);
			int res = pstmt.executeUpdate();

			if (res == 0) {
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

	// 管理员解锁某个用户
	public boolean unlockAccount(String id) {
		DBConn jdbc = DBConn.getInstance();
		try {
			Connection connection = jdbc.startConn();
			PreparedStatement pstmt = connection
					.prepareStatement("update qiuwen_user set is_ok = '1' where usr_id = ? ");
			pstmt.setString(1, id);
			int res = pstmt.executeUpdate();
			if (res == 0) {
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

	// 管理员查找用户名中包含某关键字的用户
	public ArrayList<UserBean> searchById(String id) {
		ArrayList<UserBean> users = new ArrayList<UserBean>();
		try {
			DBConn jdbc = DBConn.getInstance();
			Connection connection = jdbc.startConn();
			PreparedStatement pstmt = connection.prepareStatement(
					"select * from qiuwen_user where usr_id like ? or nickname like ? or school like ?");
			pstmt.setString(1, "%" + id + "%");
			pstmt.setString(2, "%" + id + "%");
			pstmt.setString(3, "%" + id + "%");
			ResultSet rs = pstmt.executeQuery();
			if (rs != null) {
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
			}
			jdbc.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return users;
	}

	public ResultSet selectIsOk(String uid) {
		DBConn jdbc = DBConn.getInstance();
		try {
			Connection connection = jdbc.startConn();
			PreparedStatement pstmt = connection.prepareStatement("select is_ok from qiuwen_user where usr_id = ?");
			pstmt.setString(1, uid);
			ResultSet rs = pstmt.executeQuery();
			jdbc.close();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public ResultSet selectAccount(String account, String pwd) {
		DBConn jdbc = DBConn.getInstance();
		try {
			Connection connection = jdbc.startConn();
			PreparedStatement pstmt = connection
					.prepareStatement("select usr_id,nickname,is_ok from qiuwen_user where usr_id = ? and usr_pwd = ?");
			pstmt.setString(1, account);
			pstmt.setString(2, pwd);
			ResultSet rs = pstmt.executeQuery();
			jdbc.close();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public int insertAccount(String account, String pwd) throws SQLException {
		DBConn jdbc = DBConn.getInstance();
		try {
			Connection connection = jdbc.startConn();
			PreparedStatement pstmt = connection.prepareStatement(
					"insert into qiuwen_user (nickname, usr_id, usr_pwd, is_ok, sex, age, school, text) "
							+ "values(?, ?, ?, ?, ?, ?, ?, ?)");
			pstmt.setString(1, "无名氏");
			pstmt.setString(2, account);
			pstmt.setString(3, pwd);
			pstmt.setInt(4, 1);
			pstmt.setInt(5, 1);
			pstmt.setInt(6, 0);
			pstmt.setString(7, "西北工业大学");
			pstmt.setString(8, "这个人懒死了，什么都没有写");
			int rs = pstmt.executeUpdate();
			if (rs == 0) {
				jdbc.rollback();
				return 0;
			} else {
				jdbc.commit();
				return 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		jdbc.close();
		return 0;
	}

	public boolean updateSchool(String usrId, String school) {

		DBConn jdbc = DBConn.getInstance();
		try {
			Connection connection = jdbc.startConn();
			PreparedStatement pstmt = connection.prepareStatement("update qiuwen_user set school = ? where usr_id = ?");
			pstmt.setString(1, school);
			pstmt.setString(2, usrId);

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

	public boolean updateSex(String usrId, int sex) {

		DBConn jdbc = DBConn.getInstance();
		try {
			Connection connection = jdbc.startConn();
			PreparedStatement pstmt = connection.prepareStatement("update qiuwen_user set sex = ? where usr_id = ? ");
			pstmt.setInt(1, sex);
			pstmt.setString(2, usrId);

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

	public boolean updateAge(String usrId, int age) {

		DBConn jdbc = DBConn.getInstance();
		try {
			Connection connection = jdbc.startConn();
			PreparedStatement pstmt = connection.prepareStatement("update qiuwen_user set age = ? where usr_id = ? ");
			pstmt.setInt(1, age);
			pstmt.setString(2, usrId);

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

	public boolean updateNickName(String usrId, String nickname) {

		DBConn jdbc = DBConn.getInstance();
		try {
			Connection connection = jdbc.startConn();
			PreparedStatement pstmt = connection
					.prepareStatement("update qiuwen_user set nickname = ? where usr_id = ?");
			pstmt.setString(1, nickname);
			pstmt.setString(2, usrId);

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

	public boolean updatetext(String usrId, String text) {

		DBConn jdbc = DBConn.getInstance();
		try {
			Connection connection = jdbc.startConn();
			PreparedStatement pstmt = connection.prepareStatement("update qiuwen_user set text = ? where usr_id = ?");
			pstmt.setString(1, text);
			pstmt.setString(2, usrId);
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
}