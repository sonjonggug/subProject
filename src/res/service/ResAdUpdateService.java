package res.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import res.bean.ResBean;
import res.dao.ResAdDAO;

public class ResAdUpdateService {

	public boolean modifyArticle(ResBean article) {

		boolean isModifySuccess = false;
		Connection conn = getConnection();
		ResAdDAO resAdDAO = ResAdDAO.getInstance();
		resAdDAO.setConnection(conn);
		int updateCount = resAdDAO.updateAdRes(article);
		
		if(updateCount > 0){
			commit(conn);
			isModifySuccess=true;
		}
		else{
			rollback(conn);
		}
		
		close(conn);
		return isModifySuccess;
		
	}

}

