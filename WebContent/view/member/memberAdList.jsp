<%@page import="member.bean.MemberBean"%>
<%@page import="member.bean.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
	ArrayList<MemberBean> articleList=(ArrayList<MemberBean>)request.getAttribute("articleList");
    PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="/view/main/mycarAdHeader.jsp"></jsp:include>
<title>회원 목록</title>
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
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css" class="svelte-p5qu1m" data-svelte="svelte-1yifjfe">
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
    color: #101010;
   
  }
  
  #search1 {
    margin-left: 0px;
    padding-right: 0px;
    padding-left: 0px;
    
  }
  
  #write{
    margin-left: 3px;
  
  }
 

.btn-info {
   color:#1e1a1b!important;
    background-color: #fff!important;
   
}
.btn-primary {
     color: #fff!important;
    background-color: #263238!important;
    border-color: #263238!important;
    
    
}
.btn-danger {
   color:#1e1a1b!important;
    background-color: #fff!important;
   
}
.btn-success {
    background-color: #1e1a1b;
    border-color: #1e1a1b;
}
.btn-default {
     color:#1e1a1b!important;
    background-color: #fff!important;
   
}
a {
    color: #1e1a1b;
    text-decoration: none;
}
body {
    font-family: pretendard;
    font-size: 14px;
    
    color: #333;
    background-color: #fff;
}


