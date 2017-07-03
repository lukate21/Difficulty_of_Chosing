<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container">
	<div class="row">
		<div class="col-lg-12 text-center">
			<h2>2단계</h2>
			<hr class="star-light">
			<h3 id="alert">SPIN버튼을 눌러 룰렛을 돌려주세요</h3>
		</div>
	</div>
	<div class="row">
		<!-- <div class="col-lg-4"> -->
		<jsp:include page="/jsp/rullet/rullet.jsp"></jsp:include>
	</div>
	<div class="col-lg-8 col-lg-offset-2 text-center">
		<div class="col-lg-8 col-lg-offset-2 text-center">
			<span class="power_controls">
				<button alt="Spin" class="btn btn-lg btn-outline"
					onClick="startSpin()">SPIN</button>&nbsp; 
					<a href="#" onClick="resetWheel(); return false;" class="btn btn-lg btn-outline">
					재설정</a>
			</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<span class="page-scroll"> 
				<a href="#select" class="btn btn-lg btn-outline"> 이전단계 </a>
			</span>
		</div>
	</div>
</div>
