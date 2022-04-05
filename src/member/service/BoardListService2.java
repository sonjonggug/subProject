package member.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import member.bean.MemberBean;
import member.dao.MemberAdDao;

public class BoardListService2 {

	public int getListCount1(String fieldName, String viewId) throws Exception{
		// TODO Auto-generated method stub
		
		int listCount = 0;
		Connection con = getConnection();
		MemberAdDao boardDAO = MemberAdDao.getInstance();
		boardDAO.setConnection(con);
		listCount = boardDAO.selectListCount1(fieldName,viewId);
		close(con);
		return listCount;
		
	}

	public ArrayList<MemberBean> getArticleList1(int page, int limit,String fieldName,String viewId) throws Exception{
		
		ArrayList<MemberBean> articleList = null;
		Connection con = getConnection();
		MemberAdDao boardDAO = MemberAdDao.getInstance();
		boardDAO.setConnection(con);
		articleList = boardDAO.selectArticleList1(page,limit,fieldName,viewId);
		close(con);
		return articleList;
		
	}
}
	
