package car.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import car.bean.CarBean;
import car.dao.CarDAO;



public class CarAdDetailProService {

	public CarBean getArticle(String cCode) throws Exception{
		
		CarBean car = null;
		Connection conn = getConnection();
		CarDAO carDAO = CarDAO.getInstance();
		carDAO.setConnection(conn);
				
		car = carDAO.selectCar(cCode);
		close(conn);
		return car;
		
	}

}
