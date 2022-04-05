<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="res.bean.ResClCheckBean" %>
<%@ page import="res.bean.PageInfo" %>
<%@ page import="res.dao.ResClDAO" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Mycar 렌터카</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <%
    String rid = (String)session.getAttribute("id");
    ArrayList<ResClCheckBean> resList = (ArrayList<ResClCheckBean>)request.getAttribute("resList");
    PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
    int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
  %>
<style>
 .pagination {
   display: block;
   text-align: center;
  }
 
 th, td {
  text-align: center;
}

a {
    color: #1e1a1b;
    text-decoration: none;
    text-align:center;
}

  .pagination > li > a {
   float: none;
   color: #1e1a1b;
  }
  
 .container{
 margin: 0 auto;
 padding: 0;
 }
 
 .pagination{
 text-align: center;
 margin: auto;
 }

 #pageList{
 margin: 0 auto;
 }
 #pageList1{
 margin: 0 auto;
 }
.pagination > li > a {
   float: none;
   color: #1e1a1b;
  }

body {
    font-family: pretendard !important;
    font-size: 14px;
}		
</style>
</head>
<body>
<script>
  var nowPage= document.location.href.split("=")[1]; 
  $( document ).ready( function() {
      $( 'a:contains('+ nowPage +')' ).css( 'color', 'white' );
      $( 'a:contains('+ nowPage +')' ).css( 'background-color', '#1e1a1b' );
    } );
 </script>
 
<div class="container" id="resClList">
	<h1 title="예약 내역">예약 내역</h1><br/>



	<c:if test="${resList !=null && pageInfo.listCount >5}">

	<section id="listForm">
	<table class="table table-striped table-hover responsive">

	<tr>
		<th class="col-xs-2 col-sm-1" title="예약번호">예약번호</th>
		<th class="col-xs-3 col-sm-1" title="예약시작일">예약시작일</th>
		<th class="col-xs-3 col-sm-1" title="예약종료일">예약종료일</th>
		<th class="col-xs-4 col-sm-1" title="총 금액">총 금액</th>
		<th class="col-sm-1 hidden-xs" title="예약 취소 여부">예약 취소 여부</th>
	</tr>
	<%
	DecimalFormat df = new DecimalFormat("###,###");
	for(int i=0;i<resList.size();i++){
			String rtotal = df.format(resList.get(i).getRtotal())+"원";
	%>			
				<tr>
					<td class="col-xs-2 col-sm-1" onclick="location.href='resClDetail.re?rnum=<%=resList.get(i).getRnum()%>&page=<%=nowPage%>'" title="<%=resList.get(i).getRnum()%>"><%=resList.get(i).getRnum()%></td>
					<td class="col-xs-3 col-sm-1" onclick="location.href='resClDetail.re?rnum=<%=resList.get(i).getRnum()%>&page=<%=nowPage%>'" title="<%=resList.get(i).getRstart() %>"><%=resList.get(i).getRstart() %></td>
					<td class="col-xs-3 col-sm-1" onclick="location.href='resClDetail.re?rnum=<%=resList.get(i).getRnum()%>&page=<%=nowPage%>'" title="<%=resList.get(i).getRend() %>"><%=resList.get(i).getRend() %></td>
					<td class="col-xs-4 col-sm-1" onclick="location.href='resClDetail.re?rnum=<%=resList.get(i).getRnum()%>&page=<%=nowPage%>'" title="<%=rtotal %>"><%=rtotal %></td>
					<td class="col-sm-1 hidden-xs" onclick="location.href='resClDetail.re?rnum=<%=resList.get(i).getRnum()%>&page=<%=nowPage%>'" title="<%=resList.get(i).getRcancel() %>"><%=resList.get(i).getRcancel() %></td>
				</tr>
	<%
	}
	 %>
</table>
</section>

