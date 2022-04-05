package qna.qnaq.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.Action;
import main.ActionForward;
import qna.bean.PageInfo;
import qna.bean.QnaQBean;
import qna.qnaq.svc.QnaQClSearchListService;

public class QnaQClSearchListAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		 	ArrayList<QnaQBean> articleList=new ArrayList<QnaQBean>();
	   		
		  	int page=1;
			int limit=5;
			ActionForward forward = null;
			
			request.setAttribute("fromURI", request.getRequestURI() + "?" + request.getQueryString());
			System.out.println("현재 fromURI 값은 " + request.getRequestURI() + "?" + request.getQueryString());
			
		    String qsearch = request.getParameter("qsearch");
			if(request.getParameter("page")!=null){
				page=Integer.parseInt(request.getParameter("page"));
			}
		   	forward = new ActionForward();
		   	QnaQClSearchListService qnaQClSearchListService = new QnaQClSearchListService();
			int listCount = qnaQClSearchListService.getSearchCount(qsearch); //총 리스트 수를 받아옴.
			System.out.println(listCount);
			articleList = qnaQClSearchListService.getClSearchList(page,limit,qsearch); //리스트를 받아옴.
			//총 페이지 수.
	   		int maxPage=(int)((double)listCount/limit/2+0.95); //0.95를 더해서 올림 처리.
	   		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
	   		int startPage = (((int) ((double)page / 5 + 0.9)) - 1) * 5 + 1;
	   		//현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
	   	        int endPage = startPage+5-1;

	   		if (endPage > maxPage) endPage = maxPage;

	   		PageInfo pageInfo = new PageInfo();
	   		pageInfo.setEndPage(endPage);
	   		pageInfo.setListCount(listCount);
			pageInfo.setMaxPage(maxPage);
			pageInfo.setPage(page);
			pageInfo.setStartPage(startPage);	
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("articleList", articleList);
	   		forward.setPath("/view/qna/qnaQClSearchList.jsp");
	   		return forward;
		 }
}

