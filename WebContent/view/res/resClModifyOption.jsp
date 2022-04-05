<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-2.1.3.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<style>
body { 
margin: 0;
font-family: pretendard;
font-size: 14px;
}
div.form-group {
width:100%;
margin:auto;

}
#legend {margin: auto; max-width: 1000px; border: 1px solid }
div.container {
margin: 3% -5%; 
}
</style>


<title>Mycar 렌터카</title>
<%
int rnum = Integer.parseInt(request.getParameter("rnum"));
String nowPage = request.getParameter("page");
%>
<script type="text/javascript">
	$(function(){
		$("#resClMOption").submit(function(){
	        var start = $('#rstart').val();
	        var end = $('#rend').val();

	        var startArray = start.split('-');
	        var endArray = end.split('-');   

	        var startDate = new Date(startArray[0], startArray[1], startArray[2]);
	        var endDate = new Date(endArray[0], endArray[1], endArray[2]);

 	        if(startDate.getTime() >= endDate.getTime()) {
	            alert("날짜를 확인해주십시오.");
	            return false;
	        }
	     });
	});
</script>
</head>
<body>
<jsp:include page="../main/mycarClHeader.jsp"></jsp:include>
<div id="legend"style="text-align: center;">
<div class="container">
<form class="form-horizontal" role="form" action="resClModifyPro.re?rnum=<%=rnum %>&page=<%=nowPage %>" method="post" id="resClMOption" name="resClMOption" onsubmit="return empty()">
<div class="form-group" style="text-align: center; margin: auto;">
<h2 title="예약변경하기">예약변경하기</h2>
</div><br/>
<script>
function empty() {
	if( $('input[type=radio][name=car]:checked').length == 0 ) {
		alert("차량 크기를 선택해주세요");
		return false;
	}else if ( $('input[type=radio][name=seat]:checked').length == 0){
		alert("승차인원을 선택해주세요");
		return false;
	}else if ( $('input[type=radio][name=rent]:checked').length == 0){
		alert("예약 타입을 선택해주세요");
		return false;
	}else if ( $('input[type=radio][name=gear]:checked').length == 0){
		alert("기어 종류를 선택해주세요");
		return false;
	}else if ( $('input[type=radio][name=fuel]:checked').length == 0){
		alert("연료 종류를 선택해주세요");
		return false;
	}
}

function setDisplay(){
    if($('input:radio[id=min]').is(':checked')){
    	$('#four').show();
    	$('#four2').show();
    	$('#six').hide();
    	$('#six2').hide();
    	$('#fif').hide();
    	$('#fif2').hide();
    } else if($('input:radio[id=sma]').is(':checked')){
    	$('#four').show();
    	$('#four2').show();
    	$('#six').hide();
    	$('#six2').hide();
    	$('#fif').hide();
    	$('#fif2').hide();
    } else if($('input:radio[id=mid]').is(':checked')){
    	$('#four').show();
    	$('#four2').show();
    	$('#six').hide();
    	$('#six2').hide();
    	$('#fif').hide();
    	$('#fif2').hide();
    } else if($('input:radio[id=big]').is(':checked')){
    	$('#four').show();
    	$('#four2').show();
    	$('#six').hide();
    	$('#six2').hide();
    	$('#fif').hide();
    	$('#fif2').hide();
    } else if($('input:radio[id=van]').is(':checked')){
    	$('#four').hide();
    	$('#four2').hide();
    	$('#six').hide();
    	$('#six2').hide();
    	$('#fif').show();
    	$('#fif2').show();
    } else if($('input:radio[id=suv]').is(':checked')){
    	$('#four').hide();
    	$('#four2').hide();
    	$('#six').show();
    	$('#six2').show();
    	$('#fif').hide();
    	$('#fif2').hide();
    }
}
</script>
<div class="form-group" style="text-align: center; margin: auto;">
<label class="col-sm-4 control-label" title="차량 크기">차량 크기 :</label>
<div class="col-sm-2" style="text-align: center;">
<label class="form-control" title="경차"><input type="radio" id="min" name="car" value="min" onchange="setDisplay()"> 경차</label>
<label class="form-control" title="소형차"><input type="radio" id="sma" name="car" value="sma" onchange="setDisplay()"> 소형차</label>
<label class="form-control" title="중형차"><input type="radio" id="mid" name="car" value="mid" onchange="setDisplay()"> 중형차</label>
</div>
<div class="col-sm-2" style="text-align: center;">
<label class="form-control" title="대형차"><input type="radio" id="big" name="car" value="big" onchange="setDisplay()"> 대형차</label>
<label class="form-control" title="승합차"><input type="radio" id="van" name="car" value="van" onchange="setDisplay()"> 승합차</label>
<label class="form-control" title="SUV"><input type="radio" id="suv" name="car" value="suv" onchange="setDisplay()"> SUV</label>
</div>
</div>
<br/>

