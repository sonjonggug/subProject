package res.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import res.dao.ResAdDAO;

public class ResAdDeleteService {

	public boolean resAdDelete(String deleteId) {
		boolean resAdDeleteResult= false;
		Connection conn = getConnection();
		ResAdDAO resAdDAO = ResAdDAO.getInstance();
		resAdDAO.setConnection(conn);
		int deleteCount = resAdDAO.resAdDelete(deleteId);
		if(deleteCount > 0){
			commit(conn);
			resAdDeleteResult = true;
		}
		else{
			rollback(conn);
		}
		close(conn);
		return resAdDeleteResult;
	}


}
