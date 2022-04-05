package qna.qnaq.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import qna.bean.QnaQBean;
import qna.dao.QnaDAO;

public class QnaQSelectListService {
	public int getListCount(String id) throws Exception{
		// TODO Auto-generated method stub
		
		int listCount = 0;
		Connection conn = getConnection();
		QnaDAO qnaDAO = QnaDAO.getInstance();
		qnaDAO.setConnection(conn);
		listCount = qnaDAO.selectList(id);
		close(conn);
		return listCount;
		
	}

	public ArrayList<QnaQBean> getSelectList(int page, int limit, String id) throws Exception{
		
		ArrayList<QnaQBean> articleList = null;
		Connection conn = getConnection();
		QnaDAO qnaDAO = QnaDAO.getInstance();
		qnaDAO.setConnection(conn);
		articleList = qnaDAO.getSelectList(page, limit, id);
		close(conn);
		return articleList;
		
	}

}
