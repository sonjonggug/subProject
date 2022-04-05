	package res.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import res.bean.ResBean;
import res.dao.ResAdDAO;

public class ResAdSearchListService {

	public int getresAdListCount(String fieldName, String viewId) throws Exception{
		// TODO Auto-generated method stub
		
		int listCount = 0;
		Connection conn = getConnection();
		ResAdDAO resAdDAO = ResAdDAO.getInstance();
		resAdDAO.setConnection(conn);
		listCount = resAdDAO.resAdListCount1(fieldName,viewId);
		close(conn);
		return listCount;
		
	}

	public ArrayList<ResBean> getResList(int page, int limit,String fieldName,String viewId) throws Exception{
		
		ArrayList<ResBean> resList = null;
		Connection conn = getConnection();
		ResAdDAO resAdDAO = ResAdDAO.getInstance();
		resAdDAO.setConnection(conn);
		resList = resAdDAO.selectResAdSearchList(page,limit,fieldName,viewId);
		close(conn);
		return resList;
		
	}

	

}
