<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Mycar 렌터카</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap -->
<link href="bootStrapLaw/css/bootstrap.min.css?after" rel="stylesheet">
<!-- Style CSS -->
<link href="bootStrapLaw/css/style.css?after" rel="stylesheet">
<!-- FontAwesome CSS -->
<link href="bootStrapLaw/css/font-awesome.min.css" rel="stylesheet">
<link href="bootStrapLaw/css/owl.carousel.min.css" rel="stylesheet">
<link href="bootStrapLaw/css/owl.theme.default.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css" class="svelte-p5qu1m" data-svelte="svelte-1yifjfe">

  <style>
  
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {	
      margin-bottom: 0 !important;
      border-radius: 0;
    }
    
    .owl-carousel .owl-item img {
    width: 100%;
    height: 500px;
    object-fit: cover;
}

.slider-captions {
    position: absolute;
    bottom: 170px;
    left: 0px;
    margin-left: 50px;
}

body {
    font-family: Pretendard !important;
}

.slider-title {
    font-weight: 700;
}

.btn-default {
    color: #1e1a1b !important;
    font-family: Pretendard;
    margin-top:20px;
    width:200px;
    height:60px;
}

#detailButton {
    vertical:middle !important;
    font-size: 2.3em;
    font-weight: 700;
    color: #4c4446 !important;
}

.btn {
    border: 0px !important;
}

.navbar-inverse .navbar-brand {
    color: #e2e2e2;
}

.service-block:hover { 
	border: 1px solid #1e1a1b; 
}

@media screen and (max-width: 767px) {
	.slider-captions {
	    bottom: 300px;
	}
	.btn-default {
	    color: #1e1a1b !important;
	    font-family: Pretendard;
	    margin-top:20px;
	    width:120px;
	    height:50px;
	}

	#detailButton {
	    vertical:middle !important;
	    font-size: 1.5em;
	    font-weight: 700;
	    color: #4c4446 !important;
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

<jsp:include page="view/main/mycarClHeader.jsp"></jsp:include>

    <!-- slider-start -->
    <div class="slider">
        <div class="owl-carousel owl-theme">
            <div class="item"><a href="carClList.ca?ctype=short"><img src="image/indexImage2.jpg" class="img-responsive" alt=""></a>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <div class="slider-captions">
                                <h1 class="slider-title">SUV(장기렌트)</h1>
                                <p class="slider-text hidden-xs"> &nbsp; 안정적인 승차감과 우수한 실용성</p>
                                <a href="carClList.ca?ctype=short" id="detailButton" class="btn btn-default btn-lg">상세보기</a> </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item"><a href="carClList.ca?ctype=short"><img src="image/indexImage1.jpg?31332" class="img-responsive" id="indexImage1" alt=""></a>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-12  col-xs-12">
                            <div class="slider-captions">
                                <h1 class="slider-title">대형(단기렌트)</h1>
                                <p class="slider-text hidden-xs"> &nbsp; 가성비를 고려한 최고의 선택</p>
                                <a href="carClList.ca?ctype=short" id="detailButton" class="btn btn-default btn-lg">상세보기</a> </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item"><a href="carClList.ca?ctype=short"><img src="image/indexImage3.jpg?afer222333" class="img-responsive" alt=""></a>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-12  col-xs-12">
                            <div class="slider-captions">
                                <h1 class="slider-title">중형(장기렌트)</h1>
                                <p class="slider-text hidden-xs"> &nbsp; 넉넉한 승차정원 및 편의성</p>
                                <a href="carClList.ca?ctype=short" id="detailButton" class="btn btn-default btn-lg">상세보기</a> </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- slider-close -->

    <!-- practic-area-start-->
    <div class="space-medium">
        <div class="container">
        <hr><br>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-lg-12 text-center">
                    <div class="section-title">
                        <h1>최근 게시물</h1>
                    </div>
                </div>
            </div>
            <div class="row">
                <!-- service-start-->
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="service-block">
                        <div class="service-icon"><i class="icon-portfolio"></i></div>
                        <div class="service-content">
                            <h3><a href="noticeList.no" class="title">공지사항</a></h3><br>
                            <jsp:include page="view/notice/noticeIndexList.jsp"></jsp:include>
                            </div>
                    </div>
                </div>
                <!-- service-close-->
                <!-- service-start-->
 				<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="service-block">
                        <div class="service-icon"><i class="icon-jury"></i></div>
                        <div class="service-content">
                             <h3>QnA</h3><a href="qnaQClList.qn" class="title"><span>&#10010;</span></a><br>
                            <jsp:include page="view/qna/qnaIndexList.jsp"></jsp:include>
                    </div>
                </div>
                </div>
                <!-- service-close-->
                <!-- service-start-->
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="service-block">
                        <div class="service-icon"><i class="icon-courthouse"></i></div>
                        <div class="service-content">
                            <h1><a onclick="return idcheck();" data-toggle="modal" data-target="#modal" data-backdrop="static" data-keyboard="false" class="title"><br>빠른예약</a><br><br></h1>
                    </div>
                </div>
                <!-- service-close-->
            </div>
            <!-- practic-area-close-->
            </div>
            </div>

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

<jsp:include page="view/main/mycarFooter.jsp"></jsp:include>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="bootStrapLaw/js/jquery.min.js" type="text/javascript"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script type="text/javascript" src="bootStrapLaw/js/owl.carousel.min.js"></script>
    <script type="text/javascript" src="bootStrapLaw/js/slider.js"></script>

</body>
</html>
