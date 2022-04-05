package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.Action;
import main.ActionForward;
import member.action.MemberAdDeleteAction;
import member.action.MemberAdJoinAction;
import member.action.MemberAdListAction;
import member.action.MemberAdLoginAction;
import member.action.MemberAdModifyProAction;
import member.action.MemberAdModifyProAction2;
import member.action.MemberAdProViewAction;
import member.action.MemberAdSearchAction;
import member.action.MemberAdViewAction;
import member.action.MemberClDeleteAction;
import member.action.MemberClJoinAction;
import member.action.MemberClLoginAction;
import member.action.MemberClUpdateAction;
import member.action.MemberClUpdateViewAction;
import member.action.MemberClViewAction;

@WebServlet("*.me")
public class MemberController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;

		if (command.equals("/memberClLogin.me") || command.equals("/view/member/memberClLogin.me")) {

			if (request.getParameter("fromURI") != null) {	   	
			request.setAttribute("fromURI", request.getQueryString().substring(8));
			System.out.println("현재 fromURI 값은 " + request.getQueryString().substring(8));
			
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("view/member/memberClLogin.jsp?fromURI=" + request.getQueryString().substring(8));
			
			} else if (request.getQueryString() != null) {	   	
			request.setAttribute("fromURI", request.getQueryString().substring(8));
			System.out.println("현재 fromURI 값은 " + request.getQueryString().substring(8));
			
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("view/member/memberClLogin.jsp?" + request.getQueryString());
			
			} else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("http://localhost:8080/mycar/view/member/memberClLogin.jsp");
			}
		} else if (command.equals("/memberClLogout.me")) {
			HttpSession session = request.getSession();
			session.invalidate();
			response.sendRedirect("./");
		} else if (command.equals("/memberClJoin.me")) {
			
			if (request.getParameter("fromURI") != null) {	   	
			request.setAttribute("fromURI", request.getParameter("fromURI"));
			System.out.println("현재 fromURI 값은 " + request.getParameter("fromURI"));
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("view/member/memberClJoin.jsp?" + request.getParameter("fromURI"));
						
			} else if (request.getQueryString() != null) {
	   		request.setAttribute("fromURI", request.getQueryString());
	    	System.out.println("현재 fromURI 값은 " + request.getQueryString());
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("view/member/memberClJoin.jsp?fromURI=" + request.getParameter("fromURI"));
			
			} else {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("view/member/memberClJoin.jsp");
			}
		} else if (command.equals("/memberClLoginAction.me")) {
			action = new MemberClLoginAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/memberClJoinAction.me")) {
			action = new MemberClJoinAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/memberClViewAction.me")) {
			action = new MemberClViewAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/memberClView.me")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("view/member/memberClMypage.jsp");
		} else if (command.equals("/memberClUpdateView.me")) {
			action = new MemberClUpdateViewAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/memberClUpdate.me")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("view/member/memberClMypageUpdate.jsp");
		} else if (command.equals("/memberClUpdateAction.me")) {
			action = new MemberClUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/memberClDeleteAction.me")) {
			action = new MemberClDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			
		} else if (command.equals("/admin.me")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/view/member/memberAdLogin.jsp");	
	
	}else if(command.equals("/memberAdLoginAction.me")){
		action = new MemberAdLoginAction();
		try{
			forward=action.execute(request, response);
		}catch(Exception e){
			e.printStackTrace();
		}
	} else if (command.equals("/memberAdJoin.me")) {
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("view/member/memberAdJoin.jsp");	
	}else if(command.equals("/memberAdJoinAction.me")){
		action = new MemberAdJoinAction();
		try{
			forward=action.execute(request, response);
		}catch(Exception e){
			e.printStackTrace();
		}
	}else if(command.equals("/memberAdListAction.me")){
		action = new MemberAdListAction();
		try{
			forward=action.execute(request, response);
		}catch(Exception e){
			e.printStackTrace();
		}
	}else if(command.equals("/memberAdViewAction.me")){
		action = new MemberAdViewAction();
		try{
			forward=action.execute(request, response);
		}catch(Exception e){
		e.printStackTrace();
		}
	}else if(command.equals("/memberAdProViewAction.me")){
		action = new MemberAdProViewAction();
		try{
			forward=action.execute(request, response);
		}catch(Exception e){
			e.printStackTrace();
		}
	}else if(command.equals("/memberAdDeleteAction.me")){
		action = new MemberAdDeleteAction();
		try{
			forward=action.execute(request, response);
		}catch(Exception e){
			e.printStackTrace();
		} 
	}else if(command.equals("/memberAdSearchAction.me")){
		action = new MemberAdSearchAction();
		try{
			forward=action.execute(request, response);
		}catch(Exception e){
		e.printStackTrace();
		}
		
	}else if(command.equals("/memberAdModifyProAction.me")){
		action = new MemberAdModifyProAction();
		try{
			forward=action.execute(request, response);
		}catch(Exception e){
			e.printStackTrace();
		}
	}else if(command.equals("/memberAdModifyProAction2.me")){
		action = new MemberAdModifyProAction2();
		try{
			forward=action.execute(request, response);
		}catch(Exception e){
			e.printStackTrace();
		}
	} else if (command.equals("/memberAdLogout.me")) {
		HttpSession session = request.getSession();
		session.invalidate();
		response.sendRedirect("./");
	}
		
		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			
		}}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}