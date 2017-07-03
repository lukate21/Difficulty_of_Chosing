<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<div class="container" id="maincontent" tabindex="-1">
	<div class="row" id="page-top">
		<div class="col-lg-12">
			<img class="img-responsive" src="freelancer/img/profile.png" alt="">
			<div class="intro-text">
				<h1 class="name">선택장애 답정너</h1>
				<hr class="star-light">
				<span class="skills">The answer is already there. You just
					have to say it.</span>
			</div>
			<div class="col-lg-8 col-lg-offset-2 text-center">
				<c:if test="${ empty email }">
					<a href="#loginModal" class="btn btn-lg btn-outline"
						data-toggle="modal"> 로그인 </a>
				</c:if>
				<br />
				<c:if test="${ not empty email }">
					<div class="page-scroll">
						<a href="#select" class="btn btn-lg btn-outline"> 시작 </a>
					</div>
					<br />
					<br />
								접속 아이디 : ${ email }&nbsp;&nbsp;
					<button type="button" class="btn btn-sm btn-outline"
						onclick="logout()">Logout</button>
				</c:if>
			</div>
		</div>
	</div>
</div>