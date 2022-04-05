<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>공지 등록 | MyCar</title>
<style type="text/css">
h2 {
	font-size: 24pt;
	text-align: center;
}

table {
	margin: 0 auto;
	padding: 0;
	width: 95%;
	max-width: 700px;
	
}
.btn-default {
	background-color: #0a212c;
	color: white;
}
.td_left {
	width: 20%;
	font-size: 18pt;
	text-align: center;
}

.td_right {
	width: 80%;
}
body {
    font-family: pretendard !important;
    font-size: 14px;
    line-height: 1.42857143;
    color: #333;
    background-color: #fff;
}
#hrOne {
	border: 1px solid black;
	max-width: 700px;
}

#hrTwo {
	border: 1px solid gray;
	max-width: 700px;
}
hr {
	max-width: 700px;
}
#commandCell {
	text-align: center;
}

#writeForm {
	width: 90%;
	margin: 0 auto;
}
textarea {
	width: 100%;
	height: 6.25em;
	border: none;
	resize: none;
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
<body>
<jsp:include page="../main/mycarAdHeader.jsp"></jsp:include>


	<%
		String strReferer = request.getHeader("referer");
		if (strReferer == null) {
	%>
	<script>
		alert("Error");
		document.location
		href = "return jsp or URL";
	</script>
	<%
		return;
		}
	%>
	<!-- 게시판 등록 -->
		<br />
		<br />

	<section id="writeForm">
		<h2>공지 사항 등록</h2>
		<br />
		<hr id="hrOne">
		<br />
		<form action="noticeWritePro.no" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td class="td_left"><label for="NTITLE">제 목</label></td>
					<td class="td_right"><input name="NTITLE" type="text"
						class="form-control" id="NTITLE" required="required"
						placeholder="제목을 입력해주세요." title="제목 입력 칸" alt="제목 입력 칸" /></td>
				</tr>
				</table>
				<br />
				<hr />
				<br />
				<table>
				<tr>
					<td class="td_left"><label for="NCON">내 용</label></td>
					<td class="td_right"><textarea id="NCON" name="NCON" class="form-control"
							cols="60" rows="15" required="required" placeholder="내용을 입력해주세요." title="내용 입력 칸" alt="내용 입력 칸"></textarea>
				</tr>
				</table>
				<br />
				<hr />
				<br />
				<table>
				<tr>
					<td class="td_left"><label for="NFILE">파일 첨부</label></td>
					<td class="td_right"><input name="NFILE" type="file" 
						onchange="fileCheck(this)" accept="image/gif, image/jpeg, image/png" id="NFILE" title="파일 첨부"></td>
				</tr>
			</table>
			<br/>
			<hr/>
			<br/>
			<section id="commandCell">
				<div class="vstack gap-2 col-md-12 mx-auto">
					<input class="btn btn-default" type="submit" value="등록" title="등록">&nbsp;&nbsp;
				</div>
				<br />
				<br />
				<div class="vstack gap-2 col-md-12 mx-auto">
					<input class="btn btn-default" type="reset" value="다시쓰기" title="다시쓰기">&nbsp;&nbsp;
					<input class="btn btn-default" type="button" value="뒤로가기" onclick="history.back(-1);" title="뒤로가기">
				</div>
			</section>
		</form>
	</section>
	<!-- 게시판 등록 -->
	<jsp:include page="../main/mycarFooter.jsp"></jsp:include>
	
</body>
</html>