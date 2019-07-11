package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import utils.DBConn;
import entity.UserBean;

/**
 * 用于处理好友的dao
 * 
 * @author s
 *
 */
public class UserFriendDao {

	/**
	 * 查找一个用户的所有好友
	 * 
	 * @param hostUserId 该用户userid
	 * @return 好友userid列表
	 */
	public ArrayList<String> selectALLUserFriend(String hostUserId) {
		ArrayList<String> friendList = new ArrayList<String>();
		try {
			DBConn jdbc = DBConn.getInstance();
			Connection connection = jdbc.startConn();
			PreparedStatement pstmt = connection
					.prepareStatement("select friend_id from qiuwen_userfriend where u_id = ?");
			pstmt.setString(1, hostUserId);
			ResultSet result = pstmt.executeQuery();

			while (result.next()) {
				friendList.add(result.getString(1));
			}

			jdbc.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return friendList;
	}

	public boolean deleteUserFriend(String hostId, String friendId) {
		try {
			DBConn jdbc = DBConn.getInstance();
			Connection connection = jdbc.startConn();
			PreparedStatement pstmt = connection
					.prepareStatement("delete from qiuwen_userfriend where u_id = ? and friend_id = ? ");
			pstmt.setString(1, hostId);
			pstmt.setString(2, friendId);
			int result = pstmt.executeUpdate();

			if (result != 0) {
				jdbc.commit();
			} else {
				jdbc.rollback();
			}
			jdbc.close();

			boolean res = false;
			if (result != 0) {
				res = true;
			}
			return res;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;

	}
}
