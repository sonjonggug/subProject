package notice.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import notice.bean.NoticeBean;
import notice.dao.NoticeDAO;
public class NoticeWriteProService {

	public boolean registArticle(NoticeBean noticeBean) throws Exception{
		
		boolean isWriteSuccess = false;
		Connection conn = getConnection();
		NoticeDAO noticeDAO = NoticeDAO.getInstance();
		noticeDAO.setConnection(conn);
		int insertCount = noticeDAO.insertArticle(noticeBean);
		
		if(insertCount > 0){
			commit(conn);
			isWriteSuccess = true;
		}
		else{
			rollback(conn);
		}
		
		close(conn);
		return isWriteSuccess;
		
	}

}
