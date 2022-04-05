package member.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import member.dao.MemberDAO;

public class MemberClDeleteService {

	public boolean memberClDelete(String deleteClId) {
		boolean deleteClResult = false;
		Connection conn = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(conn);
		int deleteCount = memberDAO.memberClDelete(deleteClId);
		if(deleteCount > 0){
			commit(conn);
			deleteClResult = true;
		}
		else{
			rollback(conn);
		}
		close(conn);
		return deleteClResult;
	}

}