package notice.action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import main.Action;
import main.ActionForward;
import notice.bean.NoticeBean;
import notice.service.NoticeWriteProService;

public class NoticeWriteProAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{

		ActionForward forward=null;
		NoticeBean noticeBean = null;
		String realFolder="/noticeUpload";
		String saveFolder="/noticeUpload";
		int fileSize=5*1024*1024; // 5MB
		ServletContext context = request.getServletContext();
		realFolder=context.getRealPath(saveFolder);   		
		MultipartRequest multi=new MultipartRequest(request,
				realFolder,
				fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy());
		noticeBean = new NoticeBean();
		noticeBean.setNTITLE(multi.getParameter("NTITLE"));
		noticeBean.setNCON(multi.getParameter("NCON"));
		noticeBean.setNFILE(
		multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		NoticeWriteProService noticeWriteProService = new NoticeWriteProService();
		boolean isWriteSuccess = noticeWriteProService.registArticle(noticeBean);

		if(!isWriteSuccess){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('Fail')");
			out.println("history.back();");
			out.println("</script>");
		}
		else{
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("noticeAdList.no");
		}

		return forward;
		
	}  	
	
}