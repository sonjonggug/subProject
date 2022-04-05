package member.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import member.bean.MemberBean;
import member.dao.MemberAdDao;

public class MemberAdJoinService {

	public boolean joinMember(MemberBean member) {
		// TODO Auto-generated method stub
		boolean joinSuccess = false;
		MemberAdDao memberDAO = MemberAdDao.getInstance();
		Connection con = getConnection();
		memberDAO.setConnection(con);
		int insertCount = memberDAO.insertMember(member);
		if(insertCount > 0){
			joinSuccess = true;
			commit(con);
		}
		else{
			rollback(con);
		}
		close(con);
		return joinSuccess;
	}

}
