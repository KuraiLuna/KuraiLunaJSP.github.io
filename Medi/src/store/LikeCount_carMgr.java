package store;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeCount_carMgr {
	
	private DBConnectionMgr pool = null;
	
	public LikeCount_carMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	public boolean insertLike(int snum, String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		int like = 1;
		try {
			con = pool.getConnection();
			sql = "insert into tblLikeCount_car(snum, id, likes) values(?,?,?) ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, snum);
			pstmt.setString(2, id);
			pstmt.setInt(3, like);
			int cnt = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	public int getLikesCount( int snum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int count=0;
		try {
			con = pool.getConnection();
			sql = "select count(likes) from tblLikeCount_car where snum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, snum);
			rs = pstmt.executeQuery();
			if(rs.next()) 
				count = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return count;
	}
	
	
	public boolean  getLikes( int snum, String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select snum from tblLikeCount_car where snum=? and id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, snum);
			pstmt.setString(2,  id);
			rs = pstmt.executeQuery();
			if(rs.next())
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	
	public void deleteLikes(int snum, String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;		
		try {
			con = pool.getConnection();
			sql = "delete from tblLikeCount_car where snum=? and id =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, snum);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		
	}
	
}
