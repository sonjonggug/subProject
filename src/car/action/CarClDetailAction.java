package car.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import car.bean.CarBean;
import car.service.CarDetailService;
import main.Action;
import main.ActionForward;

 public class CarClDetailAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		String cCode =request.getParameter("cCode");
		String page = request.getParameter("page");
		
		request.setAttribute("fromURI", request.getRequestURI() + "?" + request.getQueryString());
		System.out.println("현재 fromURI 값은 " + request.getRequestURI() + "?" + request.getQueryString());
		
		CarDetailService carDetailService = new CarDetailService();
		CarBean car = carDetailService.getArticle(cCode);
		ActionForward forward = new ActionForward();
		request.setAttribute("page", page);
	   	request.setAttribute("car", car);
   		forward.setPath("/view/car/carClView.jsp");
   		System.out.println(forward);
   		return forward;

	 }
	 
}