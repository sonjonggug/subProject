package car.service;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;
import car.bean.CarBean;
import car.dao.CarDAO;
public class CarAdSearchListService {

	public int getListCount(String fieldName, String word) throws Exception{
		// 아직 안함(DAO)
		int listCount = 0;
		Connection conn = getConnection();
		CarDAO carDAO = CarDAO.getInstance();
		carDAO.setConnection(conn);
		listCount = carDAO.selectAdListCount(fieldName, word);
		close(conn);
		System.out.println("CarAdSearchService > listcount 반환");
		System.out.println(listCount);
		return listCount;
		
	}

	public ArrayList<CarBean> getCarSearchList(int page,int limit, String fieldName, String word) throws Exception{
		
		ArrayList<CarBean> carList = null;
		Connection conn = getConnection();
		CarDAO carDAO = CarDAO.getInstance();
		carDAO.setConnection(conn);
		carList = carDAO.getCarSearchList(page, limit, fieldName, word);
		close(conn);
		System.out.println("CarAdSearchService > ArrayList<CarBean> 반환");
		return carList;
		
	}

}
