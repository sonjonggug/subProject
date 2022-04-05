<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<head>
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
      <a class="navbar-brand" href="memberAdListAction.me" ><strong>MyCar</strong>
      </a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="resAdListAction.re">&nbsp;&nbsp;&nbsp;예약목록&nbsp;&nbsp;&nbsp;</a></li>
        <li><a href="memberAdListAction.me">&nbsp;&nbsp;&nbsp;회원목록&nbsp;&nbsp;&nbsp;</a></li>
        <li><a href="http://localhost:8080/mycar/carAdSearchList.ca">&nbsp;&nbsp;&nbsp;상품목록&nbsp;&nbsp;&nbsp;</a></li>
        <li><a href="http://localhost:8080/mycar/qnaQAdList.qn">&nbsp;&nbsp;&nbsp;QnA&nbsp;&nbsp;&nbsp;</a></li>
        <li><a href="noticeList.no">&nbsp;&nbsp;&nbsp;공지사항&nbsp;&nbsp;&nbsp;</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      <%
	String id = (String)session.getAttribute("id");
    
    if(id == null){
%>
        <li><a href="./memberAdLogin.me"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
        
        <%
    }
    else{
%>
        <li><a href="./memberAdLogout.me"><span class="glyphicon glyphicon-log-in"></span> 로그아웃</a></li>
       
        <%
    }
%>
      </ul>
    </div>
  </div>
</nav>
</header>
</body>