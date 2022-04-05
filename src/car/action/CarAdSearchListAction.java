package car.action;

import java.io.PrintWriter;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import car.bean.CarBean;
import car.bean.CarPageInfo;
import main.Action;
import main.ActionForward;
import car.service.CarAdSearchListService;

 public class CarAdSearchListAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
			HttpSession session=request.getSession();
			String id=(String)session.getAttribute("id");
			ActionForward forward = null;
			System.out.print("관리자 AdListAction: ");
			System.out.println(id);
			
	
			if(id==null) {
				response.setContentType("text/html;charset=UTF8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("location.href='./carIdCheck.ca';");
				out.println("</script>");
			
			}else if(!id.equals("admin")){
				response.setContentType("text/html;charset=UTF8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("location.href='./carIdCheck.ca';");
				out.println("</script>");
			}
			else {
        ArrayList<CarBean> carList=new ArrayList<CarBean>();
	  	int page=1;
		int limit=10;
		String fieldName = request.getParameter("fieldName");
		String word = request.getParameter("word");
		System.out.println("관리자 리스트 검색");
		System.out.println("콤보박스에서 넘어온 값" + fieldName);
		System.out.println("text Field에 입력한 값 " +word);
		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}// page 값이 있으면
		if(fieldName== null && word==null) {
			fieldName = "All";
			word = "";
		}
		CarAdSearchListService carAdSearchListService = new CarAdSearchListService();
		int listCount=carAdSearchListService.getListCount(fieldName, word); //총 리스트 수를 받아옴.
		carList = carAdSearchListService.getCarSearchList(page, limit, fieldName, word); //리스트를 받아옴.
		System.out.println("CarAdSearchActionList으로 Service에서 넘어온 값"  + carList);
		//총 페이지 수.
   		int maxPage=(int)((double)listCount/limit+0.95); //0.95를 더해서 올림 처리.
   	    //현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
   		int startPage = (((int) ((double)page / 5 + 0.9)) - 1) * 5 + 1;
   	    //현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
   	        int endPage = startPage+5-1;

   		if (endPage> maxPage) endPage= maxPage;
          //마지막 페이지(end)가 DB에 저장되어 있는 상품(max)으로 표현 할 수있는 페이지 보다 크다면... endPage= maxPage
   		CarPageInfo pageInfo = new CarPageInfo();
   		pageInfo.setFieldName(fieldName);
   		pageInfo.setWord(word);
   		pageInfo.setEndPage(endPage);
   		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);	
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("carList", carList);
		forward= new ActionForward();
		forward.setPath("/view/car/carAdList.jsp");
		System.out.println("carAdListAction > carController로 이동");
			}
		return forward;	
	 }
	 
 }