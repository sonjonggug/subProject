package res.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import res.bean.ResBean;
import res.dao.ResAdDAO;

public class ResAdViewService {

	public ResBean getResAdView(String resAdViewNum) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		ResAdDAO resAdDAO = ResAdDAO.getInstance();
		resAdDAO.setConnection(conn);
		ResBean resAdView = resAdDAO.resAdView(resAdViewNum);
		close(conn);
		return resAdView;
	}

}
