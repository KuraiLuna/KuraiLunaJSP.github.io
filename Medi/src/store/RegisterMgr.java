package store;

import java.sql.*;
import java.util.*;

public class RegisterMgr {

	private DBConnectionMgr pool = null;

	public RegisterMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.out.println("Error : 커넥션 가져오기 실패!!");
		}
	}

	public boolean checkId(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select id from tblLogin where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}

	public Vector<ZipcodeBean> zipcodeRead(String area) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ZipcodeBean> zipList = new Vector<ZipcodeBean>();
		try {
			con = pool.getConnection();
			sql = "select * from tblZipcode where area1 like ? or area2 like ? or area3 like ? or area4 like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + area + "%");
			pstmt.setString(2, "%" + area + "%");
			pstmt.setString(3, "%" + area + "%");
			pstmt.setString(4, "%" + area + "%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
					ZipcodeBean zipBean = new ZipcodeBean();
					zipBean.setZipcode(rs.getString(1));
					zipBean.setArea1(rs.getString(2));
					zipBean.setArea2(rs.getString(3));
					zipBean.setArea3(rs.getString(4));
					zipBean.setArea4(rs.getString(5));
					zipList.addElement(zipBean);
			}					
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return zipList;
	}

	public String insertResiter(LoginBean logBean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		String id = null;
		try {
			con = pool.getConnection();
			sql = "insert tblLogin(id,pass,name,email,phone,zipcode,address,birth) values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, logBean.getId());
			pstmt.setString(2, logBean.getPass());
			pstmt.setString(3, logBean.getName());
			pstmt.setString(4, logBean.getEmail());
			pstmt.setString(5, logBean.getPhone());
			pstmt.setString(6, logBean.getZipcode());
			pstmt.setString(7, logBean.getAddress());
			pstmt.setString(8, logBean.getBirth());
			int count = pstmt.executeUpdate();
			if (count > 0)
				id = logBean.getId();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return id;
	}

	public int loginCheck(String id, String pass) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int mode = 0;
		// 0-id false, 1-id true pass-false, 2-id&pass true
		try {
			if (!checkId(id))
				return mode;
			con = pool.getConnection();
			sql = "select id, pass from tblLogin where id=? and pass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs = pstmt.executeQuery();
			if (rs.next())
				mode = 2;
			else
				mode = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return mode;
	}

	public boolean updateRegister(LoginBean logBean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "update tblLogin set pass=?,name=?," 
			+ "email=?,phone=?,zipcode=?,address=?, birth=? "
					+ "where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, logBean.getPass());
			pstmt.setString(2, logBean.getName());
			pstmt.setString(3, logBean.getEmail());
			pstmt.setString(4, logBean.getPhone());
			pstmt.setString(5, logBean.getZipcode());
			pstmt.setString(6, logBean.getAddress());
			pstmt.setString(7, logBean.getBirth());
			pstmt.setString(8, logBean.getId());
			int count = pstmt.executeUpdate();
			if (count > 0)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}

	public LoginBean getRegister(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		LoginBean logBean = new LoginBean();
		try {
			con = pool.getConnection();
			sql = "select * from tblLogin where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				logBean.setId(rs.getString("id"));
				logBean.setPass(rs.getString("pass"));
				logBean.setName(rs.getString("name"));
				logBean.setPhone(rs.getString("phone"));
				logBean.setZipcode(rs.getString("zipcode"));
				logBean.setAddress(rs.getString("address"));
				logBean.setEmail(rs.getString("email"));
				logBean.setBirth(rs.getString("birth"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return logBean;
	}

	public boolean adminCheck(String admin_id, String admin_pass) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select admin_id, admin_pass from tblAdmin where admin_id=? "
					+ "and admin_pass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, admin_id);
			pstmt.setString(2, admin_pass);
			rs = pstmt.executeQuery();
			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return flag;
	}

	public Vector<LoginBean> getRegisterList() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<LoginBean> rlist = new Vector<>();
		try {
			con = pool.getConnection();
			sql = "select * from tblRegister";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				LoginBean logBean = new LoginBean();
				logBean.setId(rs.getString("id"));
				logBean.setPass(rs.getString("pass"));
				logBean.setName(rs.getString("name"));
				logBean.setPhone(rs.getString("phone"));
				logBean.setEmail(rs.getString("email"));
				rlist.addElement(logBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return rlist;
	}
	public ArrayList<String> idFind(String name,String phone, String birth) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ArrayList<String>  idlist = new ArrayList();
		
		try {
			con = pool.getConnection();
			sql = "select id from tblLogin where name=? and phone=? and birth=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,name);
			pstmt.setString(2,phone);
			pstmt.setString(3,birth);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				idlist.add(rs.getString(1));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return idlist;
	}
	public String passFind(String name,String id,String phone, String birth) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String pass = null;
		try {
			con = pool.getConnection();
			sql = "select pass from tblLogin where name =? and "
					+ "id=? and phone=? and birth=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			pstmt.setString(3, phone);
			pstmt.setString(4, birth);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pass = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return pass;
	}
	
	/*//Send id, pass
	public void sendAccount(String id) {
		LoginBean bean = getRegister(id);
		String pass = bean.getPass();
		String title = "OOO.com에서 아이디와 비밀번호 전송";
		String content = "id : " + id + ", " + "pass : " + pass;
		String toEmail = bean.getEmail();
		GmailMail.send(title, content, toEmail);
	}*/
}








