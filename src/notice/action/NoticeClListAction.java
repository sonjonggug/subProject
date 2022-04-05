package notice.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.Action;
import main.ActionForward;
import notice.bean.NoticeBean;
import notice.bean.NoticePageInfo;
import notice.service.NoticeListService;

 public class NoticeClListAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		ArrayList<NoticeBean> articleList=new ArrayList<NoticeBean>();
	  	int page=1;
		int limit=5;
		
		request.setAttribute("fromURI", request.getRequestURI());
		System.out.println("현재 fromURI 값은 " + request.getRequestURI());
		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		NoticeListService noticeListService = new NoticeListService();
		int listCount=noticeListService.getListCount(); //珥� 由ъ뒪�듃 �닔瑜� 諛쏆븘�샂.
		articleList = noticeListService.getArticleList(page,limit); //由ъ뒪�듃瑜� 諛쏆븘�샂.
		//珥� �럹�씠吏� �닔.
   		int maxPage=(int)((double)listCount/limit/2+0.95); //0.95瑜� �뜑�빐�꽌 �삱由� 泥섎━.
   		//�쁽�옱 �럹�씠吏��뿉 蹂댁뿬以� �떆�옉 �럹�씠吏� �닔(1, 11, 21 �벑...)
   		int startPage = (((int) ((double)page / 5 + 0.9)) - 1) * 5 + 1;
   		//�쁽�옱 �럹�씠吏��뿉 蹂댁뿬以� 留덉�留� �럹�씠吏� �닔.(10, 20, 30 �벑...)
	        int endPage = startPage+5-1;

		if (endPage> maxPage) endPage= maxPage;

   		NoticePageInfo pageInfo = new NoticePageInfo();
   		pageInfo.setEndPage(endPage);
   		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);	
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("articleList", articleList);
		ActionForward forward= new ActionForward();
   		forward.setPath("/view/notice/noticeClList.jsp");
   		return forward;
   		
	 }
	 
 }