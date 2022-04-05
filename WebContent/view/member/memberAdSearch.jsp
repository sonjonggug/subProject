<%@page import="member.bean.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="member.bean.PageInfo"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%
	ArrayList<MemberBean> articleList=(ArrayList<MemberBean>)request.getAttribute("member1");
    PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
%>
<title>Mycar 렌터카</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="/js/bootstrap.min.js"></script>
<link href="/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
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
  }
  .table-striped {
  text-align: center;
  }
  table.table-striped > th {
  text-align: center;
  }
  
</style>
</head>
<body>
 <script>
    function OK()
    {
        alert(" 삭제를 완료하였습니다. ");
    }
    function no()
    {
        alert("아니오피우지않습니다.");
    }
   </script>
<jsp:include page="/view/main/mycarAdHeader.jsp"></jsp:include>
 
    <table class="table">
      <div id="legend"style="text-align: center;">
      
      <legend><h2 ><a href="memberAdListAction.me">회원 검색</a></h2></legend>
      
      <div class="col-sm-8 col-sm-offset-2">
     <form action="memberAdSearchAction.me" method="post">
	    <div class="input-group" >
	      <input type="text" class="form-control"name="id" id="id"class="form-control" placeholder="아이디 혹은 이름을 입력하세요.">
	      <span class="input-group-btn">
		<button class="btn btn-default" type="submit">검색</button>
	      </span>
	    </div><!-- /input-group -->
	  </div><!-- /.col-sm-6 -->
	</div><!-- /.row -->  
     </form>
     

 <!--   <div class="container">
   <form class="navber-form navbar-right" action="memberAdSearchAction.me" method="post">
    <div clss="form-group">
     <input type="text" name="id" id="id"class="form-control" placeholder="작성자">
    
     <button type="submit" class="btn btn-default">검색</button></div>
   </form>
  </div>   --> 
        
    <thead>
    
 
 <!-- <a href="memberAdListAction.me" class="btn btn-primary btn-xs pull-left"><b> << </b>뒤로가기</a>  -->   
     
      	<%
