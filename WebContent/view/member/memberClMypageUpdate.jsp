<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Mycar 렌터카</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
body { margin: 0;}

#resClList {
	width:100%; 
	max-width: 700px; 
	text-align: center;
}

.mypageDiv {
	width: 90%; 
	max-width:800px; 
	margin: 0 auto; 
	margin-top: 50px;
}

</style> 

</head>
<body>
	<jsp:include page="../main/mycarClHeader.jsp"></jsp:include>
	<div class="mypageDiv" id="mypageDiv">
	
		<ul class="nav nav-tabs">
			<li><a href="#tabmenu_01" data-toggle="tab">예약내역</a></li>
			<li class='active'><a href="#tabmenu_02" data-toggle="tab">내 정보</a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane fade" id="tabmenu_01">
				<jsp:include page="../res/resClList.jsp"></jsp:include>
			</div>
			<div class="tab-pane fade in active" id="tabmenu_02">
				<jsp:include page="./memberClUpdate.jsp"></jsp:include>
			</div>
		</div>
	</div>

	<jsp:include page="../main/mycarFooter.jsp"></jsp:include>

</body>
</html>
