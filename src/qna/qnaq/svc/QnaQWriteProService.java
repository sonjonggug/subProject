package qna.qnaq.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import qna.bean.QnaQBean;
import qna.dao.QnaDAO;

public class QnaQWriteProService {
	
	public boolean registArticle(QnaQBean QnaQBean) throws Exception {
		// TODO Auto-generated method stub
		
		boolean isWriteSuccess = false;
		Connection conn = getConnection();
		QnaDAO qnaQDAO = QnaDAO.getInstance();
		qnaQDAO.setConnection(conn);
		int insertCount = qnaQDAO.insertQnaQ(QnaQBean);
		
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
