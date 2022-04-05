package car.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import car.bean.CarBean;
import car.service.CarAdModifyProService;
import main.Action;
import main.ActionForward;

public class CarModifyTest implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{
           
		ActionForward forward = null;
		boolean isModifySuccess = false;
		CarBean article=new CarBean();
		String cCode=(request.getParameter("cCode"));
		String page = request.getParameter("page");
		CarAdModifyProService boardModifyProService = new CarAdModifyProService();
		   
		    article.setcCode(request.getParameter("cCode"));
			article.setcType(request.getParameter("cType"));
			article.setcSize(request.getParameter("cSize"));
			article.setcName(request.getParameter("cName"));
			article.setcPrice(Integer.parseInt(request.getParameter("cPrice")));
			article.setcGear(request.getParameter("cGear"));
			article.setcFuel(request.getParameter("cFuel"));
			article.setcSeat(request.getParameter("cSeat"));
			article.setcFile(request.getParameter("cFile"));
			
			isModifySuccess = boardModifyProService.modifyArticle(article);

			if(!isModifySuccess){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('수정 실패');");
				out.println("history.back()");
				out.println("</script>");
			}
			else{
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("./carAdDetail.ca?cCode="+cCode+"&&page="+ page); 
				
			}

		

		return forward;
	}

}