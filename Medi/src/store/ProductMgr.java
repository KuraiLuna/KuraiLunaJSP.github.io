package store;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ProductMgr {
	
	
	private DBConnectionMgr pool;
	//private static final String UPLOAD = "C:/Jsp/homestar/WebContent/store/data/imgs/";
	private static final String UPLOAD = "F:/MY Projects/JSP/Medi/WebContent/store/data/imgs/";
	private static final String ENCTYPE = "EUC-KR";
	private static final int MAXSIZE = 10*1024*1024;

	public ProductMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	//Product List
	public Vector<ProductBean> getProductList(){
		//상품에 대한 리스트 가져오기 db1사용
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ProductBean> vlist = new Vector<>();
		//벡터 생성
		try {
			con = pool.getConnection();
			sql = "select * from tblProduct order by pnum desc";
			
			//최신 상품이 제일 위로 오게끔
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductBean bean = new ProductBean();//bean 생성
				bean.setPnum(rs.getInt("pnum"));//상품번호
				bean.setPname(rs.getString("pname"));//상품이름
				bean.setPrice(rs.getInt("price"));//상품가격
				bean.setDetail(rs.getString("detail"));//상품디테일
				bean.setDate(rs.getString("date"));//상품등록날짜
				bean.setStock(rs.getInt("stock"));//상품재고
				bean.setImage(rs.getString("image"));//상품이미지
				bean.setCategory(rs.getString("category"));//카테고리
				bean.setBest(rs.getInt("best"));//베스트
				vlist.addElement(bean);//vlist에 bean 추가
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	//Product List
		public Vector<ProductBean> getProductBest(){
			//상품에 대한 리스트 가져오기 db1사용
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			Vector<ProductBean> vlist = new Vector<>();
			//벡터 생성
			try {
				con = pool.getConnection();
				sql = "select * from tblProduct where best !=0 order by best";
				
				//최신 상품이 제일 위로 오게끔
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					ProductBean bean = new ProductBean();//bean 생성
					bean.setPnum(rs.getInt("pnum"));//상품번호
					bean.setPname(rs.getString("pname"));//상품이름
					bean.setPrice(rs.getInt("price"));//상품가격
					bean.setDetail(rs.getString("detail"));//상품디테일
					bean.setDate(rs.getString("date"));//상품등록날짜
					bean.setStock(rs.getInt("stock"));//상품재고
					bean.setImage(rs.getString("image"));//상품이미지
					bean.setCategory(rs.getString("category"));//카테고리
					bean.setBest(rs.getInt("best"));//베스트
					vlist.addElement(bean);//vlist에 bean 추가
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return vlist;
		}
	
	//Product List
		public Vector<ProductBean> getProductCategory(String category){
			//상품에 대한 리스트 가져오기 db1사용
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			Vector<ProductBean> vlist = new Vector<>();
			//벡터 생성
			try {
				con = pool.getConnection();
				if(category==null || category.equals("")) {
					sql = "select * from tblProduct order by pnum desc";
				}else {
					sql = "select * from tblProduct where category='"+category+"' order by pnum desc";
				}
				
				//최신 상품이 제일 위로 오게끔
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					ProductBean bean = new ProductBean();//bean 생성
					bean.setPnum(rs.getInt("pnum"));//상품번호
					bean.setPname(rs.getString("pname"));//상품이름
					bean.setPrice(rs.getInt("price"));//상품가격
					bean.setDetail(rs.getString("detail"));//상품디테일
					bean.setDate(rs.getString("date"));//상품등록날짜
					bean.setStock(rs.getInt("stock"));//상품재고
					bean.setImage(rs.getString("image"));//상품이미지
					bean.setCategory(rs.getString("category"));//카테고리
					bean.setBest(rs.getInt("best"));//베스트
					vlist.addElement(bean);//vlist에 bean 추가
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return vlist;
		}
	
	//Product Detail
	public ProductBean getProduct(int pnum) {
		//하나의 제품에 대한 상세정보 db1사용
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ProductBean bean = new ProductBean();//bean생성
		try {
			con = pool.getConnection();
			sql = "select * from tblProduct where pnum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pnum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setPnum(rs.getInt("pnum"));//상품번호
				bean.setPname(rs.getString("pname"));//상품이름
				bean.setPrice(rs.getInt("price"));//상품가격
				bean.setDetail(rs.getString("detail"));//상품상세설명
				bean.setDate(rs.getString("date"));
				bean.setStock(rs.getInt("stock"));//상품재고 
				bean.setImage(rs.getString("image"));//상품이미지
				bean.setCategory(rs.getString("category"));//카테고리
				bean.setBest(rs.getInt("best"));//베스트
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
	
	//Product Stock Reduce
	//장바구니에 넣는거 자체는 재고가 변하지 않음
	public void reduceProduct(OrderBean order /*주문수량*/){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tblProduct set stock=stock-? where pnum=?";
			//stock에서 주문수량만큼 뺌
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, order.getQuantity());//주문수량
			pstmt.setInt(2, order.getProductNum());//상품번호
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	////admin mode/////
	
	//Product Insert : db1
	public boolean insertProduct(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert tblProduct(pname,price,detail,date,stock,image,category,best)"
					+ "values(?,?,?,?,?,?,?,?)";
			MultipartRequest multi = 
					new MultipartRequest(req, UPLOAD, MAXSIZE, 
							ENCTYPE, new DefaultFileRenamePolicy());//중복값
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("pname"));
			pstmt.setInt(2, Integer.parseInt(multi.getParameter("price")));
			pstmt.setString(3, multi.getParameter("detail"));
			pstmt.setString(4, UtilMgr.getDay());
			pstmt.setInt(5, Integer.parseInt(multi.getParameter("stock")));
			if(multi.getFilesystemName("image")==null) {
				pstmt.setString(6, "ready.gif");
			}else {
				pstmt.setString(6, multi.getFilesystemName("image"));
			}
			pstmt.setString(7, multi.getParameter("category"));
			pstmt.setInt(8, Integer.parseInt(multi.getParameter("best")));
			if(pstmt.executeUpdate()==1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	//Product Update
	public boolean updateProduct(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			MultipartRequest multi = 
					new MultipartRequest(req, UPLOAD, MAXSIZE, 
							ENCTYPE, new DefaultFileRenamePolicy());
			if(multi.getFilesystemName("image")==null) {
				sql = "update tblProduct set pname=?, price=?,"
						+ "detail=?, stock=?,category=?, best=? where pnum=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, multi.getParameter("pname"));
				pstmt.setInt(2, Integer.parseInt(multi.getParameter("price")));
				pstmt.setString(3, multi.getParameter("detail"));
				pstmt.setInt(4, Integer.parseInt(multi.getParameter("stock")));
				pstmt.setString(5, multi.getParameter("category"));
				pstmt.setInt(6, Integer.parseInt(multi.getParameter("best")));
				pstmt.setInt(7, Integer.parseInt(multi.getParameter("pnum")));
			}else{
				sql = "update tblProduct set pname=?,price=?,"
						+ "detail=?,stock=?,image=?,category=?, best=? where pnum=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, multi.getParameter("pname"));
				pstmt.setInt(2, Integer.parseInt(multi.getParameter("price")));
				pstmt.setString(3, multi.getParameter("detail"));
				pstmt.setInt(4, Integer.parseInt(multi.getParameter("stock")));
				pstmt.setString(5, multi.getFilesystemName("image"));
				pstmt.setString(6, multi.getParameter("category"));
				pstmt.setInt(7, Integer.parseInt(multi.getParameter("best")));
				pstmt.setInt(8, Integer.parseInt(multi.getParameter("pnum")));
			}
			if(pstmt.executeUpdate()==1) flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	//Product Delete
	public boolean deleteProduct(int pnum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "delete from tblProduct where pnum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pnum);
			if(pstmt.executeUpdate()==1)flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
}