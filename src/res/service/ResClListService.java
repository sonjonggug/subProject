package res.service;

import java.sql.Connection;
import java.util.ArrayList;

import car.bean.CarBean;
import qna.dao.QnaDAO;

import static db.JdbcUtil.*;
import res.bean.ResClCheckBean;
import res.dao.ResClDAO;

public class ResClListService {
	public ArrayList<ResClCheckBean> getResList(String rid, int page, int limit) throws Exception{
		ArrayList<ResClCheckBean> resList = null;
		Connection conn = getConnection();
		ResClDAO resDAO = ResClDAO.getInstance();
		resDAO.setConnection(conn);
		resList = resDAO.selectResList(rid, page, limit);
		close(conn);
		return resList;
	}
	
	public int getListCount(String rid) throws Exception{
		int listCount = 0;
		Connection conn = getConnection();
		ResClDAO resDAO = ResClDAO.getInstance();
		resDAO.setConnection(conn);
		listCount = resDAO.selectResListCount(rid);
		close(conn);
		return listCount;
		
	}
	
	public ArrayList<CarBean> getcarlist(String car, String rent, String gear, String fuel, String seat) throws Exception {
		ArrayList<CarBean> carlist = null;
		Connection conn = getConnection();
		ResClDAO resDAO = ResClDAO.getInstance();
		resDAO.setConnection(conn);
		carlist = resDAO.carlist(car, rent, gear, fuel, seat);
		close(conn);
		return carlist;
	}
}
