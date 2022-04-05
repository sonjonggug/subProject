<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
​<%@ page import="java.util.ArrayList" %>
<%@ page import="notice.bean.NoticeBean" %>
<%@ page import="notice.service.NoticeIndexService" %>
<% 	
	ArrayList<NoticeBean> noticeIndexList = new ArrayList<NoticeBean>();
	NoticeIndexService noticeIndexService = new NoticeIndexService();
	noticeIndexList = noticeIndexService.getIndexArticle();
	request.setAttribute("noticeIndexList", noticeIndexList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
<title>공지 인덱스</title>
<style type="text/css">

table {
	margin: auto;
	width: 300px;
}
td {
	text-align: center;
	margin: auto;
	padding: 10px;
}
#art { a:visited; color:black; font-weight:bold;}
#art { a:link; color:black; font-weight:bold;}

</style>
</head>
<body>

		<table>       
		
		<%
		for (int i=0; i < noticeIndexList.size(); i++) {
		%>
			<tr>
				<td>
					<a href="noticeClDetail.no?nNUM=<%=noticeIndexList.get(i).getNNUM()%>" id="art" title="글 상세 보기">
					<%=noticeIndexList.get(i).getNTITLE()%>
					</a>
				</td>
			</tr>
			<% } %>
			
		</table>
</body>
</html>