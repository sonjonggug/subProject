package car.service;

import java.sql.Connection;

import car.bean.CarBean;
import car.dao.CarDAO;

import static db.JdbcUtil.*;
public class CarWriteProService {

	public boolean registCar(CarBean car) throws Exception{
		
		boolean isWriteSuccess = false;
		Connection conn = getConnection();
		CarDAO carDAO = CarDAO.getInstance();
		carDAO.setConnection(conn);
		int insertCount = carDAO.insertCar(car);
		
		if(insertCount > 0){
			commit(conn);
			isWriteSuccess = true;
            }
		else{
			rollback(conn);
		}
		
		close(conn);
		System.out.println("InsertService에서 True로 반환완료");
		return isWriteSuccess;
		
	}

}
