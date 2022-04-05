package notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.Action;
import main.ActionForward;
import notice.action.NoticeAdDetailAction;
import notice.action.NoticeAdListAction;
import notice.action.NoticeAdSearchAction;
import notice.action.NoticeClDetailAction;
import notice.action.NoticeClListAction;
import notice.action.NoticeClSearchAction;
import notice.action.NoticeDeleteAction;
import notice.action.NoticeDeleteProAction;
import notice.action.NoticeIndexAction;
import notice.action.NoticeListViewAction;
import notice.action.NoticeModifyFormAction;
import notice.action.NoticeModifyProAction;
import notice.action.NoticeWriteAction;
import notice.action.NoticeWriteProAction;

@WebServlet("*.no")
public class NoticeController extends javax.servlet.http.HttpServlet {
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		ActionForward forward=null;
		Action action=null;

		if(command.equals("/noticeWriteForm.no")){
			action  = new NoticeWriteAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/noticeWritePro.no")){
			action  = new NoticeWriteProAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/noticeList.no")){
			action = new NoticeListViewAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/noticeClList.no")){
			action = new NoticeClListAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/noticeAdList.no")){
			action = new NoticeAdListAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/noticeClDetail.no")){
			action = new NoticeClDetailAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/noticeAdDetail.no")){
			action = new NoticeAdDetailAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/noticeModifyForm.no")){
			action = new NoticeModifyFormAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/noticeModifyPro.no")){
			action = new NoticeModifyProAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/noticeDeleteProAction.no")){
			action = new NoticeDeleteProAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/noticeDeleteAction.no")){
			action = new NoticeDeleteAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("./")){
			action = new NoticeIndexAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/noticeClSearchAction.no")){
			action = new NoticeClSearchAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/noticeAdSearchAction.no")){
			action = new NoticeAdSearchAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	    else if(command.equals("/modal.ca")){
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