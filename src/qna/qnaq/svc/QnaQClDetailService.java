package qna.qnaq.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import qna.bean.QnaABean;
import qna.bean.QnaQBean;
import qna.dao.QnaDAO;

public class QnaQClDetailService {

	public QnaQBean getArticle(int qnum) throws Exception{
		// TODO Auto-generated method stub
		
		QnaQBean article = null;
		Connection conn = getConnection();
		QnaDAO qnaDAO = QnaDAO.getInstance();
		qnaDAO.setConnection(conn);
		int updateCount = qnaDAO.updateReadCount(qnum);
		
		if(updateCount > 0){
			commit(conn);
		}
		else{
			rollback(conn);
		}
		
		article = qnaDAO.selectArticle(qnum);
		close(conn);
		return article;
		
	}
	public QnaABean getReply(int qnum) throws Exception{
		// TODO Auto-generated method stub
		
		QnaABean reply = null;
		Connection conn = getConnection();
		QnaDAO qnaDAO = QnaDAO.getInstance();
		qnaDAO.setConnection(conn);
		reply = qnaDAO.selectQnaA(qnum);
		close(conn);
		return reply;
		
	}
}
