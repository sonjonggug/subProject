package member.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import member.dao.MemberAdDao;

public class MemberAdDeleteService {

	public boolean deleteMember(String deleteId) {
		// TODO Auto-generated method stub
		boolean deleteResult = false;
		Connection con = getConnection();
		MemberAdDao memberDAO = MemberAdDao.getInstance();
		memberDAO.setConnection(con);
		int deleteCount = memberDAO.deleteMember(deleteId);
		if(deleteCount > 0){
			commit(con);
			deleteResult = true;
		}
		else{
			rollback(con);
		}
		close(con);
		return deleteResult;
	}

}
