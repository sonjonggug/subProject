package res.dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import car.bean.CarBean;
import res.bean.ResClBean;
import res.bean.ResClCheckBean;

public class ResClDAO {
	public static ResClDAO instance;
	Connection conn;
	
	public void setConnection(Connection conn){
		this.conn = conn;
	}
	public static ResClDAO getInstance() {
		if(instance == null) {
			instance = new ResClDAO();
		}
		return instance;
	} 
	
	public ArrayList<ResClCheckBean> selectResList(String rid, int page, int limit){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String res_list_sql = "select r.rnum, date_format(r.rstart, '%y-%m-%d') rstart, " + 
				"date_format(r.rend, '%y-%m-%d') rend, r.rcode, " + 
				"(ABS(DATEDIFF(r.rstart, r.rend)))*c.cprice rtotal, r.rcancel " + 
				"from res r join member m on r.rid=m.mid join car c on r.rcode=c.ccode " +
				"where r.rid = ? order by r.rcancel, r.rstart desc, r.rnum desc " +
				"limit ? offset ?";
		ArrayList<ResClCheckBean> resList = new ArrayList<ResClCheckBean>();
		ResClCheckBean rescheck = null;
		int startrow = (page-1)*10; // 읽기 시작할 row 번호
		
		System.out.println("selectResList : " + res_list_sql);
		System.out.println("limit : " + limit);
		System.out.println("page : " + page);
		try{
			pstmt = conn.prepareStatement(res_list_sql);
			pstmt.setString(1, rid);
			pstmt.setInt(2, limit);
			pstmt.setInt(3, startrow);
			rs = pstmt.executeQuery();

			while(rs.next()){
				rescheck = new ResClCheckBean();			
				rescheck.setRnum(rs.getInt(1));
				rescheck.setRstart(rs.getString(2));
				rescheck.setRend(rs.getString(3));
				rescheck.setRcode(rs.getString(4));
				rescheck.setRtotal(rs.getInt(5));
				rescheck.setRcancel(rs.getString(6));
				resList.add(rescheck);
			}
		System.out.println("예약 리스트 조회 완료");
	}catch(Exception ex){
		System.out.println("resList 에러 : " + ex);
	}finally{
		close(rs);
		close(pstmt);
	}
	return resList;
}
	
	public int selectResListCount(String rid){

		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String res_count_sql = "select count(*) from res where rid = ?";

		System.out.println("selectResList : " + res_count_sql);
		try{
			pstmt = conn.prepareStatement(res_count_sql);
			pstmt.setString(1, rid);
			rs = pstmt.executeQuery();

			while(rs.next()){
				listCount = rs.getInt(1);
			}
		System.out.println("예약 갯수 조회 완료 : " + listCount);
	}catch(Exception ex){
		System.out.println("resListCount 에러 : " + ex);
	}finally{
		close(rs);
		close(pstmt);
	}
	return listCount;
}
	
	public ResClCheckBean selectRes(int rnum){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String res_sql = "select r.rnum, date_format(r.rstart, '%y-%m-%d') rstart, " + 
				"date_format(r.rend, '%y-%m-%d') rend,  r.rcode, " + 
				"(ABS(DATEDIFF(r.rstart, r.rend)))*c.cprice rtotal, r.rcancel " + 
				"from res r join member m on r.rid=m.mid join car c on r.rcode=c.ccode where r.rnum = ?";
		ResClCheckBean rescheck = null;
		System.out.println("selectRes : " + res_sql);
		try{
			pstmt = conn.prepareStatement(res_sql);
			pstmt.setInt(1, rnum);
			rs = pstmt.executeQuery();

			while(rs.next()){
				rescheck = new ResClCheckBean();			
				rescheck.setRnum(rs.getInt(1));
				rescheck.setRstart(rs.getString(2));
				rescheck.setRend(rs.getString(3));
				rescheck.setRcode(rs.getString(4));
				rescheck.setRtotal(rs.getInt(5));
				rescheck.setRcancel(rs.getString(6));
			}
		System.out.println("예약 조회 완료");
	}catch(Exception ex){
		System.out.println("rescheck 에러 : " + ex);
	}finally{
		close(rs);
		close(pstmt);
	}
	return rescheck;
}
	
