package res.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import car.bean.CarBean;
import res.dao.ResAdDAO;

public class ResAdCarSearchService {

	public CarBean getCar(String viewId) {
		
		Connection conn = getConnection();
		ResAdDAO resAdDAO = ResAdDAO.getInstance();
		resAdDAO.setConnection(conn);
		CarBean prod = resAdDAO.selectCar(viewId);
		close(conn);
		return prod;
	}
}
