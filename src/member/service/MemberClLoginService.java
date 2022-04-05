package member.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import member.bean.MemberBean;
import member.dao.MemberDAO;

public class MemberClLoginService {

	public boolean login(MemberBean member) {
		Connection conn = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(conn);
		boolean loginResult = false;
		String loginId = memberDAO.selectLoginId(member);
		if(loginId != null){
			loginResult = true;
		}
		close(conn);
		return loginResult;
	}

}
