package store;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class OrderMgr {
	
	private DBConnectionMgr pool;
	
	public OrderMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	//Order Insert
	public void insertOrder(OrderBean order) {		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert tblOrderlist(quantity,date,state,id,productNum)"
					+ " values(?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, order.getQuantity());//몇개
			pstmt.setString(2, UtilMgr.getDay());//언제
			pstmt.setString(3, "1");//주문상태
			pstmt.setString(4, order.getId());//누가
			pstmt.setInt(5, order.getProductNum());//제품번호
			//접수중,접수,입금확인,배송준비,배송중,완료
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	//Order List
	public Vector<OrderBean> getOrder(String id){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<OrderBean>vlist = new Vector<>();
		try {
			con = pool.getConnection();
			sql = "select * from tblOrderlist where id=? "
					+ "order by onum desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				OrderBean order = new OrderBean();
				order.setOnum(rs.getInt("onum"));//주문번호
				order.setQuantity(rs.getInt("quantity"));//몇개
				order.setDate(rs.getString("date"));//언제
				order.setState(rs.getString("state"));//주문상태
				order.setId(rs.getString("id"));//누가	
				order.setProductNum(rs.getInt("productNum"));//상품번호	
				vlist.addElement(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	////////admin mode/////////
	
	//Order All List
	public Vector<OrderBean> getOrderList(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<OrderBean> vlist = new Vector<>();
		try {
			con = pool.getConnection();
			sql = "select * from tblOrderlist order by onum desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				OrderBean order = new OrderBean();
				order.setOnum(rs.getInt("onum"));//주문번호
				order.setQuantity(rs.getInt("quantity"));//몇개
				order.setDate(rs.getString("date"));//언제
				order.setState(rs.getString("state"));//주문상태
				order.setId(rs.getString("id"));//누가		
				order.setProductNum(rs.getInt("productNum"));//상품번호	
				vlist.addElement(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	//Order Detail
		public OrderBean getOrderDetail(int onum){
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			OrderBean order = new OrderBean();
			try {
				con = pool.getConnection();
				sql = "select * from tblOrderlist where onum=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, onum);
				rs = pstmt.executeQuery();
				if(rs.next()){
					order.setOnum(rs.getInt("onum"));//주문번호
					order.setQuantity(rs.getInt("quantity"));//주문수량
					order.setDate(rs.getString("date"));//주문날짜
					order.setState(rs.getString("state"));//주문상태
					order.setId(rs.getString("id"));//주id
					order.setProductNum(rs.getInt("productNum"));//주문상품
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return order;
		}
		
		//Order Update
		public boolean updateOrder(int onum, String state){
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			boolean flag = false;
			try {
				con = pool.getConnection();
				sql = "update tblOrderlist set state=? where onum=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, state);
				pstmt.setInt(2, onum);
				if(pstmt.executeUpdate()==1) flag = true;
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
			return flag;
		}
		
		//Order Delete
		public boolean deleteOrder(int onum){
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			boolean flag = false;
			try {
				con = pool.getConnection();
				sql = "delete from tblOrderlist where onum=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, onum);
				if(pstmt.executeUpdate()==1) flag = true;
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
			return flag;
		}
}

