<%@page import="notice.bean.NoticeBean"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("crcn", "\r\n"); 
   pageContext.setAttribute("br", "<br/>");
   %>
<%
	NoticeBean article = (NoticeBean)request.getAttribute("article");
    String nowPage = (String)request.getAttribute("page");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


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
	background-color: #0a212c !important;
	color: white !important;
}
h2 {
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
    font-family: pretendard !important;
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
<jsp:include page="../main/mycarClHeader.jsp"></jsp:include>
<br/><br/><br/><br/>
	<!-- 게시판 수정 -->
	<section id="articleForm">
		<h2>${article.NTITLE}</h2>
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
		<input type="button" value="목록" class="btn btn-default"
		onclick="location='noticeClList.no?page=<%=nowPage%>'" title="목록으로 이동">	
	</section>
	
	<jsp:include page="../main/mycarFooter.jsp"></jsp:include>
	
</body>
</html>