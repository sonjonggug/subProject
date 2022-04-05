package res.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import res.bean.ResClBean;
import res.dao.ResClDAO;

public class ResClCancelService {
	public boolean resClCancel(ResClBean resClBean) throws Exception {
		boolean isRescancelSuccess = false;
		Connection conn = getConnection();
		ResClDAO resClDAO = ResClDAO.getInstance();
		resClDAO.setConnection(conn);
		int cancelCount = resClDAO.resCancel(resClBean);
		
		if(cancelCount > 0){
			commit(conn);
			isRescancelSuccess = true;
		}
		else{
			rollback(conn);
		}
		close(conn);
		return isRescancelSuccess;
	}
}
