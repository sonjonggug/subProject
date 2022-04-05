package qna.qnaq.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import qna.dao.QnaDAO;

public class QnaQAdDeleteProService {
	
	public boolean deleteQnaQ(int qnum) throws Exception{
		// TODO Auto-generated method stub
		
		boolean isRemoveSuccess = false;
		Connection conn = getConnection();
		QnaDAO qnaDAO = QnaDAO.getInstance();
		qnaDAO.setConnection(conn);
		int deleteCount = qnaDAO.deleteQnaQ(qnum);
		
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