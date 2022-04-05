package car.service;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;
import car.bean.CarBean;
import car.dao.CarDAO;
public class CarClSanListService {

	public int getListCount(String ctype, String csize) throws Exception{
		// TODO Auto-generated method stub
		
		int listCount = 0;
		Connection conn = getConnection();
		CarDAO carDAO = CarDAO.getInstance();
		carDAO.setConnection(conn);
		listCount = carDAO.selectClSanListCount(ctype, csize);
		close(conn);
		System.out.println("service�뿉�꽌 listcount 諛섑솚�셿猷�");
		return listCount;
		
	}

	public ArrayList<CarBean> getArticleList(int page, int limit, String ctype, String csize) throws Exception{
		
		ArrayList<CarBean> carList = null;
		Connection conn = getConnection();
		CarDAO carDAO = CarDAO.getInstance();
		carDAO.setConnection(conn);
		carList = carDAO.selectClSanCarList(page,limit, ctype, csize);
		close(conn);
		System.out.println("service�뿉�꽌 LongXscarlist 諛섑솚�셿猷�");
		return carList;
		
	}

}
