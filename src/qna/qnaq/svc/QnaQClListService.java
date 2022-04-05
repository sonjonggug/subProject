package qna.qnaq.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import qna.bean.QnaQBean;
import qna.dao.QnaDAO;

public class QnaQClListService {
	
	public int getListCount() throws Exception{
		// TODO Auto-generated method stub
		
		int listCount = 0;
		Connection conn = getConnection();
		QnaDAO qnaDAO = QnaDAO.getInstance();
		qnaDAO.setConnection(conn);
		listCount = qnaDAO.selectListCount();
		close(conn);
		return listCount;
		
	}

	public ArrayList<QnaQBean> getArticleList(int page, int limit) throws Exception{
		
		ArrayList<QnaQBean> articleList = null;
		Connection conn = getConnection();
		QnaDAO qnaQDAO = QnaDAO.getInstance();
		qnaQDAO.setConnection(conn);
		articleList = qnaQDAO.selectQnaQList(page, limit);
		close(conn);
		return articleList;
		
	}

}
