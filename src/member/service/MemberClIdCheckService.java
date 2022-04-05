package member.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import member.dao.MemberDAO;

public class MemberClIdCheckService {

	public ArrayList<String> getMemberList() {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(conn);
		ArrayList<String> memberIdCheckList = memberDAO.memberIdCheckList();
		close(conn);
		return memberIdCheckList;
	}

}
