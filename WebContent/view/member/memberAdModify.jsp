<%@page import="member.bean.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css" class="svelte-p5qu1m" data-svelte="svelte-1yifjfe">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-2.1.3.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<style>

.btn-default {
    color: #fff!important;
    background-color: #1e1a1b!important;
    border-color: #1e1a1b!important;
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
</style>
<title>Mycar 렌터카</title>
<body style="overflow-x: hidden"style="overflow-y: hidden"><jsp:include page="/view/main/mycarAdHeader.jsp"></jsp:include>
<script>
    function OK()
    {
        alert(" 수정을 완료하였습니다. ");
    }
    function no()
    {
        alert("아니오피우지않습니다.");
    }
   </script>
  
<div class="container"style="text-align: center;">
  <div class="col-sm-8 col-sm-offset-2">
  <legend><h2><a href="memberAdListAction.me">수정 페이지</a></h2></legend>
     <form action="memberAdProViewAction.me" method="post">
	    <div class="input-group" >
	      <input type="text" class="form-control"name="id" id="id"class="form-control" placeholder="아이디 혹은 이름을 입력하세요.">
	      <span class="input-group-btn">
		<button class="btn btn-default" type="submit"title="검색">검색</button>
	      </span>
	    </div><!-- /input-group -->
	  </div><!-- /.col-sm-6 -->
	<!-- /.row -->  
     </form>
   <form class="form-horizontal" role="form"action="memberAdModifyProAction.me" method="POST"name = "joinform">
                 <div id="legend"style="text-align: center;">
                 <div class="form-group col-sm-12 " style="text-align: center;">&nbsp;</div>
      
                
                 <div class="form-group col-sm-12" style="text-align: center;">
                    <label for="MID"class="col-sm-4 control-label" >아이디 :</label>
                    <div class="col-sm-4" style="text-align: center;">
                 <input type="text" id="MID" name="MID" class="form-control" value="${member.mid}" onclick="test7()" minlength = "3" maxlength = "10"autofocus required readonly>
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label for="lastName" class="col-sm-4 control-label">이름 :</label>
                    <div class="col-sm-4">
                        <input type="text" id="MNAME" name="MNAME" class="form-control"  value="${member.mname}"  minlength = "2" maxlength = "10"onchange="test()"autofocus required pattern="^[가-힣]+$"placeholder="한글만 입력가능합니다.">
                    </div>
                </div>
                 <div class="form-group col-sm-12">
                    <label for="birthDate" class="col-sm-4 control-label">생년월일 :</label>
                    <div class="col-sm-4">
                        <input type="date" id="MBIRTH" name="MBIRTH" value="${member.mbirth}" class="form-control"onchange="test1()"minlength = "6" maxlength = "15">
                    </div>
                </div>
                 <div class="form-group col-sm-12">
                    <label for="lastName" class="col-sm-4 control-label">휴대폰 번호 :</label>
                    <div class="col-sm-4">
                        <input type="text" id="MHP" name="MHP" class="form-control"  value="${member.mhp}" onchange="test2()"autofocus required minlength = "8" maxlength = "15"pattern="^[0-9]+$" placeholder="-을 제외한 숫자를 입력해주세요">
                    </div>
                </div>
                 <div class="form-group col-sm-12">
                    <label for="email" class="col-sm-4 control-label">우편번호 :</label>
                    <div class="col-sm-4">
                        <input type="text" id="MADDRP" name="MADDRP"  class="form-control" value="${member.maddrp}" onclick="sample6_execDaumPostcode()"onchange="test8()"required placeholder="클릭시 우편번호 화면이 나타납니다.">
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label for="email" class="col-sm-4 control-label">주소 :</label>
                    <div class="col-sm-4">
                        <input type="text" id="MADDR" name="MADDR"  class="form-control" value="${member.maddr}" onchange="test3()"required placeholder="클릭시 주소화면이 나타납니다.">
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label for="email" class="col-sm-4 control-label">상세주소 :</label>
                    <div class="col-sm-4">
                        <input type="text" id="MADDRD" name="MADDRD"  class="form-control" value="${member.maddrd}"onchange="test4()" minlength = "3" maxlength = "15" required required placeholder="상세주소를 기입해주세요.">
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label for="password" class="col-sm-4 control-label">이메일  :</label>
                    <div class="col-sm-4">
                        <input type="email" id="MEMAIL" name="MEMAIL"class="form-control" value="${member.memail}"onchange="test5()"required minlength = "10" maxlength = "30" placeholder="이메일 양식에 따라 기입해주세요.">
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label for="password" class="col-sm-4 control-label">라이센스 :</label>
                    <div class="col-sm-4">
                        <input type="text" id="MLIC" name="MLIC" class="form-control" value="${member.mlic}"onchange="test6()"required pattern="^(?=.*\d)(?=.*[-])[\d$-]{8,16}$" placeholder="-을 포함한 숫자만 입력가능합니다.">
                    </div>
                </div>
                
               
                           
               
                <div class="form-group">
                    <div class="col-sm-4 col-sm-offset-4">
                        <span class="help-block">*Required fields</span>
                    </div>
                </div>
                <button type="button"onclick="location.href='memberAdListAction.me'"class="btn btn-default"title="목록으로">목록으로</button> 
                 <a href="memberAdViewAction.me?id=${member.mid}" class="btn btn-default"title="상세정보"> 상세정보</a> 
              <button type="button"class="btn btn-default"data-toggle="modal" data-target="#Mody"title="수정하기">수정하기</button> 
         </div></div></div>     
<jsp:include page="/view/main/mycarFooter.jsp"></jsp:include>
         <!-- 모달 테스트 -->
       
    <div class="modal fade" id="Mody" role="dialog">
    <div class="modal-dialog modal-dialog-centered">
     
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">정말 수정하시겠습니까?</h4>
        </div>
        <div class="modal-body col-sm-6" style="text-align: center;">
               <label >수정전 아이디 :</label>
           
           <input type="text" id="MID" name="MID" class="form-control" value="${member.mid}"  onclick="test7()" size="5" minlength = "3" maxlength = "10"autofocus required readonly style="text-align: center;">
           
           <label >수정전 이름 :</label>
            
           <input type="text" id="MNAME2" name="MNAME2" class="form-control"  value="${member.mname}"  minlength = "2" maxlength = "10" readonly autofocus required pattern="^[가-힣]+$"placeholder="한글만 입력가능합니다." style="text-align: center;">
            
           <label >수정전 생년월일 :</label>
                 
           <input type="date" id="MBIRTH2" name="MBIRTH2"  class="form-control"value="${member.mbirth}"minlength = "6" maxlength = "15" readonly style="text-align: center;">
             
           <label >수정전 휴대폰 번호 :</label>
                    
           <input type="text" id="MHP2" name="MHP2" class="form-control" value="${member.mhp}"  onchange="test2()"autofocus required readonly minlength = "8" maxlength = "15"pattern="^[0-9]+$" placeholder="-을 제외한 숫자를 입력해주세요" style="text-align: center;">

           <label >수정전 우편번호 :</label>
                    
           <input type="text" id="MADDRP2" name="MADDRP2"  class="form-control" value="${member.maddrp}" onclick="sample6_execDaumPostcode()"onchange="test8()"required  readonly placeholder="클릭시 우편번호 화면이 나타납니다."style="text-align: center;">

            <label >수정전 주소 :</label>
                    
            <input type="text" id="MADDR2" name="MADDR2"  class="form-control" value="${member.maddr}" readonly  onchange="test3()"required placeholder="클릭시 주소화면이 나타납니다."style="text-align: center;">

            <label >수정전 상세주소 :</label>
                    
            <input type="text" id="MADDRD2" name="MADDRD2"  class="form-control" value="${member.maddrd}"onchange="test4()" minlength = "3" maxlength = "15" required readonly placeholder="상세주소를 기입해주세요."style="text-align: center;">

            <label >수정전 이메일  :</label>
                   
            <input type="email" id="MEMAIL2" name="MEMAIL2"class="form-control" value="${member.memail}"onchange="test5()"required minlength = "10" maxlength = "30" readonly placeholder="이메일 양식에 따라 기입해주세요."style="text-align: center;">

            <label >수정전 라이센스 :</label>
                    
            <input type="text" id="MLIC2" name="MLIC2" class="form-control" value="${member.mlic}"readonly onchange="test6()"required minlength = "3" maxlength = "10"pattern="^[0-9]+$"   placeholder="숫자만 입력가능합니다."style="text-align: center;">

       
      </div>
       <div class="modal-body col-sm-6" style="text-align: center;">
               <label >수정후 아이디 :</label>
           
           <input type="text" id="MID" name="MID" class="form-control" value="${member.mid}"  onclick="test7()" size="5" minlength = "3" maxlength = "10"autofocus required readonly style="text-align: center;">
           
           <label >수정후 이름 :</label>
            
           <input type="text" id="MNAME1" name="MNAME1" class="form-control"  value="${member.mname}"  minlength = "2" maxlength = "10" readonly autofocus required pattern="^[가-힣]+$"placeholder="한글만 입력가능합니다." style="text-align: center;">
            
           <label >수정후 생년월일 :</label>
                 
           <input type="date" id="MBIRTH1" name="MBIRTH1"  class="form-control"value="${member.mbirth}"minlength = "6" maxlength = "15" readonly style="text-align: center;">
             
           <label >수정후 휴대폰 번호 :</label>
                    
           <input type="text" id="MHP1" name="MHP1" class="form-control" value="${member.mhp}"  onchange="test2()"autofocus required readonly minlength = "8" maxlength = "15"pattern="^[0-9]+$" placeholder="-을 제외한 숫자를 입력해주세요" style="text-align: center;">

           <label >수정후 우편번호 :</label>
                    
           <input type="text" id="MADDRP1" name="MADDRP1"  class="form-control" value="${member.maddrp}" onclick="sample6_execDaumPostcode()"onchange="test8()"required  readonly placeholder="클릭시 우편번호 화면이 나타납니다."style="text-align: center;">

            <label >수정후 주소 :</label>
                    
            <input type="text" id="MADDR1" name="MADDR1"  class="form-control" value="${member.maddr}" readonly  onchange="test3()"required placeholder="클릭시 주소화면이 나타납니다."style="text-align: center;">

            <label >수정후 상세주소 :</label>
                    
            <input type="text" id="MADDRD1" name="MADDRD1"  class="form-control" value="${member.maddrd}"onchange="test4()" minlength = "3" maxlength = "15" required readonly placeholder="상세주소를 기입해주세요."style="text-align: center;">

            <label >수정후 이메일  :</label>
                   
            <input type="email" id="MEMAIL1" name="MEMAIL1"class="form-control" value="${member.memail}"onchange="test5()"required minlength = "10" maxlength = "30" readonly placeholder="이메일 양식에 따라 기입해주세요."style="text-align: center;">

            <label >수정후 라이센스 :</label>
                    
            <input type="text" id="MLIC1" name="MLIC1" class="form-control" value="${member.mlic}"readonly onchange="test6()"required minlength = "3" maxlength = "10"pattern="^[0-9]+$"   placeholder="숫자만 입력가능합니다."style="text-align: center;">

       
      </div>
         <div class="modal-footer" style="text-align: center;" >  
         
           <!--   <button type="submit"class="btn btn-primary"><span class="glyphicon glyphicon-ok"></span> &nbsp네</button> --> 
          <button type="submit" class="btn btn-default">&nbsp&nbsp네&nbsp&nbsp</button>
          <button type="button" class="btn btn-default btn-close"data-dismiss="modal"alt="아니요"title="아니요">아니요</button>
         </div></div>
       <!-- ./container --> </form>
   </form>
          <!-- 모달 테스트 -->
  <script>
function test()  {
  const name = document.getElementById('MNAME').value;
  
 // document.getElementById("result").innerText = name;
  $(".modal-body #MNAME1").val( name );
}
function test1()  {
	  const name = document.getElementById('MBIRTH').value;
	  
	 // document.getElementById("result1").innerText = name;
	  $(".modal-body #MBIRTH1").val( name );
	}
function test2()  {
	  const name = document.getElementById('MHP').value;
	  
	//  document.getElementById("result2").innerText = name;
	  $(".modal-body #MHP1").val( name );
	}
function test3()  {
	  const name = document.getElementById('MADDR').value;
	  
	//  document.getElementById("result3").innerText = name;
	  $(".modal-body #MADDR1").val( name );
	}
function test4()  {
	  const name = document.getElementById('MADDRD').value;
	  
	 // document.getElementById("result4").innerText = name;
	  $(".modal-body #MADDRD1").val( name );
	}
function test5()  {
	  const name = document.getElementById('MEMAIL').value;
	  
	//  document.getElementById("result5").innerText = name;
	  $(".modal-body #MEMAIL1").val( name );
	}
function test6()  {
	  const name = document.getElementById('MLIC').value;
	  
	 // document.getElementById("result6").innerText = name;
	  $(".modal-body #MLIC1").val( name );
	}
function test8()  {
	  const name = document.getElementById('MADDRP').value;
	  
	//  document.getElementById("result8").innerText = name;
	  $(".modal-body #MADDRP1").val( name );
	}
function test7() {

	  alert("아이디는 수정할수없습니다.");

	}

</script>
<script>
//$('input[name=result9]').attr('value',"'<button></button>'");
</script>


            <!-- /form -->
         <!-- ./container -->
        <!--다음주소 따오기-->
   <script>
   window.onload = function(){
	    document.getElementById("MADDR").addEventListener("click", function(){ //주소입력칸을 클릭하면
	        //카카오 지도 발생
	        new daum.Postcode({
	            oncomplete: function(data) { //선택시 입력값 세팅
	            	var name2 =document.getElementById("MADDR").value = data.address; // 주소 넣기
	               
	          	  
	            	 $(" #MADDR1").val( name2 );
	            }
	        }).open();
	    });
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
                // = document.getElementById('MADDR').value;
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                var name1=   document.getElementById('MADDRP').value = data.zonecode;
                const name= document.getElementById("MADDR").value = addr;
               // document.getElementById("result3").innerText = name;
               // document.getElementById("result8").innerText = name1;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("MADDRD").focus();
                $(".modal-body #MADDRP1").val( name1 );
                $(".modal-body #MADDR1").val( name );
            }
        }).open();
    }
</script>
 
        </body>