if(articleList != null && listCount > 0){
%>     
     
        <tr >
             <th>아이디</th>           
            <th>  &nbsp  &nbsp  &nbsp  &nbsp  &nbsp  &nbsp 이름</th>
            <th>  &nbsp  &nbsp  &nbsp  &nbsp  &nbsp  &nbsp 생년월일</th>
            <th>  &nbsp  &nbsp  &nbsp  &nbsp  &nbsp  &nbsp 휴대폰 번호</th>
            <th>  &nbsp  &nbsp  &nbsp  &nbsp  &nbsp  &nbsp 주소</th>
            <th class="text-center">Action</th>
        </tr>
       <%
		for(int i=0;i<articleList.size();i++){
			
	%>
    </thead>
      <Tbody> 
       
            <tr>
                 <td onclick="location.href='memberAdViewAction.me?id=<%=articleList.get(i).getMid()%>'"><%=articleList.get(i).getMid()%></td>             
              <td  onclick="location.href='memberAdViewAction.me?id=<%=articleList.get(i).getMid()%>'"> &nbsp &nbsp &nbsp &nbsp &nbsp  &nbsp<%=articleList.get(i).getMname()%></td> 
              <td  onclick="location.href='memberAdViewAction.me?id=<%=articleList.get(i).getMid()%>'"> &nbsp &nbsp &nbsp &nbsp &nbsp  &nbsp<%=articleList.get(i).getMbirth()%></td> 
              <td  onclick="location.href='memberAdViewAction.me?id=<%=articleList.get(i).getMid()%>'"> &nbsp &nbsp &nbsp &nbsp &nbsp  &nbsp<%=articleList.get(i).getMhp()%></td> 
              <td  onclick="location.href='memberAdViewAction.me?id=<%=articleList.get(i).getMid()%>'"> &nbsp &nbsp &nbsp &nbsp &nbsp  &nbsp<%=articleList.get(i).getMaddr()%></td> 
   <td class="text-center"><a class='btn btn-info btn-xs' href="memberAdViewAction.me?id=<%=articleList.get(i).getMid()%>" data-toggle="modal" ><span class="glyphicon glyphicon-search"></span>상세 정보</a> 
              
   <!--  <a href="myfunction1()" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span>삭제</a></td> --> 
   <!--  <button type="button" onclick="location.href='memberAdDeleteAction.me?id=<%=articleList.get(i).getMid()%>'" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span>삭제</a></td>--> 
     <button type="button"class="btn btn-primary btn-xs"data-toggle="modal" data-target="#<%=articleList.get(i).getMid()%>1"alt="수정"title="수정"><span class="glyphicon glyphicon-edit"></span>빠른 수정</button>
       <button type="button"class="btn btn-danger btn-xs"data-toggle="modal" data-target="#<%=articleList.get(i).getMid()%>"alt="삭제"title="삭제"><span class="glyphicon glyphicon-remove"></span>삭제</button>  
 
 
  <!-- 모달 테스트 -->
       
    <div class="modal fade" id="<%=articleList.get(i).getMid()%>" role="dialog">
    <div class="modal-dialog modal-dialog-centered">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">정말 삭제하시겠습니까?</h4>
        </div>
        <div class="modal-body">
          <p>삭제할 아이디: <%=articleList.get(i).getMid()%></p>
        </div>
        <div class="modal-footer">
           <button type="button" class="btn btn-info"onclick="OK(); location.href='memberAdDeleteAction.me?idd=<%=articleList.get(i).getMid()%>&id=<%=articleList.get(i).getMid()%>';" data-dismiss="modal"alt="삭제"title="삭제"><span class="glyphicon glyphicon-ok"></span> 삭제</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal"alt="아니요"title="아니요"><span class="glyphicon glyphicon-remove"></span> 아니요</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>
          <!-- 모달 테스트 --> 
          
           <div class="modal fade "  id="<%=articleList.get(i).getMid()%>1" role="dialog">
    <div class="modal-dialog modal-dialog-centered">
   
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">정말 수정하시겠습니까?</h4>
        </div>
        <div class="modal-body " style="text-align: center;"><form class="form-horizontal" role="form"action="memberAdModifyProAction2.me" method="POST"name = "joinform1">
            
           <label >아이디 :</label>
           
           <input type="text" style="text-align: center;" id="MID" name="MID" class="form-control" value="<%=articleList.get(i).getMid()%>" onclick="tst7()" size="5" minlength = "3" maxlength = "10"autofocus required readonly >
           
           <label >이름 :</label>
            
           <input type="text" id="MNAME" name="MNAME" class="form-control"  value="<%=articleList.get(i).getMname()%>" onchange="tst()" minlength = "2" maxlength = "10"autofocus required pattern="^[가-힣]+$"placeholder="한글만 입력가능합니다." style="text-align: center;">
            
           <label >생년월일 :</label>
                 
           <input type="date" id="MBIRTH" name="MBIRTH" value="<%=articleList.get(i).getMbirth()%>" class="form-control"onchange="tst1()" minlength = "6" maxlength = "15" style="text-align: center;">
             
           <label >휴대폰 번호 :</label>
                    
           <input type="text" id="MHP" name="MHP" class="form-control"  value="<%=articleList.get(i).getMhp()%>" onchange="tst2()"autofocus required minlength = "8" maxlength = "15"pattern="^[0-9]+$" placeholder="-을 제외한 숫자를 입력해주세요" style="text-align: center;">

           <label >우편번호 :</label>
                    
           <input type="text" id="MADDRP" name="MADDRP"  class="form-control" value="<%=articleList.get(i).getMaddrp()%>" onclick="sample6_execDaumPostcode()"onchange="1test8()"required placeholder="클릭시 우편번호 화면이 나타납니다."style="text-align: center;">

            <label >주소 :</label>
                    
            <input type="text" id="MADDR" name="MADDR"  class="form-control" value="<%=articleList.get(i).getMaddr()%>" onchange="tst3()"required placeholder="클릭시 주소화면이 나타납니다."style="text-align: center;">

            <label >상세주소 :</label>
                    
            <input type="text" id="MADDRD" name="MADDRD"  class="form-control" value="<%=articleList.get(i).getMaddrd()%>"onchange="tst4()" minlength = "3" maxlength = "15" required required placeholder="상세주소를 기입해주세요."style="text-align: center;">

            <label >이메일  :</label>
                   
            <input type="email" id="MEMAIL" name="MEMAIL"class="form-control" value="<%=articleList.get(i).getMemail()%>"onchange="tst5()"required minlength = "10" maxlength = "30" placeholder="이메일 양식에 따라 기입해주세요."style="text-align: center;">

            <label >라이센스 :</label>
                    
            <input type="text" id="MLIC" name="MLIC" class="form-control" value="<%=articleList.get(i).getMlic()%>"onchange="tst6()"required minlength = "3" maxlength = "10"pattern="^[0-9]+$" placeholder="숫자만 입력가능합니다."style="text-align: center;">

       </div>
         
         
     
        <div class="modal-footer  "style="text-align: center;">
          <button type="submit" class="btn btn-primary" ><span class="glyphicon glyphicon-ok"></span> &nbsp네</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal"alt="아니요"title="아니요"><span class="glyphicon glyphicon-remove"></span> 아니요</button>
        </div>
      </div>
      </form>
    </div>
  </div>
  </div>
  </tr>
         
          
         
         <!-- <a href="memberAdJoin.jsp" class="btn btn-primary" style="float:right"><b></b>고객 추가</a>  -->      
            <%}%>      
          </Tbody>
          
    </table>
   <section id="pageList"style="text-align: center;">
 <div class="container">
    <ul class="pagination">
	  
		<%} %>
		</ul> 
		</div>
	</section>
	<div>&nbsp </div>
	<section style="text-align: center;">
	  <a href="memberAdListAction.me" class="btn btn-primary"><span class="glyphicon glyphicon-chevron-left" ></span> 뒤로가기</a> 
	 <button type="button" onclick="location.href='./memberAdJoin.me'"class="btn btn-success   "alt="추가"title="추가"><span class="glyphicon glyphicon-pencil"></span>고객 추가</a>
	</section>
	<jsp:include page="/view/main/mycarFooter.jsp"></jsp:include>
</body>
</html>
