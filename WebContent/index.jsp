<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content=""> 
<title>선택장애 답정너</title>
	<!-- Bootstrap Core CSS -->
    <link href="freelancer/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Theme CSS -->
    <link href="freelancer/css/freelancer.min.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="freelancer/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
 	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
 	<script src="/difficulty_of_chosing/js/chooseCall.js"></script>
	
</head>
	
<script>

function logout(){
	var result = confirm('로그아웃 하시겠습니까?');
	if(result == true){
		location.href = "/difficulty_of_chosing/jsp/login/logout.jsp";
	}
}

</script>
<body>
<div id="skipnav"><a href="#maincontent">Skip to main content</a></div>

    <!-- Navigation -->
    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="#page-top">선택장애 답정너</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <!--  로그인이 되지 않으면 나타나지 않는다. -->
                    <c:if test="${ not empty email }">
                    <li class="page-scroll">
                        <a href="#select">1단계</a>
                    </li>
                    <!--  1단계를 수행해야 나타난다. -->
                    <c:if test="${ not empty param.fId }">
                    <li class="page-scroll">
                        <a href="#about">2단계</a>
                    </li>
                   <!--  <li class="page-scroll">
                        <a href="#contact">3단계</a>
                    </li> -->
                    </c:if>
                    <li class="page-scroll">
                        <a href="#" onclick="logout()">로그아웃</a>
                    </li>
                    </c:if>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <!-- Header -->
    <header>
       <jsp:include page="jsp/headerpage.jsp"></jsp:include>
    </header>
    <!--  로그인이 되지 않으면 나타나지 않는다. -->
<c:if test="${ not empty email }">

    <!-- 메뉴1 Grid Section -->
    <section id="select">
		<jsp:include page="jsp/menu/menu1.jsp" />
    </section>
    
    <!--  1단계를 수행해야 나타난다. -->
	<c:if test="${ not empty param.fId }">
    
    <!-- 메뉴2 Section -->
    <section class="success" id="about">
        <jsp:include page="jsp/menu/menu2.jsp" />
    </section>

    <%-- <!-- 메뉴3 Section -->
    <section id="contact">
        <jsp:include page="jsp/menu/menu3.jsp" />
    </section> --%>
    </c:if>
</c:if>

    <!-- Footer -->
    <footer class="text-center">
        <jsp:include page="jsp/footerpage.jsp"></jsp:include>
    </footer>

    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
    <div class="scroll-top page-scroll hidden-sm hidden-xs hidden-lg hidden-md">
        <a class="btn btn-primary" href="#page-top">
            <i class="fa fa-chevron-up"></i>
        </a>
    </div>

    <!-- Selection Modals -->
    <jsp:include page="jsp/modal/selectionModal.jsp" />
    
    <!-- Modal -->
  	<jsp:include page="jsp/modal/modal.jsp" />
  
    <!-- jQuery -->
    <script src="freelancer/vendor/jquery/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="freelancer/vendor/bootstrap/js/bootstrap.min.js"></script>
    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <!-- Contact Form JavaScript -->
    <script src="freelancer/js/jqBootstrapValidation.js"></script>
    <script src="freelancer/js/contact_me.js"></script>
    <!-- Theme JavaScript -->
    <script src="freelancer/js/freelancer.min.js"></script>
    <!-- 네이버 아이디 로그인하기 버튼 영역 -->
    <script type="text/javascript" src="/difficulty_of_chosing/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
 	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
  	<script src="/difficulty_of_chosing/js/naverLogin.js"></script>
    <!-- 네이버 아이디 로그인하기 버튼 영역 -->
</body>
</html>