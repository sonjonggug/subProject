<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Mycar 렌터카</title>
<!-- Bootstrap CSS -->
<!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- <script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<!-- <script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->

<style>
body {
	min-height: 100vh;
	background: white;
	font-family: Pretendard !important;
}

.input-form {
	max-width: 680px;
	margin: auto;
	margin-top: 5%;
	margin-bottom: 5%;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}
.btn-primary {
    color: #fff;
    background-color: #263238;
    border-color: #263238;
}
.input-group, .mb-3 {
	margin-bottom: 10px;
}
form {
    padding: 20px;
}
.mhpLabel{
	vertical-align: top;
}
.col-md-12 {
    float: unset;
}
.modalButton {
	display: none;
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
button {
    color: white !important;
    background-color: #1e1a1b !important;
    border-color: #1e1a1b !important;
}
button:hover {
    color: #1e1a1b !important;
    background-color: white !important;
    border-color: #1e1a1b !important;
}
.close {
    color: darkgray !important;
    background-color: white !important;
}
</style>
</head>
<body>

		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h2 class="mb-3">&nbsp;&nbsp;내 정보</h2><br>
				<form class="updateViewForm" name="updateViewForm" method="post">

					<label for="mid">아이디 <span class="text-danger">*</span></label> 
					<div class="input-group">
					<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
						<input type="text"
							class="form-control" name = "mid" id="mid" value="${member.mid}"
							placeholder="영문 소문자와 숫자만 입력가능" pattern="^[a-z0-9_]{3,20}$" 
							minlength="3" maxlength="20" required readonly>
					</div>
					<div class="mb-3"></div>
					<div class="mb-3">
						<label for="mname">이름 <span class="text-danger">*</span></label> <input type="text"
							class="form-control"  name = "mname" id="mname" value="${member.mname}"
							placeholder="홍길동" pattern="^[가-힣]+$" 
							minlength='2' maxlength="6" required readonly>
					</div>
					<div class="mb-3">
						<label for="mbirth">생년월일 <span class="text-danger">*</span></label> <input type="text"
							class="form-control" name = "mbirth" id="mbirth" value="${member.mbirth}"
							placeholder="19901212 (기호제외 8자리)" pattern="^[0-9_]{8}$" 
							maxlength="8" required readonly>
					</div>
					<label for="mhp">연락처 <span class="text-danger">*</span></label> 
					<div class="input-group">
		            <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i><i class="mhpLabel"> &nbsp; (010) </i></span>
						<input type="tel"
							class="form-control"  name = "mhp" id="mhp" value="${member.mhp}"
							pattern=".{8}" placeholder="12345678 (010제외, 기호제외 8자리)" 
							maxlength="8" required readonly>
					</div>
					<div class="mb-3"></div>
					<div class="row">
						<div class="col-md-4 mb-3">
							<label for="maddrp">우편번호 </label><input type="text"
								class="form-control" name = "maddrp" id="maddrp" value="${member.maddrp}"
								placeholder="우편번호" maxlength="7" required readonly>
						</div>
						<div class="col-md-8 mb-3">
							<label for="maddr">주소 <span class="text-danger">*</span></label> <input type="text"
								class="form-control" name = "maddr" id="maddr" value="${member.maddr}"
								placeholder="여기를 클릭해주세요" required readonly>
						</div>
					</div>
					<label for="maddrd">상세주소 <span class="text-danger">*</span><span class="text-muted"></span></label>
					<div class="input-group">
					<span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>	
					<input type="text" class="form-control" name="maddrd" id="maddrd" value="${member.maddrd}"
							placeholder="상세주소를 입력해주세요." maxlength="50" required readonly>
					</div>
					<div class="mb-3"></div>
					<label for="email">이메일 <span class="text-danger">*</span></label>
					<div class="input-group">
		            <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
					<input type="email"
							class="form-control" name="memail" id="memail" value="${member.memail}"
							placeholder="email@example.com" maxlength="30" required readonly>
					</div>
					<div class="mb-3"></div>
					<div class="mb-3">
						<label for="mlic">면허번호 <span class="text-danger">*</span></label> <input type="text"
							class="form-control" name = "mlic" id="mlic" value="${member.mlic}" 
							placeholder="면허번호" maxlength="10" required readonly>
					</div>					
					<div class="mb-4"></div>
					<hr class="mb-4">
					<div class="mb-4"></div>
					<div class="row">
						<div class="col-md-6 mb-3">
						<input type="button" class="btn btn-default btn-lg btn-block" 
						id="updateViewButton" value="정보수정" 
						onclick="location='/mycar/memberClUpdateView.me'" title="정보수정 링크로 이동">
						</div>
						<div class="col-md-6 mb-3">
						<input type="button" class="btn btn-default btn-lg btn-block" 
						id="backButton" value="회원탈퇴" 
						onclick="document.getElementById('deleteModalButton').click();" title="회원탈퇴 버튼">
						</div>		
					</div>	
				</form>
			</div>
		</div>
	
	<div class="container">
	  	<!-- Trigger the modal with a button -->
 	 	<button class="modalButton" id="deleteModalButton" data-toggle="modal" data-target="#deleteModal">버튼</button>
		<!-- Modal -->
		<div class="modal fade" id="deleteModal" role="dialog">
	   	 	<div class="modal-dialog">
		    	<!-- Modal content-->
   		 		<div class="modal-content">
      		  		<div class="modal-header">
       		   		<button type="button" class="close" data-dismiss="modal">&times;</button>
          			<h4 class="modal-title" id="deleteName">회원탈퇴</h4>
        			</div>
        			<div class="modal-body">
        	  			<p id="deleteMessage">정말로 탈퇴하시겠습니까?</p>
       		 		</div>
      		 	 	<div class="modal-footer">
        	  			<button type="button" class="btn btn-default" data-dismiss="modal" 
        	  					onclick="location.replace('/mycar/memberClDeleteAction.me');">예</button>
						<button type="button" class="btn btn-default" data-dismiss="modal" 
        	  					onclick="">아니오</button>        	  					
       	 			</div>
    			</div>
			</div>
		</div>
	</div>	

</body>
</html>