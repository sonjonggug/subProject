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
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"> -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- <script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->

<!-- modal bootstrap -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%@ page import="static db.JdbcUtil.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="member.dao.MemberDAO" %>
<%@ page import="member.bean.MemberBean" %>
<%@ page import="member.service.MemberClIdCheckService" %>
<%@ page import="java.util.*" %>
<%	
MemberClIdCheckService memberClIdCheckService = new MemberClIdCheckService();
ArrayList<String> memberIdCheckList = memberClIdCheckService.getMemberList();
System.out.println("memberidCheckList의 값 = " + memberIdCheckList);
%>

<style>
body {
	min-height: 100vh;
	background: white;
	font-family: Pretendard !important;
}

.input-form {
	width: 90%;
	max-width: 700px;
	margin: auto;
	margin-top: 50px;
	margin-bottom: 50px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}

.input-group, .mb-3 {
	margin-bottom: 10px;
}

.btn-primary {
    color: #fff;
    background-color: #263238!important;
    border-color: #263238!important;
}

form {
    padding: 20px;
}

#midCheckLabel {
	color: white;
}

.mhpLabel{
	vertical-align: top;
}

#input-form {
    float: unset;
}
.modalButton {
	display: none;
}
#midCheckButton {
    color: white !important;
    background-color: #1e1a1b !important;
    border-color: #1e1a1b !important;
}
#midCheckButton:hover {
    color: #1e1a1b !important;
    background-color: white !important;
    border-color: #1e1a1b !important;
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
input:invalid {
	border-color: red;
}
#joinButtonHidden {
	display: none;
}
</style>
</head>
<body>

