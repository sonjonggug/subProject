package res.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import car.bean.CarBean;
import main.Action;
import main.ActionForward;
import res.service.ResAdCarSearchService;

public class ResAdCarSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		ActionForward forward = null;
		forward = new ActionForward();
		System.out.print("관리자 AdListAction: ");
		System.out.println(id);
		
		if(id==null) {
			response.setContentType("text/html;charset=UTF8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("location.href='/mycar/admin.me'");
			out.println("</script>");
		
		} else if(!id.equals("admin")){
			response.setContentType("text/html;charset=UTF8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("location.href='/mycar/admin.me'");
			out.println("</script>");
	
		} else {
			System.out.println("ResAdCarSearchAction에서 ccode값 " + request.getParameter("ccode"));
	   		String viewCar=request.getParameter("ccode");
	   		ResAdCarSearchService carSearchService = new ResAdCarSearchService();
	   		CarBean prod = carSearchService.getCar(viewCar);
	   		System.out.println("ResAdCarSearchAction에서 viewCar값 :" + viewCar);
			System.out.println("ResAdCarSearchAction에서 prod값 :" + prod);		
	   		request.setAttribute("prod", prod);
	   		System.out.println("ResAdCarSearchAction에서 prod값 :" + prod);
	   		forward.setPath("/view/res/resAdCarSearch.jsp");
		}
		return forward;
	}
}