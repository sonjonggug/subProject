<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
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
<html>
<head>
  <title>Mycar 렌터카</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css" class="svelte-p5qu1m" data-svelte="svelte-1yifjfe">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<link href="/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="js/bootstrap.js"></script>
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
    
  .carousel-inner img {
      width: 60%; /* Set width to 100% */
      margin: auto;
      min-height:600px;
      max-height:600px;
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
  
  }
  
 .pagination > li > a {
   float: none;
   color: #1e1a1b;
  }
  
  #sangpum{
  cursor:pointer;
  }


   #search1{
   margin-right: 5px;
   border-bottom-width:2px;
   } 

   body {
    font-family: pretendard;
    font-size: 14px;
    color: #333;
    background-color: #fff;
}

h2 {
    margin-top: 50px;
    margin-bottom: 30px;
    margin-left:5px;
}

#delete{
    color: #333;
    background-color: #fff;
    border-color: #e2e2e2;
}

#modify{
    color: #333;
    background-color: #fff;
    border-color: #e2e2e2;

}


.btn-default {
    color: #f5f5f5;
    background-color: #1e1a1b;
    border-color: #1e1a1b;
}


  </style>
  
  <script>
  $(function(){
	     var pageBtn = $("ul > li");    //  ul > li 이를 pageBtn 으로 칭한다. (클릭이벤트는 li에 적용 된다.)
	      pageBtn .find("a").click(function(){   // pageBtn 에 속해 있는  a 찾아 클릭.
	      pageBtn .removeClass("active");     // pageBtn 속에 (active) 클래스를 삭제.
	      $(this).parent().addClass("active"); // 클릭한 a에 (active)클래스를 넣는다.
	     })
	    });
  </script>
</head>
<body>

<jsp:include page="../main/mycarAdHeader.jsp"></jsp:include>

