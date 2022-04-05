package member.service;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;

import member.bean.MemberBean;
import member.dao.MemberAdDao;

public class BoardListService {

	public int getListCount() throws Exception{
		// TODO Auto-generated method stub
		
		int listCount = 0;
		Connection con = getConnection();
		MemberAdDao boardDAO = MemberAdDao.getInstance();
		boardDAO.setConnection(con);
		listCount = boardDAO.selectListCount();
		close(con);
		return listCount;
		
	}

	public ArrayList<MemberBean> getArticleList(int page, int limit) throws Exception{
		
		ArrayList<MemberBean> articleList = null;
		Connection con = getConnection();
		MemberAdDao boardDAO = MemberAdDao.getInstance();
		boardDAO.setConnection(con);
		articleList = boardDAO.selectArticleList(page,limit);
		close(con);
		return articleList;
		
	}

}
