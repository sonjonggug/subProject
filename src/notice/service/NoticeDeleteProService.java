package notice.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import notice.dao.NoticeDAO;

public class NoticeDeleteProService {

	public boolean deleteArticle(int nNUM) throws Exception{
		
		boolean isRemoveSuccess = false;
		Connection conn = getConnection();
		NoticeDAO noticeDAO = NoticeDAO.getInstance();
		noticeDAO.setConnection(conn);
		int deleteCount = noticeDAO.deleteArticle(nNUM);
		
		if(deleteCount > 0){
			commit(conn);
			isRemoveSuccess=true;
		}
		else{
			rollback(conn);
		}
		
		close(conn);
		return isRemoveSuccess;
	}

}
