<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="car.bean.CarBean"%>
<%
	CarBean car = (CarBean)request.getAttribute("car");
    String nowPage = (String)request.getAttribute("page");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>차량 상세페이지</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-2.1.3.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

  
  <style>
.btn-default {
    color: #f5f5f5 !important; 
    background-color: #1e1a1b !important; 
    border-color: #1e1a1b !important;
}
  
  select {
    width: 100%;
    padding: 5px;
    border:1px solid #999;
    font-family:"굴림체";
    border-radius:3px;
    text-align:center;
    background: Gainsboro;
    
}
  
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }

    .carousel-inner img {
      width: 100%; /* Set width to 100% */
      min-height: 200px;
    }

    /* Hide the carousel text when the screen is less than 600 pixels wide */
    @media (max-width: 600px) {
      .carousel-caption {
        display: none; 
      }
    }
    #imgstyle{filter: drop-shadow(5px 5px 5px #000)}
  </style>
  <script>

window.onload = function test(){
	var ctype = "<c:out value = "${car.cType}"/>";
	var cSize = "<c:out value = "${car.cSize}"/>";
	var cGear = "<c:out value = "${car.cGear}"/>";
	var cFuel = "<c:out value = "${car.cFuel}"/>";
	var cPrice = "<c:out value = "${car.cPrice}"/>";
	
	if(ctype == "short") {
	document.getElementById("cType").value = "단기렌탈";
	} else if (ctype == "long"){
	document.getElementById("cType").value = "장기렌탈";
		}

	if(cSize == "min") {
    document.getElementById("cSize").value = "경차";
	} else if (cSize =="sma"){
    document.getElementById("cSize").value = "소형차";
	} else if (cSize =="mid"){
	document.getElementById("cSize").value = "중형차";
	} else if (cSize =="big"){
	document.getElementById("cSize").value = "대형차";
	} else if (cSize =="van"){
	document.getElementById("cSize").value = "승합차";
	} else if (cSize =="suv"){
	document.getElementById("cSize").value = "SUV";
	}
	if(cGear == "au") {
	document.getElementById("cGear").value = "오토차량";
	} else if(cGear =="su"){
	document.getElementById("cGear").value = "수동차량 ";
		}
	if(cFuel =="gas") {
	document.getElementById("cFuel").value = "휘발유";
	} else if(cFuel == "oil"){
    document.getElementById("cFuel").value = "경유";
	}
    
	var sangpumPrice = cPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원";
	document.getElementById("cPrice").value = sangpumPrice;
	
	}
	
	function logincheck() { 
	var id = '<%= (String)session.getAttribute("id")%>'; 
		  
	 	  if(id == "null"){
	 		  $('#loginmodal').modal({backdrop: 'static', keyboard: false});
	 	  }else if(id != "null"){
	 		  
	 	  }
	};
</script>
<script type="text/javascript">
	$(function(){
		$("#carClView").submit(function(){
	        var start = $('#rstart').val();
	        var end = $('#rend').val();

	        var startArray = start.split('-');
	        var endArray = end.split('-');   

	        var startDate = new Date(startArray[0], startArray[1], startArray[2]);
	        var endDate = new Date(endArray[0], endArray[1], endArray[2]);

 	        if(startDate.getTime() > endDate.getTime()) {
	            alert("날짜를 확인해주십시오.");
	            return false;
	        }
	     });
	});
</script>
  
</head>

<body>
<jsp:include page="/view/main/mycarClHeader.jsp"></jsp:include>

