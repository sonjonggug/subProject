<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="qna.bean.QnaQBean"%>
<%@ page import="qna.bean.QnaABean"%>
<%
	String id = (String) session.getAttribute("id");
	QnaQBean article = (QnaQBean) request.getAttribute("article");
	QnaABean reply = (QnaABean) request.getAttribute("reply");
	String nowPage = (String) request.getAttribute("page");
%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
      pageContext.setAttribute("crcn", "\r\n");
      pageContext.setAttribute("br", "<br/>");
%>
<!DOCTYPE html>
<html>
<head>
<title>Mycar 렌터카</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
#articleForm {
	width: 95%;
	max-width: 800px;
	margin: 0 auto;
	font-family: Pretendard !important;
}
#hrOne {
	border: 1px solid black;
}

#hrTwo {
	border: 1px solid gray;
}

h2 {
	text-align: left;
	font-weight: bold;
	word-wrap: break-word;
	font-family: Pretendard !important;
}

#basicInfoArea {
	padding: 20px 5px;
	height: 400px auto;
	width: 100%;
	max-width: 800px;
	text-align: left;
	word-break:break-all;
	font-size: 1.5em;
	font-family: Pretendard !important;
}
#option {
	text-align: center;
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
	<jsp:include page="/view/main/mycarClHeader.jsp"></jsp:include>

	<!-- 게시판 수정 -->
	<section id="articleForm">
		<%
			if (reply == null) {
		%>
		<h2><%=article.getQTITLE()%></h2>
		<br /> <br />
		<section id="INFO">${article.QID} | ${article.QDATE} | 조회
			${article.QREAD}</section>
		<hr id="hrOne">
		<br />
		<hr id="hrTwo">
		<section>
			<div id="basicInfoArea">${fn:replace(article.QCON, crcn, br)}</div>
		</section>

		<%
			} else {
		%>
		<h2>${article.QTITLE}</h2>
		<br /> <br />
		<section id="INFO">${article.QID} | ${article.QDATE} | 조회
			${article.QREAD}</section>
		<hr id="hrOne">
		<br />
		<hr id="hrTwo">
		<section id="basicInfoArea">
			<div>${fn:replace(article.QCON, crcn, br)}</div>
		</section>
		<hr id="hrOne">
		<section id="REPLY">
			<h2>&#9398; 답변</h2>

			<section id="REPLYCONTENT">
				<tr id="viewTop">
					<td>관리자 | <%=reply.getADATE()%></td>
				</tr>
			</section>
			<section id="basicInfoArea">
				<td>${fn:replace(reply.ACON, crcn, br)}</td>
			</section>
		</section>
		<%
			}
		%>
		<hr id="hrTwo">
	</section>
	<section id="option">

		<%
			if (id == null) {
		%>
		<input type="button" value="목록" class="btn btn-default btn-sm"
			onclick="location='qnaQClList.qn?page=<%=nowPage%>'" title="목록으로 이동"
			alt="QnA 목록으로 이동"><br /> <br />
		<%
			} else if (id.equals(article.getQID())) {
		%>
		<input type="button" value="목록" class="btn btn-default btn-sm"
			onclick="location='qnaQClList.qn?page=<%=nowPage%>'" title="목록으로 이동"
			alt="QnA 목록으로 이동">
		<button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#update" title="수정">게시글 수정</button>
		<div class="modal fade" id="update" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title"></h4>
					</div>
					<div class="modal-body">정말로 수정 하시겠습니까?</div>
					<div class="modal-footer">
						<button type="button"
							onclick="location.href='qnaQClUpdate.qn?QNUM=<%=article.getQNUM()%>&page=<%=nowPage%>'"
							class="btn btn-secondary btn btn-sm" title="수정">수정</button>
						<button type="button" class="btn btn-secondary btn btn-sm"
							data-dismiss="modal" title="취소">취소</button>
					</div>
				</div>
			</div>
		</div>
		<button type="button" class="btn btn-default btn-sm" data-toggle="modal"
			data-target="#delete" title="수정">게시글 삭제</button>
		<div class="modal fade" id="delete" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title"></h4>
					</div>
					<div class="modal-body">정말로 삭제 하시겠습니까?</div>
					<div class="modal-footer">
						<button type="button"
							onclick="location.href='qnaQClDelete.qn?QNUM=<%=article.getQNUM()%>&page=<%=nowPage%>'"
							class="btn btn-secondary btn btn-sm" title="삭제">삭제</button>
						<button type="button" class="btn btn-secondary btn btn-sm"
							data-dismiss="modal" title="취소">취소</button>
					</div>
				</div>
			</div>
		</div><br /> <br />

		<%
			} else {
		%>
		<input type="button" value="목록" class="btn btn-default btn-sm"
			onclick="location='qnaQClList.qn?page=<%=nowPage%>'" title="목록으로 이동"
			alt="QnA 목록으로 이동"><br /> <br />
		<%
			}
		%>

	</section>
	<jsp:include page="/view/main/mycarFooter.jsp"></jsp:include>
</body>
</html>