<div class="container">
  <c:if test="${carList !=null && pageInfo.listCount >0}">
        <h2>상품 목록</h2>
        
        <div> 
	    <button class='btn btn-default pull-right'  id=insert onclick="location.href='carInsertForm.ca?page=${pageInfo.page}'"title= "제품등록">등&nbsp;록</button>
  	    <form action="carAdSearchList.ca" method="post" >
	    <div class="col-sm-2" id="search1" style="padding:0 ;">
	    <select class="form-control hidden-xs"  name="fieldName">
        <option value="All">전체 검색</option>
        <option value="cCode">코드 번호</option>
        <option value="cType">장기/단기</option>
        <option value="cSize">차량 크기</option>
        <option value="cName">차 종</option>
        <option value="cPrice">가 격</option>
        <option value="cGear">기 어</option>
        <option value="cFuel">연 료</option>
        <option value="cSeat">승차인원</option>
        </select></div>
       <div class="input-group" id="search2">
	   <input type="search" class="form-control" name="word" placeholder="Search" >
	   <span class="input-group-btn"><button class="btn btn-default"  id = search1 type="submit" title="검색">검색</button></span>
	   </div>
	   </form>
       </div>
    <br>
     <section id="listForm" style="text-align:center;">
        
     <table class="table table-striped table table-hover">
      <tr>
        <td class="text-center col-xs-1 col-sm-1 col-md-1 "><strong>상품 코드</strong></td>
        <td class="text-center hidden-xs hidden-sm col-md-1"><strong>타입</strong></td>
        <td class="text-center hidden-xs hidden-sm col-md-1 "><strong>분류</strong></td>
        <td class="text-center col-xs-3 col-sm-2 col-md-1"><strong>차종</strong></td>
        <td class="text-center hidden-xs col-sm-1 col-md-1"><strong>가격</strong></td>
        <td class="text-center hidden-xs hidden-sm col-md-1 "><strong>기어</strong></td>
        <td class="text-center hidden-xs hidden-sm col-md-1 "><strong>연료</strong></td>
        <td class="text-center hidden-xs col-sm-3 col-md-2"><strong>승차 인원</strong></td>
        <td class="text-center col-xs-1 col-sm-1 col-md-1"><strong>파일</strong></td>
        <td class="text-center col-xs-3 col-sm-3 col-md-3"><strong>버튼</strong></td>
      </tr>
      
	    <c:forEach var="Code" items="${carList}">
   		    <tr  id="sangpum" >
			<%-- <td><input type = "checkbox" name ="sangpumlist" value = "${cCode}"></td>--%>
			<td class="text-center col-xs-1 col-sm-1 col-md-1" onclick="location.href='carAdDetail.ca?cCode=${Code.cCode}&&page=${pageInfo.page}&&fieldName=${pageInfo.fieldName}&&word=${pageInfo.word}'">${Code.cCode}</td>
            <td class="text-center hidden-xs hidden-sm col-md-1" onclick="location.href='carAdDetail.ca?cCode=${Code.cCode}&&page=${pageInfo.page}&&fieldName=${pageInfo.fieldName}&&word=${pageInfo.word}'">${Code.cType}</td>
            <td class="text-center hidden-xs hidden-sm col-md-1" onclick="location.href='carAdDetail.ca?cCode=${Code.cCode}&&page=${pageInfo.page}&&fieldName=${pageInfo.fieldName}&&word=${pageInfo.word}'">${Code.cSize}</td>
            <td class="text-center col-xs-3 col-sm-2 col-md-1" onclick="location.href='carAdDetail.ca?cCode=${Code.cCode}&&page=${pageInfo.page}&&fieldName=${pageInfo.fieldName}&&word=${pageInfo.word}'">${Code.cName}</td>
            <td class="text-center hidden-xs col-sm-1 col-md-1" onclick="location.href='carAdDetail.ca?cCode=${Code.cCode}&&page=${pageInfo.page}&&fieldName=${pageInfo.fieldName}&&word=${pageInfo.word}'">${Code.cPrice}</td>
            <td class="text-center hidden-xs hidden-sm col-md-1" onclick="location.href='carAdDetail.ca?cCode=${Code.cCode}&&page=${pageInfo.page}&&fieldName=${pageInfo.fieldName}&&word=${pageInfo.word}'">${Code.cGear}</td>
            <td class="text-center hidden-xs hidden-sm col-md-1" onclick="location.href='carAdDetail.ca?cCode=${Code.cCode}&&page=${pageInfo.page}&&fieldName=${pageInfo.fieldName}&&word=${pageInfo.word}'">${Code.cFuel}</td>
            <td class="text-center hidden-xs col-sm-3 col-md-1"onclick="location.href='carAdDetail.ca?cCode=${Code.cCode}&&page=${pageInfo.page}&&fieldName=${pageInfo.fieldName}&&word=${pageInfo.word}'">${Code.cSeat}</td>
            <td class="text-center col-xs-1 col-sm-1 col-md-1" onclick="location.href='carAdDetail.ca?cCode=${Code.cCode}&&page=${pageInfo.page}&&fieldName=${pageInfo.fieldName}&&word=${pageInfo.word}'"><img src="image/${Code.cFile}" width="70px" alt =" 상품정보" title="차량 아이콘" style="margin:0 auto;"> </td>
           <td class="text-center col-xs-3 col-sm-3 col-md-3" >
           <button type="button"  id = modify class="btn btn-default btn-xs" onclick="location.href='carAdDetail.ca?cCode=${Code.cCode}&&page=${pageInfo.page}&&fieldName=${pageInfo.fieldName}&&word=${pageInfo.word}'"title="수정"><span class="glyphicon glyphicon-edit"></span>수정</button>		
           <button type="button" class="btn btn-default btn-xs" id= delete data-toggle="modal" data-target="#${Code.cCode}" title="삭제"><span class="glyphicon glyphicon-remove"></span>삭제</button>
           <div class="modal fade" id="${Code.cCode}" role="dialog">
           <div class="modal-dialog">
           <!-- Modal content-->
           <div class="modal-content">
           <div class="modal-header">
           <button type="button" class="close" data-dismiss="modal">&times;</button>
           <h4 class="modal-title"></h4>
           </div>
           <div class="modal-body">
                                정말로 삭제 하시겠습니까?
               </div>   
               <div class="modal-footer">
                    <button type="button" onclick="location.href='carDeletePro.ca?cCode=${Code.cCode}&&page=${pageInfo.page}&&cFile=${Code.cFile}&&fieldName=${pageInfo.fieldName}&&word=${pageInfo.word}'" class="btn btn-secondary btn" title="삭제">삭제</button>
                 <button type="button" class="btn btn-secondary btn" data-dismiss="modal" title="취소">취소</button>
                </div>
    </div>
  </div>
           </div>
		</td>
		</tr>
		</c:forEach>
		</table>
	</section>
	</c:if>	
    <section id="pageList">
    
  	   <ul class="pagination pagination-sm">
	   <c:if test="${pageInfo.page > 5}" >
	   <li><a href="carAdSearchList.ca?page=${pageInfo.startPage-1}&&fieldName=${pageInfo.fieldName}&&word=${pageInfo.word}">이전</a></li></c:if>
	   
	   <c:forEach var="pNo" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
	   <li><a href="carAdSearchList.ca?page=${pNo}&&fieldName=${pageInfo.fieldName}&&word=${pageInfo.word}">${pNo}</a></li></c:forEach>
	   
	   <c:if test="${pageInfo.maxPage > 5 && pageInfo.maxPage != pageInfo.endPage }" >
	   <li><a href="carAdSearchList.ca?page=${pageInfo.endPage+1}&&fieldName=${pageInfo.fieldName}&&word=${pageInfo.word}">다음</a></li></c:if>
	   
	   </ul>               
	 	
	</section>  	
    
  	 
    
  	  	<c:if test="${not (carList !=null && pageInfo.listCount >0)}">

<section id="emptyArea">등록된 글이 없습니다.</section>

</c:if>

</div>

 <jsp:include page="../main/mycarFooter.jsp"></jsp:include>
</body>
</html>