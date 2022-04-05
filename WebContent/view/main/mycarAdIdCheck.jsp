<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<head>
 <meta charset="utf-8">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

 <script>
$(document).ready(function() { 
	var id ='<%= (String)session.getAttribute("id")%>';
	 	  if(id == "null"){
	 	  $('#idCheck').modal({backdrop: 'static', keyboard: false});
	       
	 	   }else if (id != admin ){
	 		  $('#admin').modal({backdrop: 'static', keyboard: false});
			  
	 	  }
		 	  });
		 	  


</script>

<script>
history.pushState(null, null, location.href);
window.onpopstate = function(event) {
history.go(1);

};
</script>

</head>

<body >
<%-- 관리자로 로그인 --%>
<div id="admin" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" style="color: #000;">로그인</h5>
                </div>
            <div class="modal-body">
                <p>관리자가 아닙니다.</p>
            </div>
            <div class="modal-footer">
                <button type="button" onclick="location.href='./admin.me'" class="btn btn-secondary" data-dismiss="modal">확인</button>
            </div>
        </div>
    </div>
</div>

<%-- 비관리자로 로그인 --%>
<div id="idCheck" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" style="color: #000;">로그인</h5>
            </div>
            <div class="modal-body">
                <p>접근 권한이 없습니다</p>
            </div>
            <div class="modal-footer">
                <button type="button" onclick="location.href='./admin.me'" class="btn btn-secondary" data-dismiss="modal">확인</button>
            </div>
        </div>
    </div>
</div>

</body>