<%@page import="member.bean.MemberBean"%>
<%@page import="car.bean.CarBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="member.service.MemberClIdCheckService" %>
<%@ page import="res.service.ResAdCarCheckService" %>
<%
	MemberBean user = (MemberBean) request.getAttribute("user");	
	request.setAttribute("user", user);
	
	CarBean prod = (CarBean) request.getAttribute("prod");	
	request.setAttribute("prod", prod);
	
	MemberClIdCheckService memberClIdCheckService = new MemberClIdCheckService();
	ArrayList<String> memberIdCheckList = memberClIdCheckService.getMemberList();
	
	ResAdCarCheckService resAdCarCheckService = new ResAdCarCheckService();
	ArrayList<String> resCarCheckList = resAdCarCheckService.getCarList();
	
	
%>    
<!DOCTYPE html>
<html>
<head>
 <title>Mycar 렌터카</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
  <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-2.1.3.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<style>
.input-group[class*=col-] {
	    margin: auto;
	    margin-top: 50px;
	}
h2 {
	    margin-top: 30px;
	}
body {
    font-family: pretendard;
    font-size: 14px;
    
    color: #333;
    background-color: #fff;
}		
.btn-default {
    color: #f5f5f5;
    background-color: #1e1a1b;
    border-color: #1e1a1b;
}

</style>

</head>
<body><jsp:include page="../main/mycarAdHeader.jsp"></jsp:include>
<div class="container" style="text-align: center;">
 <h2>예약 추가</h2>
 
 	<form action="resAdUserSearchAction.re" id="userSearchForm" name="userSearchForm" method="post" onsubmit="return false" >
	    <div class="input-group col-sm-4" >
	      <input type="search" class="form-control" name="rid" id="rid" placeholder="아이디를 입력해주세요."  autofocus required>
	      <span class="input-group-btn">
		<button class="btn btn-default pull-right" type="button" onclick="midCheckAction()" id="midCheckButton" name = "midCheckButton" data-toggle="modal" data-target="#errorModal"  title="검색">검색</button>
		<input type="hidden" id="midCheck" name="midCheck" value="N">
		</span>
		</div>
     </form>
     <br>
     <form class="form-horizontal" role="form" action="./resAdInsertProAction.re" method="POST" name = "joinform">
                 <div class="form-group" style="text-align: center;">
                    <label for="MID"class="col-sm-4 control-label" >아  이  디 :</label>
                    <div class="col-sm-4" style="text-align: center;">
                 <input type="text" id="mid" name="mid" class="form-control" value="${user.mid}" required readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label for="mname" class="col-sm-4 control-label">고  객  명 :</label>
                    <div class="col-sm-4">
                        <input type="text" id="mname" name="mname" class="form-control" value="${user.mname}" required readonly>
                    </div>
                </div>
                 <div class="form-group">
                    <label for="mhp" class="col-sm-4 control-label">연  락  처 : </label>
                    <div class="col-sm-4">
                        <input type="text" id="mhp" name="mhp"  class="form-control" value="${user.mhp}" required readonly>
                    </div>
                </div>
                 <div class="form-group">
                    <label for="mlic" class="col-sm-4 control-label">면허 정보 :</label>
                    <div class="col-sm-4">
                        <input type="text" id="mlic" name="mlic"  class="form-control" value="${user.mlic}" required readonly>
                    </div>
                </div>
      </form>
      
                 	<form action="resAdCarSearchAction.re"  id="carSearchForm" method="post">
				    <div class="input-group col-sm-4" >
				      <input type="search" class="form-control col-sm-4" name="id" id="id" placeholder="고객 정보 입력 후 상품을 검색해주세요." readonly>
				      <span class="input-group-btn">
					<button class="btn btn-default pull-right" type="button" title="검색">검색</button>
					</span>
					</div>
			     </form><br>
			     
		<form class="form-horizontal" role="form" action="./resAdInsertProAction.re" method="POST" name = "joinform">
                <div class="form-group ">
                    <label for="ccode" class="col-sm-4 control-label">예약 차량 :</label>
                    <div class="col-sm-4">
                        <input type="text" id="ccode" name="ccode"  class="form-control" value="${prod.cCode}" required readonly>
                    </div>
                </div>
                 <div class="form-group">
                    <label for="cprice" class="col-sm-4 control-label">대여료(일):</label>
                    <div class="col-sm-4">
                        <input type="text" id="cprice" name="cprice" class="form-control" value="${prod.cPrice}" required readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label for="rstart" class="col-sm-4 control-label">예약시작일 :</label>
                    <div class="col-sm-4">
                        <input type="date" id="rstart" name="rstart"  class="form-control" required readonly >
                    </div>
                </div>
                <div class="form-group">
                    <label for="rend" class="col-sm-4 control-label">예약종료일  :</label>
                    <div class="col-sm-4">
                        <input type="date" id="rend" name="rend"class="form-control" required readonly >
                    </div>
                </div>       
        </form>
          
                <button type="button" onclick="location.href='resAdListAction.re'"class="btn btn-default" title="리스트로 돌아가기">돌아가기</button>   
</div>
			<script>
				function midCheckAction() {
				var rid = document.getElementById('rid').value;
				var memberList = "<%=memberIdCheckList%>";
				var memberListArray = memberList.split(", ");
				
				if(rid==""){
					$("#errorName").text("error");
					$("#errorMessage").text("검색어를 입력해주세요");
					document.getElementById('errorModalButton').click();
					return false;
					}
				else if(rid==null){
					$("#errorName").text("error");
					$("#errorMessage").text("검색어를 입력해주세요");
					document.getElementById('errorModalButton').click();
					return false;
					}
				else{
						if(memberListArray.includes(rid)){
							document.getElementById('userSearchForm').submit();
							document.getElementById('midCheck').value = "Y";								
						} else {
							$("#errorMessage").text("존재하지 않는 아이디입니다.");
							document.getElementById('errorModalButton').click();
						return false;
						}
					}
				}
			</script>


		<div class="container">
		<!-- Modal -->
		<div class="modal fade" id="errorModal" role="dialog">
	   	<div class="modal-dialog modal-dialog-centered">
		           <div class="modal-content">
		           	<div class="modal-header">
       		   		<button type="button" class="close" data-dismiss="modal">&times;</button>
<!--           			<h4 class="modal-title" id="errorName">오류</h4> -->
        			</div>
        			<div class="modal-body">
        	  			<p id="errorMessage"></p>
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