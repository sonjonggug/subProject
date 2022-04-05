package notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.Action;
import main.ActionForward;

public class NoticeViewAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			 	throws Exception{
				 	
				 	HttpSession session=request.getSession();
			   		String id=(String)session.getAttribute("id");
			   		
			   		ActionForward forward = null;
			   		if(id=="admin"){
			   			forward = new ActionForward();
						forward.setRedirect(true);
						forward.setPath("/noticeList.no");
			   		}else if(!id.equals("admin")){
			   			forward = new ActionForward();
						forward.setRedirect(true);
						forward.setPath("/view/notice/noticeClList.jsp");
			   		}
			   		
			   		return forward;
			}
		}