<div class="container text-center" style="margin-top:2%;">    
  <h3>상품 상세 페이지</h3>
  <br>
  <div class="row">
    <div class="col-sm-6">
    &nbsp;<br/>&nbsp;<br/>&nbsp;<br/>&nbsp;<br/>&nbsp;<br/>
      <div class="form-group">
                    <div>
                    <img>
                        <img src="image/<%=car.getcFile()%>" width="105%" alt =" 상품정보" title="차량 아이콘" id="imgstyle">
                     </div>
                </div>
    </div>
    <div class="col-sm-6">
      <div class="well"  style="background-color: #FFFFFF;">
      <form class="form-horizontal" role="form"  action="/mycar/resClWriteForm.re?ctype=${car.cType}&csize=${car.cSize}&cCode=${car.cCode}&page=<%=nowPage %>" method="POST" id="carClView">
                 <div id="legend"style="text-align: center;">
                
                <div class="form-group" style="text-align: center;">
                    <label for="cCode"class="col-sm-4 control-label" >상품 번호 :</label>
                    <div class="col-sm-6" style="text-align: center;">
                 <input type="text" id="cCode" name="cCode" class="form-control" value="${car.cCode}"  readonly>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="cType" class="col-sm-4 control-label">장기/단기 :</label>
                    <div class="col-sm-6">
                        <input type="text" id="cType" name="cType" class="form-control"  value="${car.cType}"  readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label for="cSize" class="col-sm-4 control-label">차량 크기 :</label>
                    <div class="col-sm-6">
                        <input type="text" id="cSize" name="cSize" class="form-control"  value="${car.cSize}" readonly>
                    </div>
                </div>
                 <div class="form-group">
                    <label for="cName" class="col-sm-4 control-label">차 종 :</label>
                    <div class="col-sm-6">
                        <input type="text" id="cName" name="cName"  class="form-control" value="${car.cName}" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label for="cPrice" class="col-sm-4 control-label">가격 :</label>
                    <div class="col-sm-6">
                        <input type="text" id="cPrice" name="cPrice"  class="form-control" value="${car.cPrice}원"  readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label for="cGear" class="col-sm-4 control-label">기어 :</label>
                    <div class="col-sm-6">
                        <input type="text" id="cGear" name="cGear"  class="form-control" value="${car.cGear}" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label for="cFuel" class="col-sm-4 control-label">연료 :</label>
                    <div class="col-sm-6">
                        <input type="text" id="cFuel" name="cFuel"  class="form-control" value="${car.cFuel}"  readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label for="cSeat" class="col-sm-4 control-label">승차인원  :</label>
                    <div class="col-sm-6">
                        <input type="text" id="cSeat" name="cSeat"class="form-control" value="${car.cSeat}" readonly>
                    </div>
                </div>
                <div class="form-group" style="text-align: center; margin: auto;">
					<label class="col-sm-4 control-label" title="예약시작일 :">예약시작일 :</label>
					<div class="col-sm-6" style="text-align: center;">
						<input class="form-control" type="date" id="rstart" name="rstart" required>
					</div>
				</div><br/>
				<div class="form-group" style="text-align: center; margin: auto;">
					<label class="col-sm-4 control-label" title="예약종료일 :">예약종료일 :</label>
					<div class="col-sm-6" style="text-align: center;">
						<input class="form-control" type="date" id="rend" name="rend" required>
					</div>
				</div><br/>                
                 <%--<button type="button"onclick="location.href='./carClSanList.ca?page=<%=nowPage%>'"class="btn btn-primary"><span class="glyphicon glyphicon-chevron-left" ></span> 돌아가기</button>--%>           
              <button type="button"onclick="location.href='./carClSanList.ca?ctype=${param.ctype}&&csize=${param.csize}&&page=${param.page}'"class="btn btn-default"><span class="glyphicon glyphicon-chevron-left" ></span> 돌아가기</button>        
              <button type="submit"onclick="return logincheck();" class="btn btn-default"><span class="glyphicon glyphicon-edit"></span>예약하기</button>
            </div>  
            </form> <!-- /form -->
            </div>
             
</div>
    </div>
    </div>
  <hr>
 <jsp:include page="/view/main/mycarFooter.jsp"></jsp:include> 
 
<script>
	document.getElementById('rstart').valueAsDate = new Date();
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
 
<div id="loginmodal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" style="color: #000;">로그인</h5>
            </div>
            <div class="modal-body">
                <p>로그인이 필요한 서비스입니다.</p>
            </div>
            <div class="modal-footer">
                <button type="button" onclick="location.href='/mycar/memberClLogin.me?fromURI=<%=request.getAttribute("fromURI")%>'" class="btn btn-secondary" data-dismiss="modal">확인</button>
            </div>
        </div>
    </div>
</div>
 
</body>
</html>
