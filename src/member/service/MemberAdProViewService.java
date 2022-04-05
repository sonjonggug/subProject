package member.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import member.bean.MemberBean;
import member.dao.MemberAdDao;

public class MemberAdProViewService {

	public MemberBean getMember(String viewId) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		MemberAdDao memberDAO = MemberAdDao.getInstance();
		memberDAO.setConnection(con);
		MemberBean member = memberDAO.selectMember(viewId);
		close(con);
		return member;
	}

}
