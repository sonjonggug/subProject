package member.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import member.bean.MemberBean;
import member.dao.MemberDAO;

public class MemberClViewService {

	public MemberBean getMember(String viewId) {
		Connection conn = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(conn);
		MemberBean member = memberDAO.selectMember(viewId);
		close(conn);
		return member;
	}

}