package res.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import member.bean.MemberBean;
import res.dao.ResAdDAO;

public class ResAdUserSearchService {

	public MemberBean getMember(String viewId) {
		
		Connection conn = getConnection();
		ResAdDAO resAdDAO = ResAdDAO.getInstance();
		resAdDAO.setConnection(conn);
		MemberBean user = resAdDAO.selectMember(viewId);
		System.out.println("ResAdUserSearchService에서 user값은 = " + user);
		close(conn);
		return user;
	}
}
