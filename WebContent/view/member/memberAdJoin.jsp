<%@page import="member.bean.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="member.dao.MemberDAO" %>
<%@ page import="member.service.MemberClIdCheckService" %>
<%	
MemberClIdCheckService memberClIdCheckService = new MemberClIdCheckService();
ArrayList<String> memberIdCheckList = memberClIdCheckService.getMemberList();
System.out.println("memberidCheckList의 값 = " + memberIdCheckList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css" class="svelte-p5qu1m" data-svelte="svelte-1yifjfe">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-2.1.3.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<style>
.btn-default{
    color: #fff!important;
    background-color: #1e1a1b!important;
    border-color: #1e1a1b!important;
}
a {
    color: #1e1a1b;
    text-decoration: none;
}
.h1, .h2, .h3, .h4, .h5, .h6, h1, h2, h3, h4, h5, h6 {
    font-family: pretendard;
    font-weight: 500;
    line-height: 1.1;
    color: inherit;
}
body {
    font-family: pretendard;
    font-size: 14px;
    
    color: #333;
    background-color: #fff;
}
.modalButton {
	display: none;
}
</style>
<script>
function test()  {
	const name = document.getElementById('MID').value;
	$("#MID1").val( name );
	 // const name = document.getElementById('MID').value;	  
	 // document.getElementById("result").innerText = name;
	}
function test1()  {
	const name = document.getElementById('MNAME').value;
	$("#MNAME1").val( name );
}
function test2()  {
	const name = document.getElementById('MBIRTH').value;
	$("#MBIRTH1").val( name );
}
function test3()  {
	const name = document.getElementById('MHP').value;
	$("#MHP1").val( name );
}function test4()  {
	const name = document.getElementById('MEMAIL').value;
	$("#MEMAIL1").val( name );
}function test5()  {
	const name = document.getElementById('MLIC').value;
	$("#MLIC1").val( name );
}
function test6()  {
	const name = document.getElementById('MADDR').value;
	$("#MADDR1").val( name );
}
function test7()  {
	const name = document.getElementById('MADDRD').value;
	$("#MADDRD1").val( name );
}
</script>
<title>Mycar 렌터카</title>
<body style="overflow-x: hidden"style="overflow-y: hidden"><jsp:include page="/view/main/mycarAdHeader.jsp"></jsp:include>
            <div id="legend"style="text-align: center;">
          <legend><h2><a href="memberAdListAction.me">회원 추가</a></h2></legend>
   <form class="form-horizontal col-sm-8 col-sm-offset-2" role="form"action="./memberAdJoinAction.me" method="POST"name = "joinfyform">
                
               
                
                
               
                 <div class="form-group col-sm-12"style="text-align: center;">
                 <label for="MID"class="col-sm-4 control-label" >아이디 :</label>
	             <div class="input-group col-sm-5" style="text-align: center;" >    
	             <input type="text" id="MID" name="MID" class="form-control" onchange="test()" pattern="^[a-zA-Z0-9]+$"minlength = "3" maxlength = "20"placeholder="아이디는 영문만 가능합니다."autofocus required>
	             <span class="input-group-btn">
		         <button type="button" class="form-control" name = "midCheckButton" id="midCheckButton"  onclick="midCheckAction()" title="중복확인">중복확인</button>		
						
	             </span>
	             </div><!-- /input-group -->
	             </div>
	  
                <div class="form-group col-sm-12"style="text-align: center;">
                    <label for="MID"class="col-sm-4 control-label" >패스워드 :</label>
                    <div class="col-sm-4" style="text-align: center;">
                 <input type="password" id="MPW" name="MPW" class="form-control" pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$" placeholder="숫자, 영문, 특수문자 각 1개 이상 포함하세요"autofocus required>
                    </div>
                </div>
                <div class="form-group col-sm-12" style="text-align: center;">
                    <label for="MID"class="col-sm-4 control-label" >패스워드 확인 :</label>
                    <div class="col-sm-4" style="text-align: center;">
                 <input type="password" id="MPW2" name="MPW2" class="form-control"  pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$" placeholder="숫자, 영문, 특수문자 각 1개 이상 포함하세요" onchange="testo()"  required>
                
                    </div>
                </div>         
                <div class="form-group col-sm-12">
                    <label for="lastName" class="col-sm-4 control-label">이름 :</label>
                    <div class="col-sm-4">
                        <input type="text" id="MNAME" name="MNAME" class="form-control"onchange="test1()" minlength = "2" maxlength = "10" required   pattern="^[가-힣]+$"placeholder="한글만 입력가능합니다.">
                    </div>
                </div>
                 <div class="form-group col-sm-12">
                    <label for="birthDate" class="col-sm-4 control-label">생년월일 :</label>
                    <div class="col-sm-4">
                        <input type="date" id="MBIRTH" name="MBIRTH" minlength = "8" onchange="test2()" maxlength = "20" class="form-control"required >
                    </div>
                    </div>
                  <div class="form-group col-sm-12">
                    <label for="birthDate" class="col-sm-4 control-label">휴대폰 번호 :</label>
                    <div class="col-sm-4">
                        <input type="tel" id="MHP" name="MHP" minlength = "10" maxlength = "20"onchange="test3()" placeholder="-을 제외한 숫자를 입력해주세요"class="form-control"pattern="^[0-9]+$">
                    </div>
                </div>
                 <div class="form-group col-sm-12">
                    <label for="email" class="col-sm-4 control-label">우편번호 :</label>
                    <div class="col-sm-4">
                        <input type="text" id="MADDRP" name="MADDRP"  class="form-control"onclick="sample6_execDaumPostcode()"minlength="6" maxlength = "25" placeholder="클릭시 우편번호 화면이 나타납니다."required> 
                    </div>
                    </div>
                <div class="form-group col-sm-12">
                    <label for="email" class="col-sm-4 control-label">주소 :</label>
                    <div class="col-sm-4">
                        <input type="text" id="MADDR" name="MADDR"  class="form-control"minlength="6" maxlength = "25" placeholder="클릭시 주소화면이 나타납니다." required> 
                    </div>
                    </div>
                  <div class="form-group col-sm-12">
                    <label for="email" class="col-sm-4 control-label">상세주소 :</label>
                    <div class="col-sm-2">
                        <input type="text" id="MADDRD" name="MADDRD" onchange="test7()" class="form-control" minlength="3" maxlength = "25" required placeholder="상세주소를 기입해주세요."> 
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label for="password" class="col-sm-4 control-label">이메일  :</label>
                    <div class="col-sm-4">
                        <input type="email" id="MEMAIL" name="MEMAIL"class="form-control"onchange="test4()" minlength = "10" maxlength = "30" required placeholder="이메일 양식에 따라 기입해주세요.">
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label for="password" class="col-sm-4 control-label">라이센스 :</label>
                    <div class="col-sm-4">
                        <input type="text" id="MLIC" name="MLIC" class="form-control" minlength = "5"onchange="test5()"  required pattern="^(?=.*\d)(?=.*[-])[\d$-]{8,16}$"placeholder="-을 포함한 숫자만 입력가능합니다.">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-4 col-sm-offset-4">
                        <span class="help-block">전부 기입</span>
                    </div>
                </div>
                <button type="button"class="btn btn-default"onclick="location.href='memberAdListAction.me'" alt="뒤로가기"title="뒤로가기" >뒤로가기</button>    
               <button type="button"class="btn btn-default"data-toggle="modal" data-target="#join"alt="추가하기"title="추가하기" >추가하기</button> 
           
           
             <!-- /form -->
        </div> <!-- ./container -->
          
              <!-- 모달 테스트 -->
           <div class="modal fade" id="join" role="dialog">
    <div class="modal-dialog modal-dialog-centered">
     
      <!-- Modal content-->
      <div class="modal-content  ">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"style="text-align: center;">정말 추가하시겠습니까?</h4>
        
        <div class="modal-body ">
           <div class="form-group col-sm-12">
                    <label for="password" class="col-sm-4 control-label">추가할 아이디 :</label>
                    <div class="col-sm-6">
                        <input type="text" id="MID1" name="MID1" class="form-control" style="text-align: center;"readonly>
                    </div>
                </div>
          <div class="form-group col-sm-12">
                    <label for="password" class="col-sm-4 control-label">추가할 이름 :</label>
                    <div class="col-sm-6">
                        <input type="text" id="MNAME1" name="MNAME1" class="form-control" style="text-align: center;"readonly>
                    </div>
                </div>
          <div class="form-group col-sm-12">
                    <label for="password" class="col-sm-4 control-label">추가할 생년월일 :</label>
                    <div class="col-sm-6">
                        <input type="text" id="MBIRTH1" name="MBIRTH1" class="form-control" style="text-align: center;"readonly>
                    </div>
                </div>
          <div class="form-group col-sm-12">
                    <label for="password" class="col-sm-4 control-label">추가할 휴대폰 번호 :</label>
                    <div class="col-sm-6">
                        <input type="text" id="MHP1" name="MHP1" class="form-control" style="text-align: center;"readonly>
                    </div>
                </div>
          <div class="form-group col-sm-12">
                    <label for="password" class="col-sm-4 control-label">추가할 우편번호 :</label>
                    <div class="col-sm-6">
                        <input type="text" id="MADDRP1" name="MADDRP1" class="form-control" style="text-align: center;"readonly>
                    </div>
                </div>
          <div class="form-group col-sm-12">
                    <label for="password" class="col-sm-4 control-label">추가할 주소 :</label>
                    <div class="col-sm-6">
                        <input type="text" id="MADDR1" name="MADDR1" class="form-control" style="text-align: center;"readonly>
                    </div>
                </div>
          <div class="form-group col-sm-12">
                    <label for="password" class="col-sm-4 control-label">추가할 상세주소 :</label>
                    <div class="col-sm-6">
                        <input type="text" id="MADDRD1" name="MADDRD1" class="form-control" style="text-align: center;"readonly>
                    </div>
                </div>
          <div class="form-group col-sm-12">
                    <label for="password" class="col-sm-4 control-label">추가할 이메일 :</label>
                    <div class="col-sm-6">
                        <input type="text" id="MEMAIL1" name="MEMAIL1" class="form-control" style="text-align: center;"readonly>
                    </div>
                </div>
          <div class="form-group col-sm-12">
                    <label for="password" class="col-sm-4 control-label">추가할 라이센스 :</label>
                    <div class="col-sm-6">
                        <input type="text" id="MLIC1" name="MLIC1" class="form-control" style="text-align: center;"readonly>
                    </div>
                </div>      
        </div>
        </div>
        <div class="modal-footer"style="text-align: center;">
        
           <button type="submit" class="btn btn-default" alt="추가"title="추가"><span class="glyphicon glyphicon-ok"></span> &nbsp네</button>
          <button type="button" class="btn btn-default btn-close" data-dismiss="modal"alt="아니요"title="아니요"onclick="modal"><span class="glyphicon glyphicon-remove"></span>아니요</button>
        </div>
      </div>     
    </div>
        </div> <!-- ./container -->
        
       
   <!-- /form -->  </form> 
          <!-- 모달 테스트 -->
          
          <div class="container">
	  	<!-- Trigger the modal with a button -->
 	 	<button class="modalButton" id="errorModalButton" data-toggle="modal" data-target="#errorModal">버튼</button>
		<!-- Modal -->
		<div class="modal fade" id="errorModal" role="dialog">
	   	 	<div class="modal-dialog">
		    	<!-- Modal content-->
   		 		<div class="modal-content">
      		  		<div class="modal-header">
       		   		<button type="button" class="close" data-dismiss="modal">&times;</button>
          			<h4 class="modal-title" id="errorName">오류</h4>
        			</div>
        			<div class="modal-body">
        	  			<p id="errorMessage">오류 메세지</p>
       		 		</div>
      		 	 	<div class="modal-footer">
        	  			<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
       	 			</div>
    			</div>
			</div>
		</div>
	</div>
	
	<div class="container">
	  	<!-- Trigger the modal with a button -->
 	 	<button class="modalButton" id="submitModalButton" data-toggle="modal" data-target="#submitModal">버튼</button>
		<!-- Modal -->
		<div class="modal fade" id="submitModal" role="dialog">
	   	 	<div class="modal-dialog">
		    	<!-- Modal content-->
   		 		<div class="modal-content">
      		  		<div class="modal-header">
       		   		<button type="button" class="close" data-dismiss="modal">&times;</button>
          			<h4 class="modal-title" id="submitName">성공</h4>
        			</div>
        			<div class="modal-body">
        	  			<p id="submitMessage">성공 메세지</p>
       		 		</div>
      		 	 	<div class="modal-footer">
        	  			<button type="button" class="btn btn-default" data-dismiss="modal" 
        	  					onclick="document.getElementById('joinForm').submit();">닫기</button>
       	 			</div>
    			</div>
			</div>
		</div>
	</div>	
          
          
    <jsp:include page="/view/main/mycarFooter.jsp"></jsp:include>      
          
          
          
          
          
               <script type="text/javascript">
           	
               
    function testo() {
      var p1 = document.getElementById('MPW').value;
      var p2 = document.getElementById('MPW2').value;
      
     
          if( p1 != p2 ) {
            alert("패스워드가 일치하지않습니다.");
            document.getElementById("MPW2").focus();
            return ;
          } else{
          
          }
    }
   
  </script>
    <!--다음주소 따오기-->
   <script>
   window.onload = function(){
	   
	    document.getElementById("MADDR").addEventListener("click", function(){ //주소입력칸을 클릭하면
	        //카카오 지도 발생
	        new daum.Postcode({
	            oncomplete: function(data) { //선택시 입력값 세팅
	            	var name2 = document.getElementById("MADDR").value = data.address;
	            // 주소 넣기
	                $(" #MADDR1").val( name2 );
	            }
	        }).open();
	    });
	}
	function midCheckAction() {
		var mid = document.getElementById('MID').value;
		var memberList = "<%=memberIdCheckList%>";
		var memberListArray = memberList.split(', ');
		
		
		if(mid==""){
			$("#errorName").text("회원가입");
			$("#errorMessage").text("아이디를 입력해주세요");
			document.getElementById('errorModalButton').click();
			return false;
			}
		if(mid==null){
			$("#errorName").text("회원가입");
			$("#errorMessage").text("아이디를 입력해주세요");
			document.getElementById('errorModalButton').click();
			return false;
			}
		else{
			
			if(memberListArray.includes(mid)){
				$("#errorName").text("아이디 중복체크");
				$("#errorMessage").text("이미 존재하는 아이디입니다.");
				document.getElementById('errorModalButton').click();
				return false;										
			} else {
				$("#errorName").text("아이디 중복체크");
				$("#errorMessage").text("사용 가능한 아이디입니다.");
				document.getElementById('errorModalButton').click();
				document.getElementById('midCheck').value = "Y";
			}
			}
		}
   function midChange() {
     	document.getElementById('midCheck').value = "N";
     }
      
</script>
  
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                 var name1=   document.getElementById('MADDRP').value = data.zonecode;
                const name= document.getElementById("MADDR").value = addr;
                document.getElementById('MADDRP').value = data.zonecode;
                document.getElementById("MADDR").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("MADDRD").focus();
                $(" #MADDRP1").val( name1 );
                $(" #MADDR1").val( name );
            }
        }).open();
    }
</script>

               
        </body>