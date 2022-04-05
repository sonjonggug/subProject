package res.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import res.bean.ResClBean;
import res.dao.ResClDAO;

public class ResClModifyService {
	public boolean resClmo(ResClBean resClBean) throws Exception {
		boolean isResmoSuccess = false;
		Connection conn = getConnection();
		ResClDAO resClDAO = ResClDAO.getInstance();
		resClDAO.setConnection(conn);
		int modifyCount = resClDAO.resModify(resClBean);
		
		if(modifyCount > 0){
			commit(conn);
			isResmoSuccess = true;
		}
		else{
			rollback(conn);
		}
		close(conn);
		return isResmoSuccess;
	}
}
