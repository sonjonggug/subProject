package qna.dao;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import qna.bean.QnaABean;
import qna.bean.QnaQBean;

public class QnaDAO {


	DataSource ds;
	Connection conn;
	private static QnaDAO QnaQDAO;

	private QnaDAO() {
		// TODO Auto-generated constructor stub
	}

	public static QnaDAO getInstance(){
		if(QnaQDAO == null){
			QnaQDAO = new QnaDAO();
		}
		return QnaQDAO;
	}

	public void setConnection(Connection conn){
		this.conn = conn;
	}
	// 질문 등록(고객)
	public int insertQnaQ(QnaQBean qnaQBean){

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql="";
		int insertCount=0;

		try{
			pstmt=conn.prepareStatement("select qnum from QnaQ");
			rs = pstmt.executeQuery();

			sql="insert into QnaQ (qid, qtitle, qcon, qread, qdate) values(?,?,?,?,now())";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, qnaQBean.getQID());
			pstmt.setString(2, qnaQBean.getQTITLE());
			pstmt.setString(3, qnaQBean.getQCON());
			pstmt.setInt(4, 0);

			insertCount=pstmt.executeUpdate();

		} catch(Exception ex){
			System.out.println("QnaQInsert 에러 : "+ex);
		} finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}
	//질문 리스트 카운트
	public int selectListCount() {

		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			System.out.println("getConnection");
			pstmt=conn.prepareStatement("select count(*) from qnaq");
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1);
			}
		} catch(Exception ex){
			System.out.println("getListCount 에러: " + ex);			
		} finally{
			close(rs);
			close(pstmt);
		}

		return listCount;

	}
	//질문 리스트 나열
	public ArrayList<QnaQBean> selectQnaQList(int page, int limit){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="select * from qnaq order by QNUM desc limit ?,10";
		ArrayList<QnaQBean> articleList = new ArrayList<QnaQBean>();
		QnaQBean QnaQ = null;
		int startrow=(page-1)*10; //읽기 시작할 row 번호..	

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();

			while(rs.next()){
				QnaQ = new QnaQBean();
				QnaQ.setQNUM(rs.getInt("QNUM"));
				QnaQ.setQID(rs.getString("QID"));
				QnaQ.setQTITLE(rs.getString("QTITLE"));
				QnaQ.setQCON(rs.getString("QCON"));
				QnaQ.setQREAD(rs.getInt("QREAD"));
				QnaQ.setQDATE(rs.getDate("QDATE"));
				articleList.add(QnaQ);
			}

		} catch(Exception ex){
			System.out.println("getBoardList 에러 : " + ex);
		} finally{
			close(rs);
			close(pstmt);
		}

		return articleList;

	}
	//조회수 카운트
	public int updateReadCount(int qnum){

		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql="update qnaq set QREAD = QREAD+1 where QNUM = "+ qnum;

		try{
			pstmt=conn.prepareStatement(sql);
			updateCount = pstmt.executeUpdate();
		}catch(SQLException ex){
			System.out.println("setReadCountUpdate 에러 : "+ex);
		}
		finally{
			close(pstmt);

		}

		return updateCount;

	}
	//질문 상세보기
	public QnaQBean selectArticle(int qnum){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		QnaQBean qnaQBean= null;

		try{
			pstmt = conn.prepareStatement(
					"select * from qnaq where QNUM = ?");
			pstmt.setInt(1, qnum);
			rs= pstmt.executeQuery();

			if(rs.next()){
				qnaQBean = new QnaQBean();
				qnaQBean.setQNUM(rs.getInt("QNUM"));
				qnaQBean.setQID(rs.getString("QID"));
				qnaQBean.setQTITLE(rs.getString("QTITLE"));
				qnaQBean.setQCON(rs.getString("QCON"));
				qnaQBean.setQREAD(rs.getInt("QREAD"));
				qnaQBean.setQDATE(rs.getDate("QDATE"));
			}
			
		}catch(Exception ex){
			System.out.println("getDetail 에러 : " + ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return qnaQBean;

	}
	//답변 등록(관리자)
	public int insertQnaA(QnaABean qnaABean){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		

		String sql="";
		int insertCount=0;
		
		try{
			pstmt=conn.prepareStatement("select qnum from QnaQ");
			rs = pstmt.executeQuery();
			sql="update qnaq set QREP = 'Y' where QNUM = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qnaABean.getAREP());
			int updateCount=pstmt.executeUpdate();

			if(updateCount > 0){
				commit(conn);
			}
			pstmt=conn.prepareStatement("select qnum from QnaQ");
			rs = pstmt.executeQuery();
			
			sql="insert into QnaA (AREP, AID, ACON, ADATE) values(?,?,?,now())";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, qnaABean.getAREP());
			pstmt.setString(2, qnaABean.getAID());
			pstmt.setString(3, qnaABean.getACON());
			
			insertCount=pstmt.executeUpdate();

		} catch(Exception ex){
			System.out.println("QnaQInsert 에러 : "+ex);
		} finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}
	//답변 삭제(관리자)
		public int deleteQnaA(QnaABean qnaABean){

			PreparedStatement pstmt = null;
			ResultSet rs = null;
			

			String sql="";
			int insertCount=0;
			
			try{
				pstmt=conn.prepareStatement("select qnum from QnaQ");
				rs = pstmt.executeQuery();
				sql="update qnaq set QREP = 'N' where QNUM = ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, qnaABean.getAREP());
				int updateCount=pstmt.executeUpdate();

				if(updateCount > 0){
					commit(conn);
				}
				pstmt=conn.prepareStatement("select qnum from QnaQ");
				rs = pstmt.executeQuery();
				
				sql="delete from qnaa where AREP = ?";

				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, qnaABean.getAREP());
				
				insertCount=pstmt.executeUpdate();

			} catch(Exception ex){
				System.out.println("QnaQInsert 에러 : "+ex);
			} finally{
				close(rs);
				close(pstmt);
			}

			return insertCount;

		}
	// 댓글 가져오기
	public QnaABean selectQnaA(int qnum){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		QnaABean qnaABean= null;

		try{
			pstmt = conn.prepareStatement(
					"select * from QnaA where AREP = ?");
			pstmt.setInt(1, qnum);
			rs= pstmt.executeQuery();
			
		if(rs.next()){
			qnaABean = new QnaABean();
			qnaABean.setAID(rs.getString("AID"));
			qnaABean.setACON(rs.getString("ACON"));
			qnaABean.setADATE(rs.getDate("ADATE"));
			}

			
		} catch(Exception ex){
			System.out.println("getDetail 에러 : " + ex);
		} finally{
			close(rs);
			close(pstmt);
		}

		return qnaABean;

	}
	//질문 삭제(관리자)
	public int deleteQnaQ(int qnum){

		PreparedStatement pstmt = null;
		String deletesql="delete from qnaq where QNUM = ? and QREP = 'N'";
		int deleteCount=0;

		try{
			pstmt=conn.prepareStatement(deletesql);
			pstmt.setInt(1, qnum);
			deleteCount=pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("boardDelete 에러 : "+ex);
		}	finally{
			close(pstmt);
		}

		return deleteCount;

	}
	//질문 삭제(고객)
	public int deleteQnaQCl(int qnum){

		PreparedStatement pstmt = null;
		String deletesql="delete from qnaq where QNUM = ? and QREP = 'N'";
		int deleteCount=0;

		try{
			pstmt=conn.prepareStatement(deletesql);
			pstmt.setInt(1, qnum);
			deleteCount=pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("boardDelete 에러 : "+ex);
		}	finally{
			close(pstmt);
		}

		return deleteCount;

	}
	//질문 수정(고객)
	public int updateQnaQ(QnaQBean qnaQBean){

		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql="update QNAQ set QTITLE = ?, QCON = ? where QNUM = ? and QREP = 'N'";

		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qnaQBean.getQTITLE());
			pstmt.setString(2, qnaQBean.getQCON());
			pstmt.setInt(3, qnaQBean.getQNUM());
			updateCount = pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("boardModify 에러 : " + ex);
		}finally{
			close(pstmt);
		}

		return updateCount;

	}
	//내 글 갯수
	public int selectList(String qid) {

		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			System.out.println("검색 완료");
			pstmt=conn.prepareStatement("select count(*) from qnaq where QID like '%"+qid+"%'");
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1);
			}
		} catch(Exception ex){
			System.out.println("getListCount 에러: " + ex);			
		} finally{
			close(rs);
			close(pstmt);
		}

		return listCount;

	}
	//내 글 검색기능
	public ArrayList<QnaQBean> getSelectList(int page, int limit, String qid){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="select * from qnaq where QID like'%"+qid+"%' order by QNUM desc limit ?,10";
		ArrayList<QnaQBean> articleList = new ArrayList<QnaQBean>();
		QnaQBean QnaQ = null;
		int startrow=(page-1)*10; //읽기 시작할 row 번호..	

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();

			while(rs.next()){
				QnaQ = new QnaQBean();
				QnaQ.setQNUM(rs.getInt("QNUM"));
				QnaQ.setQID(rs.getString("QID"));
				QnaQ.setQTITLE(rs.getString("QTITLE"));
				QnaQ.setQCON(rs.getString("QCON"));
				QnaQ.setQREAD(rs.getInt("QREAD"));
				QnaQ.setQDATE(rs.getDate("QDATE"));
				articleList.add(QnaQ);
			}

		} catch(Exception ex){
			System.out.println("getBoardList 에러 : " + ex);
		} finally{
			close(rs);
			close(pstmt);
		}

		return articleList;

	}
	//아이디 검색 갯수
	public int adSelectList(String qid) {

		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			System.out.println("검색 완료");
			pstmt=conn.prepareStatement("select count(*) from qnaq where QID like '%"+qid+"%'");
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1);
			}
		} catch(Exception ex){
			System.out.println("getListCount 에러: " + ex);			
		} finally{
			close(rs);
			close(pstmt);
		}

		return listCount;

	}
	//아이디 검색 기능
	public ArrayList<QnaQBean> getAdSelectList(int page, int limit, String qid){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="select * from qnaq where QID '%"+qid+"%' order by QNUM desc limit ?,10";
		ArrayList<QnaQBean> articleList = new ArrayList<QnaQBean>();
		QnaQBean QnaQ = null;
		int startrow=(page-1)*10; //읽기 시작할 row 번호..	

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();

			while(rs.next()){
				QnaQ = new QnaQBean();
				QnaQ.setQNUM(rs.getInt("QNUM"));
				QnaQ.setQID(rs.getString("QID"));
				QnaQ.setQTITLE(rs.getString("QTITLE"));
				QnaQ.setQCON(rs.getString("QCON"));
				QnaQ.setQREAD(rs.getInt("QREAD"));
				QnaQ.setQDATE(rs.getDate("QDATE"));
				articleList.add(QnaQ);
			}

		} catch(Exception ex){
			System.out.println("getBoardList 에러 : " + ex);
		} finally{
			close(rs);
			close(pstmt);
		}

		return articleList;

	}
	//인덱스 페이지
			public ArrayList<QnaQBean> mainArticle(){

				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql="select QNUM, QTITLE, QDATE from QNAQ order by QNUM desc limit 2";
				ArrayList<QnaQBean> articleList = new ArrayList<QnaQBean>();
				QnaQBean qnaQBean = null;

				try{
					pstmt=conn.prepareStatement(sql);
					rs=pstmt.executeQuery();
					
					while(rs.next()){
						qnaQBean = new QnaQBean();
						qnaQBean.setQNUM(rs.getInt("QNUM"));
						qnaQBean.setQTITLE(rs.getString("QTITLE"));
						qnaQBean.setQDATE(rs.getDate("QDATE"));
						articleList.add(qnaQBean);
					}
				}catch(Exception ex){
					System.out.println("mainArticle error : "+ex);
				}finally{
					close(rs);
					close(pstmt);
				}

				return articleList;

			}
			//키워드 검색글 갯수
			public int ClSearchList(String qsearch) {

				int listCount= 0;
				PreparedStatement pstmt = null;
				ResultSet rs = null;

				try{
					System.out.println("검색 완료");
					pstmt=conn.prepareStatement("select count(*) from qnaq where QTITLE like '%"+qsearch+"%'");
					rs = pstmt.executeQuery();

					if(rs.next()){
						listCount=rs.getInt(1);
					}
				} catch(Exception ex){
					System.out.println("getListCount 에러: " + ex);			
				} finally{
					close(rs);
					close(pstmt);
				}

				return listCount;

			}
			//키워드 검색기능
			public ArrayList<QnaQBean> getSearchList(int page, int limit, String qsearch){

				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql="select * from qnaq where QTITLE like'%"+qsearch+"%' order by QNUM desc limit ?,10";
				ArrayList<QnaQBean> articleList = new ArrayList<QnaQBean>();
				QnaQBean QnaQ = null;
				int startrow=(page-1)*10; //읽기 시작할 row 번호..	

				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, startrow);
					rs = pstmt.executeQuery();

					while(rs.next()){
						QnaQ = new QnaQBean();
						QnaQ.setQNUM(rs.getInt("QNUM"));
						QnaQ.setQID(rs.getString("QID"));
						QnaQ.setQTITLE(rs.getString("QTITLE"));
						QnaQ.setQCON(rs.getString("QCON"));
						QnaQ.setQREAD(rs.getInt("QREAD"));
						QnaQ.setQDATE(rs.getDate("QDATE"));
						articleList.add(QnaQ);
					}

				} catch(Exception ex){
					System.out.println("getBoardList 에러 : " + ex);
				} finally{
					close(rs);
					close(pstmt);
				}

				return articleList;

			}
}
