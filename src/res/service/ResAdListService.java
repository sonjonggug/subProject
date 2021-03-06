	package res.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import res.bean.ResBean;
import res.dao.ResAdDAO;

public class ResAdListService {

	public int getresAdListCount() throws Exception{
		// TODO Auto-generated method stub
		
		int listCount = 0;
		Connection conn = getConnection();
		ResAdDAO resAdDAO = ResAdDAO.getInstance();
		resAdDAO.setConnection(conn);
		listCount = resAdDAO.resAdListCount();
		close(conn);
		return listCount;
		
	}

	public ArrayList<ResBean> getresList(int page, int limit) throws Exception{
		
		ArrayList<ResBean> resList = null;
		Connection conn = getConnection();
		ResAdDAO resAdDAO = ResAdDAO.getInstance();
		resAdDAO.setConnection(conn);
		resList = resAdDAO.selectResAdList(page,limit);
		close(conn);
		return resList;
		
	}

}
