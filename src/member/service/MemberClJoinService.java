package member.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import member.bean.MemberBean;
import member.dao.MemberDAO;

public class MemberClJoinService {

	public boolean joinMember(MemberBean member) {
		boolean joinSuccess = false;
		MemberDAO memberDAO = MemberDAO.getInstance();
		Connection conn = getConnection();
		memberDAO.setConnection(conn);
		int insertCount = memberDAO.insertMember(member);
		if(insertCount > 0){
			joinSuccess = true;
			commit(conn);
		}
		else{
			rollback(conn);
		}
		close(conn);
		return joinSuccess;
	}

}
