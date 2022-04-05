package car.action;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import car.bean.CarBean;
import car.bean.CarPageInfo;
import car.service.CarClSanListService;
import main.Action;
import main.ActionForward;

 public class CarClSanListAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		ArrayList<CarBean> carList=new ArrayList<CarBean>();
	  	int page=1;
		int limit=6;
		String ctype = request.getParameter("ctype");
		String csize = request.getParameter("csize");
		
		request.setAttribute("fromURI", request.getRequestURI() + "?" + request.getQueryString());
		System.out.println("현재 fromURI 값은 " + request.getRequestURI() + "?" + request.getQueryString());
		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		CarClSanListService CarClSanListService = new CarClSanListService();
		int listCount=CarClSanListService.getListCount(ctype, csize); 
		carList = CarClSanListService.getArticleList(page,limit,ctype,csize); 
   		int maxPage=(int)((double)listCount/limit+0.95); 
   		int startPage = (((int) ((double)page / 3 + 0.9)) - 1) * 3 + 1;
   	    int endPage = startPage+3-1;

   		if (endPage> maxPage) endPage= maxPage;

   		CarPageInfo pageInfo = new CarPageInfo();
   		pageInfo.setEndPage(endPage);
   		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);	
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("carList", carList);
		ActionForward forward= new ActionForward();
		forward.setPath("/view/car/carClSanList.jsp");
		System.out.println("caClSanListAction > carController濡� �씠�룞");
   		return forward;
   		
	 }
	 
 }