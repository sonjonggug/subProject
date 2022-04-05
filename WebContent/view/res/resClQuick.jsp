<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.bean.MemberBean" %>
<%@ page import="member.service.MemberClViewService" %>
<%@ page import="car.bean.CarBean" %>
<%@ page import="res.dao.ResClDAO" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="static db.JdbcUtil.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

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
#legend {margin: auto; max-width: 1000px; border: 1px solid }
div.container {
margin: 3% -5%; 
}
</style>


<title>Mycar 렌터카</title>

<%
	request.setCharacterEncoding("UTF-8");
	String rid = (String)session.getAttribute("id");
	MemberClViewService memberClViewService = new MemberClViewService();
	MemberBean member = memberClViewService.getMember(rid);
	
	Connection conn = getConnection();
	ResClDAO rescldao = ResClDAO.getInstance();
	rescldao.setConnection(conn);
	
	String car = request.getParameter("car");
	String rent = request.getParameter("rent");
	String gear = request.getParameter("gear");
	String fuel = request.getParameter("fuel");	
	String seat = request.getParameter("seat");
	
	String rstart = request.getParameter("rstart");
	String rend = request.getParameter("rend");
	
	Date start = new SimpleDateFormat("yyyy-MM-dd").parse(rstart);
    Date end = new SimpleDateFormat("yyyy-MM-dd").parse(rend);
    
    long diffSec = (end.getTime() - start.getTime()) / 1000; //초 차이
    long diffDays = diffSec / (24*60*60); //일자수 차이
	
	ArrayList<CarBean> carlist = rescldao.carlist(car, rent, gear, fuel, seat);

%>

</head>
<body>
<jsp:include page="../main/mycarClHeader.jsp"></jsp:include>
<div id="legend"style="text-align: center;">
<div class="container text-center">
<form class="form-horizontal" action="/mycar/resClCheck.re" method="post" role="form" name="resClQuick">
<div class="form-group" style="text-align: center; margin: auto;">
<h1 title="빠른 예약">빠른 예약</h1>
</div><br/>
<div class="form-group" style="text-align: center; margin: auto;">
<h2 title="예약자 정보">예약자 정보</h2>
</div>
<div class="form-group" style="text-align: center; margin: auto;">
	<label class="col-sm-5 col-lg-5 control-label" title="이름  <%=member.getMname() %>">이름 :</label>
	<div class="col-sm-3 col-lg-2" style="text-align: center; ">
	<input type="text" class="form-control" value="<%=member.getMname() %>" readonly>
	</div>
</div><br/>
<div class="form-group" style="text-align: center; margin: auto;">
	<label class="col-sm-5 col-lg-5 control-label" title="연락처  <%=member.getMhp() %>">연락처 :</label>
	<div class="col-sm-3 col-lg-2" style="text-align: center;">
	<input type="text" class="form-control" value="<%=member.getMhp() %>" readonly>
	</div>
</div><br/>
<div class="form-group" style="text-align: center; margin: auto;">
	<label class="col-sm-5 col-lg-5 control-label" title="면허번호 <%=member.getMlic() %>">면허번호 :</label>
	<div class="col-sm-3 col-lg-2" style="text-align: center;">
	<input type="text" class="form-control" value="<%=member.getMlic() %>" readonly>
	</div>
</div><br/>

<br/><br/><br/>

<div class="form-group" style="text-align: center; margin: auto;">
<h2 title="예약 내용">예약 내용</h2>
</div>
<div class="form-group" style="text-align: center; margin: auto;">
	<label class="col-sm-5 col-lg-5 control-label" title="차량 선택  ">차량 선택 :</label>
	<div class="col-sm-3 col-lg-2" style="text-align: center;">
		<select class="form-control" id="rcode" name="rcode" onchange="select(this)" required>
			<option class="form-control" value="">선택</option>
				<%
  					for (int i=0; i < carlist.size(); i++) { 
				%> 
			<option class="form-control" title="<%=carlist.get(i).getcCode()%>" value="<%=carlist.get(i).getcCode()%>"><%=carlist.get(i).getcCode()%></option>
			
				<%
 					}
				%>
		</select>
	</div>
