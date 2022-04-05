package qna.qnaq.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import qna.bean.QnaQBean;
import qna.dao.QnaDAO;

public class QnaIndexService {

	public ArrayList<QnaQBean> getIndexArticle() throws Exception{
		
		ArrayList<QnaQBean> articleList = null;
		Connection conn = getConnection();
		QnaDAO qnaDAO = QnaDAO.getInstance();
		qnaDAO.setConnection(conn);
		articleList = qnaDAO.mainArticle();
		System.out.println(articleList);

		close(conn);
		return articleList;
		
	}
}
