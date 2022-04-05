<%@page import="notice.bean.NoticeBean"%>
<%@page import="notice.dao.NoticeDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	NoticeBean article = (NoticeBean)request.getAttribute("article");
    String nowPage = (String)request.getAttribute("page");
%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
      pageContext.setAttribute("crcn", "\r\n"); //Space, Enter
      pageContext.setAttribute("br", "<br/>"); //br 태그
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  

<title>공지 사항 | MyCar</title>
<style type="text/css">
#articleForm {
	width: 95%;
	max-width: 800px;
	margin: 0 auto;
}
#hrOne {
	border: 1px solid black;
}

#hrTwo {
	border: 1px solid gray;
}
.btn-default {
	background-color: #0a212c;
	color: white;
}
h3 {
	text-align: left;
	font-weight: bold;
}

#basicInfoArea {
	padding: 20px 5px;
	height: 400px auto;
	width: 100%;
	max-width: 700px;
	text-align: left;
	font-size: 14pt;
	word-break:break-all;
}
#option {
	text-align: center;
	}
.file {
	position: bottom;
	text-align: center;
	width: auto;
	font-size: 12pt;
}
body {
	font-family: pretendard !important;;
    font-size: 14px;
    line-height: 1.42857143;
    color: #333;
    background-color: #fff;
}
.btn-default.active, .btn-default:active, .open>.dropdown-toggle.btn-default {
    color: #f5f5f5;
    background-color: #1e1a1b;
    background-image: none;
    border-color: #1e1a1b;
}
</style>
</head>
<body>
<jsp:include page="../main/mycarAdHeader.jsp"></jsp:include>
<br/><br/><br/><br/>
	<!-- 게시판 수정 -->
	<section id="articleForm">
		<h3>${article.NTITLE}</h3>
		<h5>${article.NDATE} &nbsp;|&nbsp; 조회 <%=article.getNREAD()%></h5>
		<hr id="hrOne"><br/>
		<hr id="hrTwo">
		<section>
			<div id="basicInfoArea">${fn:replace(article.NCON, crcn, br)}</div>
		</section>

			<%if(!(article.getNFILE()==null)){ %>
			<hr id="hrOne">
			<div class="file">첨부 파일 &nbsp;&nbsp;&nbsp; 
			<a href="./view/notice/noticeDown.jsp" title="첨부 파일 다운로드"> <%=article.getNFILE() %>
			</a></div>
			<%} %>
			<hr id="hrTwo">
	</section>
	<section id="option">
			<a href="noticeModifyForm.no?nNUM=<%=article.getNNUM() %>&page=<%=nowPage%>" class="btn btn-default" role="button" title="수정">
			수정</a>&nbsp;&nbsp;&nbsp;
	
<button type="button" class="btn btn-default" data-toggle="modal" data-target="#${article.NNUM}" title="삭제">삭제</button>
	
           <div class="modal fade" id="${article.NNUM}" role="dialog">
           <div class="modal-dialog">
           <!-- Modal content-->
           <div class="modal-content">
           <div class="modal-header">
           <button type="button" class="close" data-dismiss="modal">&times;</button>
           <h4 class="modal-title"></h4>
           </div>
           <div class="modal-body">
                                정말로 삭제 하시겠습니까?
               </div>   
               <div class="modal-footer">
                 <button type="button" class="btn btn-secondary btn" data-dismiss="modal" title="취소">취소</button>
                 <button type="button" onclick="location.href='noticeDeleteProAction.no?nNUM=<%=article.getNNUM() %>&page=<%=nowPage%>'" class="btn btn-secondary btn" title="삭제">삭제</button>
			</div>
		</div>
 	</div>
</div>
			&nbsp;&nbsp;
			<%if(!(request.getParameter("noticeSearch")==null)){ %>
			<a href="noticeAdSearchAction.no?page=<%=nowPage%>&noticeSearch=<%=request.getParameter("noticeSearch")%>"
			class="btn btn-default" role="button">목록</a>
			<%}else{ %>
			<a href="noticeAdList.no?page=<%=nowPage%>" class="btn btn-default" role="button">목록</a>
			<%} %>
			
	</section>
	
	<jsp:include page="../main/mycarFooter.jsp"></jsp:include>
	
</body>
</html>