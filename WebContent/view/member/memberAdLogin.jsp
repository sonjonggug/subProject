<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - Log In / Sign Up - pure css - #12</title>
   
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'> 
<link rel='stylesheet' href='https://unicons.iconscout.com/release/v2.1.9/css/unicons.css'><link rel="stylesheet" href="./bootStrapLogin/dist/style.css">

</head>
<style>
body {
    font-family: pretendard;
    font-size: 14px;
     color : #fff;
}
.h1, h1 {
    font-size: 5.5rem;
}
.btn {
   
    color:#1e1a1b!important;
    background-color: #fff!important;
}   
.card-front, .card-back {
    width: 100%;
    height: 100%;
    background-color: #1e1a1b;
    background-position: bottom center;
    background-repeat: no-repeat;
    background-size: 300%;
    position: absolute;
    border-radius: 6px;
    left: 0;
    top: 0;
    -webkit-transform-style: preserve-3d;
    transform-style: preserve-3d;
    -webkit-backface-visibility: hidden;
    -moz-backface-visibility: hidden;
    -o-backface-visibility: hidden;
    backface-visibility: hidden;

}
</style>
<body>

<!-- partial:index.partial.html -->


		
	
	      
<form name="loginform"action="./memberAdLoginAction.me" method="post" role="form" class="php-email-form">
	<div class="section">
		<div class="container">
		
			<div class="row full-height justify-content-center">
				<div class="col-12 text-center align-self-center py-5">
					<div class="section pb-5 pt-5 pt-sm-2 text-center">
					  <h1>MyCar</h1>
						
			          	<label for="reg-log"></label>
						<div class="card-3d-wrap mx-auto">
							<div class="card-3d-wrapper">
								<div class="card-front">
								
									<div class="center-wrap">
										<div class="section text-center">
											<h4 class="mb-4 pb-3">관리자 로그인</h4>
											<div class="form-group">
												
												<input type="text" name="MID" class="form-style" id="MID"  placeholder="아이디" required>
												<i class="input-icon uil uil-at"></i>
											</div>	
											<div class="form-group mt-2">
												<input type="password" class="form-style" name="MPW" id="MPW" placeholder="비밀번호"  required>
												<i class="input-icon uil uil-lock-alt"></i>
											</div>
											 <button type="submit" class="btn mt-4"href="javascript:loginform.submit()">로그인</button>
											<!--  <a href="#" class="btn mt-4">submit</a>-->
                            				
				      					</div>
			      					</div>
			      				</div>
			      				
			      				
								
			      	</div>
		      	</div>
	      	</div>
	    </div>
	</div>
	</div>
	</div>
<!-- partial -->
  <script  src="./script.js"></script>
 </form>
 
 
 <jsp:include page="../main/mycarFooter.jsp"></jsp:include>
</body>

</html>
