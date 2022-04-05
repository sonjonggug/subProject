package member.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import member.bean.MemberBean;
import member.dao.MemberDAO;

public class MemberClUpdateService {

	public boolean memberClUpdate(MemberBean updateClMember) {
		boolean updateClResult = false;
		Connection conn = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(conn);
		int updateCount = memberDAO.memberClUpdate(updateClMember);
		if(updateCount > 0){
			commit(conn);
			updateClResult = true;
		}
		else{
			rollback(conn);
		}
		close(conn);
		return updateClResult;
	}

}