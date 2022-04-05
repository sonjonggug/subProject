<%@page import="car.bean.CarBean"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>

<%
	CarBean car = (CarBean)request.getAttribute("car");
    String nowPage = (String)request.getAttribute("page");
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
  <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css" class="svelte-p5qu1m" data-svelte="svelte-1yifjfe">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-2.1.3.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<style>
body {
    font-family: pretendard;
    font-size: 14px;
    
    color: #333;
    background-color: #fff;
}
.btn-default {
    color: #fff;
    background-color: #1e1a1b;
    border-color: #1e1a1b;
}
</style>
<script type = "text/javascript">
function fileCheck(obj){
pathpoint = obj.value.lastIndexOf('.');
filepoint = obj.value.substring(pathpoint+1, obj.length);
filetype = filepoint.toLowerCase();
if(filetype=='jpg'||filetype=='gif'||filetype=='png'||filetype=='jpeg'||
   filetype=='bmp'){
   
   }else{
   alert('이미지 파일만 선택할 수 있습니다.');
   obj.outerHTML = obj.outerHTML;

   return false;
   }
   
   if(filetype=='bmp'){
   upload = confirm('BMP 파일은 웹상에서 사용하기에 적절한 이미지 포맷이 아닙니다. \n 그래도 계속하시겠습니까?');
  
   if(upload){
	      
   }else
    obj.outerHTML = obj.outerHTML;  
   return false;
   }
   }
   </script>
</head>
<body><jsp:include page="/view/main/mycarAdHeader.jsp"></jsp:include>
	<div class="container"style="text-align: center; margin-top:2%; margin-bottom:2%;">
    <h2>상품 등록</h2>
    
    <form class="form-horizontal" id ="InsertForm" role="form" action="carAdInsert.ca" method="POST" enctype="multipart/form-data" name = "carform">
                 <div id="legend"style="text-align: center;">
    
                <div class="form-group" style="text-align: center;">
                    <label for="cCode"class="col-sm-4 control-label" >코드 :</label>
                    <div class="col-sm-4" style="text-align: center;">
                  <input type="text" name="CarCode" class="form-control" id="cCode" required="required" Autofocus />
                    </div>
                </div>
                <div class="form-group">
                    <label for="cType" class="col-sm-4 control-label">장기/단기 :</label>
                    <div class="col-sm-4">
                        <input name="CarType" type="text" class="form-control" id="cType" required="required" /></div>
                </div>
                 <div class="form-group">
                    <label for="cSize" class="col-sm-4 control-label">차량 크기 :</label>
                    <div class="col-sm-4">
                       <input name="CarSize" type="text" class="form-control" id="cSize" required="required" />
                       </div>
                </div>
                 <div class="form-group">
                    <label for="cName" class="col-sm-4 control-label">차 종 :</label>
                    <div class="col-sm-4">
                        <input name="CarName" type="text" class="form-control" id="CName" required="required" /></div>
                </div>
                <div class="form-group">
                    <label for="cPrice" class="col-sm-4 control-label">가격 :</label>
                    <div class="col-sm-4">
                        <input name="CarPrice" type="text" class="form-control" id="cPrice" required="required" /></div>
                </div>
                <div class="form-group">
                    <label for="cGear" class="col-sm-4 control-label">기어 :</label>
                    <div class="col-sm-4">
                         <input name="CarGear" type="text" class="form-control" id="cGear" required="required" /></div>
                </div>
                <div class="form-group">
                    <label for="cFuel" class="col-sm-4 control-label">연료 :</label>
                    <div class="col-sm-4">
                        <input name="CarFuel" type="text" class="form-control" id="cFuel" required="required" /></div>
                </div>
                <div class="form-group">
                    <label for="cSeat" class="col-sm-4 control-label">승차인원  :</label>
                    <div class="col-sm-4">
                        <input name="CarSeat" type="text" class="form-control" id="cSeat" required="required" /></div>
                </div>
                <div class="form-group">
                    <label for="cFile" class="col-sm-4 control-label">차량 사진첨부 :</label>
                    <div class="col-sm-4">
                         <input name="CarFile" type="file" class="form-control" onchange = "fileCheck(this)"
			              accept="image/gif, image/jpeg, image/png" id="cFile" required="required" />
                    </div>
                </div>
                 </div>
                     <input name="page" type="hidden" id="page" value="${param.page}"  />
                    
            </form> <!-- /form -->
            </div>
                 <div id="FunctionButton" style="text-align: center;">
                 <button type="submit" class="btn btn-default" form="InsertForm" >등록</button>
                 <button type="reset" class="btn btn-default">다시 쓰기</button>
                 <a href="carAdSearchList.ca?page=${param.page}"><button class="btn btn-default" > 상품 리스트</button></a>
                 </div>
           
 <jsp:include page="../main/mycarFooter.jsp"></jsp:include>

        </body>