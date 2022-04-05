<%@page import="member.bean.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css" class="svelte-p5qu1m" data-svelte="svelte-1yifjfe">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-2.1.3.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<style>

.btn-default{
    color: #fff!important;
    background-color: #1e1a1b!important;
    border-color: #1e1a1b!important;
}
a {
    color: #1e1a1b;
    text-decoration: none;
}
body {
    font-family: pretendard;
    font-size: 14px;
    
    color: #333;
    background-color: #fff;
}
</style>
<title>Mycar 렌터카</title>
<body style="overflow-x: hidden"style="overflow-y: hidden"><jsp:include page="/view/main/mycarAdHeader.jsp"></jsp:include>
<script>
    function OK()
    {
    	 var val = $('.modal-body #reason').val();
	 		
    	 
    	
 
    	var answer;
    	answer = confirm("삭제사유 : " + val +"가(이) 맞습니까?");
    	if(answer == true){
     //   alert(" 삭제를 완료하였습니다. ");
        document.location.href="memberAdDeleteAction.me?id=${member.mid}&&fieldName= &&page=1 &&viewId= ";
    	}else{
    	return false;	
    	}
    	}
   
   </script>
   
<div class="container"style="text-align: center;">

 <div class="col-sm-8 col-sm-offset-2">
 <legend><h2><a href="memberAdListAction.me">상세 정보 페이지</a></h2></legend>
 
     <form action="memberAdViewAction.me" method="post">
	    <div class="input-group" >
	      <input type="text" class="form-control"name="id" id="id"class="form-control" placeholder="아이디 혹은 이름을 입력하세요.">
	      <span class="input-group-btn">
		<button class="btn btn-default" type="submit"alt="검색"title="검색">검색</button>
	      </span>
	    </div><!-- /input-group -->
	  <!-- /.col-sm-6 -->
	</div><!-- /.row -->  
     </form>
    
   <form class="form-horizontal" role="form"action="memberAdModifyProAction.me" method="POST"name = "modifyform">
                 <div id="legend"style="text-align: center;">
                <div class="form-group col-sm-12 " style="text-align: center;">&nbsp;</div>
                
                <div class="form-group col-sm-12 " style="text-align: center;">
                    <label for="as"class="col-sm-4 control-label" >아이디 :</label>
                    <div class="col-sm-4" style="text-align: center;">
                 <input type="text" id="MID" name="MID" class="form-control" value="${member.mid}" onclick="test7()" readonly>
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label for="lastName" class="col-sm-4 control-label">이름 :</label>
                    <div class="col-sm-4">
                        <input type="text" id="MNAME" name="MNAME" class="form-control"  value="${member.mname}" onclick="test7()"autofocus required readonly>
                    </div>
                </div>
                 <div class="form-group col-sm-12">
                    <label for="birthDate" class="col-sm-4 control-label">생년월일 :</label>
                    <div class="col-sm-4">
                        <input type="date" id="MBIRTH" name="MBIRTH" value="${member.mbirth}" class="form-control"onclick="test7()"readonly required>
                    </div>
                </div>
                 <div class="form-group col-sm-12">
                    <label for="email" class="col-sm-4 control-label">휴대폰 번호 :</label>
                    <div class="col-sm-4">
                        <input type="text" id="MHP" name="MHP"  class="form-control" value="${member.mhp}" onclick="test7()"required readonly>
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label for="email" class="col-sm-4 control-label">우편번호 :</label>
                    <div class="col-sm-4">
                        <input type="text" id="MADDRP" name="MADDRP"  class="form-control" value="${member.maddrp}" onclick="test7()"required readonly>
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label for="email" class="col-sm-4 control-label">주소 :</label>
                    <div class="col-sm-4">
                        <input type="text" id="MADDR" name="MADDR"  class="form-control" value="${member.maddr}" onclick="test7()"required readonly>
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label for="email" class="col-sm-4 control-label">상세주소 :</label>
                    <div class="col-sm-4">
                        <input type="text" id="MADDRD" name="MADDRD"  class="form-control" value="${member.maddrd}" onclick="test7()"required readonly>
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label for="password" class="col-sm-4 control-label">이메일  :</label>
                    <div class="col-sm-4">
                        <input type="email" id="MEMAIL" name="MEMAIL"class="form-control" value="${member.memail}"onclick="test7()"required readonly>
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label for="password" class="col-sm-4 control-label">라이센스 :</label>
                    <div class="col-sm-4">
                        <input type="text" id="MLIC" name="MLIC" class="form-control" value="${member.mlic}"onclick="test7()"required readonly>
                    </div>
                </div>
                
               
                           
               
                <div class="form-group">
                    <div class="col-sm-4 col-sm-offset-4">
                        <span class="help-block">*Required fields</span>
                    </div>
                </div>
                       
              <button type="button"onclick="location.href='memberAdListAction.me'"class="btn btn-default" title="목록으로">목록으로</button>           
                <button type="button"onclick="location.href='memberAdProViewAction.me?id=${member.mid}'"class="btn btn-default"title="수정">수정</button>
           
               <button type="button"class="btn btn-default"data-toggle="modal" data-target="#${member.mid}"title="삭제">삭제</a></td>
       
  </div>
