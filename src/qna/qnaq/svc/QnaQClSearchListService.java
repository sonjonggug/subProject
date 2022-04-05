package qna.qnaq.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import qna.bean.QnaQBean;
import qna.dao.QnaDAO;

public class QnaQClSearchListService {
	public int getSearchCount(String qsearch) throws Exception{
		// TODO Auto-generated method stub
		
		int listCount = 0;
		Connection conn = getConnection();
		QnaDAO qnaDAO = QnaDAO.getInstance();
		qnaDAO.setConnection(conn);
		listCount = qnaDAO.ClSearchList(qsearch);
		close(conn);
		return listCount;
		
	}

	public ArrayList<QnaQBean> getClSearchList(int page, int limit, String qsearch) throws Exception{
		
		ArrayList<QnaQBean> articleList = null;
		Connection conn = getConnection();
		QnaDAO qnaDAO = QnaDAO.getInstance();
		qnaDAO.setConnection(conn);
		articleList = qnaDAO.getSearchList(page, limit, qsearch);
		close(conn);
		return articleList;
		
	}

}

