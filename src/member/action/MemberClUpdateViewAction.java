package member.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.Action;
import main.ActionForward;
import member.bean.MemberBean;
import member.service.MemberClViewService;
import res.bean.PageInfo;
import res.bean.ResClCheckBean;
import res.service.ResClListService;

public class MemberClUpdateViewAction implements Action{
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 	
		 	HttpSession session=request.getSession();
	   		String id=(String)session.getAttribute("id");
	   		
	   		ActionForward forward = null;
	   		if(id==null){
	   			forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("./memberClLogin.me");
	   		}
	   		
	   		else{
	   		forward = new ActionForward();
	   		
	   		// ResClListAction 遺�遺�
			ArrayList<ResClCheckBean> resList = new ArrayList<ResClCheckBean>();
			
			int page=1;
			int limit=5;
			
			if(request.getParameter("page")!=null){
				page=Integer.parseInt(request.getParameter("page"));
			}// page 媛믪씠 �엳�쑝硫�
			
			ResClListService resListService = new ResClListService();
			int listCount=resListService.getListCount(id); //珥� 由ъ뒪�듃 �닔瑜� 諛쏆븘�샂.
			resList = resListService.getResList(id, page,limit); //由ъ뒪�듃瑜� 諛쏆븘�샂.
			//珥� �럹�씠吏� �닔.
	   		int maxPage=(int)((double)listCount/limit+0.95); //0.95瑜� �뜑�빐�꽌 �삱由� 泥섎━.
	   	    //�쁽�옱 �럹�씠吏��뿉 蹂댁뿬以� �떆�옉 �럹�씠吏� �닔(1, 11, 21 �벑...)
	   		int startPage = (((int) ((double)page / 5 + 0.9)) - 1) * 5 + 1;
	   	    //�쁽�옱 �럹�씠吏��뿉 蹂댁뿬以� 留덉�留� �럹�씠吏� �닔.(10, 20, 30 �벑...)
	   	    int endPage = startPage+5-1;

	   		if (endPage> maxPage) endPage= maxPage;
	          //留덉�留� �럹�씠吏�媛� DB�뿉 ���옣�릺�뼱 �엳�뒗 �긽�뭹�쑝濡� �몴�쁽 �븷 �닔�엳�뒗 �럹�씠吏� 蹂대떎 �겕�떎硫�... endPage= maxPage
			
	   		PageInfo pageInfo = new PageInfo();
	   		pageInfo.setEndPage(endPage);
	   		pageInfo.setListCount(listCount);
			pageInfo.setMaxPage(maxPage);
			pageInfo.setPage(page);
			pageInfo.setStartPage(startPage);	
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("resList", resList);
	   		
			// MemberClUpdateViewAction 遺�遺�
	   		String updateViewId=id;
	   		MemberClViewService memberClViewService = new MemberClViewService();
	   		MemberBean member=memberClViewService.getMember(updateViewId);
	   		request.setAttribute("member", member);
	   		request.getSession().setAttribute("member", member);
	   		forward.setPath("/memberClUpdate.me");
	   		}
	   		return forward;
	}
}