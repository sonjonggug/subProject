<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="res.bean.ResClCheckBean" %>
<%@ page import="res.bean.ResClBean" %>
<%@ page import="car.bean.CarBean" %>
<%@ page import="res.service.ResClDetailService" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="res.dao.ResClDAO" %>
<%@ page import="res.bean.PageInfo" %>
<%@ page import="static db.JdbcUtil.*"%>
<%@ page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mycar 렌터카</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-2.1.3.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<style>
body { 
margin: 0;
font-family: pretendard;
font-size: 14px;
}
div.form-group {width:100%; margin:auto;}

</style>

<%
	ResClCheckBean resclckbean = (ResClCheckBean)request.getAttribute("resclckbean");
	ResClDetailService rescldetailservice = new ResClDetailService();	
	String rcode = resclckbean.getRcode();
	CarBean carbean = rescldetailservice.getCar(rcode);
	ResClBean resclbean = (ResClBean)request.getAttribute("resclbean");
	request.setAttribute("rnum", resclckbean.getRnum());
	Connection conn = getConnection();
	ResClDAO rescldao = ResClDAO.getInstance();
	rescldao.setConnection(conn);
	
	String nowPage = request.getParameter("page");
	String rent = carbean.getcType();
	String car = carbean.getcSize();
	String gear = carbean.getcGear();
	String fuel = carbean.getcFuel();	

%>
</head>
<body>
<jsp:include page="../main/mycarClHeader.jsp"></jsp:include>
<form class="form-horizontal" role="form" >
<div id="legend"style="text-align: center;">
<div class="form-group" style="text-align: center; margin: auto;">
<h2 title="예약 상세 내역">예약 상세 내역</h2>
</div><br/>
<%
if(rent.equals("short")) {
	rent = "단기렌탈";
} else if (rent.equals("long")){
	rent = "장기렌탈";
}

if(car.equals("min")) {
	car = "경차";
} else if (car.equals("sma")){
	car = "소형차";
} else if (car.equals("mid")){
	car = "중형차";
} else if (car.equals("big")){
	car = "대형차";
} else if (car.equals("van")){
	car = "승합차";
} else if (car.equals("suv")){
	car = "SUV";
}

if(gear.equals("au")) {
	gear = "오토차량";
} else if(gear.equals("su")){
	gear = "수동차량";
}

if(fuel.equals("gas")) {
	fuel = "휘발유";
} else if(fuel.equals("oil")){
	fuel = "경유";
}


DecimalFormat df = new DecimalFormat("###,###");
String rtotal = df.format(resclckbean.getRtotal())+"원";
String cprice = df.format(carbean.getcPrice())+"원";
%>
<div class="form-group" style="text-align: center; margin: auto;">
	<label class="col-sm-5 control-label" title="예약 번호 : <%=resclckbean.getRnum() %>">예약 번호 :</label> 
	<div class="col-sm-2" style="text-align: center;">
	<input type="text" class="form-control" value="<%=resclckbean.getRnum() %>" readonly>
	</div>
</div><br/>
<div class="form-group" style="text-align: center; margin: auto;">
	<label class="col-sm-5 control-label" title="예약 타입 : <%=rent %>">예약 타입 :</label> 
	<div class="col-sm-2" style="text-align: center;">
	<input type="text" class="form-control" value="<%=rent %>" readonly>
	</div>
</div><br/>
<div class="form-group" style="text-align: center; margin: auto;">
	<label class="col-sm-5 control-label" title="차량 코드 : <%=resclckbean.getRcode() %>">차량 코드 :</label>
	<div class="col-sm-2" style="text-align: center;">
	<input type="text" class="form-control" value="<%=resclckbean.getRcode() %>" readonly>
	</div>
</div><br/>
<div class="form-group" style="text-align: center; margin: auto;">
	<label class="col-sm-5 control-label" title="가격 : <%=cprice %>">가격 :</label>
	<div class="col-sm-2" style="text-align: center;">
	<input type="text" class="form-control" value="<%=cprice %>" readonly>
	</div>
</div><br/>
<div class="form-group" style="text-align: center; margin: auto;">
	<label class="col-sm-5 control-label" title="예약시작일 : <%=resclckbean.getRstart() %>">예약시작일 :</label>
	<div class="col-sm-2" style="text-align: center;">
	<input type="text" class="form-control" value="<%=resclckbean.getRstart() %>" readonly>
	</div>
</div><br/>
<div class="form-group" style="text-align: center; margin: auto;">
	<label class="col-sm-5 control-label" title="예약종료일 : <%=resclckbean.getRend() %>">예약종료일 :</label>
	<div class="col-sm-2" style="text-align: center;">
	<input type="text" class="form-control" value="<%=resclckbean.getRend() %>" readonly>
	</div>
</div><br/>
<div class="form-group" style="text-align: center; margin: auto;">
	<label class="col-sm-5 control-label" title="총 금액 : <%=rtotal %>">총 금액 :</label>
	<div class="col-sm-2" style="text-align: center;">
	<input type="text" class="form-control" value="<%=rtotal %>" readonly>
	</div>
