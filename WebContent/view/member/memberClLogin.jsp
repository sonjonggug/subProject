<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mycar 렌터카</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- modal bootstrap -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
body {
	font-family: Pretendard !important;
}
.alert-info {
    color: #31708f;
    background-color: #d9edf7;
    border-color: #bce8f1;
}
.btn-default {
    color: #fff !important;
    background-color: #1e1a1b!important;
    border-color: #1e1a1b!important;
}
.btn-default:hover {
    color: #1e1a1b !important;
    background-color: white !important;
    border-color: #1e1a1b !important;
}

.modal-body {
    font-family: 'Pretendard';
    font-size: 1.3em;
}

.modalButton {
	display: none;
}

</style>

</head>
<body>

<jsp:include page="../main/mycarClHeader.jsp"></jsp:include>

<div class="container">
	<div id="login" class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<h2>Mycar 로그인</h2><hr>
				<%
				if(request.getQueryString() != null) {
				%>
				<form id="loginform" class="loginform" action="../../memberClLoginAction.me?<%=request.getQueryString()%>" method='post'>
					<label>아이디</label> 
					<div style="margin-bottom: 12px" class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
						<input id="mid" type="text" class="form-control" name="mid" value="" placeholder="아이디" data-toggle="tooltip" data-placement="top" title="Inserire l'username" required>
					</div>
					<label>비밀번호</label> 
					<div style="margin-bottom: 12px" class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
						<input id="mpw" type="password" class="form-control" name="mpw" placeholder="비밀번호" data-toggle="tooltip" data-placement="top" title="Inserire la password" required>
					</div>
					<div align="center"><button type="submit" class="btn btn-default"> &nbsp;로그인&nbsp; </button>&nbsp;&nbsp;&nbsp;
					<button onclick="history.back()" class="btn btn-default"> 뒤로가기</button>
					</div><hr>
					<div align="center">
						<a href="/mycar/memberClJoin.me?<%=request.getQueryString()%>" class="btn btn-default" title="회원가입 링크로 이동">회원가입</a>
					</div>
				</form>
				<%
				} else {
				%>
				<form id="loginform" class="loginform" action="../../memberClLoginAction.me" method='post'>
					<label>아이디</label> 
					<div style="margin-bottom: 12px" class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
						<input id="mid" type="text" class="form-control" name="mid" value="" placeholder="아이디" data-toggle="tooltip" data-placement="top" title="Inserire l'username" required>
					</div>
					<label>비밀번호</label> 
					<div style="margin-bottom: 12px" class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
						<input id="mpw" type="password" class="form-control" name="mpw" placeholder="비밀번호" data-toggle="tooltip" data-placement="top" title="Inserire la password" required>
					</div>
					<div align="center"><button type="submit" class="btn btn-default" data-toggle="modal" data-target="#loginErrorModal"> &nbsp;로그인&nbsp; </button>&nbsp;&nbsp;&nbsp;
					<button onclick="history.back()" class="btn btn-default"> 뒤로가기</button>
					</div><hr>
					<div align="center">
						<a href="/mycar/memberClJoin.me" class="btn btn-default" title="회원가입 링크로 이동">회원가입</a>
					</div>
				</form>				
				<%
				}
				%>
			</div>
		</div>
	</div>
</div>   

<div class="container">
  	<!-- Trigger the modal with a button -->
  	<button class="modalButton" id="loginErrorModalButton" data-toggle="modal" data-target="#loginErrorModal">버튼</button>
	<!-- Modal -->
	<div class="modal fade" id="loginErrorModal" role="dialog">
    	<div class="modal-dialog">
	    	<!-- Modal content-->
    		<div class="modal-content">
      	  		<div class="modal-header">
          		<button type="button" class="close" data-dismiss="modal">&times;</button>
          		<h4 class="modal-title">오류</h4>
        		</div>
        	<div class="modal-body">
          		<p>아이디 또는 비밀번호를 확인해주세요.</p>
        	</div>
        	<div class="modal-footer">
          		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        	</div>
    	</div>
	</div>
</div>
 
</div>

<jsp:include page="../main/mycarFooter.jsp"></jsp:include>

</body>
</html>