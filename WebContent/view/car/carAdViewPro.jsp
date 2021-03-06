<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@page import="car.bean.CarBean"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css" class="svelte-p5qu1m" data-svelte="svelte-1yifjfe">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<style>
#imgstyle{filter: drop-shadow(5px 5px 5px #000)}
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


/* #cFile { */
/*      visibility: hidden; */
/* } */
</style>

<script type = "text/javascript">
function fileCheck(obj){
pathpoint = obj.value.lastIndexOf('.');
filepoint = obj.value.substring(pathpoint+1, obj.length);
filetype = filepoint.toLowerCase();
if(filetype=='jpg'||filetype=='gif'||filetype=='png'||filetype=='jpeg'||
   filetype=='bmp'){
   
   }else{
   obj.outerHTML = obj.outerHTML;
   $('#imgCheck').modal({backdrop: 'static', keyboard: false});
   
   return false;
   }
   
   if(filetype=='bmp'){
   upload = $('#bmpCheck').modal({backdrop: 'static', keyboard: false});
	  
   if(upload){
	      
   }else
    obj.outerHTML = obj.outerHTML;  
   return false;
   }
   }
   </script>
   <script>
function test()  {
  const name = document.getElementById('cType').value;
  
  document.getElementById("result").innerText = name;
}
function test1()  {
	  const name = document.getElementById('cSize').value;
	  
	  document.getElementById("result1").innerText = name;
	}
function test2()  {
	  const name = document.getElementById('cName').value;
	  
	  document.getElementById("result2").innerText = name;
	}
function test3()  {
	  const name = document.getElementById('cPrice').value;
	  
	  document.getElementById("result3").innerText = name;
	}
function test4()  {
	  const name = document.getElementById('cGear').value;
	  
	  document.getElementById("result4").innerText = name;
	}
function test5()  {
	  const name = document.getElementById('cFuel').value;
	  
	  document.getElementById("result5").innerText = name;
	}
function test6()  {
	  const name = document.getElementById('cSeat').value;
	  
	  document.getElementById("result6").innerText = name;
	}

	

</script>

<script>
function onClickUpload(){
    let FileUpload = document.getElementById("cFile");
    FileUpload.click();
    }
</script>   


      


</head>

<body><jsp:include page="/view/main/mycarAdHeader.jsp"></jsp:include>

