package car.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;
import java.sql.Connection;
import car.dao.CarDAO;

public class CarDeleteProService {


	public boolean removeCar(String cCode) throws Exception{
		// TODO Auto-generated method stub
		
		boolean isRemoveSuccess = false;
		Connection conn = getConnection();
		CarDAO carDAO = CarDAO.getInstance();
		carDAO.setConnection(conn);
		int deleteCount = carDAO.deleteCar(cCode);
		
		if(deleteCount > 0){
			commit(conn);
			isRemoveSuccess=true;
		}
		else{
			rollback(conn);
		}
		
		close(conn);
		System.out.print("CarDeleteProService"+ "서비스:  ");
		System.out.println(isRemoveSuccess);
		return isRemoveSuccess;
	}

}
