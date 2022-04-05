package res.dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.sql.DataSource;

import car.bean.CarBean;
import member.bean.MemberBean;
import res.bean.ResBean;
import res.bean.ResClBean;

public class ResAdDAO {
	public static ResAdDAO instance;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	public ResAdDAO() {
		
	}
	public static ResAdDAO getInstance(){
		if(instance == null){
			instance = new ResAdDAO();
		}
		return instance;
	}
	public void setConnection(Connection conn){
		this.conn = conn;
	}
	public String selectLoginId(ResBean resb){
		String loginId = null;
		String sql="SELECT Rid FROM res WHERE Rnum=?";
		return loginId;
	}	

//예약 리스트 불러오기
public ArrayList<ResBean> selectResAdList(int page, int limit){

	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String resb_list_sql="select r.rnum, r.rid, m.mname, m.mhp, m.mlic, r.rcode, " + 
			"date_format(r.rstart, '%Y-%m-%d') rstart, date_format(r.rend, '%Y-%m-%d') rend, " + 
			"((ABS(DATEDIFF(r.rstart, r.rend)))+1)*c.cprice rtotal, r.rcancel, c.cfile " + 
			"from res r join member m on r.rid=m.mid join car c on r.rcode=c.ccode order by r.rnum desc limit ?,10";
	ArrayList<ResBean> resAdList = new ArrayList<ResBean>();
	ResBean resb = null;
	int startrow=(page-1)*10;
	try{
		pstmt = conn.prepareStatement(resb_list_sql);
		pstmt.setInt(1, startrow);
		rs = pstmt.executeQuery();

		while(rs.next()){
			resb = new ResBean();
			resb.setRnum(rs.getInt("rnum"));
			resb.setRid(rs.getString("rid"));
			resb.setMname(rs.getString("mname"));
			resb.setMhp(rs.getString("mhp"));
			resb.setMlic(rs.getString("mlic"));
			resb.setRcode(rs.getString("rcode"));
			resb.setRstart(rs.getString("rstart"));
			resb.setRend(rs.getString("rend"));
			resb.setRtotal(rs.getInt("rtotal"));
			resb.setRcancel(rs.getString("rcancel"));
			resb.setCfile(rs.getString("cfile"));
			resAdList.add(resb);
		}

	}catch(Exception ex){
		System.out.println("getResAdList 에러 : " + ex);
	}finally{
		close(rs);
		close(pstmt);
	}

	return resAdList;

	}
	public int resAdDelete(String deleteId){
	
		PreparedStatement pstmt = null;
		String res_delete_sql="delete from res where rnum=?";
		int deleteCount=0;
	
		try{
			pstmt=conn.prepareStatement(res_delete_sql);
			pstmt.setString(1, deleteId);
			deleteCount=pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("resAdDelete 에러 : "+ex);
		}	finally{
			close(pstmt);
		}
	
		return deleteCount;
	}
	public ResBean resAdView(String resAdViewNum) {
		String resb_view_sql="select r.rnum, r.rid, m.mname, m.mhp, m.mlic, r.rcode, " + 
				"date_format(r.rstart, '%Y-%m-%d') rstart, date_format(r.rend, '%Y-%m-%d') rend, " + 
				"((ABS(DATEDIFF(r.rstart, r.rend)))+1)*c.cprice rtotal, r.rcancel, c.cprice, c.cfile " + 
				"from res r join member m on r.rid=m.mid join car c on r.rcode=c.ccode where r.rnum = ?";
		ResBean resb = null;
		try{
			pstmt = conn.prepareStatement(resb_view_sql);
			pstmt.setString(1, resAdViewNum);
			rs = pstmt.executeQuery();

			while(rs.next()){
				resb = new ResBean();
				resb.setRnum(rs.getInt("rnum"));
				resb.setRid(rs.getString("rid"));
				resb.setMname(rs.getString("mname"));
				resb.setMhp(rs.getString("mhp"));
				resb.setMlic(rs.getString("mlic"));
				resb.setRcode(rs.getString("rcode"));
				resb.setRstart(rs.getString("rstart"));
				resb.setRend(rs.getString("rend"));
				resb.setRtotal(rs.getInt("rtotal"));
				resb.setRcancel(rs.getString("rcancel"));
				resb.setCprice(rs.getString("cprice"));
				resb.setCfile(rs.getString("cfile"));
				
			}

		}catch(Exception ex){
			System.out.println("getResAdList 에러 : " + ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return resb;
	}

	public int updateAdRes(ResBean article) {
		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql="update res set rcode=?,rstart=?,rend=?,rcancel=? where rnum=?";

		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getRcode());
			pstmt.setString(2, article.getRstart());
			pstmt.setString(3, article.getRend());
			pstmt.setString(4, article.getRcancel());
			pstmt.setInt(5, article.getRnum());


			updateCount = pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("UpdateAdrRes 실패 : " + ex);
		}finally{
			close(pstmt);
		}

		return updateCount;

	}
	//예약 리스트 카운트
	public int resAdListCount() {

		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			System.out.println("getConnection");
			pstmt=conn.prepareStatement("select count(*) from res");
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1);
			}
		} catch(Exception ex){
			System.out.println("getListCount 에러: " + ex);			
		} finally{
			close(rs);
			close(pstmt);
		}

		return listCount;

	}
	
	public int resInsert(ResBean resb) {

		PreparedStatement pstmt = null;
		String sql = "";
		int insertCount = 0;
		
		try{
			sql="insert into res (rid, rcode, rstart, rend) values (?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, resb.getRid());
			pstmt.setString(2, resb.getRcode());
			pstmt.setString(3, resb.getRstart());
			pstmt.setString(4, resb.getRend());
			
			insertCount = pstmt.executeUpdate();
			
			System.out.println("예약완료");
		}catch(Exception ex){
			System.out.println("resInsert 에러 : " + ex);
		}finally{
			close(pstmt);
		}
		return insertCount;
	}

	
	public MemberBean selectMember(String id){
		String sql="SELECT * FROM MEMBER WHERE MID=?";
		MemberBean mb = null;
		try{
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
			mb=new MemberBean();
			mb.setMid(rs.getString("MID"));
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
			System.out.println("예약 회원 검색 실패: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}
		System.out.println("DAO에서 mb값은 = " + mb);
		return mb;
	}
	
	public ArrayList<ResBean> resAdSearchList(String id, int page, int limit) {
		String sql="select r.rnum, r.rid, m.mname, m.mhp, m.mlic, r.rcode, " + 
				"date_format(r.rstart, '%Y-%m-%d') rstart, date_format(r.rend, '%Y-%m-%d') rend, " + 
				"((ABS(DATEDIFF(r.rstart, r.rend)))+1)*c.cprice rtotal, r.rcancel " + 
				"from res r join member m on r.rid=m.mid join car c on r.rcode=c.ccode where r.rid like '%"+id+"%' or m.mname like '%"+id+"%' order by r.rnum desc limit ?,?";
		ArrayList<ResBean> resb1=new ArrayList<ResBean>();
		ResBean resb = null;
		int startrow=(page-1)*10;
		try{
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, limit);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				do{
				resb = new ResBean();
				resb.setRnum(rs.getInt("rnum"));
				resb.setRid(rs.getString("rid"));
				resb.setMname(rs.getString("mname"));
				resb.setMhp(rs.getString("mhp"));
				resb.setMlic(rs.getString("mlic"));
				resb.setRcode(rs.getString("rcode"));
				resb.setRstart(rs.getString("rstart"));
				resb.setRend(rs.getString("rend"));
				resb.setRtotal(rs.getInt("rtotal"));
				resb.setRcancel(rs.getString("rcancel"));
				resb1.add(resb);
				}while(rs.next());
			
			}
		}catch(Exception ex){
			System.out.println("getSearchRes 에러 : " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}
		
		return resb1;
	
	}
	public CarBean selectCar(String id) {
		String sql="SELECT * FROM CAR WHERE CCODE=?";
		CarBean cb = null;
		try{
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
			cb=new CarBean();
			cb.setcCode(rs.getString("CCODE"));
			cb.setcType(rs.getString("CTYPE"));
			cb.setcSize(rs.getString("CSIZE"));
			cb.setcName(rs.getString("CNAME"));
			cb.setcPrice(rs.getInt("CPRICE"));
			cb.setcGear(rs.getString("CGEAR"));
			cb.setcFuel(rs.getString("CFUEL"));
			cb.setcSeat(rs.getString("CSEAT"));
			cb.setcFile(rs.getString("CFILE"));
			
			}
		}catch(Exception ex){
			System.out.println("차량 검색 실패: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}
		System.out.println("DAO에서 cb값은 = " + cb);
		return cb;
	}
	public ArrayList<String> resCarCheckList() {
		String sql="SELECT CCODE FROM CAR";
		ArrayList<String> resCarCheckList = new ArrayList<String>();
		try{
			
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				do{
					resCarCheckList.add(rs.getString("CCODE"));
			} while(rs.next());
			}
			
		}catch(Exception ex){
			System.out.println("getDeatilCar 에러  : " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}
		return resCarCheckList;
	}
	public ArrayList<ResBean> selectResAdSearchList(int page, int limit, String fieldName, String viewId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<ResBean> resList=new ArrayList<ResBean>();
		ResBean rb = null;
		int startrow=(page-1)*10;

		try{
			if(fieldName.equals("All")) {
				String sql = "select * from res r join member m on r.rid=m.mid join car c on r.rcode=c.ccode where concat(rnum, mid, mname, rcode, rstart, rend, rcancel) like ? order by r.rnum limit ?,10";	
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + viewId.trim() +"%");
				pstmt.setInt(2, startrow);
				rs = pstmt.executeQuery();	
			}
			else {
				
			String board_list_sql="select * from res r join member m on r.rid=m.mid join car c on r.rcode=c.ccode where "+fieldName+" like '%"+viewId+"%'order by r.rnum desc limit ?,10";
			pstmt = conn.prepareStatement(board_list_sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();
			
			}
			while(rs.next()){
				
				rb = new ResBean();
				rb.setRnum(rs.getInt("rnum"));
				rb.setRid(rs.getString("rid"));
				rb.setMname(rs.getString("mname"));
				rb.setMhp(rs.getString("mhp"));
				rb.setMlic(rs.getString("mlic"));
				rb.setRcode(rs.getString("rcode"));
				rb.setRstart(rs.getString("rstart"));
				rb.setRend(rs.getString("rend"));
				rb.setRcancel(rs.getString("rcancel"));
				resList.add(rb);
			}
		}catch(Exception ex){
			System.out.println("getResSearchList 에러 : " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}
		
		return resList;
	}
	public int resAdListCount1(String fieldName, String viewId) {
		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			if(fieldName.equals("All")) {
				String sql = "select count(*) from res r join member m on r.rid=m.mid join car c on r.rcode=c.ccode where concat(rnum, mid, mname, rcode, rstart, rend, rcancel) like ? order by r.rnum";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + viewId.trim() +"%");
				
				rs = pstmt.executeQuery();	
			}else {
			
	String sql="select count(*) from res r join member m on r.rid=m.mid join car c on r.rcode=c.ccode where "+fieldName+" like '%"+viewId+"%'";
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
}