<div class="form-group" style="text-align: center; margin: auto;">
<label class="col-sm-4 col-md-4 col-lg-4 control-label" title="승차인원">승차인원 :</label>
<div class="col-sm-4 col-md-4 col-lg-4" style="text-align: center;">
<label class="form-control" title="4인승" id="four2"><input type="radio" id="four" name="seat" value="4인승"> 4인승</label>
<label class="form-control" title="6인승" id="six2"><input type="radio" id="six" name="seat" value="6인승"> 6인승</label>
<label class="form-control" title="15인승" id="fif2"><input type="radio" id="fif" name="seat" value="15인승"> 15인승</label>
</div>
</div>
<br/>

<div class="form-group" style="text-align: center; margin: auto;">
<label class="col-sm-4 col-md-4 col-lg-4 control-label" title="예약 타입">예약 타입 :</label>
<div class="col-sm-4 col-md-4 col-lg-4" style="text-align: center;">
<label class="form-control" title="단기렌탈(30일 미만)"><input type="radio" id="short" name="rent" value="short">단기렌탈(30일 미만)</label>
<label class="form-control" title="장기렌탈(30일 이상)"><input type="radio" id="long" name="rent" value="long">장기렌탈(30일 이상)</label>
</div>
</div>
<br/>

<div class="form-group" style="text-align: center; margin: auto;">
<label class="col-sm-4 col-md-4 col-lg-4 control-label" title="기어">기어 :</label>
<div class="col-sm-2 col-md-4 col-lg-4" style="text-align: center;">
<label class="form-control" title="오토차량"><input type="radio" id="au" name="gear" value="au">오토차량</label>
<label class="form-control" title="수동차량"><input type="radio" id="su" name="gear" value="su">수동차량</label>
</div>
</div>
<br/>

<div class="form-group" style="text-align: center; margin: auto;">
<label class="col-sm-4 col-md-4 col-lg-4 control-label" title="연료">연료 :</label>
<div class="col-sm-4 col-md-4 col-lg-4" style="text-align: center;">
<label class="form-control" title="휘발유"><input type="radio" id="gas" name="fuel" value="gas">휘발유</label>
<label class="form-control" title="경유"><input type="radio" id="oil" name="fuel" value="oil">경유</label>
</div>
</div>
<br/>

<div class="form-group" style="text-align: center; margin: auto;">
	<label class="col-sm-4 col-lg-4 control-label" title="예약시작일 :">예약시작일 :</label>
	<div class="col-sm-4 col-lg-4" style="text-align: center;">
	<input class="form-control" type="date" id="rstart" name="rstart" required>
</div>
</div><br/>
<div class="form-group" style="text-align: center; margin: auto;">
	<label class="col-sm-4 col-lg-4 control-label" title="예약종료일 :">예약종료일 :</label>
	<div class="col-sm-4 col-lg-4" style="text-align: center;">
	<input class="form-control" type="date" id="rend" name="rend" required>
</div>
</div>
<script>
document.getElementById("rstart").valueAsDate = new Date();
var today = new Date();
var nextday = new Date();
var dd = today.getDate();
var dd2 = today.getDate() + 1;
var mm = today.getMonth() + 1;
var yyyy = today.getFullYear();

if (dd < 10) {
   dd = '0' + dd;
}

if (mm < 10) {
   mm = '0' + mm;
} 
    
today = yyyy + '-' + mm + '-' + dd;
nextday = yyyy + '-' + mm + '-' + dd2;
document.getElementById("rstart").setAttribute("min", today);
document.getElementById("rend").setAttribute("min", nextday);
</script>
<input type="hidden" value="<%=nowPage %>"><br/>
<div class="form-group" style="text-align: center; margin: auto;">
<button type="button" class="btn btn-default" id="back" name="back" style="background-color: #1e1a1b; color: #fff;" title="뒤로가기" onClick="location.href='/mycar/resClDetail.re?rnum=<%=rnum%>&page=<%=nowPage%>'">뒤로가기</button>&nbsp;&nbsp;&nbsp;
<button type="submit" class="btn btn-default" style="background-color: #1e1a1b; color: #fff;" title="다음">다음</button>
</div><br/>
</form>
</div>
</div>
<jsp:include page="/view/main/mycarFooter.jsp"></jsp:include>
</body>
</html>