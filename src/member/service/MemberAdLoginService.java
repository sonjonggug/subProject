package member.service;

import static db.JdbcUtil.*;
import java.sql.Connection;

import member.bean.MemberBean;
import member.dao.MemberAdDao;

public class MemberAdLoginService {

	public boolean login(MemberBean member) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		MemberAdDao memberAdDAO = MemberAdDao.getInstance();
		memberAdDAO.setConnection(conn);
		boolean loginResult = false;
		String loginId = memberAdDAO.selectLoginId(member);
		if(loginId != null){
			loginResult = true;
		}
		close(conn);
		return loginResult;
	}

}
