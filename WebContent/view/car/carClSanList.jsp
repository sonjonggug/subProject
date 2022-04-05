<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import ="car.bean.CarBean" %>
<%@ page import="car.bean.CarPageInfo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
	ArrayList<CarBean> carList=(ArrayList<CarBean>)request.getAttribute("carList");
    CarPageInfo pageInfo = (CarPageInfo)request.getAttribute("pageInfo");
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Mycar 렌터카</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <style>
     
  .pagination > li > a {
   float: none;
   color: #1e1a1b !important;
  }
 
     
  table{
       
       border : 0px border #bcbcbc;
       font-size: 15pt; 
       display:inline;
       
 
       }
 tbody{
      border: 1pt solid #bcbcbc;
      padding: 0;
      margin-right:4%;
      margin-left:4%;
      margin-top:0%
      
      }
 #sangpum{
        text-align: center;  
         border-top: 1pt solid #bcbcbc;
         background-color: #FAFAFA;
         }
 .car{
      line-height:40px;
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
.pagination > li > a {
   float: none;
   color: #1e1a1b;
  }
  
</style>
</head>
<body>
 
<jsp:include page="/view/main/mycarClHeader.jsp"></jsp:include> 
&nbsp;<br />&nbsp;<br />&nbsp;<br />&nbsp;<br />
<div class="container" style="margin: 0 auto;">
<div class= "col-xs-12">
<div class="car">
<c:if test="${carList !=null && pageInfo.listCount >0}">
<c:forEach var="Code" items="${carList}">
<table >
<tbody class= "col-xs-12 col-sm-3" style="padding:0; margin-bottom:2.8%;" >
<tr><td height="20"></td></tr>
<tr>
<td ><a href="carClDetail.ca?ctype=${param.ctype}&&csize=${param.csize}&&cCode=${Code.cCode}&&page=${pageInfo.page}">
 <img src="image/${Code.cFile}" width="100%" alt =" 상품정보" title="차량 아이콘"></a></td>
 </tr>
<tr id="sangpum"><td>${Code.cName}</td></tr>
 </tbody>    
</table>
</c:forEach>
</c:if>
</div>

	
	
<c:if test="${not (carList !=null && pageInfo.listCount >0)}">

<section id="emptyArea">등록된 글이 없습니다.</section>

</c:if>
</div>

   	<section id="pageList">
   	   <div>
   	   <div class= "col-xs-2 col-sm-2"></div>
  	   <div class= "col-xs-8 col-sm-8" style="text-align:center;">                
	   <ul class="pagination pagination-sm">
	   <c:if test="${pageInfo.page > 5}" >
	   <li><a href="carClSanList.ca?ctype=${param.ctype}&&csize=${param.csize}&&page=${pageInfo.startPage-1}">이전</a></li></c:if>
	   
	   <c:forEach var="pNo" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
	   <li><a href="carClSanList.ca?ctype=${param.ctype}&&csize=${param.csize}&&page=${pNo}">${pNo}</a></li></c:forEach>
	   
	   <c:if test="${pageInfo.maxPage > 5 && pageInfo.maxPage != pageInfo.endPage}" >
	   <li><a href="carClSanList.ca?ctype=${param.ctype}&&csize=${param.csize}&&page=${pageInfo.endPage+1}">다음</a></li></c:if>
	   
	   </ul>               
	   </div>	
	   <div class= "col-xs-2 col-sm-2"></div>
	   </div>
	</section>
</div>


<jsp:include page="/view/main/mycarFooter.jsp"></jsp:include> 

</body>
</html>