</div>     
</div>            
            </form> <!-- /form -->
         <div class="modal fade" id="${member.mid}" role="dialog">
    <div class="modal-dialog modal-dialog-centered">
     
      <!-- Modal content-->
      <div class="modal-content col-sm-10">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">정말 삭제하시겠습니까?</h4>
        </div>
        <div class="modal-body"><form action="memberAdDeleteAction.me" method="post">
          <p><label >삭제할 아이디 :</label>         
           <input type="text" style="text-align: center;"class="form-control" value="${member.mid}"  readonly >
           <label >삭제할 이름 :</label>         
           <input type="text" style="text-align: center;"class="form-control" value="${member.mname}"  readonly >
           <label >삭제할 생년월일 :</label>         
           <input type="text" style="text-align: center;"class="form-control" value="${member.mbirth}"  readonly >
           <label >삭제할 휴대폰번호 :</label>         
           <input type="text" style="text-align: center;"class="form-control" value="${member.mhp}"  readonly >
           <label >삭제할 주소 :</label>         
           <input type="text" style="text-align: center;"class="form-control" value="${member.maddr}"  readonly >
           <label >삭제할 이메일 :</label>         
           <input type="text" style="text-align: center;"class="form-control" value="${member.memail}"  readonly >
           <label >삭제할 라이센스 :</label>         
           <input type="text" style="text-align: center;"class="form-control" value="${member.mlic}"  readonly >
           <label >삭제 사유 :</label>         
           <input type="text" name="reason" id="reason"  style="text-align: center;"class="form-control"   required  />
        <!--  <input type="text" name="reason1" id="reason1"  style="text-align: center;"class="form-control"   required  />-->   
          <input type="hidden" id="id"name="id"value="${member.mid}">
          <input type="hidden" id="fieldName"name="fieldName" value="">
          <input type="hidden" id="viewId"name="viewId"  value="">
          <input type="hidden" id="page"name="page"  value="">
           </p>
        </div>
        <div class="modal-footer" style="text-align: center;">
         <button type="button" class="btn btn-default" onclick="OK();"> &nbsp&nbsp네&nbsp&nbsp</button>
          <!--   <button type="button" class="btn btn-primary"onclick="OK(); location.href='memberAdDeleteAction.me?id=${member.mid}'" data-dismiss="modal"><span class="glyphicon glyphicon-ok"></span>삭제</button>-->
          <button type="button" class="btn btn-default" data-dismiss="modal">아니요</button>
        </div>
      </div>     
    </div>  </form>
        </div> <!-- ./container -->
    <script>
       function test7() {

	  alert("상세 페이지에선 수정할수없습니다.");

	}
</script>
<jsp:include page="/view/main/mycarFooter.jsp"></jsp:include>
        </body>