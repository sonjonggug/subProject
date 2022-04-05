package car.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import car.bean.CarBean;
import car.dao.CarDAO;

public class CarAdModifyProService {

	

	public boolean modifyArticle(CarBean carBean) throws Exception {
		// TODO Auto-generated method stub
		
		boolean isModifySuccess = false;
		Connection con = getConnection();
		CarDAO boardDAO = CarDAO.getInstance();
		boardDAO.setConnection(con);
		int updateCount = boardDAO.updateArticle1(carBean);
		
		if(updateCount > 0){
			commit(con);
			isModifySuccess=true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isModifySuccess;
		
	}

}
