package notice.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import notice.bean.NoticeBean;
import notice.dao.NoticeDAO;

public class NoticeDetailService {

	public NoticeBean getArticle(int nnum) throws Exception{
		
		NoticeBean article = null;
		Connection conn = getConnection();
		NoticeDAO noticeDAO = NoticeDAO.getInstance();
		noticeDAO.setConnection(conn);
		int updateCount = noticeDAO.updateReadCount(nnum);
		
		if(updateCount > 0){
			commit(conn);
		}
		else{
			rollback(conn);
		}
		
		article = noticeDAO.selectArticle(nnum);
		close(conn);
		return article;
		
	}

}

