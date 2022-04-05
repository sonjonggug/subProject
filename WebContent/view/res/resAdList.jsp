<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="res.bean.ResBean" %>
<%@ page import="res.dao.ResAdDAO" %>
<%@page import="res.bean.PageInfo"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	ArrayList<ResBean> resList = (ArrayList<ResBean>)request.getAttribute("resList");
    PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
%>
	

<!DOCTYPE html>
<html>
<head>
  <title>Mycar 렌터카</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
  <!-- modal bootstrap -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--   <script src="js/bootstrap.js"></script> -->
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
  
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }

  /* Hide the carousel text when the screen is less than 600 pixels wide */
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; 
    }
  }
   .pagination {
   display: block;
   text-align: center;
   padding-left: 6px;
   padding-right: 6px;
  
  }
  
 .pagination > li > a {
   float: none;
   color: #101010;
   padding-left: 6px;
   padding-right: 6px;
  
  }
  
 #pageList {
 	margin: auto; 
 	width: 80%; 
 	text-align: center; 
 	
 }
 
a:link {
	text-decoration: none; color: #101010;}
a:visited {
	text-decoration: none; color: #101010;}
a:active {
	text-decoration: none; color: #101010;}
a:hover {
	text-decoration: none; color: #101010;}

 
th, td {
  text-align: center;
  cursor:pointer
}

h2 {

    text-align: center;
}
body {
    font-family: pretendard;
    font-size: 14px;
    
    color: #333;
    background-color: #fff;

}
#search1 {
  width:15%;
  padding-left:0%;
  padding-right:0%;
}
#search2 {
   margin-right: 5px;
   margin-bottom: 4px;
   background-color: #101010;
   color: #fff;
   border-bottom-width: 1px;
   
}
#insert {
  background-color: #101010;
  color: #fff;
}
#id {
 margin-bottom: 4px;
}
.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {
    z-index: 3;
    color: #fff;
    cursor: default;
    background-color: #101010;
    border-color: #101010;
}

  </style>
</head>
<body>
<jsp:include page="../main/mycarAdHeader.jsp"></jsp:include>

<div class="container">
	<h2><a href="resAdListAction.re" title="예약 목록">예약 목록</a></h2>
  
 
   <button class='btn btn-default pull-right btn-dark' title="예약추가" id="insert" onclick="location.href='resAdInsertAction.re'">예약추가</button>
     <form action="resAdSearchAction.re" name="searchform" method="post">
   	    <div class="col-sm-2" id="search1" >
	   		<select class="form-control hidden-xs"  name="fieldName">
        	<option value="All">전체 검색</option>
        	<option value="rid">아이디</option>
        	<option value="mname">고객명</option>
        	</select></div>
	    <div class="input-group" id="serch">
	      <input type="search" class="form-control" name="id" id="id" value="${pageInfo.viewId}" placeholder="검색어를 입력하세요.">
	      <input type="hidden" id="page" name="page" class="form-control" value="${pageInfo.page}"onchange="tst6()">
	      <span class="input-group-btn"><button class="btn btn-default btn-dark" type="button" id="search2" type="button" onclick="document.searchform.submit();" title="검색">검색</button></span>
	    </div>
   </form><br>

<section id="listForm">
	 <table class="table table-striped responsive">
	
		<%
