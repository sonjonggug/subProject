package member.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import member.bean.MemberBean;
import member.dao.MemberAdDao;

public class MemberAdListService {

	public ArrayList<MemberBean> getMemberList() {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		MemberAdDao memberDAO = MemberAdDao.getInstance();
		memberDAO.setConnection(con);
		ArrayList<MemberBean> memberList = memberDAO.selectMemberList();
		close(con);
		return memberList;
	}

}
