<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="res.bean.ResBean" %>
<%@ page import="res.dao.ResAdDAO" %>
<%@page import="res.bean.PageInfo"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String rid = request.getParameter("rid");
	ArrayList<ResBean> AdResList = (ArrayList<ResBean>)request.getAttribute("AdResList");
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
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
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
  }
  
 .pagination > li > a {
   float: none;
  }
 #pageList {margin: auto; width: 80%; text-align: center; }
 
 th, td {
  text-align: center;
}

h2 {
    margin-top: 50px;
    margin-bottom: 30px;
}
body {
    font-family: pretendard;
    font-size: 14px;
    
    color: #333;
    background-color: #fff;
}		
.btn-default {
    color: #f5f5f5;
    background-color: #1e1a1b;
    border-color: #1e1a1b;
}
  </style>
</head>
<body>
<jsp:include page="../main/mycarAdHeader.jsp"></jsp:include>

<div class="container">
  <h2>예약 목록</h2>
  
   <a class='btn btn-default pull-right' title="예약추가" onclick="location.href='resAdInsertAction.re'">예약추가</a> 
     <form action="resAdSearchAction.re" method="post">
   
	   <div class="col-sm-2" id="search1" >
	   <select class="form-control"  name="fieldName">
        	<option value="All">전체 검색</option>
        	<option value="cCode">아이디</option>
        	<option value="cCode">고객명</option>
       </select></div>
	   
	    <div class="input-group" >
	      <input type="search" class="form-control"name="rid" id="rid" placeholder="검색어를 입력하세요.">
	      <span class="input-group-btn"><button class="btn btn-default" type="submit" title="검색">검색</button></span>
	    </div>
   </form><br>

<section id="listForm">
	 <table class="table table-striped responsive">
	
		<%
if (AdResList != null && listCount > 0) {
		%>

	<tr>
        <th>예약번호</th>
        <th>예약아이디</th>
        <th>고객명</th>
        <th>예약차량</th>
        <th>예약시작일</th>
        <th>예약종료일</th>
        <th>총예약금액</th>
        <th>예약상태</th>
        <th>비고&nbsp; &nbsp; &nbsp;</th>
        
      </tr>

		<%
		DecimalFormat df = new DecimalFormat("###,###");
		for (int i=0; i < AdResList.size(); i++) {
			
		%>
			<tr>
				<td><%=AdResList.get(i).getRnum()%></td>
				<td><%=AdResList.get(i).getRid()%></td>
				<td><%=AdResList.get(i).getMname()%></td>
				<td><%=AdResList.get(i).getRcode()%></td>
				<td><%=AdResList.get(i).getRstart() %></td>
				<td><%=AdResList.get(i).getRend() %></td>
				<td><%=df.format(AdResList.get(i).getRtotal())+"원"%></td>
				<td><%=AdResList.get(i).getRcancel() %></td>
				<td class="text-center"><a class='btn btn-default btn-xs' title="상세보기" href="resAdViewAction.re?rnum=<%=AdResList.get(i).getRnum()%>&page=<%=nowPage%>">상세보기</a>
				<a href="resAdDeleteAction.re?rnum=<%=AdResList.get(i).getRnum()%>&page=<%=nowPage%>" class='btn btn-default btn-xs'title="삭제" onclick="if(!confirm('삭제 하시겠습니까?')){return false;}">삭제</a>
				</td>
				
	</tr>
			<% } %>
			
		</table>
	</section>
	
	<section id="pageList">
		<ul class="pagination">
		<% if (nowPage <= 5) { %>
		<% } else { %>
		<li><a href="resAdSearchAction.re?rid=<%=rid%>&page=<%=startPage-1 %>" title="이전 페이지로 이동">이전</a></li>
		<%}  %>

		<% for (int a = startPage; a <= endPage; a++) {
				if (a == nowPage) { %>
		<li><a><%=a %></a></li>
		<% } else { %>
		<li><a href="resAdSearchAction.re?rid=<%=rid%>&page=<%=a %>" title="<%=a %>페이지로 이동"><%=a %></a></li>
		<% } %>
		<% } %>

		<%if(nowPage >= maxPage){ %>
		<%} else if(endPage == maxPage){ %>
		
		<%} else { %>
		<li><a href="resAdSearchAction.re?rid=<%=rid%>&page=<%=endPage+1 %>" title="다음 페이지로 이동">다음</a></li>
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