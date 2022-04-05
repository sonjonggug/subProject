<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
​<%@ page import="java.util.ArrayList"%>
<%@ page import="qna.bean.QnaQBean"%>
<%@ page import="qna.qnaq.svc.QnaIndexService"%>
<%
	ArrayList<QnaQBean> qnaIndexList = new ArrayList<QnaQBean>();
	QnaIndexService qnaIndexService = new QnaIndexService();
	qnaIndexList = qnaIndexService.getIndexArticle();
	request.setAttribute("qnaIndexList", qnaIndexList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA인덱스</title>
<style>
.td_left {
	width: 100%;
	color: black;
	font-weight: bold;
	text-align: left;
	width: 200px;
	display: block;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	cursor:pointer;
	padding:0px;
	margin-bottom:10px;
	margin-top:10px;
}

.td_right {
	width: 100%;
	a: link;
	color: black;
	width: 100%;
	padding:0px;
	text-align: right;
}
table {
	width: 100%;
}
</style>
</head>
<body>


	<table>

		<%
			for (int i = 0; i < qnaIndexList.size(); i++) {
		%>

		<tr>
			<td class="td_left" onclick="location.href='qnaQClDetail.qn?QNUM=<%=qnaIndexList.get(i).getQNUM()%>&page=1';" title="<%=qnaIndexList.get(i).getQTITLE()%>" alt="<%=qnaIndexList.get(i).getQTITLE()%>"><%=qnaIndexList.get(i).getQTITLE()%></td>
			<td class="td_right"><span><%=qnaIndexList.get(i).getQDATE()%></span></td>
		</tr>

		<%
			}
		%>
	</table>
</body>
</html>