	public CarBean selectCar(String cCode){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String res_sql = "select ccode, ctype, csize, cname, cprice, cgear, cfuel, cseat, cfile from car where ccode= ?";
		CarBean carbean = null;
		
		System.out.println("cCode : " + cCode);
		System.out.println("selectCar : " + res_sql);
		
		try{
			pstmt = conn.prepareStatement(res_sql);
			pstmt.setString(1, cCode);
			rs = pstmt.executeQuery();

			while(rs.next()){
				carbean = new CarBean();
				carbean.setcCode(rs.getString(1));
				carbean.setcType(rs.getString(2));
				carbean.setcSize(rs.getString(3));
				carbean.setcName(rs.getString(4));
				carbean.setcPrice(rs.getInt(5));
				carbean.setcGear(rs.getString(6));
				carbean.setcFuel(rs.getString(7));
				carbean.setcSeat(rs.getString(8));
				carbean.setcFile(rs.getString(9));			
			}
		System.out.println("차량 정보 조회 완료");
	}catch(Exception ex){
		System.out.println("차량 정보 조회 에러 : " + ex);
	}finally{
		close(rs);
		close(pstmt);
	}
	return carbean;
}
	

	
	public ArrayList<CarBean> carlist(String car, String rent, String gear, String fuel, String seat){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String res_sql = "select ccode, ctype, csize, cname, cprice, cgear, cfuel, cseat, cfile from car"
				+ " where csize = '" + car +"' and ctype = '" + rent + "' and cgear = '" + gear
				+ "' and cfuel = '" + fuel + "' and cseat = '" + seat + "'";
		ArrayList<CarBean> carlist = new ArrayList<CarBean>();
		CarBean carbean = null;
		System.out.println("carlist : " + res_sql);
		try{
			pstmt = conn.prepareStatement(res_sql);
			rs = pstmt.executeQuery();

			while(rs.next()){
				carbean = new CarBean();
				carbean.setcCode(rs.getString(1));
				carbean.setcType(rs.getString(2));
				carbean.setcSize(rs.getString(3));
				carbean.setcName(rs.getString(4));
				carbean.setcPrice(rs.getInt(5));
				carbean.setcGear(rs.getString(6));
				carbean.setcFuel(rs.getString(7));
				carbean.setcSeat(rs.getString(8));
				carbean.setcFile(rs.getString(9));	
				carlist.add(carbean);
			}
		System.out.println("차량 리스트 조회 완료");
	}catch(Exception ex){
		System.out.println("차량 리스트 조회 에러 : " + ex);
	}finally{
		close(rs);
		close(pstmt);
	}
	return carlist;
}

	public int resInsert(ResClBean resClBean) {

		PreparedStatement pstmt = null;
		String sql = "";
		int insertCount = 0;
		
		try{
			sql="insert into res (rid, rcode, rstart, rend) values (?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, resClBean.getRid());
			pstmt.setString(2, resClBean.getRcode());
			pstmt.setString(3, resClBean.getRstart());
			pstmt.setString(4, resClBean.getRend());
			
			System.out.println(resClBean.getRid());
			System.out.println(resClBean.getRcode());
			System.out.println(resClBean.getRstart());
			System.out.println(resClBean.getRend());
			System.out.println("resInsert : " + sql);
			
			insertCount = pstmt.executeUpdate();
			System.out.println("예약완료");
		}catch(Exception ex){
			System.out.println("resInsert 에러 : " + ex);
		}finally{
			close(pstmt);
		}
		return insertCount;
	}

	public int resModify(ResClBean resClBean) {

		PreparedStatement pstmt = null;
		String sql = "";
		int modifyCount = 0;
		try{
			sql="update res set rcode = ?, rstart = ?, rend = ? where rnum = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, resClBean.getRcode());
			pstmt.setString(2, resClBean.getRstart());
			pstmt.setString(3, resClBean.getRend());
			pstmt.setInt(4, resClBean.getRnum());
			
			System.out.println(resClBean.getRid());
			System.out.println(resClBean.getRcode());
			System.out.println(resClBean.getRstart());
			System.out.println(resClBean.getRend());
			System.out.println(resClBean.getRnum());
			System.out.println("resModify : " + sql);
			modifyCount = pstmt.executeUpdate();
			System.out.println("예약변경완료");
		}catch(Exception ex){
			System.out.println("resModify 에러 : " + ex);
		}finally{
			close(pstmt);
		}
		return modifyCount;
	}
	
	public int resCancel(ResClBean resClBean) {

		PreparedStatement pstmt = null;
		String sql = "";
		int modifyCount = 0;
		try{
			sql="update res set rcancel = ? where rnum = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "Y");
			pstmt.setInt(2, resClBean.getRnum());
			System.out.println("resCancel : " + sql);
			modifyCount = pstmt.executeUpdate();
			System.out.println("예약취소완료");
		}catch(Exception ex){
			System.out.println("rescancel 에러 : " + ex);
		}finally{
			close(pstmt);
		}
		return modifyCount;
	}
}
