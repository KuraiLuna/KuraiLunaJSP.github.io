package store;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class StoryMgr {

	private DBConnectionMgr pool;
	
	//public final static String uploadFile = "C:/Jsp/homestar/WebContent/uploadFile/";
	//public final static String uploadFile = "F:/MY Projects/JSP/Medi/WebContent/uploadFile/";
	public final static String uploadFile = "F:/MY Projects/JSP/Medi/WebContent/uploadFile/";
	//한글 파일 처리 인코딩 타입
	public final static String encType = "EUC-KR";
	//파일크기 제한
	public final static int  maxSize = 10*1024*1024;//10메가바이트
	
	public StoryMgr() {
		//pool에는 db연결 객체 Connection을 10개 미리 만든다. 
		pool = DBConnectionMgr.getInstance();
	}
	
	//파일 업로드 ->서버에 저장 된후에 -> db에 저장되야됨
	public boolean storyUpload(HttpServletRequest req) {
		Connection con =null;
		PreparedStatement pstmt = null;
		String sql =null;
		boolean flag = false;
		
		try {
			MultipartRequest multi = 
					new MultipartRequest(req,uploadFile,maxSize, encType,new DefaultFileRenamePolicy());	
			String imgname = multi.getFilesystemName("imgUpload");//실제 업로드되는 파일명
			//파일사이즈구하기
			String id =  multi.getParameter("id");
			String content = multi.getParameter("content");
			File img= multi.getFile("imgUpload");
			int imgsize = (int)img.length();//long형이라 변형
			//DB저장
			con = pool.getConnection();
			sql = "insert tblstory(id, content, imgname,imgsize) values(?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setString(2,content);
			pstmt.setString(3,imgname);
			pstmt.setLong(4,imgsize);
			
			if(pstmt.executeUpdate()==1/*실행된 레코드 갯수*/) {
				//정상적인 실행 
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt);
		}return flag;
		
	}
	
	//리스트
	public Vector<StoryBean> storyList(){
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<StoryBean> vlist = new Vector<StoryBean>();
		
		try {
			con = pool.getConnection();
			sql = "select * from tblstory";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				//레코드 갯수 만큼 만들어 진다. //빈이 겹쳐지는게 아니라 각각의 객체로 새로 만들어진다. 
				StoryBean bean = new StoryBean();
				bean.setSnum(rs.getInt("snum"));
				bean.setId(rs.getString("id"));
				bean.setContent(rs.getString("content"));
				bean.setImgname(rs.getString("imgname"));
				bean.setImgsize(rs.getInt("imgsize"));
				//Vector에 저장
				vlist.addElement(bean);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return vlist;
	}
	
	
	public Vector<StoryBean> todayStoryList(){
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<StoryBean> vlist = new Vector<StoryBean>();
		
		try {
			con = pool.getConnection();
			sql = "select snum from tbllikecount order by likes desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				//레코드 갯수 만큼 만들어 진다. //빈이 겹쳐지는게 아니라 각각의 객체로 새로 만들어진다. 
				StoryBean bean = new StoryBean();
				bean.setSnum(rs.getInt("snum"));
				//Vector에 저장
				vlist.addElement(bean);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return vlist;
	}
	
	//파일 삭제 fch=1&fch=3 => num[] ={1,3}
	public void storyDelete( int snum) {
		
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			con = pool.getConnection();
				//1. 매개변수로 받은 num값으로 파일명 리턴
				sql = "select imgname from tblstory where snum =?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, snum);
				rs = pstmt.executeQuery();
				if(rs.next()) {//파일명이 없으면 continue하라
					//2. 리턴받은 파일명으로 파일을 삭제
					String file = rs.getString(1);//삭제할 파일이 있을경우
					File f = new File(uploadFile+file);
					if(f.exists()) {//파일이 존재한다면 
						f.delete();//파일삭제
					}
				}
				
				//3. 매개변수로 받은 num값으로 레코드 삭제
				sql = "delete from tblstory where snum= ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, snum);
				pstmt.executeUpdate();	
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
	}
	
	public boolean replyUpload(String id , int pos, String comment) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		ResultSet rs = null;
		int ref=0;
		try {
			con = pool.getConnection();
			sql= "select * from tblStoryReply where pos=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pos);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ref++;
			}
			sql = "insert into tblStoryReply(id,pos,comment ,ref) values(?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, pos);
			pstmt.setString(3, comment);
			pstmt.setInt(4, ref);
			int cnt = pstmt.executeUpdate();
			if(cnt>0) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	public  Vector<ReplyBean>  replyList(int pos){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ReplyBean> replyList = new Vector();
		try {
			con = pool.getConnection();
			sql = "select * from tblStoryReply where pos=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pos);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ReplyBean bean= new ReplyBean();
				bean.setId(rs.getString("id"));
				bean.setComment(rs.getString("comment"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				replyList.addElement(bean);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return replyList;
	}
	
public boolean replyDelete( int pos, String comment) {
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();	
			sql = "delete from tblStoryReply where pos =? and comment=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pos);
			pstmt.setString(2, comment);
			int cnt = pstmt.executeUpdate();	
			if(cnt>0) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return flag;
	}
}//public class
