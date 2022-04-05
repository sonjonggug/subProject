package notice.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import notice.bean.NoticeBean;
import notice.dao.NoticeDAO;

public class NoticeModifyProService {


	public boolean modifyArticle(NoticeBean noticeBean) throws Exception {
		
		boolean isModifySuccess = false;
		Connection conn = getConnection();
		NoticeDAO noticeDAO = NoticeDAO.getInstance();
		noticeDAO.setConnection(conn);
		int updateCount = noticeDAO.updateArticle(noticeBean);
		
		if(updateCount > 0){
			commit(conn);
			isModifySuccess=true;
		}
		else{
			rollback(conn);
		}
		
		close(conn);
		return isModifySuccess;
		
	}

}
