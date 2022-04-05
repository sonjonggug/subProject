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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 

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


String nowPage = request.getParameter("page");
String cCode = request.getParameter("cCode");
String cType = request.getParameter("ctype");
String cSize = request.getParameter("csize");

CarBean carbean = rescldao.selectCar(cCode);
String car = carbean.getcSize();
String rent = carbean.getcType();
String seat = carbean.getcSeat();
int price = carbean.getcPrice();

String rstart = request.getParameter("rstart");
String rend = request.getParameter("rend");

Date start = new SimpleDateFormat("yyyy-MM-dd").parse(rstart);
Date end = new SimpleDateFormat("yyyy-MM-dd").parse(rend);

long diffSec = (end.getTime() - start.getTime()) / 1000; //초 차이
long diffDays = diffSec / (24*60*60); //일자수 차이


%>
<script>
function modalshow() {
	  $('#resmodal').modal('show';);
 };

 
</script>
</head>
<body>
<jsp:include page="../main/mycarClHeader.jsp"></jsp:include>


<form class="form-horizontal" role="form" name="resClWriteForm">
<br/>
<div id="legend"style="text-align: center;">
<div class="container text-center">
<div class="form-group" style="text-align: center; margin: auto;">
<h1 title="예약하기">예약하기</h1>
</div>
<br/><br/>
<div class="form-group" style="text-align: center; margin: auto;">
<h2 title="예약자 정보">예약자 정보</h2>
</div><br/>
<div class="form-group" style="text-align: center; margin: auto;">
	<label class="col-sm-5 col-lg-5 control-label" style="text-align: right;" title="이름  <%=member.getMname() %>">이름 :</label>
	<div class="col-sm-3 col-lg-2" style="text-align: center;">
	<input type="text" class="form-control" value="<%=member.getMname() %>" readonly>
	</div>

</div>
<br/>
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
</div><br/>
<div class="form-group" style="text-align: center; margin: auto;">
	<label class="col-sm-5 col-lg-5 control-label" title="상품 번호">상품 번호 :</label>
	<div class="col-sm-3 col-lg-2" style="text-align: center;">
	<input type="text" class="form-control" id="rcode" name="rcode" value="<%=cCode%>" readonly>
	</div>
</div><br/>
<%
if(rent.equals("short")) {
	rent = "단기 렌탈";
} else {
	rent = "장기 렌탈";
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

long cprice = carbean.getcPrice();
long rtotal = cprice * diffDays;

DecimalFormat df = new DecimalFormat("###,###");
String cprices = df.format(cprice)+"원";
String rtotals = df.format(rtotal)+"원";
%>
<div class="form-group" style="text-align: center; margin: auto;">
	<label class="col-sm-5 col-lg-5 control-label" title="예약 타입">예약 타입 :</label>
	<div class="col-sm-3 col-lg-2" style="text-align: center;">
	<input type="text" class="form-control" id="rent" name="rent" value="<%=rent %>" readonly>
	</div>
</div><br/>
<div class="form-group" style="text-align: center; margin: auto;">
	<label class="col-sm-5 col-lg-5 control-label" title="크기">크기 :</label>
	<div class="col-sm-3 col-lg-2" style="text-align: center;">
	<input type="text" class="form-control" id="car" name="car" value="<%=car %>" readonly>
	</div>
</div><br/>
<div class="form-group" style="text-align: center; margin: auto;">
	<label class="col-sm-5 col-lg-5 control-label" title="승차인원">승차인원 :</label>
	<div class="col-sm-3 col-lg-2" style="text-align: center;">
	<input type="text" class="form-control" id="seat" name="seat" value="<%=seat %>" readonly>
	</div>
</div><br/>
<div class="form-group" style="text-align: center; margin: auto;">
	<label class="col-sm-5 col-lg-5 control-label" title="단가">단가 :</label>
	<div class="col-sm-3 col-lg-2" style="text-align: center;">
	<input type="text" class="form-control" id="cprice" name="cprice" value="<%=cprices %>" readonly>
	</div>
</div><br/>
<div class="form-group" style="text-align: center; margin: auto;">
	<label class="col-sm-5 col-lg-5 control-label" title="예약시작일">예약시작일 :</label>
	<div class="col-sm-3 col-lg-2" style="text-align: center;">
	<input type="text" class="form-control" id="rstart" name="rstart" value="<%=rstart %>" readonly>
	</div>
</div><br/>
<div class="form-group" style="text-align: center; margin: auto;">
	<label class="col-sm-5 col-lg-5 control-label" title="예약종료일">예약종료일 :</label>
	<div class="col-sm-3 col-lg-2" style="text-align: center;">
	<input type="text" class="form-control" id="rend" name="rend" value="<%=rend %>" readonly>
	</div>
</div><br/>
<div class="form-group" style="text-align: center; margin: auto;">
	<label class="col-sm-5 col-lg-5 control-label" title="총 금액">총 금액 :</label>
	<div class="col-sm-3 col-lg-2" style="text-align: center;">
	<input type="text" class="form-control" id="rtotal" name="rtotal" value="<%=rtotals %>" readonly>
	</div>
</div><br/>
<input type="hidden" id="cCode" name="cCode" value="<%=cCode%>">
<input type="hidden" id="page" name="page" value="<%=nowPage%>">
<input type="hidden" id="cType" name="cType" value="<%=cType%>">
<input type="hidden" id="cSize" name="cSize" value="<%=cSize%>">

<div class="form-group" style="text-align: center; margin: auto;">
<button type="button" class="btn btn-default" style="background-color: #1e1a1b; color: #fff;" id="back" name="back" title="뒤로가기" onClick="location.href='/mycar/carClDetail.ca?ctype=<%=cType%>&csize=<%=cSize%>&cCode=<%=cCode%>&page=<%=nowPage%>'">뒤로가기</button>&nbsp;&nbsp;&nbsp;
<button type="button" class="btn btn-default" style="background-color: #1e1a1b; color: #fff;" title="예약하기" onclick="modalshow();" data-toggle="modal" data-target="#resmodal">예약하기</button>
</div>
</div>
</div>
</form>
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
            	<button type="button" onclick="location.href='/mycar/resClCheck.re?rcode=<%=cCode %>&rstart=<%=rstart %>&rend=<%=rend %>'" data-dismiss="modal" class="btn btn-secondary">네</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">아니오</button>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/view/main/mycarFooter.jsp"></jsp:include> 
</body>
</html>
