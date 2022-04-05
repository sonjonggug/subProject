<%@page import="member.bean.MemberBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	MemberBean member = (MemberBean) request.getSession().getAttribute("member");
	// System.out.println(member);
	String id = (String)session.getAttribute("id");
	// System.out.println(id);
	request.setAttribute("fromURI", request.getAttribute("fromURI"));
	System.out.println("헤더에 찍힌 fromURI = " + request.getAttribute("fromURI"));
	
	if(id != null){
		if(id.equals("admin")){
		out.println("<script>");
		out.println("alert('관리자 계정으로 접속하였습니다.');");
		out.println("location.href='/mycar/admin.me';");
		out.println("</script>");	
		}
	}
%>    

<head>
  <meta charset="utf-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css" class="svelte-p5qu1m" data-svelte="svelte-1yifjfe">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<style>
/* header { */
/*     width: 100%; */
/*     height: 20px; */
/*     position: fixed; */
/*     top: 0; */
/*     left: 0; */
/*   	z-index: 30; */
/* } */
.navbar-brand {
font-size: 5em !important;
font-family: Pretendard;
}
.navbar-header {
height: 120px;
padding: 1em;
padding-top: 0.5em;
margin-left: 3% !important;
}
.navbar-nav {
color: #efefef;
padding-left: 1em !important;
padding-right: 1em !important;
font-size: 2.5em;
font-family: Pretendard;
line-height: 1em;
}
.nav>li {
margin: auto;
padding: 0;
}
.navbar-nav>li>a {
    line-height: 2.5em !important;
}
.navbar-right>li>a {
    line-height: 3.6em !important;
}
.navbar-right li {
font-size: 0.7em;
}
.navbar-inverse {
background-color: #1e1a1b;
border-color: #1e1a1b;
}

.navbar-inverse .navbar-nav>li>a {
    color: white !important;
}
.navbar-inverse .navbar-nav>li>a:hover {
    color: white !important;
}
.navbar-inverse .navbar-brand {
    color: white !important;
}
.navbar-inverse .navbar-brand:hover {
    color: white !important;
}
#myNavbar {
	line-height: 1em;
}
#mycarLogo {
	line-height: 1em;
}
.navbar-toggle {
	margin-top: 35px !important;
}
@media screen and (max-width: 767px) {
   .navbar-brand {
   		font-size: 3em !important;
	}
	.navbar-header {
		padding-top: 1.6em;
		padding-left: 0 !important;
		margin-left: 0 !important;
	}
	.navbar-toggle {
		margin-top: 23px !important;
	}					
	.navbar-nav {
		font-size: 2em !important;
	}
	.navbar-nav>li>a {
	    line-height: 1.5em !important;
	}
	.navbar-right>li>a {
    	line-height: 1.5em !important;
    	margin-left: 1.5em !important;
	}
}
@media screen and (min-width: 768px) and (max-width: 1023px) {
   .navbar-brand {
   		font-size: 3em !important;
	}
	.navbar-header {
		width: 150px;
		padding: 0;
		padding-top: 1.6em;
		margin-left: 1% !important;
	}	
	.navbar-nav {
		font-size: 1.1em !important;
	}
	.navbar-nav > li > a {
		padding: 0 !important;
    	line-height: 7.7em !important;
	}
	.navbar-right>li>a {
    	line-height: 11em !important;
	}		
}
@media screen and (min-width: 1023px) and (max-width: 1833px) {
   .navbar-brand {
   		font-size: 4em !important;
	}
	.navbar-header {
		width: 200px;
		padding: 0;
		padding-top: 1em;
		margin-left: 1% !important;
	}	
	.navbar-nav {
		font-size: 1.5em !important;
	}
	.navbar-nav > li > a {
		padding: 0 !important;
    	line-height: 5.5em !important;
	}
	.navbar-right>li>a {
    	line-height: 8em !important;
	}		
}
</style>

<script>
function idcheck() { 
	var id = '<%= (String)session.getAttribute("id")%>'; 
		  
	 	  if(id == "null"){
	 		  $('#modal').modal('show');
			    
	 	  }else if(id != "null"){
	 		 location.href="http://localhost:8080/mycar/resClQuick.re";
	 		  }
	 	  };

