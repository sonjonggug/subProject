package res.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import res.dao.ResAdDAO;

public class ResAdCarCheckService {

	public ArrayList<String> getCarList() {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		ResAdDAO resAdDAO = ResAdDAO.getInstance();
		resAdDAO.setConnection(conn);
		ArrayList<String> resCarCheckList = resAdDAO.resCarCheckList();
		close(conn);
		return resCarCheckList;
	}

}

