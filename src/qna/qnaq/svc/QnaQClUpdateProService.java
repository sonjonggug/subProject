package qna.qnaq.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import qna.dao.QnaDAO;
import qna.bean.QnaQBean;

public class QnaQClUpdateProService {

	public boolean updateQnaQ(QnaQBean qnaQBean) throws Exception {
		// TODO Auto-generated method stub
		
		boolean isModifySuccess = false;
		Connection conn = getConnection();
		QnaDAO qnaDAO = QnaDAO.getInstance();
		qnaDAO.setConnection(conn);
		int updateCount = qnaDAO.updateQnaQ(qnaQBean);
		
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