</script>

</head>
<body>

<header>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="http://localhost:8080/mycar" title="Mycar 메인 인덱스 링크로 이동"><strong id="mycarLogo">&nbsp;MyCar&nbsp;&nbsp;&nbsp;</strong>
      </a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav" id="mainNav2">
        <li><a href="http://localhost:8080/mycar/carClList.ca?ctype=short" title="단기렌트 메뉴 링크로 이동">&nbsp;&nbsp;&nbsp;단기렌트&nbsp;&nbsp;&nbsp;</a></li>
        <li><a href="http://localhost:8080/mycar/carClList.ca?ctype=long" title="장기렌트 메뉴 링크로 이동">&nbsp;&nbsp;&nbsp;장기렌트&nbsp;&nbsp;&nbsp;</a></li>
        <li><a href="" onclick="return idcheck();" data-toggle="modal" data-target="#modal" data-backdrop="static" data-keyboard="false" title="예약하기 메뉴 링크로 이동">&nbsp;&nbsp;&nbsp;예약하기&nbsp;&nbsp;&nbsp;</a></li>
        <li><a href="http://localhost:8080/mycar/qnaQClList.qn" title="QnA 메뉴 링크로 이동">&nbsp;&nbsp;&nbsp;QnA&nbsp;&nbsp;&nbsp;</a></li>
        <li><a href="http://localhost:8080/mycar/noticeList.no" title="공지사항 메뉴 링크로 이동">&nbsp;&nbsp;&nbsp;공지사항&nbsp;&nbsp;&nbsp;</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      <%
    if(id == null){
		if (request.getParameter("fromURI") != null){
		%>
		<li><a href="http://localhost:8080/mycar/memberClLogin.me?fromURI=<%=request.getParameter("fromURI")%>" title="로그인 링크로 이동"><span class="glyphicon glyphicon-log-in"></span> 로그인&nbsp;</a></li>
   	 	<li><a href="http://localhost:8080/mycar/memberClJoin.me?fromURI=<%=request.getParameter("fromURI")%>" title="회원가입 링크로 이동"><span class="glyphicon glyphicon-user"></span> 회원가입&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
   	 	<%
		} else if(request.getAttribute("fromURI") != null){
		%>			
		<li><a href="http://localhost:8080/mycar/memberClLogin.me?fromURI=${fromURI}" title="로그인 링크로 이동"><span class="glyphicon glyphicon-log-in"></span> 로그인&nbsp;</a></li>
        <li><a href="http://localhost:8080/mycar/memberClJoin.me?fromURI=${fromURI}" title="회원가입 링크로 이동"><span class="glyphicon glyphicon-user"></span> 회원가입&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
        <%
		} else {
		%>
		<li><a href="http://localhost:8080/mycar/memberClLogin.me" title="로그인 링크로 이동"><span class="glyphicon glyphicon-log-in"></span> 로그인&nbsp;</a></li>
	    <li><a href="http://localhost:8080/mycar/memberClJoin.me" title="회원가입 링크로 이동"><span class="glyphicon glyphicon-user"></span> 회원가입&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
	    <%
		}
    }
    else{
%>
        <li><a href="memberClLogout.me" title="로그아웃 링크로 이동"><span class="glyphicon glyphicon-log-out"></span> 로그아웃&nbsp;</a></li>
        <li><a href="memberClViewAction.me?page=1" title="마이페이지 링크로 이동"><span class="glyphicon glyphicon-user"></span> 마이페이지&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
        <%
    }
%>
      </ul>
    </div>
  </div>
</nav>
</header>

<div id="modal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" style="color: #000;">로그인</h5>
            </div>
            <div class="modal-body">
                <p>로그인이 필요한 서비스입니다.</p>
            </div>
            <div class="modal-footer">
                <button type="button" onclick="location.href='/mycar/memberClLogin.me?fromURI=/mycar/resClQuickForm.re'" class="btn btn-secondary" data-dismiss="modal">확인</button>
            </div>
        </div>
    </div>
</div>

</body>