package notice.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import notice.bean.NoticeBean;
import notice.dao.NoticeDAO;

public class NoticeListSearchService {

	public int searchListCount(String noticeSearch) throws Exception{
		
		int listCount = 0;
		Connection conn = getConnection();
		NoticeDAO noticeDAO = NoticeDAO.getInstance();
		noticeDAO.setConnection(conn);
		listCount = noticeDAO.searchListCount(noticeSearch);
		close(conn);
		return listCount;
		
	}
	
	public ArrayList<NoticeBean> getSearchList(String noticeSearch, int page, int limit) throws Exception{
		
		Connection conn = getConnection();
		NoticeDAO noticeDAO = NoticeDAO.getInstance();
		noticeDAO.setConnection(conn);
		ArrayList<NoticeBean> articleList2 = noticeDAO.searchArticleList(noticeSearch, page, limit);
		close(conn);
		return articleList2;
		
	}

}
