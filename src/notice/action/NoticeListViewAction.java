package notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.Action;
import main.ActionForward;

public class NoticeListViewAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			 	throws Exception{
				 	
				 	HttpSession session=request.getSession();
			   		String id=(String)session.getAttribute("id");
			   		
			   		ActionForward forward = null;
			   		if(id==null){
			   			forward = new ActionForward();
						forward.setRedirect(true);
						forward.setPath("noticeClList.no");
			   		}else if(!id.equals("admin")){
			   			forward = new ActionForward();
						forward.setRedirect(true);
						forward.setPath("noticeClList.no");
			   		}
			   		else{
			   			forward = new ActionForward();
						forward.setRedirect(true);
						forward.setPath("noticeAdList.no");
			   		}
			   		return forward;
			}
		}
