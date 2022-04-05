package member.dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.sql.DataSource;

import member.bean.MemberBean;

public class MemberDAO {
	public static MemberDAO instance;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	private MemberDAO() {
		
	}
	public static MemberDAO getInstance(){
		if(instance == null){
			instance = new MemberDAO();
		}
		return instance;
	}
	public void setConnection(Connection conn){
		this.conn = conn;
	}
	
	public String selectLoginId(MemberBean member){
		String loginId = null;
		String sql="SELECT MID FROM MEMBER WHERE MID=? AND MPW=?";
		
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, member.getMid());
			pstmt.setString(2, member.getMpw());
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				loginId = rs.getString("mid");
			}
		}catch(Exception ex){
			System.out.println(" 嚥≪뮄�젃占쎌뵥 占쎈퓠占쎌쑎 " + ex);			
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
			pstmt.setString(5, "010" + member.getMhp());
			pstmt.setString(6, member.getMaddrp());
			pstmt.setString(7, member.getMaddr());
			pstmt.setString(8, member.getMaddrd());
			pstmt.setString(9, member.getMemail());
			pstmt.setString(10, member.getMlic());
			insertCount=pstmt.executeUpdate();
			
		}catch(Exception ex){
			System.out.println("joinMember 占쎈퓠占쎌쑎 : " + ex);			
		}finally{
			close(pstmt);
		}
		
		return insertCount;
	}
	
	public ArrayList<String> memberIdCheckList(){
		String sql="SELECT MID FROM MEMBER";
		ArrayList<String> memberIdCheckList = new ArrayList<String>();
		try{
			
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				do{
					memberIdCheckList.add(rs.getString("MID"));
			} while(rs.next());
			}
			
		}catch(Exception ex){
			System.out.println("getDeatilMember 占쎈퓠占쎌쑎 : " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}
		return memberIdCheckList;
	}
	
	public MemberBean selectMember(String id){
		String sql="SELECT * FROM MEMBER WHERE MID=?";
		MemberBean member = null;
		try{
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
			member=new MemberBean();
			member.setMid(rs.getString("mid"));
			member.setMpw(rs.getString("mpw"));
			member.setMname(rs.getString("mname"));
			member.setMbirth(rs.getString("mbirth"));
			member.setMhp(rs.getString("mhp").substring(3));
			member.setMaddrp(rs.getString("maddrp"));
			member.setMaddr(rs.getString("maddr"));
			member.setMaddrd(rs.getString("maddrd"));
			member.setMemail(rs.getString("memail"));
			member.setMlic(rs.getString("mlic"));
			}
		}catch(Exception ex){
			System.out.println("getDeatilMember 占쎈퓠占쎌쑎 : " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}
		return member;
	}
	

	public int memberClUpdate(MemberBean member) {
		int updateCount = 0;
		String sql = "update member set mpw=?, mhp=?, maddr=?, memail=?, mlic=? where mid=?";
		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMpw());
			pstmt.setString(2, "010" + member.getMhp());
			pstmt.setString(3, member.getMaddr());
			pstmt.setString(4, member.getMemail());
			pstmt.setString(5, member.getMlic());
			pstmt.setString(6, member.getMid());
			updateCount = pstmt.executeUpdate();
		} catch(Exception ex){
			System.out.println("memberClUpdate 占쎈퓠占쎌쑎 : " + ex);		
		} finally {
			close(rs);
			close(pstmt);
		}
		return updateCount;
	}
	
	public int memberClDelete(String mid) {
		int deleteCount = 0;
		try {
			pstmt = conn.prepareStatement("delete from MEMBER where mid = ?");
			pstmt.setString(1, mid.trim());
			deleteCount = pstmt.executeUpdate();

		} catch(Exception ex){
			System.out.println("memberClDelete 占쎈퓠占쎌쑎 : " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}
		return deleteCount;
	}
}