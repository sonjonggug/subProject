<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="qna.bean.QnaQBean"%>
<%
	QnaQBean article = (QnaQBean) request.getAttribute("article");
	String nowPage = (String) request.getAttribute("nowPage");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mycar 렌터카</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
	function modifyboard() {
		modifyform.submit();
	}
</script>
<style type="text/css">
h2 {
	font-size: 24pt;
	text-align: center;
	font-family: Pretendard !important;
}

table {
	margin: 0 auto;
	padding: 0;
	width: 95%;
	max-width: 800px;
	font-family: Pretendard !important;
}

.td_left {
	width: 20%;
	font-size: 18pt;
	text-align: center;
	font-family: Pretendard !important;
}

.td_right {
	width: 80%; font-family: Pretendard !important;
}

#hrOne {
	border: 1px solid black;
	max-width: 800px;
	font-family: Pretendard !important;
}

#hrTwo {
	border: 1px solid gray;
	max-width: 800px;
	font-family: Pretendard !important;
}
hr {
	max-width: 800px;
	font-family: Pretendard !important;
}
#commandCell {
	text-align: center; font-family: Pretendard !important;
}

#writeForm {
	width: 95%;
	margin: 0 auto;
}
textarea {
	width: 100%;
	height: 6.25em;
	border: none;
	resize: none;
	font-family: Pretendard !important;
}
.btn-default {
	color: #f5f5f5 !important;
	background-color: #1e1a1b !important;
	border-color: #1e1a1b !important;
}
</style>
</head>
<body>
	<jsp:include page="/view/main/mycarAdHeader.jsp"></jsp:include>
	<!-- 게시판 등록 -->

	<section id="writeForm">
		<h2>QnA 수정</h2>
		<br />
		<hr id="hrOne">
		<br />
		<form
			action="qnaQAdUpdatePro.qn?QNUM=<%=article.getQNUM()%>&page=<%=nowPage%>"
			method="post" name="modifyform">
			<input type="hidden" name="QNUM" value="<%=article.getQNUM()%>" />
			<table>
				<tr>
					<td class="td_left"><label for="QTITLE">제 목</label></td>
					<td class="td_right"><input name="QTITLE" type="text"
						class="form-control" id="QTITLE" value="<%=article.getQTITLE()%>"
						title="제목 입력 칸" alt="제목 입력 칸" /></td>
				</tr>
			</table>
			<br />
			<hr />
			<br />
			<table>
				<tr>
					<td class="td_left"><label for="QCON">내 용</label></td>
					<td><textarea id="QCON" name="QCON" cols="50" rows="15"
							class="form-control" title="내용 입력 칸" alt="내용 입력 칸"><%=article.getQCON()%></textarea></td>
				</tr>
			</table>
			<br />
			<hr />
			<br />
			<section id="commandCell">
				<a href="javascript:modifyboard()" class="btn btn-default btn-sm" title="수정완료 버튼">수정</a>&nbsp;&nbsp;
				<a href="qnaQAdDetail.qn?QNUM=<%=article.getQNUM()%>&page=<%=nowPage%>" class="btn btn-default btn-sm"
					title="뒤로가기 버튼">뒤로</a>
			</section>
		</form>
	</section>
	<jsp:include page="/view/main/mycarFooter.jsp"></jsp:include>
</body>
</html>