package car.dao;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.sql.DataSource;

import member.bean.MemberBean;
import car.bean.BoardBean;
import car.bean.CarBean;

public class CarDAO {

	DataSource ds;
	Connection conn;
	private static CarDAO carDAO;

	private CarDAO() {
		// TODO Auto-generated constructor stub
	}

	public static CarDAO getInstance(){
		if(carDAO == null){
			carDAO = new CarDAO();
		}
		return carDAO;
	}

	public void setConnection(Connection conn){
		this.conn = conn;
	}

    // 선택한 Id 로그인	
	public String selectLoginId(MemberBean member){
		String loginId = null;
		String sql="SELECT MID FROM MEMBER WHERE MID=? AND MPW=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, member.getMid());
			pstmt.setString(2, member.getMpw());
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				loginId = rs.getString("Mid");
			}
		}catch(Exception ex){
			System.out.println(" DAO selectLoginID 실패 " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}
		
		return loginId;
	}
	//선택한 상품의 수
	public int selectListCount() {

		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{


			System.out.println("getConnection");
			pstmt=conn.prepareStatement("select count(*) from car");
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1);
			}
		}catch(Exception ex){
			System.out.println("getListCount 상품의 총 수 출력 실패: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}

		return listCount;

	}
     // 상품 리스트 배열로 담아 출력
	public ArrayList<CarBean> selectCarList(int page,int limit){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String car_list_sql="select cCode, cType, cSize, cName, cPrice, cGear, cFuel, cSeat, cFile from car order by cCode asc limit ?,10";
		ArrayList<CarBean> carList = new ArrayList<CarBean>();
		CarBean car = null;
		int startrow=(page-1)*10; 	

		try{
			pstmt = conn.prepareStatement(car_list_sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();

			while(rs.next()){
			    car = new CarBean();
				car.setcCode(rs.getString("cCode"));
				car.setcType(rs.getString("cType"));
				car.setcSize(rs.getString("cSize"));
				car.setcName(rs.getString("cName"));
				car.setcPrice(rs.getInt("cPrice"));
				car.setcGear(rs.getString("cGear"));
				car.setcFuel(rs.getString("cFuel"));
				car.setcSeat(rs.getString("cSeat"));
				car.setcFile(rs.getString("cFile"));
				carList.add(car);
			}

		}catch(Exception ex){
			System.out.println("getcarList: " + ex);
		}finally{
			close(rs);
			close(pstmt);
		}
		System.out.println("dao > carlist 출력값 1증가 후 넘김");
		return carList;
	}

	public int selectClSanListCount(String ctype, String csize) {

		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			System.out.println("getConnection");
			pstmt=conn.prepareStatement("select count(*) from car where cType=? and cSize = ?");
			pstmt.setString(1, ctype);
            pstmt.setString(2, csize);
            rs = pstmt.executeQuery();
            if(rs.next()){
            	listCount=rs.getInt(1);
			            
			}
		}catch(Exception ex){
			System.out.println("getSanClListCount 상품의 총 수 출력 실패: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}
         System.out.println(listCount);
		return listCount;

	}

	// 차량 검색 후 배열출력
	public ArrayList<CarBean> selectClSanCarList(int page,int limit, String ctype, String csize){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String Xscar_list_sql="select cCode, cType, cSize, cName, cPrice, cGear, cFuel, cSeat, cFile from car where ctype = ? and csize = ? order by cCode asc limit ?,6";
		ArrayList<CarBean> carList = new ArrayList<CarBean>();
		CarBean car = null;
		int startrow=(page-1)*6; 	

		try{
			pstmt = conn.prepareStatement(Xscar_list_sql);
			pstmt.setString(1, ctype);
			pstmt.setString(2, csize);
			pstmt.setInt(3, startrow);
			rs = pstmt.executeQuery();

			while(rs.next()){
			    car = new CarBean();
				car.setcCode(rs.getString("cCode"));
				car.setcType(rs.getString("cType"));
				car.setcSize(rs.getString("cSize"));
				car.setcName(rs.getString("cName"));
				car.setcPrice(rs.getInt("cPrice"));
				car.setcGear(rs.getString("cGear"));
				car.setcFuel(rs.getString("cFuel"));
				car.setcSeat(rs.getString("cSeat"));
				car.setcFile(rs.getString("cFile"));
				carList.add(car);
			}

		}catch(Exception ex){
			System.out.println("getcarList: " + ex);
		}finally{
			close(rs);
			close(pstmt);
		}
		System.out.println("dao > carlist 출력");
		return carList;
	}
	
	
	public CarBean selectCar(String cCode){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CarBean car = null;

		try{
			pstmt = conn.prepareStatement(
					"select * from car where cCode = ?");
			pstmt.setString(1, cCode);
			rs= pstmt.executeQuery();

			if(rs.next()){
				car = new CarBean();
				car.setcCode(rs.getString("cCode"));
				car.setcType(rs.getString("cType"));
				car.setcSize(rs.getString("cSize"));
				car.setcName(rs.getString("cName"));
				car.setcPrice(rs.getInt("cPrice"));
				car.setcGear(rs.getString("cGear"));
				car.setcFuel(rs.getString("cFuel"));
				car.setcSeat(rs.getString("cSeat"));
				car.setcFile(rs.getString("cFile"));
			}
		}catch(Exception ex){
			System.out.println("car getDetail : " + ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return car;

	}

	public int selectAdListCount(String fieldName, String word) {

		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			if(fieldName.equals("All")) {
				String sql = "SELECT count(*) FROM car WHERE concat(CCODE, CTYPE, CSIZE, CNAME, CPRICE,  CGEAR,  CFUEL ,CSEAT) LIKE ? order by CCODE, CTYPE, CPRICE";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + word.trim() +"%");
				rs= pstmt.executeQuery();

				}else if (fieldName.equals("cCode")){
					String sql = "SELECT count(*) FROM car WHERE CCODE LIKE ? order by CCODE, CTYPE, CPRICE";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%" + word.trim() +"%");
					rs= pstmt.executeQuery();
				}else if (fieldName.equals("cType")){
					String sql = "SELECT count(*) FROM car WHERE CType LIKE ? order by CCODE, CTYPE, CPRICE";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%" + word.trim() +"%");
					rs= pstmt.executeQuery();
				}else if (fieldName.equals("cSize")){
					String sql = "SELECT count(*) FROM car WHERE CSIZE LIKE ? order by CCODE, CTYPE, CPRICE";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%" + word.trim() +"%");
					rs= pstmt.executeQuery();
				}else if (fieldName.equals("cName")){
					String sql = "SELECT count(*) FROM car WHERE CNAME LIKE ? order by CCODE, CTYPE, CPRICE";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%" + word.trim() +"%");
					rs= pstmt.executeQuery();
				}else if (fieldName.equals("cPrice")){
					String sql = "SELECT count(*) FROM car WHERE CPRICE LIKE ? order by CCODE, CTYPE, CPRICE";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%" + word.trim() +"%");
					rs= pstmt.executeQuery();
				}else if (fieldName.equals("cGear")){
					String sql = "SELECT count(*) FROM car WHERE CGEAR LIKE ? order by CCODE, CTYPE, CPRICE";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%" + word.trim() +"%");
					rs= pstmt.executeQuery();
				}else if (fieldName.equals("cFuel")){
					String sql = "SELECT count(*) FROM car WHERE CFUEL LIKE ? order by CCODE, CTYPE, CPRICE";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%" + word.trim() +"%" );
					rs= pstmt.executeQuery();
					}
				else if (fieldName.equals("cSeat")){
					String sql = "SELECT count(*) FROM car WHERE CSEAT LIKE ? order by CCODE, CTYPE, CPRICE";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%" + word.trim() +"%" );
					rs= pstmt.executeQuery();
				}			

			    if(rs.next()){
            	listCount=rs.getInt(1);
			            
			}
		}catch(Exception ex){
			System.out.println("getAdListCount 상품의 총 수 출력 실패: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}
         System.out.println(listCount);
		return listCount;

	}

	
	//상품 검색(콤보박스 및 항목에 맞는 검색기능)
	public ArrayList<CarBean> getCarSearchList(int page, int limit, String fieldName, String word) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<CarBean> carList = new ArrayList<CarBean>();
		CarBean car = null;
		int startrow=(page-1)*10; 	
        System.out.println(fieldName);
        System.out.println(word);
		try {
			if(fieldName.equals("All")) {
				String sql = "SELECT * FROM car WHERE concat(CCODE, CTYPE, CSIZE, CNAME, CPRICE,  CGEAR,  CFUEL ,CSEAT) LIKE ? order by CCODE, CTYPE, CPRICE limit ?,10";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + word.trim() +"%");
				pstmt.setInt(2, startrow);
				rs= pstmt.executeQuery();

				}else if (fieldName.equals("cCode")){
					String sql = "SELECT * FROM car WHERE CCODE LIKE ? order by CCODE, CTYPE, CPRICE limit ?,10";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%" + word.trim() +"%");
					pstmt.setInt(2, startrow);
					rs= pstmt.executeQuery();
				}else if (fieldName.equals("cType")){
					String sql = "SELECT * FROM car WHERE CType LIKE ? order by CCODE, CTYPE, CPRICE limit ?,10";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%" + word.trim() +"%");
					pstmt.setInt(2, startrow);
					rs= pstmt.executeQuery();
				}else if (fieldName.equals("cSize")){
					String sql = "SELECT * FROM car WHERE CSIZE LIKE ? order by CCODE, CTYPE, CPRICE limit ?,10";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%" + word.trim() +"%");
					pstmt.setInt(2, startrow);
					rs= pstmt.executeQuery();
				}else if (fieldName.equals("cName")){
					String sql = "SELECT * FROM car WHERE CNAME LIKE ? order by CCODE, CTYPE, CPRICE limit ?,10";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%" + word.trim() +"%");
					pstmt.setInt(2, startrow);
					rs= pstmt.executeQuery();
				}else if (fieldName.equals("cPrice")){
					String sql = "SELECT * FROM car WHERE CPRICE LIKE ? order by CCODE, CTYPE, CPRICE limit ?,10";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%" + word.trim() +"%");
					pstmt.setInt(2, startrow);
					rs= pstmt.executeQuery();
				}else if (fieldName.equals("cGear")){
					String sql = "SELECT * FROM car WHERE CGEAR LIKE ? order by CCODE, CTYPE, CPRICE limit ?,10";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%" + word.trim() +"%");
					pstmt.setInt(2, startrow);
					rs= pstmt.executeQuery();
				}else if (fieldName.equals("cFuel")){
					String sql = "SELECT * FROM car WHERE CFUEL LIKE Upper (?) order by CCODE, CTYPE, CPRICE limit ?,10";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%" + word.trim() +"%" );
					pstmt.setInt(2, startrow);
					rs= pstmt.executeQuery();
					}
				else if (fieldName.equals("cSeat")){
					String sql = "SELECT * FROM car WHERE CSEAT LIKE ? order by CCODE, CTYPE, CPRICE limit ?,10";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%" + word.trim() +"%");
					pstmt.setInt(2, startrow);
					rs= pstmt.executeQuery();
				}			
			    while(rs.next()){
		        car = new CarBean();
		        car.setcCode(rs.getString("cCode"));
		        car.setcType(rs.getString("cType"));
		        car.setcSize(rs.getString("cSize"));
		        car.setcName(rs.getString("cName"));
		        car.setcPrice(rs.getInt("cPrice"));
		        car.setcGear(rs.getString("cGear"));
		        car.setcFuel(rs.getString("cFuel"));
		        car.setcSeat(rs.getString("cSeat"));
		        car.setcFile(rs.getString("cFile"));
	            carList.add(car);
			    }
                }catch(Exception ex){
	            System.out.println("car 콤보박스검색하기 기능 : " + ex);
                }finally{
	            close(rs);
	            close(pstmt);
                }
               return carList;
               }
    //상품 검색에 따른 ListCount
	public int selectAdSanListCount(String ctype, String csize) {

		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			System.out.println("getConnection");
			pstmt=conn.prepareStatement("select count(*) from car where cType=? and cSize = ?");
			pstmt.setString(1, ctype);
            pstmt.setString(2, csize);
            rs = pstmt.executeQuery();
            if(rs.next()){
            	listCount=rs.getInt(1);
			            
			}
		}catch(Exception ex){
			System.out.println("getSanClListCount 상품의 총 수 출력 실패: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}
         System.out.println(listCount);
		return listCount;

	}

	
	//상품등록
	public int insertCar(CarBean car){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int insertCount = 0;
		
		
		try {
		String sql= "insert into car(cCode, cType, cSize, cName, cPrice, cGear, cFuel, cSeat, cFile)"
				  + "values (?, ?, ?, ?, ?, ?, ?, ?, ?)";

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, car.getcCode());
			pstmt.setString(2, car.getcType());
			pstmt.setString(3, car.getcSize());
			pstmt.setString(4, car.getcName());
			pstmt.setInt(5, car.getcPrice());
			pstmt.setString(6, car.getcGear());
			pstmt.setString(7, car.getcFuel());
			pstmt.setString(8, car.getcSeat());
			pstmt.setString(9, car.getcFile());
		    insertCount = pstmt.executeUpdate();

		}catch(Exception ex){
			System.out.println("carInsert : "+ex);
		}finally{
            close(pstmt);
		}
		System.out.println("Dao (int)insertCount> InsertService로 1이상의 값으로 넘김");			
		return insertCount;

	}

	
	public int updateArticle1(CarBean carBean){

		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql="update car set CTYPE=?,CSIZE=?,CNAME=?, CPRICE=?,CGEAR=?,CFUEL=?,CSEAT=?,CFILE=? where cCODE=?";

		try{
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, carBean.getcType());
			pstmt.setString(2, carBean.getcSize());
			pstmt.setString(3, carBean.getcName());
			pstmt.setInt(4, carBean.getcPrice());
			pstmt.setString(5, carBean.getcGear());
			pstmt.setString(6, carBean.getcFuel());
			pstmt.setString(7, carBean.getcSeat());
			pstmt.setString(8, carBean.getcFile());
			pstmt.setString(9, carBean.getcCode());
			updateCount = pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("boardModify 실패: " + ex);
		}finally{
			close(pstmt);
		}
		System.out.println("updateArticle1 실행성공 : updateCount 값 증가");
        System.out.println(updateCount);
		return updateCount;

	}

	//상품 삭제
	public int deleteCar(String cCode){

		PreparedStatement pstmt = null;
		String sql="delete from car where cCode=?";
		int deleteCount=0;

		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, cCode);
			deleteCount=pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("boardDelete: "+ex);
		}	finally{
			close(pstmt);
		}
        System.out.println("deleteDao > deleteservice로 출력");
		return deleteCount;

	}

	
	
	/*public boolean multideleteCar(String[] cCode){

		PreparedStatement pstmt = null;
		String sql="delete from car where cCode=?";
		
		int count[] = new int[cCode.length];

		try{
			pstmt=conn.prepareStatement(sql);
			conn.setAutoCommit(false);
			for(int i=0; i<cCode.length; i++) {
				pstmt.setString(1, cCode[i]);
				pstmt.addBatch();
				
			}
			count = pstmt.executeBatch();
			conn.commit();
			
		}catch(SQLException e){
			e.printStackTrace();
			System.out.println("boardDelete: "+e);
	   
			try {
		    conn.rollback();
	   
			}catch (SQLException e1) {
		  
		     e1.printStackTrace();
	       }
		}finally{
			try {
				conn.setAutoCommit(true);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			close(pstmt);
		}

		boolean result = true;
		
		for(int i = 0; i< count.length; i++) {
			if(count[i] != -2) {
				result = false;
				break;
			}
			}
		return result;
	}

	*/

}
