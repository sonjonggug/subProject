package res.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import res.bean.ResClBean;
import res.dao.ResClDAO;

public class ResClService {
	public boolean resCl(ResClBean resClBean) throws Exception {
		boolean isResSuccess = false;
		Connection conn = getConnection();
		ResClDAO resClDAO = ResClDAO.getInstance();
		resClDAO.setConnection(conn);
		int insertCount = resClDAO.resInsert(resClBean);
		
		if(insertCount > 0){
			commit(conn);
			isResSuccess = true;
		}
		else{
			rollback(conn);
		}
		close(conn);
		return isResSuccess;
	}
}