th, td {
  text-align: center;
  
}
.table--min {
  min-width:700px;
}
@media screen and (max-width:768px) {
  /*normal*/
  .table-box {
    overflow-x:auto;
  }
 
 
</style>


</head>
<body style="overflow: auto">
 
    <script>
  
  
    function OK()
    {
    	 var val = $('.modal-bodyo #reason1').val();
	 		
    	 
    	
 
    	var answer;
    	answer = confirm("삭제사유 : " + val +"가(이) 맞습니까?");
    	if(answer == true){
     //   alert(" 삭제를 완료하였습니다. ");
        document.location.href="memberAdDeleteAction.me?id=${member.mid}&&fieldName= &&page=1 &&viewId= ";
    	}else{
    	return false;	
    	}
    	}

   </script>



 <div class="container">
   
   
   
       <form action="memberAdSearchAction.me" method="post">
      <div id="legend"style="text-align: center;">
      <h2><a href="memberAdListAction.me">회원 목록</a></h2>
       <div class="col-sm-2 col-sm-offset-1" id="search1" >
	    <select class="form-control  hidden-xs"  name="fieldName">
        <option value="All">전체검색</option>
        <option value="mid">아이디</option>
        <option value="mname">이름</option>
        <option value="mbirth">생년월일</option>
        <option value="mhp">휴대폰 번호</option>
        <option value="maddr">주소</option>        
        </select></div>
   <div id="searchbox">
		<div class="input-group">
			<input type="search" class="form-control" name="id"
				id="id" value="${pageInfo.viewId}"class="form-control" placeholder="검색어를 입력하세요.">
			<input type="hidden" id="page" name="page" class="form-control" value="${pageInfo.page}"onchange="tst6()" style="text-align: center;">
			<span class="input-group-btn">
				<button class="btn btn-primary" type="submit" title="검색" >검색</button>			
			  	<a href="./memberAdJoin.me" class="btn btn-primary" role="button" title="글쓰기" id="write"> 회원 추가</a>
	<!--  <button type="button" onclick="location.href='./memberAdJoin.me'"class="btn btn-success  btn-lg "alt="추가"title="추가"><span class="glyphicon glyphicon-pencil"></span> 회원 추가</a>-->
		</span>
		</div></div></div>
		</form>
		
     
     
     
     
     <div class="col-sm-7">&nbsp</div>
     <section id="listForm">
    <table class="table table-hover responsive">
    <thead>
        
     	<%
if(articleList != null && listCount > 0){
%>           
        <tr>
            <th class="text-center">아이디</th>           
            <th class="text-center">이름</th>
            <th class="text-center  hidden-xs ">생년월일</th>
            <th class="text-center hidden-xs hidden-sm">휴대폰 번호</th>
            <th class="text-center  hidden-xs hidden-sm">주소</th>
            <th class="text-center">Action</th>
        </tr>
        <%
		for(int i=0;i<articleList.size();i++){
			
	%>
  
    </thead>
      <Tbody> 
     
            <tr>
              <td onclick="location.href='memberAdViewAction.me?id=<%=articleList.get(i).getMid()%>'"><%=articleList.get(i).getMid()%></td>             
              <td  onclick="location.href='memberAdViewAction.me?id=<%=articleList.get(i).getMid()%>'"><%=articleList.get(i).getMname()%></td> 
              <td class=" hidden-xs " onclick="location.href='memberAdViewAction.me?id=<%=articleList.get(i).getMid()%>'"><%=articleList.get(i).getMbirth()%></td> 
              <td  class=" hidden-xs hidden-sm"onclick="location.href='memberAdViewAction.me?id=<%=articleList.get(i).getMid()%>'"><%=articleList.get(i).getMhp()%></td> 
              <td  class=" hidden-xs hidden-sm" onclick="location.href='memberAdViewAction.me?id=<%=articleList.get(i).getMid()%>'"><%=articleList.get(i).getMaddr()%></td> 
             
   
      <td class="text-center"> <button type="button"class="btn btn-default btn-xs" data-toggle="modal" data-target="#<%=articleList.get(i).getMid()%>1"alt="수정"title="수정"><span class="glyphicon glyphicon-edit"></span>수정</button>
       <button type="button"class="btn btn-default btn-xs "data-toggle="modal" data-target="#<%=articleList.get(i).getMid()%>2"alt="삭제"title="삭제"><span class="glyphicon glyphicon-remove"></span>삭제</button>
          <!-- 모달 테스트 -->
       
    <div class="modal fade" id="<%=articleList.get(i).getMid()%>2" role="dialog">
    <div class="modal-dialog modal-dialog-centered">
    
      <!-- Modal content-->
      <div class="modal-content col-sm-10">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h3 class="modal-title">정말 삭제하시겠습니까?</h3>
           <span class="help-block">＊가급적 상제 정보 페이지에서 삭제하시기 바랍니다.＊</span>
            <span class="help-block">＊삭제시 복구할수없습니다.＊</span>
           
             
        </div>
        <div class="modal-bodyo"> <form action="memberAdDeleteAction.me" method="post">
     
          <p>
           <label >삭제할 아이디 :</label>         
           <input type="text" style="text-align: center;"class="form-control" value="<%=articleList.get(i).getMid()%>"  readonly >
           <label >삭제할 이름 :</label>         
           <input type="text" style="text-align: center;"class="form-control" value="<%=articleList.get(i).getMname()%>"  readonly >
           <label >삭제할 생년월일 :</label>         
           <input type="text" style="text-align: center;"class="form-control" value="<%=articleList.get(i).getMbirth()%>"  readonly >
           <label >삭제할 휴대폰번호 :</label>         
           <input type="text" style="text-align: center;"class="form-control" value="<%=articleList.get(i).getMhp()%>"  readonly>         
           <label >삭제할 주소 :</label>                             
           <input type="text" style="text-align: center;"class="form-control" value="<%=articleList.get(i).getMaddr()%>"  readonly >
           <label >삭제할 상세주소 :</label>         
           <input type="text" style="text-align: center;"class="form-control" value="<%=articleList.get(i).getMaddrd()%>"  readonly >
           <label >삭제할 이메일 :</label>         
           <input type="text" style="text-align: center;"class="form-control" value="<%=articleList.get(i).getMemail()%>"  readonly >
           <label >삭제할 라이센스 :</label>         
           <input type="text" style="text-align: center;"class="form-control" value="<%=articleList.get(i).getMlic()%>"  readonly >
           
        <!--  <input type="text" name="reason1" id="reason1"  style="text-align: center;"class="form-control"   required  />-->   
          <input type="hidden" id="id"name="id"value="<%=articleList.get(i).getMid()%>">         
          <input type="hidden" id="fieldName"name="fieldName" value="${pageInfo.fieldName}">
          <input type="hidden" id="viewId"name="viewId"  value="${pageInfo.viewId}">
          <input type="hidden" id="page"name="page"  value="${pageInfo.page}">
          <input type="hidden" id="ho" name="ho"value="<%=articleList.get(i).getMid()%>">
          </p>
        </div>
        <div class="modal-footer" style="text-align: center;">
           
             <button type="submit" class="btn btn-default" > &nbsp&nbsp네&nbsp&nbsp</button>  
         <!--  <button type="button" class="btn btn-info"onclick="OK(); location.href='memberAdDeleteAction.me?id=<%=articleList.get(i).getMid()%>&&fieldName=${pageInfo.fieldName}&&page=${pageInfo.page}&&viewId=${pageInfo.viewId}';" data-dismiss="modal"alt="삭제"title="삭제"><span class="glyphicon glyphicon-ok"></span> 삭제</button>-->   
          <button type="button" class="btn btn-default" data-dismiss="modal"alt="아니요"title="아니요"> 아니요</button>
       
        </div>
      </div>
     </form>
    </div>
  </div>
  <script>
  function OK1()
  {
  	var answer;
  	var namem = document.getElementById('ho').value;
  	answer = confirm("정말 데이터를 삭제하시겠습니까?");
  	if(answer == true){
   //   alert(" 삭제를 완료하였습니다. ");
      document.location.href="memberAdDeleteAction.me?id="+namem+"&&fieldName= &&page= &&viewId= ";
  	}else{
  	return false;	
  	}
  	}
  </script>

          <!-- 모달 테스트 --> 
          
           <div class="modal fade "  id="<%=articleList.get(i).getMid()%>1" role="dialog">
    <div class="modal-dialog modal-dialog-centered">
   
      <!-- Modal content-->
      <div class="modal-content col-sm-10">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h3 class="modal-title"style="text-align: center;">정말 수정하시겠습니까?</h3>
            <span class="help-block">*권장하지 않습니다.*</span>
             <span class="help-block">*가급적 상세정보 페이지에서 수정해주시기 바랍니다.*</span>
        </div>
        <div class="modal-body " style="text-align: center;"><form class="form-horizontal" role="form"action="memberAdModifyProAction2.me" method="POST"name = "joinform1">
            
           <label >아이디 :</label>
           
           <input type="text" style="text-align: center;" id="MID" name="MID" class="form-control" value="<%=articleList.get(i).getMid()%>" onclick="test7()" size="5" minlength = "3" maxlength = "10"autofocus required readonly >
           
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
                    
            <input type="text" id="MLIC" name="MLIC" class="form-control" value="<%=articleList.get(i).getMlic()%>"onchange="tst6()"required pattern="^(?=.*\d)(?=.*[-])[\d$-]{8,16}$" placeholder="-을 포함한 숫자만 입력가능합니다."style="text-align: center;">
            
             <input type="hidden" id="page" name="page" class="form-control" value="${pageInfo.page}"onchange="tst6()" style="text-align: center;">
             
              <input type="hidden" id="fieldName" name="fieldName" class="form-control" value="${pageInfo.fieldName}"  style="text-align: center;">
              
               <input type="hidden" id="viewId" name="viewId" class="form-control" value="${pageInfo.viewId}" style="text-align: center;">

      
          </div>
         
     
        <div class="modal-footer  "style="text-align: center;">
          <button type="submit" class="btn btn-default" > &nbsp&nbsp네&nbsp&nbsp</button>
          <button type="button" class="btn btn-default" data-dismiss="modal"alt="아니요"title="아니요"> 아니요</button>
        </div>
      </div>
      </form>
    </div>
  </div>
  

          
          
  </tr>
      
          <tr>
         
         <!-- <a href="memberAdJoin.jsp" class="btn btn-primary" style="float:right"><b></b>고객 추가</a>  -->      
          </tr>
          
      <%}} %>    
     
   
         </Tbody>
        
    </table>
    </section> 
   <section id="pageList">
  	   <div class="container">                
	   <ul class="pagination">
	 <!--  <c:if test="${pageInfo.page <= 5}" >
	   <li><a href="memberAdListAction.me?page=1&&fieldName=${pageInfo.fieldName}&&viewId=${pageInfo.viewId}">이전</a></li></c:if> -->  
	 
	   
	   <c:if test="${pageInfo.page > 5}" >
	   <li><a href="memberAdSearchAction.me?page=${pageInfo.startPage-1}&&fieldName=${pageInfo.fieldName}&&id=${pageInfo.viewId}"><span aria-hidden="true">&laquo;</span></a></li></c:if>
	   
	  <%for(int a=startPage;a<=endPage;a++){
				if(a==nowPage){%>
		<li class="page-item page-item active"><a class="page-link"><%=a %></a></li>
		<%}else{ %>
		<li class="page-item"><a class="page-link" href="memberAdSearchAction.me?page=<%=a %>&&fieldName=${pageInfo.fieldName}&&id=${pageInfo.viewId}" title="<%=a %>페이지로 이동"><%=a %>
		</a></li>
		<%} %>
		<%} %>
	   
	   
	   <c:if test="${pageInfo.maxPage > 5 && pageInfo.maxPage != pageInfo.endPage}" >
	   <li><a href="memberAdSearchAction.me?page=${pageInfo.endPage+1}&&fieldName=${pageInfo.fieldName}&&id=${pageInfo.viewId}"><span aria-hidden="true">&raquo;</span></a></li></c:if>
	   
	   </ul>               
	   </div>	
		
	</section>  
	<div>&nbsp </div>
	<section style="text-align: center;">
	<!--  <button type="button" onclick="location.href='./memberAdJoin.me'"class="btn btn-success  btn-lg "alt="추가"title="추가"><span class="glyphicon glyphicon-pencil"></span> 회원 추가</a>--> 
	</section> 
	
   
  <script>
   window.onload = function(){
	    document.getElementById("MADDR").addEventListener("click", function(){ //주소입력칸을 클릭하면
	        //카카오 지도 발생
	        new daum.Postcode({
	            oncomplete: function(data) { //선택시 입력값 세팅
	                document.getElementById("MADDR").value = data.address; // 주소 넣기
	                const name = document.getElementById('MADDR').value;
	          	  
	          	  document.getElementById("result3").innerText = name;
	            }
	        }).open();
	    });
	}
</script>

<script>
function tst()  {
  const name = document.getElementById('MNAME').value;
  
 // document.getElementById("result").innerText = name;
  $(".modal-body #MNAME1").val( name );
}
function tst1()  {
	  const name = document.getElementById('MBIRTH').value;
	  
	 // document.getElementById("result1").innerText = name;
	  $(".modal-body #MBIRTH1").val( name );
	}
function tst2()  {
	  const name = document.getElementById('MHP').value;
	  
	//  document.getElementById("result2").innerText = name;
	  $(".modal-body #MHP1").val( name );
	}
function tst3()  {
	  const name = document.getElementById('MADDR').value;
	  
	//  document.getElementById("result3").innerText = name;
	  $(".modal-body #MADDR1").val( name );
	}
function tst4()  {
	  const name = document.getElementById('MADDRD').value;
	  
	 // document.getElementById("result4").innerText = name;
	  $(".modal-body #MADDRD1").val( name );
	}
function tst5()  {
	  const name = document.getElementById('MEMAIL').value;
	  
	//  document.getElementById("result5").innerText = name;
	  $(".modal-body #MEMAIL1").val( name );
	}
function tst6()  {
	  const name = document.getElementById('MLIC').value;
	  
	 // document.getElementById("result6").innerText = name;
	  $(".modal-body #MLIC1").val( name );
	}
function tst8()  {
	  const name = document.getElementById('MADDRP').value;
	  
	//  document.getElementById("result8").innerText = name;
	  $(".modal-body #MADDRP1").val( name );
	}
function test7() {

	  alert("아이디는 수정할수없습니다.");

	}

</script>

  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

	function test7() {

		  alert("아이디는 수정할수없습니다.");

		}


   
</script>
   <script>
     function sample6_execDaumPostcode() {
         new daum.Postcode({
             oncomplete: function(data) {
                 // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                 // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                 // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                 var addr = ''; // 주소 변수
                 var extraAddr = ''; // 참고항목 변수

                 //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                 if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                     addr = data.roadAddress;
                 } else { // 사용자가 지번 주소를 선택했을 경우(J)
                     addr = data.jibunAddress;
                 }

                 // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                 if(data.userSelectedType === 'R'){
                     // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                     // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                     if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                         extraAddr += data.bname;
                     }
                     // 건물명이 있고, 공동주택일 경우 추가한다.
                     if(data.buildingName !== '' && data.apartment === 'Y'){
                         extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                     }
                     // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                     if(extraAddr !== ''){
                         extraAddr = ' (' + extraAddr + ')';
                     }
                     // 조합된 참고항목을 해당 필드에 넣는다.
                   
                 
                 } 
                 // = document.getElementById('MADDR').value;
                 // 우편번호와 주소 정보를 해당 필드에 넣는다.
                 var name1=   document.getElementById('MADDRP').value = data.zonecode;
                 const name= document.getElementById("MADDR").value = addr;
               //  document.getElementById("result3").innerText = name;
               //  document.getElementById("result8").innerText = name1;
                 // 커서를 상세주소 필드로 이동한다.
                 document.getElementById("MADDRD").focus();
                 $(".modal-body #MADDRP").val( name1 );
                 $(".modal-body #MADDR").val( name );
              //   $(".modal-body #MADDRP1").val( name1 );
              //   $(".modal-body #MADDR1").val( name );

               
             }
         }).open();
     }
     </script>
     </div>
    
   
  
   <jsp:include page="/view/main/mycarFooter.jsp"></jsp:include>  
 
</body>
</html>
