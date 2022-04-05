package res.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import car.bean.CarBean;
import res.bean.ResClCheckBean;
import res.dao.ResClDAO;

public class ResClDetailService {
	public ResClCheckBean getRes(int rnum) throws Exception{
		
		ResClCheckBean resclckbean = null;
		Connection conn = getConnection();
		ResClDAO resclDAO = ResClDAO.getInstance();
		resclDAO.setConnection(conn);
		
		resclckbean = resclDAO.selectRes(rnum);
		close(conn);
		
		return resclckbean;
		
	}
	
	public CarBean getCar(String cCode) throws Exception{
		
		CarBean carbean = null;
		Connection conn = getConnection();
		ResClDAO resclDAO = ResClDAO.getInstance();
		resclDAO.setConnection(conn);
		
		carbean = resclDAO.selectCar(cCode);
		close(conn);
		
		return carbean;
		
	}
}
