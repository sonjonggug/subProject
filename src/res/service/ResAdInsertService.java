package res.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import res.bean.ResBean;
import res.dao.ResAdDAO;

public class ResAdInsertService {

	public int JoinAdRes(ResBean resb) {
		
		Connection conn = getConnection();
		ResAdDAO resAdDAO = ResAdDAO.getInstance();
		resAdDAO.setConnection(conn);
		int insertCount = resAdDAO.resInsert(resb);
		
		if(insertCount > 0){
			commit(conn);
		}
		else{
			rollback(conn);
		}
		close(conn);
		
		return insertCount;
	}

}