<jsp:include page="../main/mycarClHeader.jsp"></jsp:include>

	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto" id="input-form">
				<h2 class="mb-3">&nbsp;&nbsp;Mycar 회원가입</h2><br>
				<form class="joinForm" id="joinForm" name="joinForm" action="./memberClJoinAction.me?fromURI=<%=request.getParameter("fromURI")%>" method="post">

					<div class="row">
						<div class="col-md-9 mb-3">
							<label for="mid">아이디  <span class="text-danger">*</span></label>
							<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
							<input type="text"
							class="form-control" name = "mid" id="mid" 
							placeholder="영문 소문자와 숫자만 입력가능" pattern="^[a-z0-9_]{3,20}$" 
							minlength="3" maxlength="20" onchange="midChange()" required autofocus>
						</div>
						</div>
						<div class="col-md-3 mb-3">
							<label for="midCheckButton" id="midCheckLabel">.</label>							
							<input type="button" class="form-control" name = "midCheckButton" id="midCheckButton" value="중복확인" onclick="midCheckAction()">			
							<input type="hidden" id="midCheck" name="midCheck" value="N">							
						</div>
					</div>
					
					
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="mpw">비밀번호 <span class="text-danger">*</span></label>
							<input type="password"
								class="form-control" name = "mpw" id="mpw" 
								placeholder="비밀번호" pattern=".{3,}" maxlength="20" onchange="mpwChange()" required>
						</div>
						<div class="col-md-6 mb-3">
							<label for="mpwCheck">비밀번호 확인 <span class="text-danger">*</span></label>
							<input type="password"
								class="form-control" name = "mpwCheckArea" id="mpwCheckArea" 
								placeholder="비밀번호 확인" pattern=".{3,}" 
								maxlength="20" onchange="mpwCheckAction()" required>
							<input type="hidden" id="mpwCheck" name="mpwCheck" value="N">
						</div>
					</div>
					<div class="mb-3">
						<label for="mname">이름 <span class="text-danger">*</span></label> <input type="text"
							class="form-control"  name = "mname" id="mname" 
							placeholder="홍길동" pattern="^[가-힣]+$" 
							minlength='2' maxlength="6" required >
					</div>
					<div class="mb-3">
						<label for="mbirth">생년월일 <span class="text-danger">*</span></label> <input type="text"
							class="form-control" name = "mbirth" id="mbirth" 
							placeholder="19901212 (기호제외 8자리)" pattern="^[0-9_]{8}$" 
							maxlength="8" required>
					</div>
					<label for="mhp">연락처 <span class="text-danger">*</span></label> 
					<div class="input-group">
		            <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i><i class="mhpLabel"> &nbsp; (010) </i></span>
						<input type="tel"
							class="form-control"  name = "mhp" id="mhp"
							pattern=".{8}" placeholder="12345678 (010제외, 기호제외 8자리)" 
							maxlength="8" required>
					</div>
					<div class="mb-3"></div>
					<div class="row">
						<div class="col-md-4 mb-3">
							<label for="maddrp">우편번호 </label><input type="text"
								class="form-control" name = "maddrp" id="maddrp" 
								placeholder="우편번호" maxlength="7" required readonly>
						</div>
						<div class="col-md-8 mb-3">
							<label for="maddr">주소 <span class="text-danger">*</span></label> <input type="text"
								class="form-control" name = "maddr" id="maddr" 
								placeholder="여기를 클릭해주세요" required>
						</div>
					</div>
					<label for="maddrd">상세주소 <span class="text-danger">*</span><span class="text-muted"></span></label>
					<div class="input-group">
					<span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>	
					<input type="text" class="form-control" name="maddrd" id="maddrd"
							placeholder="상세주소를 입력해주세요." maxlength="50" required>
					</div>
					<div class="mb-3"></div>
					<label for="email">이메일 <span class="text-danger">*</span></label>
					<div class="input-group">
		            <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
					<input type="email"
							class="form-control" name="memail" id="memail" 
							placeholder="email@example.com" maxlength="30" required>
					</div>
					<div class="mb-3"></div>
					<div class="mb-3">
						<label for="mlic">면허번호 <span class="text-danger">*</span></label> <input type="text"
							class="form-control" name = "mlic" id="mlic" placeholder="면허번호" 
							maxlength="10" required>
					</div>					
					<div class="mb-4"></div>
					<hr class="mb-4">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="aggrement"
							required> <label class="custom-control-label"
							for="aggrement">개인정보 수집 및 이용에 동의합니다.</label><br><br><br>
					</div>
					<div class="mb-4"></div>
					<div class="row">
						<div class="col-md-6 mb-3">
						<button type="button" class="btn btn-default btn-lg btn-block" id="joinButton" 
						onclick="joinCheck();">가입하기</button>
						<button type="submit" class="btn btn-default btn-lg btn-block" id="joinButtonHidden">숨겨진가입버튼</button>						
						</div>
						<div class="col-md-6 mb-3">
						<button class="btn btn-default btn-lg btn-block" id="backButton" 
						onclick="history.back();">뒤로가기</button>
						</div>		
					</div>	
				</form>
			</div>
		</div>
	</div>
	
	<div class="container">
	  	<!-- Trigger the modal with a button -->
 	 	<button class="modalButton" id="errorModalButton" data-toggle="modal" data-target="#errorModal">버튼</button>
		<!-- Modal -->
		<div class="modal fade" id="errorModal" role="dialog">
	   	 	<div class="modal-dialog">
		    	<!-- Modal content-->
   		 		<div class="modal-content">
      		  		<div class="modal-header">
       		   		<button type="button" class="close" data-dismiss="modal">&times;</button>
          			<h4 class="modal-title" id="errorName">오류</h4>
        			</div>
        			<div class="modal-body">
        	  			<p id="errorMessage">오류 메세지</p>
       		 		</div>
      		 	 	<div class="modal-footer">
        	  			<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
       	 			</div>
    			</div>
			</div>
		</div>
	</div>
	
	<div class="container">
	  	<!-- Trigger the modal with a button -->
 	 	<button class="modalButton" id="submitModalButton" data-toggle="modal" data-target="#submitModal">버튼</button>
		<!-- Modal -->
		<div class="modal fade" id="submitModal" role="dialog">
	   	 	<div class="modal-dialog">
		    	<!-- Modal content-->
   		 		<div class="modal-content">
      		  		<div class="modal-header">
       		   		<button type="button" class="close" data-dismiss="modal">&times;</button>
          			<h4 class="modal-title" id="submitName">성공</h4>
        			</div>
        			<div class="modal-body">
        	  			<p id="submitMessage">성공 메세지</p>
       		 		</div>
      		 	 	<div class="modal-footer">
        	  			<button type="button" class="btn btn-default" data-dismiss="modal" 
        	  					onclick="document.getElementById('joinButtonHidden').click();">가입하기</button>      		 	 	
        	  			<button type="button" class="btn btn-default" data-dismiss="modal" 
        	  					onclick="">닫기</button>
       	 			</div>
    			</div>
			</div>
		</div>
	</div>	

	<script>
		function midCheckAction() {
		var mid = document.getElementById('mid').value;
		var memberList = "<%=memberIdCheckList%>";
		var memberListArray = memberList.split(', ');
		
		
		if(mid==""){
			$("#errorName").text("회원가입");
			$("#errorMessage").text("아이디를 입력해주세요");
			document.getElementById('errorModalButton').click();
			return false;
			}
		if(mid==null){
			$("#errorName").text("회원가입");
			$("#errorMessage").text("아이디를 입력해주세요");
			document.getElementById('errorModalButton').click();
			return false;
			}
		else{
			
			if(memberListArray.includes(mid)){
				$("#errorName").text("아이디 중복체크");
				$("#errorMessage").text("이미 존재하는 아이디입니다.");
				document.getElementById('errorModalButton').click();
				return false;										
			} else {
				$("#errorName").text("아이디 중복체크");
				$("#errorMessage").text("사용 가능한 아이디입니다.");
				document.getElementById('errorModalButton').click();
				document.getElementById('midCheck').value = "Y";
			}
			}
		}
	</script>				
	
    <script type="text/javascript">
    function midChange() {
      	document.getElementById('midCheck').value = "N";
      }
	</script>		
							
    <script type="text/javascript">
    function mpwCheckAction() {
        var mpw = document.getElementById('mpw').value;
        var mpwCheck = document.getElementById('mpwCheckArea').value;
        
            if( mpw != mpwCheck ) {
    			$("#errorName").text("비밀번호 확인");
    			$("#errorMessage").text("비밀번호가 일치하지 않습니다.");
    			document.getElementById('errorModalButton').click();
            	document.getElementById('mpwCheck').value = "N";
            	return ;
            } else{
    			$("#errorName").text("비밀번호 확인");
    			$("#errorMessage").text("비밀번호가 일치합니다.");
    			document.getElementById('errorModalButton').click();
            	document.getElementById('mpwCheck').value = "Y";
            }
      }
	</script>
	
    <script type="text/javascript">
    function mpwChange() {
      	document.getElementById('mpwCheck').value = "N";
      }
	</script>	
	
	<script>
		function joinCheck() {
		var midCheck = document.getElementById('midCheck').value;
		var mpwCheck = document.getElementById('mpwCheck').value;
			
		if(midCheck == "N"){
			$("#errorName").text("회원가입");
			$("#errorMessage").text("아이디 중복확인을 클릭해주세요.");
			document.getElementById('errorModalButton').click();
			return false;
		} else if (mpwCheck == "N"){
			$("#errorName").text("회원가입");
			$("#errorMessage").text("비밀번호가 일치하지 않습니다.");
			document.getElementById('errorModalButton').click();
			return false;
		} else {
			$("#submitName").text("회원가입");
			$("#submitMessage").text("정말로 가입하시겠습니까?");
			document.getElementById('submitModalButton').click();
		}
		}
	</script>	
	
	<jsp:include page="../main/mycarFooter.jsp"></jsp:include>

	<script>
	    window.onload = function(){
	    document.getElementById("maddr").addEventListener("click", function(){ //주소입력칸을 클릭하면
	        //카카오 지도 발생
	        new daum.Postcode({
	            oncomplete: function(data) { //선택시 입력값 세팅
	            	document.getElementById("maddrp").value = data.zonecode; // 우편번호 넣기
	                document.getElementById("maddr").value = data.address; // 주소 넣기
	                document.querySelector("input[name=maddrd]").focus(); //상세입력 포커싱
	            }
	        }).open();
	    });
	}
	</script>
</body>
</html>