<section id="pageList">
   	   <div>
   	   <div class= "col-xs-2 col-sm-2"></div>
  	   <div class= "col-xs-8 col-sm-8" style="text-align:center;">                
	   <ul class="pagination pagination-sm">
	   <c:if test="${pageInfo.page > 5}" >
	   <li><a href="memberClViewAction.me?page=${pageInfo.startPage-1}">이전</a></li></c:if>
	   
	   <c:forEach var="pNo" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
	   <li><a href="memberClViewAction.me?page=${pNo}">${pNo}</a></li></c:forEach>
	   
	   <c:if test="${pageInfo.maxPage > 5 && pageInfo.maxPage != pageInfo.endPage}" >
	   <li><a href="memberClViewAction.me?page=${pageInfo.endPage+1}">다음</a></li></c:if>
	   
	   </ul>               
	   </div>	
	   <div class= "col-xs-2 col-sm-2"></div>
	   </div>
	</section>
<br/><br/>

</c:if>

<c:if test="${not (resList !=null && pageInfo.listCount >0)}">

<section id="emptyArea">
<h3>예약 내역이 존재하지 않습니다</h3>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
</section>

</c:if>


	<c:if test="${pageInfo.listCount <= 5}">

	<section id="listForm1">
	<table class="table table-striped table-hover responsive">

	<tr>
		<th class="col-xs-2 col-sm-1" title="예약번호">예약번호</th>
		<th class="col-xs-3 col-sm-1" title="예약시작일">예약시작일</th>
		<th class="col-xs-3 col-sm-1" title="예약종료일">예약종료일</th>
		<th class="col-xs-4 col-sm-1" title="총 금액">총 금액</th>
		<th class="col-sm-1 hidden-xs" title="예약 취소 여부">예약 취소 여부</th>
	</tr>
	<%
	DecimalFormat df = new DecimalFormat("###,###");
	for(int i=0;i<resList.size();i++){
			String rtotal = df.format(resList.get(i).getRtotal())+"원";
	%>			
				<tr>
					<td class="col-xs-2 col-sm-1" onclick="location.href='resClDetail.re?rnum=<%=resList.get(i).getRnum()%>&page=<%=nowPage%>'" title="<%=resList.get(i).getRnum()%>"><%=resList.get(i).getRnum()%></td>
					<td class="col-xs-3 col-sm-1" onclick="location.href='resClDetail.re?rnum=<%=resList.get(i).getRnum()%>&page=<%=nowPage%>'" title="<%=resList.get(i).getRstart() %>"><%=resList.get(i).getRstart() %></td>
					<td class="col-xs-3 col-sm-1" onclick="location.href='resClDetail.re?rnum=<%=resList.get(i).getRnum()%>&page=<%=nowPage%>'" title="<%=resList.get(i).getRend() %>"><%=resList.get(i).getRend() %></td>
					<td class="col-xs-4 col-sm-1" onclick="location.href='resClDetail.re?rnum=<%=resList.get(i).getRnum()%>&page=<%=nowPage%>'" title="<%=rtotal %>"><%=rtotal %></td>
					<td class="col-sm-1 hidden-xs" onclick="location.href='resClDetail.re?rnum=<%=resList.get(i).getRnum()%>&page=<%=nowPage%>'" title="<%=resList.get(i).getRcancel() %>"><%=resList.get(i).getRcancel() %></td>
				</tr>
	<%
	}
	 %>
</table>
</section>
   	<section id="pageList1">
   	   <div>
   	   <div class= "col-xs-2 col-sm-2"></div>
  	   <div class= "col-xs-8 col-sm-8" style="text-align:center;">                
	   <ul class="pagination pagination-sm">
	   <c:if test="${pageInfo.page > 5}" >
	   <li><a href="memberClViewAction.me?page=${pageInfo.startPage-1}">이전</a></li></c:if>
	   
	   <c:forEach var="pNo" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
	   <li><a href="memberClViewAction.me?page=${pNo}">${pNo}</a></li></c:forEach>
	   
	   <c:if test="${pageInfo.maxPage > 5 && pageInfo.maxPage != pageInfo.endPage}" >
	   <li><a href="memberClViewAction.me?page=${pageInfo.endPage+1}">다음</a></li></c:if>
	   
	   </ul>               
	   </div>	
	   <div class= "col-xs-2 col-sm-2"></div>
	   </div>
	   <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/><br/>
	</section>
</c:if>
</div>	

</body>
</html>
