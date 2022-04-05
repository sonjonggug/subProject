package member.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import member.bean.MemberBean;
import member.dao.MemberAdDao;

public class MemberAdSearchService {

	public ArrayList<MemberBean> getMember(String viewId) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		MemberAdDao memberDAO = MemberAdDao.getInstance();
		memberDAO.setConnection(con);
		ArrayList<MemberBean> member1 = memberDAO.selectMember1(viewId);
		close(con);
		return member1;
	}

}