<div class="container text-center">    
  <h2>?????? ?????? ??????</h2>
  <br>
  <div class="row">
    <div class="col-sm-6">
    &nbsp;<br/>&nbsp;<br/>&nbsp;<br/>&nbsp;<br/>&nbsp;<br/>
    <div class="form-group">
    <div >
    <img>
       <img src="image/${car.cFile}" width="105%" alt =" ????????????" title="?????? ?????????" id="imgstyle">
     </div>
    </div>
    </div>
    
    <div class="col-sm-6">
    <div class="well"  style="background-color: #FFFFFF;">
    <form class="form-horizontal" role="form" id="modifyForm" action="carModifyForm.ca?cFile=${car.cFile}"  method="POST" enctype="multipart/form-data"name = "Modifyform">
               <div class="form-group" style="text-align: center;">
                    <label for="cCode"class="col-sm-4 control-label" >?????? :</label>
                    <div class="col-sm-6" style="text-align: center;">
                 <input type="text" id="cCode" name="CarCode" class="form-control" value="${car.cCode}"  autofocus required>
                    </div>
                </div>
                <div class="form-group" style="text-align: center;">
                    <label for="cType" class="col-sm-4 control-label">??????/?????? :</label>
                    <div class="col-sm-6">
                        <input type="text" id="cType" name="CarType" class="form-control"  value="${car.cType}" onchange="test()" required>
                    </div>
                </div>
                 <div class="form-group" style="text-align: center;">
                    <label for="cSize" class="col-sm-4 control-label">?????? ?????? :</label>
                    <div class="col-sm-6">
                        <input type="text" id="cSize" name="CarSize" value="${car.cSize}" class="form-control"onchange="test1()" required>
                    </div>
                </div>
                 <div class="form-group" style="text-align: center;">
                    <label for="cName" class="col-sm-4 control-label">?????? :</label>
                    <div class="col-sm-6">
                        <input type="text" id="cName" name="CarName" class="form-control"  value="${car.cName}" onchange="test2()" required >
                    </div>
                </div>
                 <div class="form-group" style="text-align: center;">
                    <label for="cPrice" class="col-sm-4 control-label">?????? :</label>
                    <div class="col-sm-6">
                        <input type="text" id="cPrice" name="CarPrice"  class="form-control" value="${car.cPrice}" onchange="test3()" required>
                    </div>
                </div>
                <div class="form-group" style="text-align: center;">
                    <label for="cGear" class="col-sm-4 control-label">?????? :</label>
                    <div class="col-sm-6">
                        <input type="text" id="cGear" name="CarGear"  class="form-control" value="${car.cGear}" onchange="test4()" required>
                    </div>
                </div>
                <div class="form-group" style="text-align: center;">
                    <label for="cFuel" class="col-sm-4 control-label">?????? :</label>
                    <div class="col-sm-6">
                        <input type="text" id="cFuel" name="CarFuel"  class="form-control" value="${car.cFuel}"onchange="test5()" required>
                    </div>
                </div>
                <div class="form-group" style="text-align: center;">
                    <label for="cSeat" class="col-sm-4 control-label">????????????  :</label>
                    <div class="col-sm-6">
                        <input type="text" id="cSeat" name="CarSeat"class="form-control" value="${car.cSeat}"onchange="test6()" required >
                    </div>
                </div>
                <div class="form-group" style="text-align: center;">
                    <label for="cFile" class="col-sm-4 control-label">???????????? :</label>
                    <div class="col-sm-6">
                         <input type="text" id="carFile" name="CarFile"class="form-control" value="${car.cFile}" required readonly >
                         <span class="input-group-btn"> <button type="button" class="btn btn-default" id="FileUpload" onclick="onClickUpload()">??????</button> </span>
                         <input name="CarFile" type="file" class="form-control" value="image/${car.cFile}" onchange = "fileCheck(this)"
			             accept="image/gif, image/jpeg, image/png" id="cFile" required="required" />
			       
			           </div>
                </div>
                <button type="button" onclick="location.href='carAdDetail.ca?cCode=${car.cCode}&&page=${param.page}&&fieldName=${param.fieldName}&&word=${param.word}'"class="btn btn-default"><span class="glyphicon glyphicon-chevron-left" ></span> ????????????</button>  
                <button type="button" class="btn btn-default "data-toggle="modal" data-target="#${car.cCode}"><span class="glyphicon glyphicon-edit"></span>????????????</button> 
                <button type="button"onclick="location.href='./carAdSearchList.ca?page=${param.page}&&fieldName=${param.fieldName}&&word=${param.word}'"class="btn btn-default"><span class="glyphicon glyphicon-edit"></span>??????</button>
            
                <input name="page" type="hidden" id="page" value="${param.page}"  />
                <input name="cFile" type="hidden" id="cFile" value="${car.cFile}"  />
                <input name="fieldName" type="hidden" id="fieldName" value="${param.fieldName}"  />
                <input name="word" type="hidden" id="word" value="${param.word}"  />
                        
                        
                         
</form>



</div>
</div>
</div>
          </div>
              
    <div class="modal fade" id="${car.cCode}" role="dialog">
    <div class="modal-dialog modal-dialog-centered">
     
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">?????? ?????????????????????????</h4>
        </div>
        <%-- <div class="modal-body">
         <p>
                          ??????/??????: ${car.cType} -><span id="result"></span><br>
                          ?????? ??????: ${car.cSize} -><span id="result1"></span><br>
                          ??????:${car.cName} -><span id="result2"></span><br>              
                          ??????: ${car.cPrice} -><span id="result3"></span><br>
                          ??????: ${car.cGear} -><span id="result4"></span><br>
                          ??????:${car.cFuel} -><span id="result5"></span><br>
                          ????????????: ${car.cSeat} -><span id="result6"></span><br>
                                      
          </p>
         
        </div>--%>
        <div class="modal-footer"> 
           <button type="button" class="btn btn-primary" form = "modifyForm"  data-dismiss="modal" onclick="Modifyform.submit()"><span class="glyphicon glyphicon-ok"></span> &nbsp;???</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span>?????????</button>
        </div>
      </div>     
    </div>
        </div> <!-- ./container -->
  
        <%-- bmp ?????? Check --%>
<div id="bmpCheck" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" style="color: #000;"></h5>
                </div>
            <div class="modal-body">
                <p>BMP ????????? ???????????? ??????????????? ????????? ????????? ????????? ????????????. <p>
                <p>????????? ?????????????????????????</p>
            </div>
            <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">??????</button>
            <button type="button" class="btn btn-secondary btn" data-dismiss="modal" title="??????" onclick="return false;">??????</button>             
            </div>
        </div>
    </div>
</div>

<%-- img ?????? Check --%>
<div id="imgCheck" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" style="color: #000;"></h5>
            </div>
            <div class="modal-body">
                <p>????????? ????????? ????????? ??? ????????????.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">??????</button>
            </div>
        </div>
    </div>
</div>
        
<jsp:include page="../main/mycarFooter.jsp"></jsp:include>

  
        </body>