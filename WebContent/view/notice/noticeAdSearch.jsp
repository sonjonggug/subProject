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
	font-weight: bold;
}

#notice {
	width: 95%;
	max-width: 800px;
	margin: 0 auto;
}
.btn-default {
	background-color: #0a212c;
	color: white;
}
.btn-primary {
	background-color: white !important;
	color: #0a212c !important;
	border-color: #1e1a1b;
}
#tr_top {
	background: dark-gray;
	text-align: left;
	font-weight: bold;
	font-size: 18px;
}
body {
    font-family: pretendard !important;
	font-size: 14px;
    line-height: 1.42857143;
    color: #333;
    background-color: #fff;
}
#pageList {
	margin: auto;
	width: 50%;
	text-align: center;
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
<jsp:include page="../main/mycarAdHeader.jsp"></jsp:include>
	<br />
	<br />
	<!-- 게시판 리스트 -->
	<h2>공지사항</h2>
	<br />
			<div id="searchbox">
			<form action="noticeAdSearchAction.no" method="post" id="search">
				<div class="input-group">
					<input type="text" class="form-control" name="noticeSearch" value="${pageInfo.noticeSearch}"
						id="noticeSearch" class="form-control" placeholder="검색어를 입력하세요." title="검색어를 입력하세요.">
					<span class="input-group-btn">
						<button class="btn btn-default" type="submit" title="검색">검색</button>
		<a href="noticeAdList.no" class="btn btn-default" role="button" title="전체 목록">전체 목록</a>
		<a href="noticeWriteForm.no" class="btn btn-default" role="button" title="글쓰기">글쓰기</a>
					</span>
				</div>
			</form>
		</div>

	<br />
		<section id="notice">
	<table class="table table-striped table-hover">
<%
if(articleList != null && listCount > 0){
%>

			<tr id="tr_top">
			<td class="col-sm-1 hidden-xs visible-lg visible-md">번호</td>
			<td class="col-sm-7 hidden-xs visible-lg visible-md">제목</td>
			<td class="col-sm-1 hidden-xs visible-lg visible-md">조회</td>
			<td class="col-sm-3 visible-lg visible-md">등록일</td>
		</tr>
		<%
		for (int i=0; i < articleList.size(); i++) {
			
		%>
			<tr id="title"
			onclick="location.href='noticeAdDetail.no?nNUM=<%=articleList.get(i).getNNUM()%>&page=<%=nowPage%>';">
			<td class="hidden-xs visible-lg visible-md"><%=articleList.get(i).getNNUM()%></td>
			<td><div id="con" title="<%=articleList.get(i).getNTITLE()%> 제목의 공지사항 상세보기"
					alt="<%=articleList.get(i).getNTITLE()%> 제목의 공지사항 상세보기">
					<%=articleList.get(i).getNTITLE()%></div>
				<div class="visible-xs visible-sm">
					<span><%=articleList.get(i).getNDATE()%> | <%=articleList.get(i).getNREAD()%></span>
				</div></td>
			<td class="hidden-xs visible-lg visible-md"><%=articleList.get(i).getNREAD()%></td>
			<td class="hidden-xs visible-lg visible-md"><%=articleList.get(i).getNDATE()%>
	<button type="button"class="btn btn-primary btn-xs" onclick="location.href='noticeModifyForm.no'" title="수정"><span class="glyphicon glyphicon-edit"></span>수정</button>
	<button type="button"class="btn btn-primary btn-xs" data-target="#<%=articleList.get(i).getNNUM()%>"title="삭제"><span class="glyphicon glyphicon-remove"></span>삭제</button>
			</td>
		</tr>
			<%
				}
			%>

</table>

	</section>
	<section id="pageList">
	<nav aria-label="Page navigation example">
  <ul class="pagination">
		<%if(nowPage<=5){ %>

		<%}else{ %>
	<li class="page-item">
      <a class="page-link" href="noticeAdSearchAction.no?page=<%=startPage-1 %>&noticeSearch=<%=request.getParameter("noticeSearch")%>" aria-label="Previous" title="<%=startPage-1 %> 페이지로 이동">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
		<%} %>

		<%for(int a=startPage;a<=endPage;a++){
				if(a==nowPage){%>
		<li class="page-item active"><a class="page-link"><%=a %></a></li>
		<%}else{ %>
		<li class="page-item" aria-current="page"><a class="page-link" href="noticeAdSearchAction.no?page=<%=a %>&noticeSearch=<%=request.getParameter("noticeSearch")%>" title="<%=a %>페이지로 이동"><%=a %>
		</a></li>
		<%} %>
		<%} %>

		<%if(nowPage>=maxPage){ %>

		<%}else{ %>
	<li class="page-item">
		<a class="page-link" href="noticeAdSearchAction.no?page=<%=endPage+1 %>&noticeSearch=<%=request.getParameter("noticeSearch")%>" aria-label="Next" title="<%=endPage+1 %> 페이지로 이동">
		        <span aria-hidden="true">&raquo;</span>
		</a>
		    </li>
  </ul>
</nav>
		<%} %>
	</section>
	<%
    }
	else
	{
	%>
	<section id="emptyArea">등록된 글이 없습니다.</section>
	<% } %>
<br/>


<jsp:include page="../main/mycarFooter.jsp"></jsp:include>

</body>
</html>