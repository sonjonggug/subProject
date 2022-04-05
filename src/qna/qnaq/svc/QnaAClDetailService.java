package qna.qnaq.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import qna.bean.QnaQBean;
import qna.dao.QnaDAO;

public class QnaAClDetailService {
	
	public QnaQBean getReply(int qnum) throws Exception{
		// TODO Auto-generated method stub
		
		QnaQBean article = null;
		Connection conn = getConnection();
		QnaDAO qnaQDAO = QnaDAO.getInstance();
		qnaQDAO.setConnection(conn);
		int updateCount = qnaQDAO.updateReadCount(qnum);
		
		if(updateCount > 0){
			commit(conn);
		}
		else{
			rollback(conn);
		}
		
		article = qnaQDAO.selectArticle(qnum);
		close(conn);
		return article;
		
	}
	
}
