<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Mycar 렌터카</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default rounded borders and increase the bottom margin */ 
    /*.navbar {
      margin-bottom: 50px;
      border-radius: 0;
    }*/
    
    /* Remove the jumbotron's default bottom margin */ 
     /*.jumbotron {
      margin-bottom: 0;
    }*/
    
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
      }
    .panel-footer{ font-family : 굴림체; font-weight: bold; font-size : 13pt; text-align: center; height: 35px;}
    .panel-body {width: 300px; height: 151px;  text-align: center; margin: auto;}
    /*.container{ width: 1140px; height: 400px;}*/
   /* .panel-body {width: 100px ;
                height: 200px;} */
    </style>
</head>
<body>
 

<jsp:include page="/view/main/mycarClHeader.jsp"></jsp:include> 
&nbsp;<br />&nbsp;<br />&nbsp;<br />
<div class="container" style="margin-top:1%" >    
  <div class="row">
    <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
      <div class="panel panel-primary">
      <div class="panel-body">
       <a href= "carClSanList.ca?ctype=${param.ctype}&csize=min">
        <img src="image/xscar.png" class="img-responsive" style="width:85%; margin: 0 auto ;" title="경차 아이콘"></a></div>
        <div class="panel-footer">경&nbsp;차</div>
      </div>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"> 
      <div class="panel panel-primary">
        <div class="panel-body">
        <a href= "carClSanList.ca?ctype=${param.ctype}&csize=sma">
        <img src="image/scar.png" class="img-responsive " style="width:85%; margin: 0 auto ;" alt="소형차 예약" title="소형차 아이콘"></a></div>
        <div class="panel-footer">소&nbsp;형&nbsp;차</div>
      </div>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"> 
      <div class="panel panel-primary">
        <div class="panel-body">
         <a href= "carClSanList.ca?ctype=${param.ctype}&csize=mid">
        <img src="image/mcar.png" class="img-responsive " style="width:85%; margin: 0 auto ;" alt="중형차 예약" title="중형차 아이콘"></a></div>
        <div class="panel-footer">중 &nbsp;형&nbsp;차</div>
      </div>
    </div>
  </div>
</div><br>
      &nbsp;<br />&nbsp;<br />
<div class="container" >    
  <div class="row">
    <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4" style="margin-bottom:1%">
      <div class="panel panel-primary">
        <div class="panel-body">
         <a href= "carClSanList.ca?ctype=${param.ctype}&csize=big">
        <img src="image/lcar.png" class="img-responsive" style="width:85%; margin: 0 auto ;" alt="대형차 예약" title="대형차 아이콘"></a></div>
        <div class="panel-footer">대&nbsp;형&nbsp;차</div>
      </div>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"> 
      <div class="panel panel-primary">
        <div class="panel-body">
        <a href= "carClSanList.ca?ctype=${param.ctype}&csize=suv">
        <img src="image/suv.png" class="img-responsive" style="width:85%; margin: 0 auto ;" alt="SUV 예약" title="SUV 아이콘"></a></div>
        <div class="panel-footer">S&nbsp;U&nbsp;V</div>
      </div>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"> 
      <div class="panel panel-primary">
        <div class="panel-body">
        <a href= "carClSanList.ca?ctype=${param.ctype}&csize=van">
        <img src="image/van.png" class="img-responsive" style="width:85%; margin: 0 auto ;" alt="승합차 예약" title="승합차 아이콘"></a></div>
        <div class="panel-footer">승&nbsp;합&nbsp;차</div>
      </div>
    </div>
  </div>
</div>
&nbsp;<br />&nbsp;<br />
<jsp:include page="/view/main/mycarFooter.jsp"></jsp:include> 
</body>
</html>