if (resList != null && listCount > 0) {
		%>
		
	<tr>
        <th>예약번호</th>
        <th>예약아이디</th>
        <th>고객명</th>
        <th class="text-center hidden-xs hidden-sm">예약차량</th>
        <th class="text-center hidden-xs hidden-sm">예약시작일</th>
        <th class="text-center hidden-xs hidden-sm">예약종료일</th>
        <th class="text-center hidden-xs hidden-sm">예약상태</th>
        <th>비고&nbsp; &nbsp; &nbsp;</th>
        
      </tr>

		<%
		DecimalFormat df = new DecimalFormat("###,###");
		for (int i=0; i < resList.size(); i++) {
			
		%>
			<tr>
				<td onclick="location.href='resAdViewAction.re?rnum=<%=resList.get(i).getRnum()%>&page=<%=nowPage%>'"><%=resList.get(i).getRnum()%></td>
				<td onclick="location.href='resAdViewAction.re?rnum=<%=resList.get(i).getRnum()%>&page=<%=nowPage%>'"><%=resList.get(i).getRid()%></td>
				<td onclick="location.href='resAdViewAction.re?rnum=<%=resList.get(i).getRnum()%>&page=<%=nowPage%>'"><%=resList.get(i).getMname()%></td>
				<td class="text-center hidden-xs" onclick="location.href='resAdViewAction.re?rnum=<%=resList.get(i).getRnum()%>&page=<%=nowPage%>'"><%=resList.get(i).getRcode()%></td>
				<td class="text-center hidden-xs hidden-sm" onclick="location.href='resAdViewAction.re?rnum=<%=resList.get(i).getRnum()%>&page=<%=nowPage%>'"><%=resList.get(i).getRstart() %></td>
				<td class="text-center hidden-xs hidden-sm" onclick="location.href='resAdViewAction.re?rnum=<%=resList.get(i).getRnum()%>&page=<%=nowPage%>'"><%=resList.get(i).getRend() %></td>
				<td class="text-center hidden-xs hidden-sm" onclick="location.href='resAdViewAction.re?rnum=<%=resList.get(i).getRnum()%>&page=<%=nowPage%>'"><%=resList.get(i).getRcancel() %></td>
				<td class="text-center"><a class='btn btn-default btn-xs' title="수정" href="resAdViewProAction.re?rnum=<%=resList.get(i).getRnum()%>&page=<%=nowPage%>"><span class="glyphicon glyphicon-edit"></span> 수정</a>
				<button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#<%=resList.get(i).getRnum()%>" title="삭제"><span class="glyphicon glyphicon-remove"></span> 삭제</button>
				   
				   <div class="modal fade" id="<%=resList.get(i).getRnum()%>" role="dialog">
		           <div class="modal-dialog modal-dialog-centered">
		           <!-- Modal content-->
		           <div class="modal-content">
		           	<div class="modal-header">
		           <button type="button" class="close" data-dismiss="modal">&times;</button>
		           </div>
		           <div class="modal-body">
		                                정말로 삭제 하시겠습니까?
		               </div>   
		               <div class="modal-footer">
		                 <button type="button" class="btn btn-secondary btn" data-dismiss="modal" title="취소">취소</button>
		                 <button type="button" onclick="location.href='resAdDeleteAction.re?rnum=<%=resList.get(i).getRnum()%>&page=${pageInfo.page}&id=${pageInfo.viewId}&fieldName=${pageInfo.fieldName}'" class="btn btn-secondary btn" title="삭제">삭제</button>
		                </div>
					</div>
					</div>
					</div>
			
				</td>
				
				
	</tr>
			<% } %>
		</table>
	</section>
	
	<section id="pageList">
		<ul class="pagination">
		<% if (nowPage <= 5) { %>
		<% } else { %>
		<li><a href="resAdListAction.re?page=<%=startPage-1 %>" title="이전 페이지로 이동" >이전</a></li>
		<%}  %>

		<% for (int a = startPage; a <= endPage; a++) {
				if (a == nowPage) { %>
		<li class="page-item page-item active"><a><%=a %></a></li>
		<% } else { %>
		<li><a href="resAdListAction.re?page=<%=a %>" title="<%=a %>페이지로 이동"><%=a %></a></li>
		<% } %>
		<% } %>

		<%if(nowPage >= maxPage){ %>
		<%} else if(endPage == maxPage){ %>
		
		<%} else { %>
		<li><a href="resAdListAction.re?page=<%=endPage+1 %>" title="다음 페이지로 이동">다음</a></li>
		<%} %>
		</ul>
	</section>
	
	<%
    } else {
	%>
	<section id="emptyArea">등록된 글이 없습니다.</section>
	<% } %>
</div>	
<jsp:include page="../main/mycarFooter.jsp"></jsp:include>
</body>
</html>