</div><br/>
<script>
function select(e) {
	  // 선택된 데이터 가져오기
	  var rcode = e.value;
	  var link1 = "location.href='resClCheck.re?rcode=";
	  var link2 = "&rstart=<%=rstart%>&rend=<%=rend%>'";
	  var link = link1 + rcode + link2;
	$('#modalyes').attr("onclick", link);
}

</script>
<%
if(rent.equals("short")) {
	rent = "단기렌탈";
} else {
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

long cprice = carlist.get(0).getcPrice();
long rtotal = cprice * diffDays;

DecimalFormat df = new DecimalFormat("###,###");
String cprices = df.format(cprice)+"원";
String rtotals = df.format(rtotal)+"원";
%>

<div class="form-group" style="text-align: center; margin: auto;">
	<label class="col-sm-5 col-lg-5 control-label" title="예약 타입">예약 타입 :</label>
	<div class="col-sm-3 col-lg-2" style="text-align: center;">
	<input type="text" class="form-control" value="<%=rent %>" readonly>
	</div>
</div><br/>
<div class="form-group" style="text-align: center; margin: auto;">
	<label class="col-sm-5 col-lg-5 control-label" title="차량 크기">차량 크기 :</label>
	<div class="col-sm-3 col-lg-2" style="text-align: center;">
	<input type="text" class="form-control" value="<%=car %>" readonly>
	</div>
</div><br/>
<div class="form-group" style="text-align: center; margin: auto;">
	<label class="col-sm-5 col-lg-5 control-label" title="승차인원">승차인원 :</label>
	<div class="col-sm-3 col-lg-2" style="text-align: center;">
	<input type="text" class="form-control" value="<%=seat %>" readonly>
	</div>
</div><br/>
<div class="form-group" style="text-align: center; margin: auto;">
	<label class="col-sm-5 col-lg-5 control-label" title="가격">가격 :</label>
	<div class="col-sm-3 col-lg-2" style="text-align: center;">
	<input type="text" class="form-control" value="<%=cprices %>" readonly>
	</div>
</div><br/>
<div class="form-group" style="text-align: center; margin: auto;">
	<label class="col-sm-5 col-lg-5 control-label" title="예약시작일">예약시작일 :</label>
	<div class="col-sm-3 col-lg-2" style="text-align: center;">
	<input type="text" class="form-control" name="rstart" value="<%=rstart %>" readonly>
	</div>
</div><br/>
<div class="form-group" style="text-align: center; margin: auto;">
	<label class="col-sm-5 col-lg-5 control-label" title="예약종료일">예약종료일 :</label>
	<div class="col-sm-3 col-lg-2" style="text-align: center;">
	<input type="text" class="form-control" name="rend" value="<%=rend %>" readonly>
	</div>
</div><br/>
<div class="form-group" style="text-align: center; margin: auto;">
	<label class="col-sm-5 col-lg-5 control-label" title="총 금액">총 금액 :</label>
	<div class="col-sm-3 col-lg-2" style="text-align: center;">
	<input type="text" class="form-control" value="<%=rtotals %>" readonly>
	</div>
</div><br/>
<div class="form-group" style="text-align: center; margin: auto;">
<button type="button" class="btn btn-default" style="background-color: #1e1a1b; color: #fff;" id="back" name="back" title="뒤로가기" onClick="location.href='/mycar/resClQuickForm.re'">뒤로가기</button>&nbsp;&nbsp;&nbsp;
<button type="button" class="btn btn-default" style="background-color: #1e1a1b; color: #fff;" data-toggle="modal" data-target="#resmodal" title="예약하기">예약하기</button>
</div>
</form>
</div>
</div>
<div id="resmodal" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" >
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" style="color: #000;">예약 확정</h5>
            </div>
            <div class="modal-body">
                <p>예약하시겠습니까?</p>
            </div>
            <div class="modal-footer">
            	<button id="modalyes" type="button" data-dismiss="modal" class="btn btn-secondary">네</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">아니오</button>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/view/main/mycarFooter.jsp"></jsp:include> 
</body>
</html>
