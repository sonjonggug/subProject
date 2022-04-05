<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import ="car.bean.CarBean" %>
<%@ page import="car.bean.CarPageInfo"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% System.out.println("여기를 들르는가"); %>


<html>
<head>
<title>Mycar 렌터카</title>
 <meta charset="utf-8">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script>
$(document).ready(function() { 
	var id = '<%= (String)session.getAttribute("id")%>'; 
		  
	 	  if(id == "null"){
	 		  $('#modal').modal('show');
			    
	 	  }else{
			  
	 		  }
	 	  });

</script>
</head>
<body>

<div id="modal" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" style="color: #000;">로그인</h5>
            </div>
            <div class="modal-body">
                <p>로그인이 필요한 서비스입니다.</p>
            </div>
            <div class="modal-footer">
                <button type="button" onclick="location.href='/mycar/memberClLogin.me?fromURI=<%request.getQueryString();%>'" class="btn btn-secondary" data-dismiss="modal">확인</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>