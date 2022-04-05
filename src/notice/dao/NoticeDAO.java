package notice.dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import notice.bean.NoticeBean;


public class NoticeDAO {

	DataSource ds;
	Connection conn;
	private static NoticeDAO noticeDAO;

	private NoticeDAO() {
	}

	public static NoticeDAO getInstance(){
		if(noticeDAO == null){
			noticeDAO = new NoticeDAO();
		}
		return noticeDAO;
	}

	public void setConnection(Connection conn){
		this.conn = conn;
	}

	// 리스트 카운트
	public int selectListCount() {

		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{


			System.out.println("getConnection");
			pstmt=conn.prepareStatement("select count(*) from notice");
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1);
			}
		}catch(Exception ex){
			System.out.println("getListCount Error : " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}

		return listCount;

	}
	
	public int searchListCount(String noticeSearch) {

		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{


			System.out.println("getConnection");
			pstmt=conn.prepareStatement("select count(*) from notice where NTITLE like '%"+noticeSearch+"%'");
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1);
			}
		}catch(Exception ex){
			System.out.println("getListCount Error : " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}

		return listCount;

	}

	//�� ��� ����.	
	public ArrayList<NoticeBean> selectArticleList(int page,int limit){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="select * from notice order by NNUM desc, NDATE asc limit ?,10";
		ArrayList<NoticeBean> articleList = new ArrayList<NoticeBean>();
		NoticeBean notice = null;
		int startrow=(page-1)*10; //읽기 시작할 row 번호..	

		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();

			while(rs.next()){
				notice = new NoticeBean();
				notice.setNNUM(rs.getInt("NNUM"));
				notice.setNTITLE(rs.getString("NTITLE"));
				notice.setNCON(rs.getString("NCON"));
				notice.setNFILE(rs.getString("NFILE"));
				notice.setNREAD(rs.getInt("NREAD"));
				notice.setNDATE(rs.getDate("NDATE"));
				articleList.add(notice);
			}

		}catch(Exception ex){
			System.out.println("getNoticeList error : " + ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return articleList;

	}
	
	public ArrayList<NoticeBean> searchArticleList(String noticeSearch, int page, int limit){

		ArrayList<NoticeBean> articleList2 = new ArrayList<NoticeBean>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="select * from notice where NTITLE like '%"+noticeSearch+"%' order by NNUM desc, NDATE limit ?,10";
		NoticeBean notice = null;
		int startrow=(page-1)*10;

		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();

			while(rs.next()){
				notice = new NoticeBean();
				notice.setNNUM(rs.getInt("NNUM"));
				notice.setNTITLE(rs.getString("NTITLE"));
				notice.setNCON(rs.getString("NCON"));
				notice.setNFILE(rs.getString("NFILE"));
				notice.setNREAD(rs.getInt("NREAD"));
				notice.setNDATE(rs.getDate("NDATE"));
				articleList2.add(notice);
			}

		}catch(Exception ex){
			System.out.println("getNoticeList error : " + ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return articleList2;

	}
	

	//�� ���� ����.
	public NoticeBean selectArticle(int nNUM){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		NoticeBean noticeBean = null;

		try{
			pstmt = conn.prepareStatement(
					"select * from NOTICE where NNUM = ?");
			pstmt.setInt(1, nNUM);
			rs= pstmt.executeQuery();

			if(rs.next()){
				noticeBean = new NoticeBean();
				noticeBean.setNNUM(rs.getInt("NNUM"));
				noticeBean.setNTITLE(rs.getString("NTITLE"));
				noticeBean.setNCON(rs.getString("NCON"));
				noticeBean.setNFILE(rs.getString("NFILE"));
				noticeBean.setNREAD(rs.getInt("NREAD"));
				noticeBean.setNDATE(rs.getDate("NDATE"));
			}
		}catch(Exception ex){
			System.out.println("getDetail error : " + ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return noticeBean;

	}

	//�� ���.
	public int insertArticle(NoticeBean article){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="";
		int insertCount=0;

		try{
			pstmt=conn.prepareStatement("select max(nNUM) from NOTICE");
			rs = pstmt.executeQuery();


			sql="insert into NOTICE (NTITLE, NCON, NFILE, NREAD, NDATE) " + 
			"values(?,?,?,?,now())";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getNTITLE());
			pstmt.setString(2, article.getNCON());
			pstmt.setString(3, article.getNFILE());
			pstmt.setInt(4, 0);


			insertCount=pstmt.executeUpdate();

		}catch(Exception ex){
			System.out.println("noticeInsert error : "+ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}

	//�� �亯.

	//�� ����.
	public int updateArticle(NoticeBean noticeBean){

		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql="update notice set NTITLE=?, NCON=? where NNUM=?";

		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, noticeBean.getNTITLE());
			pstmt.setString(2, noticeBean.getNCON());
			pstmt.setInt(3, noticeBean.getNNUM());
			updateCount = pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("noticeModify error : " + ex);
		}finally{
			close(pstmt);
		}

		return updateCount;

	}
	

	//�� ����.
	public int deleteArticle(int nNUM){

		PreparedStatement pstmt = null;
		String sql="delete from NOTICE where NNUM=?";
		int deleteCount=0;

		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, nNUM);
			deleteCount=pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("noticeDelete error : "+ex);
		}	finally{
			close(pstmt);
		}

		return deleteCount;

	}

	//��ȸ�� ������Ʈ.
	public int updateReadCount(int nNUM){

		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql="update notice set NREAD = "+
				"NREAD+1 where NNUM = "+nNUM;

		try{
			pstmt=conn.prepareStatement(sql);
			updateCount = pstmt.executeUpdate();
		}catch(SQLException ex){
			System.out.println("setReadCountUpdate error : "+ex);
		}
		finally{
			close(pstmt);

		}

		return updateCount;

	}

	public boolean isArticleNoticeWriter(int nNUM){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="select * from NOTICE where NNUM=?";
		boolean isWriter = false;

		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, nNUM);
			rs=pstmt.executeQuery();
			rs.next();

		}catch(SQLException ex){
			System.out.println("isNoticeWriter error : "+ex);
		}
		finally{
			close(pstmt);
		}

		return isWriter;
	
	}
	
	public ArrayList<NoticeBean> mainArticle(){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="select NTITLE, NNUM from NOTICE order by NNUM desc limit 2";
		ArrayList<NoticeBean> articleList = new ArrayList<NoticeBean>();
		NoticeBean noticeBean = null;

		try{
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				noticeBean = new NoticeBean();
				noticeBean.setNNUM(rs.getInt("NNUM"));
				noticeBean.setNTITLE(rs.getString("NTITLE"));
				articleList.add(noticeBean);
			}
		}catch(Exception ex){
			System.out.println("mainArticle error : "+ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return articleList;

	}


}
