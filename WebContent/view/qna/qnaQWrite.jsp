<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mycar 렌터카</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
h2 {
	font-size: 24pt;
	text-align: center;
	font-family: Pretendard !important;
}

table {
	margin:0 auto;
	padding: 0;
	width: 100%;
	max-width: 800px;
	font-family: Pretendard !important;
	
}

.td_left {
	width: 20%;
	font-size: 18pt;
	text-align: center;
	
}

.td_right {
	width: 80%;
}
#hrOne {
	border: 1px solid black;
	max-width: 800px;
}

#hrTwo {
	border: 1px solid gray;
	max-width: 800px;
}
hr { max-width: 800px; }
#commandCell {
	text-align: center;
}
#writeForm {
	width: 95%;
	margin: 0 auto;
	font-family: Pretendard !important;
}
textarea {
	width: 100%;
	height: 6.25em;
	border: none;
	resize: none;
	font-family: Pretendard !important;
}
.btn-default {
	color: #f5f5f5 !important;
	background-color: #1e1a1b !important;
	border-color: #1e1a1b !important;
}
</style>
</head>
<body>
<jsp:include page="/view/main/mycarClHeader.jsp"></jsp:include>
	<!-- 게시판 등록 -->

	<section id="writeForm">
		<h2>QnA</h2>
		<br />
		<hr id="hrOne">
		<br/>
		<form action="/mycar/qnaQWritePro.qn" method="post">
			<table>
				<tr>
					<td class="td_left"><label for="QTITLE">제 목</label></td>
					<td class="td_right"><input name="QTITLE" type="text" class="form-control"
						id="QTITLE" required="required" placeholder="제목을 입력해주세요." title="제목 입력 칸" alt="제목 입력 칸"/></td>
				</tr>
			</table>
			<br/>
			<hr/>
			<br/>
			<table>
				<tr>
					<td class="td_left"><label for="QCON">내 용</label></td>
					<td class="td_right"><textarea id="QCON" name="QCON" class="form-control"
							cols="50" rows="15" required="required" placeholder="내용을 입력해주세요." title="내용 입력 칸" alt="내용 입력 칸"></textarea></td>
				</tr>
			</table>
			<br/>
			<hr/>
			<br/>
			<section id="commandCell">
				<input type="submit" class="btn btn-default" value="등록" title="게시글 등록하기 버튼" alt="게시글 등록하기 버튼"/>&nbsp;&nbsp;
				<input type="reset" class="btn btn-default" value="다시쓰기" title="게시글 다시쓰기 버튼" alt="게시글 다시쓰기 버튼"/>
			</section>
		</form>
	</section>
	<!-- 게시판 등록 -->
<jsp:include page="/view/main/mycarFooter.jsp"></jsp:include>
</body>
</html>