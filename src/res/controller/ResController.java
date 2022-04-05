package res.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.Action;
import main.ActionForward;
import res.action.ResAdCarSearchAction;
import res.action.ResAdDeleteAction;
import res.action.ResAdInsertAction;
import res.action.ResAdInsertProAction;
import res.action.ResAdListAction;
import res.action.ResAdSearchAction;
import res.action.ResAdUpdateAction;
import res.action.ResAdUserSearchAction;
import res.action.ResAdViewAction;
import res.action.ResAdViewProAction;
import res.action.ResClAction;
import res.action.ResClCancelAction;
import res.action.ResClCheckAction;
import res.action.ResClDetailAction;
import res.action.ResClListAction;
import res.action.ResClModifyAction;
import res.action.ResClQuickAction;

@WebServlet("*.re")
public class ResController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;
		
		if (command.equals("/resCl.re")) {
			action = new ResClAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/resClLogin.re")){
			forward = new ActionForward();
			forward.setPath("/view/main/mycarClIdCheck.jsp");
		} else if (command.equals("/resClWrite.re")){
			forward = new ActionForward();
			forward.setPath("/view/res/resClWrite.jsp");
		} else if (command.equals("/resClWriteForm.re")) {
			forward = new ActionForward();
			forward.setPath("/view/res/resClWriteForm.jsp");
		} else if (command.equals("/resClQuick.re")) {
			action = new ResClQuickAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/resClQuickForm.re")) {
			forward = new ActionForward();
			forward.setPath("/view/res/resClQuickOption.jsp");
		} else if (command.equals("/resClQuickPro.re")) {
			forward = new ActionForward();
			forward.setPath("/view/res/resClQuick.jsp");
		} else if (command.equals("/resClCheck.re")) {
			action = new ResClCheckAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/resClList.re")) {
			action = new ResClListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/resClDetail.re")) {
			action = new ResClDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/resClModifyForm.re")){
			forward = new ActionForward();
			forward.setPath("/view/res/resClModifyOption.jsp");
		} else if (command.equals("/resClModifyPro.re")){
			forward = new ActionForward();
			forward.setPath("/view/res/resClModify.jsp");
		} else if (command.equals("/resClModify.re")) {
			action = new ResClModifyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/resClCancel.re")) {
			action = new ResClCancelAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/resAdListAction.re")){
			action = new ResAdListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/resAdList.re")){
			forward = new ActionForward();
			forward.setPath("/view/res/resAdList.jsp");
			System.out.println("resAdList.re 경로에 의해 resAdList.jsp 경로설정 완료");
			
		} else if(command.equals("/resAdViewAction.re")){
			action = new ResAdViewAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}			
		} else if (command.equals("/resAdViewProAction.re")) {
			action = new ResAdViewProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/resAdViewPro.re")){
			forward = new ActionForward();
			forward.setPath("/view/res/resAdVeiwPro.jsp");
			System.out.println("resAdViewPro.re 경로에 의해 resAdVeiwPro.jsp 경로설정 완료");	
		
		} else if (command.equals("/resAdUpdateAction.re")) {
			action = new ResAdUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(command.equals("/resAdDeleteAction.re")){
			action = new ResAdDeleteAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		} else if(command.equals("/resAdInsertAction.re")){
			action = new ResAdInsertAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
		
			}
		} else if(command.equals("/resAdInsertProAction.re")){
			action = new ResAdInsertProAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
		
			}
		} else if(command.equals("/resAdSearchAction.re")){
			action = new ResAdSearchAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
		
			}
		} else if(command.equals("/resAdUserSearchAction.re")){
			action = new ResAdUserSearchAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		} else if(command.equals("/resAdCarSearchAction.re")){
			action = new ResAdCarSearchAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
 
		
			if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher=
						request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}