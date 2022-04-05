package qna.qnaa.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import qna.bean.QnaABean;
import qna.dao.QnaDAO;

public class QnaADeleteProService {
	
	public boolean deleteQnaA(QnaABean qnaABean) throws Exception {
		// TODO Auto-generated method stub
		
		boolean isWriteSuccess = false;
		Connection conn = getConnection();
		QnaDAO qnaDAO = QnaDAO.getInstance();
		qnaDAO.setConnection(conn);
		int deleteCount = qnaDAO.deleteQnaA(qnaABean);
		
		if(deleteCount > 0){
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