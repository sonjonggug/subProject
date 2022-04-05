<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="qna.bean.PageInfo"%>
<%@ page import="qna.bean.QnaQBean"%>

<%
	ArrayList<QnaQBean> articleList = (ArrayList<QnaQBean>) request.getAttribute("articleList");
	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
%>

<!DOCTYPE html>
<html>
<head>
<title>Mycar 렌터카</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
h2 {
	text-align: center;
	font-weight: bold;
	font-family: Pretendard !important;
}

#QnA {
	width: 95%;
	max-width: 800px;
	margin: 0 auto;
	font-family: Pretendard !important;
}

#QnATitle {
	background: dark-gray;
	text-align: left;
	font-weight: bold;
	font-size: 18px;
	font-family: Pretendard !important;
}

#pageList {
	margin: auto;
	width: 100%;
	text-align: center;
	font-family: Pretendard !important;
}

#con {
	a: link;
	color: black;
	font-weight: bold;
	width: 300px;
	display: block;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

P {
	text-align: left;
}

#search {
	width: 80%;
	max-width: 500px;
	display: inline-block;
	font-family: Pretendard !important;
}
#searchbox {
	margin: auto;
	text-align: center;
	width: 95%;
	max-width: 800px;
	font-family: Pretendard !important;
}
#QnAList {
	cursor: pointer;
}
.btn-default {
	color: #f5f5f5 !important;
	background-color: #1e1a1b !important;
	border-color: #1e1a1b !important;
}
.pagination > li > a {
	float: none;
	color: #1e1a1b !important;
}
</style>
</head>

<body>
	<jsp:include page="/view/main/mycarAdHeader.jsp"></jsp:include>
	<br />
	<br />
	<!-- 게시판 리스트 -->
	<h2>QnA</h2>
	<div id="searchbox">
				<span class="pull-left">전체 <%=listCount%> 건
				</span>
				<form action="qnaQAdSelectList.qn" method="post" id="search">
					<div class="input-group">
						<input type="text" class="form-control pull-right input-sm" name="qid"
							placeholder="ID 검색"> <span class="input-group-btn"><button
								class="btn btn-default btn-sm pull-right" type="submit" title="검색">검색</button></span>
					</div>
				</form>
			</div>
	<section id="QnA">
		<table class="table table-striped table table-hover">

			<%
				if (articleList != null && listCount > 0) {
			%>
			<tr id="QnATitle">
				<td class="col-sm-1 hidden-xs visible-lg visible-md">번호</td>
				<td class="col-sm-2 hidden-xs">아이디</td>
				<td class="col-sm-6 hidden-xs">제목</td>
				<td class="col-sm-1 hidden-xs visible-lg">조회</td>
				<td class="col-sm-3 visible-lg">등록일</td>
			</tr>

			<%
				for (int i = 0; i < articleList.size(); i++) {
			%>
			<tr id="QnAList"
				onclick="location.href='qnaQAdDetail.qn?QNUM=<%=articleList.get(i).getQNUM()%>&page=<%=nowPage%>';">
				<td class="hidden-xs visible-lg visible-md"><%=articleList.get(i).getQNUM()%></td>
				<td class="hidden-xs"><%=articleList.get(i).getQID()%></td>
				<td><div id="con" title="<%=articleList.get(i).getQTITLE()%>"
						alt="<%=articleList.get(i).getQTITLE()%> 제목의  QnA 상세보기">
						<%=articleList.get(i).getQTITLE()%></div>
					<div class="visible-xs">
						<span><%=articleList.get(i).getQID()%> | <%=articleList.get(i).getQDATE()%>
							| <%=articleList.get(i).getQREAD()%></span>
					</div></td>
				<td class="hidden-xs visible-lg"><%=articleList.get(i).getQREAD()%></td>
				<td class="col-sm-3 visible-lg"><%=articleList.get(i).getQDATE()%></td>
			</tr>
			<%
				}
			%>
		</table>
	</section>
	<section id="pageList">
		<nav aria-label="Page navigation example">
			<ul class="pagination pagination-sm">
				<%
					if (nowPage <= 5) {
				%>
				<%
					} else {
				%>
				<li class="page-item"><a
					href="qnaQAdList.qn?page=<%=startPage - 1%>" aria-label="Previous"
					title="이전 페이지로 이동"><span aria-hidden="true">이전</span></a></li>
				<%
					}
				%>

				<%
					for (int a = startPage; a <= endPage; a++) {
							if (a == nowPage) {
				%>
				<li class="page-item"><a class="page-link"><%=a%></a></li>
				<%
					} else {
				%>
				<li class="page-item"><a href="qnaQAdList.qn?page=<%=a%>"
					title="<%=a%>페이지로 이동" alt="<%=a%>페이지로 이동"><%=a%></a></li>
				<%
					}
				%>
				<%
					}
				%>

				<%
					if (nowPage >= maxPage) {
				%>
				<%
					} else if (endPage == maxPage) {
				%>

				<%
					} else {
				%>
				<li class="page-item"><a class="page-link"
					href="qnaQAdList.qn?page=<%=endPage + 1%>" title="다음 페이지로 이동"><span aria-hidden="true">다음</span></a></li>
			</ul>
		</nav>
		<%
			}
		%>
	</section>
	<%
		} else {
	%>
	<section id="emptyArea">등록된 글이 없습니다.</section>
	<%
		}
	%>
	<jsp:include page="/view/main/mycarFooter.jsp"></jsp:include>
</body>
</html>