package member.dao;


import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.sql.DataSource;

import member.bean.MemberBean;



public class MemberAdDao {
	public static MemberAdDao instance;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	private MemberAdDao() {
		
	}
	public static MemberAdDao getInstance(){
		if(instance == null){
			instance = new MemberAdDao();
		}
		return instance;
	}
	public void setConnection(Connection conn){
		this.conn = conn;
	}
	
	public String selectLoginId(MemberBean member){
		String loginId = null;
		String sql="SELECT MID FROM MEMBER WHERE MID=? AND MPW=?";
		//String sql="SELECT MEMBER_ID FROM MEMBER1 WHERE MEMBER_ID=? AND MEMBER_PW=?";
		
		
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, member.getMid());
			pstmt.setString(2, member.getMpw());
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				loginId = rs.getString("MID");
			//	loginId = rs.getString("MEMBER_ID");
			}
		}catch(Exception ex){
			System.out.println("ㄴ " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}
		
		return loginId;
	}
	
	public int insertMember(MemberBean member){
		String sql="INSERT INTO MEMBER VALUES (?,?,?,?,?,?,?,?,?,?)";
		int insertCount=0;
		
		try{

			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, member.getMid());
			pstmt.setString(2, member.getMpw());
			pstmt.setString(3, member.getMname());
			pstmt.setString(4, member.getMbirth());
			pstmt.setString(5, member.getMhp());
			pstmt.setString(6, member.getMaddr());
			pstmt.setString(7, member.getMaddrd());
			pstmt.setString(8, member.getMaddrp());
			pstmt.setString(9, member.getMemail());
			pstmt.setString(10, member.getMlic());
			insertCount=pstmt.executeUpdate();
			
		}catch(Exception ex){
			System.out.println("joinMember ����: " + ex);			
		}finally{
			close(pstmt);
		}
		
		return insertCount;
	}
	public MemberBean selectMember(String id){
		String sql="SELECT * FROM MEMBER WHERE MID=? or MNAME=?";
		MemberBean mb = null;
		try{
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, id);
			
			
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
			mb=new MemberBean();
			mb.setMid(rs.getString("MID"));
			mb.setMpw(rs.getString("MPW"));
			mb.setMname(rs.getString("MNAME"));
			mb.setMbirth(rs.getString("MBIRTH"));
			mb.setMhp(rs.getString("MHP"));
			mb.setMaddr(rs.getString("MADDR"));
			mb.setMaddrd(rs.getString("MADDRD"));
			mb.setMaddrp(rs.getString("MADDRP"));
			mb.setMemail(rs.getString("MEMAIL"));
			mb.setMlic(rs.getString("MLIC"));
			
			}
		}catch(Exception ex){
			System.out.println("getDeatilMember ����: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}
		
		return mb;
	}
	public ArrayList<MemberBean> selectMemberList(){
		String sql="select*from member";
		ArrayList<MemberBean> memberList=new ArrayList<MemberBean>();
		MemberBean mb = null;
		try{
			
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				do{
				mb=new MemberBean();
				mb.setMid(rs.getString("MID"));
				mb.setMpw(rs.getString("MPW"));
				mb.setMname(rs.getString("MNAME"));
				mb.setMbirth(rs.getString("MBIRTH"));
				mb.setMhp(rs.getString("MHP"));
				mb.setMaddr(rs.getString("MADDR"));
				mb.setMaddrd(rs.getString("MADDRD"));
				mb.setMaddrp(rs.getString("MADDRP"));
				mb.setMemail(rs.getString("MEMAIL"));
				mb.setMlic(rs.getString("MLIC"));
				memberList.add(mb);
				}while(rs.next());
			}
		}catch(Exception ex){
			System.out.println("getDeatilMember ����: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}
		return memberList;
	}
	
	public ArrayList<MemberBean> selectMember1(String id){
		//String sql="SELECT * FROM MEMBER WHERE MID=?";
		//	String sql="SELECT * FROM MEMBER WHERE MID LIKE '%"+id+'%';
		ArrayList<MemberBean> member1=new ArrayList<MemberBean>();
		String sql="select*from member where mid like '%"+id+"%' or mname like '%"+id+"%'";
		MemberBean mb = null;
		try{
			
			pstmt=conn.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				do{
			mb=new MemberBean();
			mb.setMid(rs.getString("MID"));
			mb.setMpw(rs.getString("MPW"));
			mb.setMname(rs.getString("MNAME"));
			mb.setMbirth(rs.getString("MBIRTH"));
			mb.setMhp(rs.getString("MHP"));
			mb.setMaddr(rs.getString("MADDR"));
			mb.setMaddrd(rs.getString("MADDRD"));
			mb.setMaddrp(rs.getString("MADDRP"));
			mb.setMemail(rs.getString("MEMAIL"));
			mb.setMlic(rs.getString("MLIC"));
			member1.add(mb);
			}while(rs.next());
	}
		}catch(Exception ex){
			System.out.println("getDeatilMember ����: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}
		
		return member1;
	}
	public int deleteMember(String id){
		String sql="DELETE from MEMBER WHERE MID=?";
		int deleteCount = 0;

		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			deleteCount = pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("deleteMember 실패: " + ex);	
		}finally{
			close(pstmt);
		}
		
		return deleteCount;
	}
	public int updateArticle(MemberBean article){

		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql="update member set MNAME=?,MBIRTH=?,MHP=?, MADDR=?,MADDRD=?,MADDRP=?,MEMAIL=?,MLIC=? where MID=?";

		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getMname());
			pstmt.setString(2, article.getMbirth());
			pstmt.setString(3, article.getMhp());
			pstmt.setString(4, article.getMaddr());
			pstmt.setString(5, article.getMaddrd());
			pstmt.setString(6, article.getMaddrp());
			pstmt.setString(7, article.getMemail());
			pstmt.setString(8, article.getMlic());
			pstmt.setString(9, article.getMid());
			updateCount = pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("boardModify ���� : " + ex);
		}finally{
			close(pstmt);
		}

		return updateCount;

	}
	public int selectListCount() {

		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{


			System.out.println("getConnection");
			pstmt=conn.prepareStatement("select count(*) from member");
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1);
			}
		}catch(Exception ex){
			System.out.println("getListCount ����: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}

		return listCount;

	}
	public int selectListCount1(String fieldName,String viewId) {

		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			if(fieldName.equals("All")) {
				String sql = "SELECT count(*) FROM member WHERE concat(mid, mname,mbirth,mhp, maddr) LIKE ? order by mid,mname,mbirth";	
			//	String board_list_sql="select * from member where mid like '%"+viewId+"%' or mname like '%"+viewId+"%' or mhp like '%"+viewId+"%' or maddr like '%"+viewId+"%' order by mid desc limit ?,10";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + viewId.trim() +"%");
				
				rs = pstmt.executeQuery();	
			}else {
			
	//String sql="select * from member where mid like '%"+viewId+"%' or mname like '%"+viewId+"%' order by MID desc,MNAME asc limit ?,10";
	//String sql="select count(*) from member where mid like '%"+viewId+"%' or mname like '%"+viewId+"%' order by MID desc, mname asc";
	String sql="select count(*) from member where "+fieldName+" like '%"+viewId+"%'order by mid desc";
	//SELECT count(*) FROM car WHERE concat(CCODE, CTYPE, CSIZE, CNAME, CPRICE,  CGEAR,  CFUEL ,CSEAT) LIKE ? order by CCODE, CTYPE, CPRICE"
		pstmt = conn.prepareStatement(sql);			
			rs = pstmt.executeQuery();
			}
			if(rs.next()){
				listCount=rs.getInt(1);
			}
		}catch(Exception ex){
			System.out.println("getListCount ����: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}

		return listCount;

	}
	public ArrayList<MemberBean> selectArticleList(int page,int limit){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_list_sql="select * from member order by MID desc,MNAME asc limit ?,10";
		ArrayList<MemberBean> articleList = new ArrayList<MemberBean>();
		MemberBean board = null;
		int startrow=(page-1)*10; //�б� ������ row ��ȣ..	

		try{
			pstmt = conn.prepareStatement(board_list_sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();

			while(rs.next()){
				board = new MemberBean();
				board.setMid(rs.getString("MID"));
				board.setMname(rs.getString("MNAME"));
				board.setMbirth(rs.getString("MBIRTH"));
				board.setMhp(rs.getString("MHP"));
				board.setMaddr(rs.getString("MADDR"));
				board.setMaddrd(rs.getString("MADDRD"));
				board.setMaddrp(rs.getString("MADDRP"));
				board.setMemail(rs.getString("MEMAIL"));
				board.setMlic(rs.getString("MLIC"));
				
				articleList.add(board);
			}

		}catch(Exception ex){
			System.out.println("getBoardList ���� : " + ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return articleList;

	}
	public ArrayList<MemberBean> selectArticleList1(int page,int limit ,String fieldName,String viewId){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//	String board_list_sql="select * from member where mid like '%"+viewId+"%' or mname like '%"+viewId+"%' order by MID desc,MNAME asc limit ?,10";
	
		ArrayList<MemberBean> articleList=new ArrayList<MemberBean>();
		MemberBean board = null;
		int startrow=(page-1)*10;
		
		
		//String sql="select*from member where mid like '%"+id+"%' or mname like '%"+id+"%'";
		
		
	
		try{
			if(fieldName.equals("All")) {
				String sql = "SELECT * FROM member WHERE concat(mid, mname,mbirth,mhp, maddr) LIKE ? order by mid,mname,mbirth limit ?,10";	
			//	String board_list_sql="select * from member where mid like '%"+viewId+"%' or mname like '%"+viewId+"%' or mhp like '%"+viewId+"%' or maddr like '%"+viewId+"%' order by mid desc limit ?,10";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + viewId.trim() +"%");
				pstmt.setInt(2, startrow);
				rs = pstmt.executeQuery();	
			}
			else {
				
			String board_list_sql="select * from member where "+fieldName+" like '%"+viewId+"%' order by mid desc limit ?,10";
			pstmt = conn.prepareStatement(board_list_sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();
			
			}
			while(rs.next()){
				
					board = new MemberBean();
					board.setMid(rs.getString("MID"));
					board.setMpw(rs.getString("MPW"));
					board.setMname(rs.getString("MNAME"));
					board.setMbirth(rs.getString("MBIRTH"));
					board.setMhp(rs.getString("MHP"));
					board.setMaddr(rs.getString("MADDR"));
					board.setMaddrd(rs.getString("MADDRD"));
					board.setMaddrp(rs.getString("MADDRP"));
					board.setMemail(rs.getString("MEMAIL"));
					board.setMlic(rs.getString("MLIC"));
					articleList.add(board);
			}
		}catch(Exception ex){
			System.out.println("getDeatilMember ����: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}
		
		return articleList;
	}
}