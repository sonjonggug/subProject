package qna.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.Action;
import main.ActionForward;
import qna.qnaa.action.QnaADeleteProAction;
import qna.qnaa.action.QnaAWriteProAction;
import qna.qnaq.action.QnaIndexAction;
import qna.qnaq.action.QnaQAdDeleteProAction;
import qna.qnaq.action.QnaQAdDetailAction;
import qna.qnaq.action.QnaQAdListAction;
import qna.qnaq.action.QnaQAdSelectListAction;
import qna.qnaq.action.QnaQAdUpdateFormAction;
import qna.qnaq.action.QnaQAdUpdateProAction;
import qna.qnaq.action.QnaQClDeleteProAction;
import qna.qnaq.action.QnaQClDetailAction;
import qna.qnaq.action.QnaQClListAction;
import qna.qnaq.action.QnaQClSearchListAction;
import qna.qnaq.action.QnaQClUpdateFormAction;
import qna.qnaq.action.QnaQClUpdateProAction;
import qna.qnaq.action.QnaQSelectListAction;
import qna.qnaq.action.QnaQWrireViewAction;
//import qna.qnaq.action.QnaQClUpdateProAction;
import qna.qnaq.action.QnaQWriteProAction;

@WebServlet("*.qn")
public class QnaController extends javax.servlet.http.HttpServlet {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		ActionForward forward=null;
		Action action=null;

		if(command.equals("/qnaQWriteFrom.qn")){
			action  = new QnaQWrireViewAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/qnaQWritePro.qn")){
			action  = new QnaQWriteProAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/memberClLogin.me")){
			action  = new QnaQWriteProAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}  else if(command.equals("/qnaQClList.qn")){
			action = new QnaQClListAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
			
		} else if(command.equals("/qnaQAdList.qn")){
			action = new QnaQAdListAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
			
		} else if(command.equals("/qnaQClDetail.qn")){
			action = new QnaQClDetailAction();
			try{
				forward=action.execute(request, response);
			} catch(Exception e){
				e.printStackTrace();
			}
		} else if(command.equals("/qnaQAdDetail.qn")){
			action = new QnaQAdDetailAction();
			try{
				forward=action.execute(request, response);
			} catch(Exception e){
				e.printStackTrace();
			}
		} else if(command.equals("/qnaQClUpdate.qn")){
			action = new QnaQClUpdateFormAction();
			try{
				forward=action.execute(request, response);
			} catch(Exception e){
				e.printStackTrace();
			}
		} else if(command.equals("/qnaQClUpdatePro.qn")){
				action = new QnaQClUpdateProAction();
				try{
				forward=action.execute(request, response);
				} catch(Exception e){
					e.printStackTrace();
				} 
		} else if(command.equals("/qnaQAdUpdate.qn")){
			action = new QnaQAdUpdateFormAction();
			try{
				forward=action.execute(request, response);
			} catch(Exception e){
				e.printStackTrace();
			}
		} else if(command.equals("/qnaQAdUpdatePro.qn")){
			action = new QnaQAdUpdateProAction();
			try{
			forward=action.execute(request, response);
			} catch(Exception e){
				e.printStackTrace();
			} 
		} else if(command.equals("/qnaAWrite.qn")){
			action = new QnaAWriteProAction();
			try{
				forward=action.execute(request, response);
			} catch(Exception e){
				e.printStackTrace();
			}
		} else if(command.equals("/qnaQAdDelete.qn")){
			action = new QnaQAdDeleteProAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		} else if(command.equals("/qnaQClDelete.qn")){
			action = new QnaQClDeleteProAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		} else if(command.equals("/qnaADelete.qn")){
			action = new QnaADeleteProAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		} else if(command.equals("/qnaQSelectList.qn")){
			action = new QnaQSelectListAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		} else if(command.equals("/qnaQAdSelectList.qn")){
			action = new QnaQAdSelectListAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		} else if(command.equals("./")){
			action = new QnaIndexAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		} else if(command.equals("/AdId.qn")){
			forward=new ActionForward();
			 forward.setPath("/view/main/mycarAdIdCheck.jsp");
		} else if (command.equals("/ClId.qn")){
			forward = new ActionForward();
			forward.setPath("/view/main/mycarClIdCheck.jsp");
		} else if(command.equals("/qnaQClSearchList.qn")){
			action = new QnaQClSearchListAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		if(forward != null){
			if(forward.isRedirect()){
			response.sendRedirect(forward.getPath());
		} else{
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
