package car.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServlet;
import car.action.CarAdDeleteProAction;

import car.action.CarAdDetailAction;
import car.action.CarAdDetailProAction;
import car.action.CarClDetailAction;
import car.action.CarAdSearchListAction;
import car.action.CarModifyFormAction;
import car.action.CarAdInsertFormAction;
import car.action.CarAdInsertAction;
import car.action.CarClSanListAction;
import main.ActionForward;
import main.Action;

@WebServlet("*.ca")
public class CarController extends HttpServlet {  

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		ActionForward forward=null;
		Action action=null;

		if(command.equals("/carInsertForm.ca")){
		forward=new ActionForward();
		action  = new CarAdInsertFormAction();
		try {
		forward=action.execute(request, response );
		System.out.println("MainController/carWriteProAction �떎�뻾 �썑 Return");
		} catch (Exception e) {
				e.printStackTrace();
		}
		}else if(command.equals("/carAdInsert.ca")){
		action  = new CarAdInsertAction();
		try {
		forward=action.execute(request, response );
		} catch (Exception e) {
				e.printStackTrace();
		}
		}else if(command.equals("/carAdSearchList.ca")){
			action = new CarAdSearchListAction();
			try{
			forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/carClList.ca")){
		     request.setAttribute("fromURI", request.getRequestURI() + "?" + request.getQueryString());
		     System.out.println("현재 fromURI 값은 " + request.getRequestURI() + "?" + request.getQueryString());
		     
			 forward=new ActionForward();
			 forward.setPath("/view/car/carClList.jsp");
	   }
		else if(command.equals("/carClSanList.ca")){
			action = new CarClSanListAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/carAdDetail.ca")){
			action = new CarAdDetailAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/carAdDetailPro.ca")){
			action = new CarAdDetailProAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/carClDetail.ca")){
			action = new CarClDetailAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}	

		else if(command.equals("/carModifyForm.ca")){
			action = new CarModifyFormAction();
			System.out.println("�닔�젙 �떎�뻾");
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		
		}else if(command.equals("/carDeletePro.ca")){
			action = new CarAdDeleteProAction();
			try{
			forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/carIdCheck.ca")){
			forward=new ActionForward();
			 forward.setPath("/view/main/mycarAdIdCheck.jsp");
		}
	
		
		if(forward != null){
			
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher=
						request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
			
		}
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}  	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}   
	
}