package notice.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import notice.bean.NoticeBean;
import notice.dao.NoticeDAO;

public class NoticeIndexService {

	public ArrayList<NoticeBean> getIndexArticle() throws Exception{
		
		ArrayList<NoticeBean> articleList = null;
		Connection conn = getConnection();
		NoticeDAO noticeDAO = NoticeDAO.getInstance();
		noticeDAO.setConnection(conn);
		articleList = noticeDAO.mainArticle();

		close(conn);
		return articleList;
		
	}
}
