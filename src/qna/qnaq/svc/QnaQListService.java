package qna.qnaq.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import qna.bean.QnaQBean;
import qna.dao.QnaDAO;

public class QnaQListService {
	
	public int getListCount() throws Exception{
		// TODO Auto-generated method stub
		
		int listCount = 0;
		Connection con = getConnection();
		QnaDAO qnaQDAO = QnaDAO.getInstance();
		qnaQDAO.setConnection(con);
		listCount = qnaQDAO.selectListCount();
		close(con);
		return listCount;
		
	}

	public ArrayList<QnaQBean> getArticleList(int page, int limit) throws Exception{
		
		ArrayList<QnaQBean> articleList = null;
		Connection con = getConnection();
		QnaDAO qnaQDAO = QnaDAO.getInstance();
		qnaQDAO.setConnection(con);
		articleList = qnaQDAO.selectQnaQList(page,limit);
		close(con);
		return articleList;
		
	}

}
