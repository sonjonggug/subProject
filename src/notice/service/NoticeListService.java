package notice.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import notice.bean.NoticeBean;
import notice.dao.NoticeDAO;

public class NoticeListService {

	public int getListCount() throws Exception{
		
		int listCount = 0;
		Connection conn = getConnection();
		NoticeDAO noticeDAO = NoticeDAO.getInstance();
		noticeDAO.setConnection(conn);
		listCount = noticeDAO.selectListCount();
		close(conn);
		return listCount;
		
	}

	public ArrayList<NoticeBean> getArticleList(int page, int limit) throws Exception{
		
		ArrayList<NoticeBean> articleList = null;
		Connection conn = getConnection();
		NoticeDAO noticeDAO = NoticeDAO.getInstance();
		noticeDAO.setConnection(conn);
		articleList = noticeDAO.selectArticleList(page,limit);
		close(conn);
		return articleList;
		
	}

}