</div><br/>
<div class="form-group" style="text-align: center; margin: auto;">
	<label class="col-sm-5 control-label" title="예약 취소 여부 : <%=resclckbean.getRcancel() %>">예약 취소 여부 :</label>
	<div class="col-sm-2" style="text-align: center;">
	<input type="text" class="form-control" value="<%=resclckbean.getRcancel() %>" readonly>
	</div>
</div><br/>
<br/>
<div class="form-group" style="text-align: center; margin: auto;">
<h3 title="예약 차량 정보">예약 차량 정보</h3>
</div>
<div class="form-group" style="text-align: center; margin: auto;">
	<label class="col-sm-5 control-label" title="차량 크기 : <%=car %>">차량 크기 :</label>
	<div class="col-sm-2" style="text-align: center;">
	<input type="text" class="form-control" value="<%=car %>" readonly>
	</div>
</div><br/>
<div class="form-group" style="text-align: center; margin: auto;">
	<label class="col-sm-5 control-label" title="차 종 : <%=carbean.getcName() %>">차 종 :</label>
	<div class="col-sm-2" style="text-align: center;">
	<input type="text" class="form-control" value="<%=carbean.getcName() %>" readonly>
	</div>
</div><br/>
<div class="form-group" style="text-align: center; margin: auto;">
	<label class="col-sm-5 control-label" title="기어 : <%=gear %>">기어 :</label>
	<div class="col-sm-2" style="text-align: center;">
	<input type="text" class="form-control" value="<%=gear %>" readonly>
	</div>
</div><br/>
<div class="form-group" style="text-align: center; margin: auto;">
	<label class="col-sm-5 control-label" title="연료 : <%=fuel %>">연료 :</label>
	<div class="col-sm-2" style="text-align: center;">
	<input type="text" class="form-control" value="<%=fuel %>" readonly>
	</div>
</div><br/>
<div class="form-group" style="text-align: center; margin: auto;">
	<label class="col-sm-5 control-label" title="승차인원 : <%=carbean.getcSeat() %>">승차인원 :</label>
	<div class="col-sm-2" style="text-align: center;">
	<input type="text" class="form-control" value="<%=carbean.getcSeat() %>" readonly>
	</div>
</div><br/>
<br/>
<input type="hidden" value="<%=nowPage %>">
<div class="form-group" style="text-align: center; margin: auto;">
	<button type="button" class="btn btn-default" style="background-color: #1e1a1b; color: #fff;" id="list" name="list" class="btn btn-primary" title="목록으로" onClick="location.href='/mycar/memberClViewAction.me?page=<%=nowPage%>'">목록으로</button>&nbsp;&nbsp;&nbsp;
	<%
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyMMdd");
		Date now = new Date();
		String today = dateFormat.format(now);
		int today2 = Integer.parseInt(today);
		StringTokenizer st = new StringTokenizer(resclckbean.getRstart(), "-");
		ArrayList<String> st1 = new ArrayList<String>();
		while(st.hasMoreTokens()) {
			st1.add(st.nextToken());
		}
		String st2 = st1.get(0) + st1.get(1) + st1.get(2);
		int rstart = Integer.parseInt(st2);
		String cancel = resclckbean.getRcancel();
		
		if((cancel.equals("N")) && (today2 < rstart)) { %>
			<button type="button" class="btn btn-default" style="background-color: #1e1a1b; color: #fff;" id="modify" name="modify" title="예약변경" onClick="location.href='/mycar/resClModifyForm.re?rnum=<%=resclckbean.getRnum() %>&page=<%=nowPage%>'">예약변경</button>&nbsp;&nbsp;&nbsp; 
 			<button type="button" class="btn btn-default" style="background-color: #1e1a1b; color: #fff;" id="cancel" name="cancel" data-toggle="modal" data-target="#cancel_modal" data-backdrop="static" data-keyboard="false" title="예약취소">예약취소</button>
 			<div class="modal fade" id="cancel_modal" role="dialog">
            	<div class="modal-dialog">
 					<div class="modal-content">
            			<div class="modal-header">
 							<button type="button" class="close" data-dismiss="modal">&times;</button>
 						<h5 class="modal-title">예약 취소</h5>
           				</div>
           				<div class="modal-body">
                                	정말로 예약을 취소 하시겠습니까?
               			</div>   
               			<div class="modal-footer">
                			<button type="button" class="btn btn-secondary btn" data-dismiss="modal" title="창닫기">창닫기</button>
                 			<button type="button" onclick="location.href='resClCancel.re?rnum=<%=resclckbean.getRnum() %>'" class="btn btn-secondary btn" title="예약취소">예약취소</button>
                		</div>
   				 	</div>
  				</div>
     		 </div>
			
	<% 	} else { 
		} %>
</div>
</div>
</form>
<jsp:include page="/view/main/mycarFooter.jsp"></jsp:include> 
</body>
</html>