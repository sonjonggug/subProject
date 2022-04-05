<%@page import="notice.bean.NoticePageInfo"%>
<%@page import="notice.bean.NoticeBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
	ArrayList<NoticeBean> articleList=(ArrayList<NoticeBean>)request.getAttribute("articleList2");
	NoticePageInfo pageInfo = (NoticePageInfo)request.getAttribute("pageInfo");
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>



<title>공지 사항 | MyCar</title>

<style type="text/css">
h2 {
	text-align: center;
	font-weight: bold !important;
}

#notice {
	width: 95%;
	max-width: 800px;
	margin: 0 auto;
}
.btn-default {
	background-color: #0a212c !important;
	color: white !important;
}
#tr_top {
	background: dark-gray;
	text-align: left;
	font-weight: bold;
	font-size: 18px;
}

#pageList {
	margin: auto;
	width: 50%;
	text-align: center;
}
  body {
    font-family: pretendard !important;
    font-size: 14px;
    line-height: 1.42857143;
    color: #333;
    background-color: #fff;
}
#con {
	a: link;
	color: black;
	font-weight: bold;
	width: 100%;
	max-width: 300px;
	display: block;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

#search {
	width: 80%;
	max-width: 500px;
	display: inline-block;
}

#searchbox {
	margin: auto;
	text-align: center;
}

#title {
	cursor: pointer;
}
.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {
    z-index: 3;
    color: #fff;
    cursor: default;
    background-color: #0a212c;
    border-color: #0a212c;
</style>
</head>
<body>
<jsp:include page="../main/mycarClHeader.jsp"></jsp:include>
	<br />
	<br />
	<!-- 게시판 리스트 -->
	<h2>공지사항</h2>
	<br />
	<br />
	<section id="notice">
<table class="table table-striped table-hover">
			<%
				if (articleList != null && listCount > 0) {
			%>

			<tr id="tr_top">
				<td class="col-sm-1 hidden-xs visible-lg visible-md">번호</td>
				<td class="col-sm-8 hidden-xs visible-lg visible-md">제목</td>
				<td class="col-sm-1 hidden-xs visible-lg visible-md">조회</td>
				<td class="col-sm-2 visible-lg visible-md">등록일</td>
			</tr>
			<%
				for (int i = 0; i < articleList.size(); i++) {
			%>
			<tr id="title"
				onclick="location.href='noticeClDetail.no?nNUM=<%=articleList.get(i).getNNUM()%>&page=<%=nowPage%>';">
				<td class="hidden-xs visible-lg visible-md"><%=articleList.get(i).getNNUM()%></td>
				<td><div id="con" title="<%=articleList.get(i).getNTITLE()%> 제목의 공지사항 상세보기"
						alt="<%=articleList.get(i).getNTITLE()%> 제목의  공지사항 상세보기">
						<%=articleList.get(i).getNTITLE()%></div>
					<div class="visible-xs visible-sm">
						<span><%=articleList.get(i).getNDATE()%> | <%=articleList.get(i).getNREAD()%></span>
					</div></td>
				<td class="hidden-xs visible-lg visible-md"><%=articleList.get(i).getNREAD()%></td>
				<td class="hidden-xs visible-lg visible-md"><%=articleList.get(i).getNDATE()%></td>
			</tr>
			<%
				}
			%>

		</table>
		<div id="searchbox">
			<form action="noticeClSearchAction.no" method="post" id="search">
				<div class="input-group">
					<input type="text" class="form-control" name="noticeSearch" value="${pageInfo.noticeSearch}"
						id="noticeSearch" placeholder="검색어를 입력하세요." title="검색어를 입력하세요.">
					<span class="input-group-btn">
						<button class="btn btn-default" type="submit" title="검색 버튼 클릭">검색</button>
						<a href="noticeClList.no" class="btn btn-default" role="button" title="전체 목록">전체 목록</a>
						
					</span>
				</div>
			</form>
		</div>
		</section>
		<section id="pageList">
			<nav aria-label="Page navigation example">
				<ul class="pagination">
					<%
						if (nowPage <= 5) {
					%>

					<%
						} else {
					%>
					<li class="page-item"><a class="page-link"
						href="noticeClSearchAction.no?page=<%=startPage - 1%>&noticeSearch=<%=request.getParameter("noticeSearch")%>"
						aria-label="Previous" title="<%=startPage - 1%> 페이지로 이동"> <span
							aria-hidden="true">&laquo;</span>
					</a></li>
					<%
						}
					%>

					<%
						for (int a = startPage; a <= endPage; a++) {
								if (a == nowPage) {
					%>
					<li class="page-item active"><a class="page-link"><%=a%></a></li>
					<%
						} else {
					%>
					<li class="page-item" aria-current="page"><a class="page-link"
						href="noticeClSearchAction.no?page=<%=a%>&noticeSearch=<%=request.getParameter("noticeSearch")%>"
						title="<%=a%>페이지로 이동"><%=a%> </a></li>
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
						} else {
					%>
					<li class="page-item"><a class="page-link"
						href="noticeClSearchAction.no?page=<%=endPage + 1%>&noticeSearch=<%=request.getParameter("noticeSearch")%>"
						aria-label="Next" title="<%=endPage + 1%> 페이지로 이동"> <span
							aria-hidden="true">&raquo;</span>
					</a></li>
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
		<br />


		<jsp:include page="../main/mycarFooter.jsp"></jsp:include>
</body>
</html>