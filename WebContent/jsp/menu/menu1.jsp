<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
	<div class="row">
		<div class="col-lg-12 text-center">
			<h2>1단계</h2>
			<hr class="star-primary">
			<h3>뭐 먹을지 고민하는 당신! 음식을 정해드려요</h3>
			<h4>사진을 클릭하세요</h4>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-4 select-item" style="margin-left: 33%">
			<a href="#" class="select-link" data-toggle="modal"
				data-target="#myModal">
				<div class="caption">
					<div class="caption-content">
						<i class="fa fa-search-plus fa-3x"></i><br/> <strong>클릭</strong> 
					</div>
				</div> <img src="freelancer/img/portfolio/food.jpg" class="img-responsive"
				alt="Cake">
			</a>
			<form id="frm" action="/difficulty_of_chosing/foodList.do">
				<input type="hidden" id="sub" name="fId" value="" /><br />
				<center>
					<div id="result"></div>
				</center>
			</form>
		</div>
	</div>
</div>