<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>음식점 세부 정보</title>
<style>
#home{
border: 1px solid black;
	width : 150px;
	height : 80px;
 	top : -20px;
 	left : 40px;
}
</style>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="/difficulty_of_chosing/css/star-rating.min.css"></link>
<script src="/difficulty_of_chosing/js/star-rating.min.js"></script>
<script type="text/javascript">
	/*
		다 JSON 데이터로 넘김
		url		: 요청 주소(문자열) - 타입 지정 안하면 GET 방식
		type	: 메소드(문자열)
		data	: 파라미터(문자열, 객체)
		success	: 수신 성공(함수)
		error	: 수신 실패(함수)
		async	: 동기/비동기 설정(안써도 됨)
	*/
	var totalCount = parseInt($('#revCnt').text());
	var totalPageNo = (totalCount % 10 == 0) ? (totalCount / 10) : (totalCount / 10 + 1);
	$(document).ready(function() {
		showReviewList();

	});
	function delReview(no, score){
		
		if($("#review_id").text() == '${ email }'){
			$.ajax({
				url: 'reviewDelete.do',
				type: 'POST',			
				data: {'bName': '${ bistroDetail.bName }', 'content': $('#content').val(), 'score': score,'no': no },
				enctype: "application/x-www-form-urlencoded",
				success : function(data){
					showReviewList();
					
				}
			});	
	
			if(parseInt($('#revCnt').text())==1){
				var cnt = 0;
				var avg = 0;
			}
			else{
				var cnt = parseInt($('#revCnt').text())-1;
				var avg = (parseFloat($('#avgScore').text()) * parseInt($('#revCnt').text()) - score) / (parseInt($('#revCnt').text())-1);
			}
			console.log(avg);
			$.ajax({
				url: '/difficulty_of_chosing/jsp/review/reviewAverage.jsp',
				type: 'GET',			
				data: {'avgScore': avg.toFixed(1)},
				//enctype: "application/x-www-form-urlencoded",
				success : function(data){
					$('#avgScore').text(data);
				}
			});
					
			$.ajax({
				url: '/difficulty_of_chosing/jsp/review/reviewCount.jsp',
				type: 'GET',			
				data: {'revCnt': cnt},
				//enctype: "application/x-www-form-urlencoded",
				success : function(data){
					$('#revCnt').text(data);
				}
			});	
		}
		else{
			alert("관리자나 해당 글쓴이만 삭제할 수 있습니다. ");
		}
		
	}
	function cancel(){
		$("#content").val("");
	}
		
	function sendNewReview()
	{		
		$.ajax({
			url: 'reviewMake.do',
			type: 'POST',			
			data: {'bName': '${ bistroDetail.bName }', 'content': $('#content').val(), 'score': $('#input-id').val() },
			enctype: "application/x-www-form-urlencoded",
			success : function(data){
				showReviewList();
			}
		});
		
		avg = (parseFloat($('#avgScore').text()) * parseInt($('#revCnt').text()) + parseFloat($('#input-id').val())) / (parseInt($('#revCnt').text()) + 1);
		
		$.ajax({
			url: '/difficulty_of_chosing/jsp/review/reviewAverage.jsp',
			type: 'GET',			
			data: {'avgScore': avg.toFixed(1)},
			//enctype: "application/x-www-form-urlencoded",
			success : function(data){
				$('#avgScore').text(data);
			}
		});
				
		$.ajax({
			url: '/difficulty_of_chosing/jsp/review/reviewCount.jsp',
			type: 'GET',			
			data: {'revCnt': parseInt($('#revCnt').text()) + 1},
			//enctype: "application/x-www-form-urlencoded",
			success : function(data){
				$('#revCnt').text(data);
			}
		});		
	}
 	function pageReturn(no){
		$.ajax({
			url: 'reviewList.do',
			type: 'GET',			
			data: 'bName=${ bistroDetail.bName }&pageNo='+no, 
			success : function(data) {
				$('#reviewList').html(data);
			}
		});
	}
	function showReviewList() 
	{
		totalCount = parseInt($('#revCnt').text());
		totalPageNo = (totalCount % 10 == 0) ? (totalCount / 10) : (totalCount / 10 + 1);
		totalPageNo=Math.floor(totalPageNo);
		$("#content").val("");
		$.ajax({
			url: 'reviewList.do',
			type: 'GET',			
			data: 'bName=${ bistroDetail.bName }',
			success : function(data) {
				$('#reviewList').html(data);
			}
		});
		
		$.ajax({
			url: '/difficulty_of_chosing/jsp/review/reviewPageNo.jsp',
			type: 'GET',			
			data: {'totalPageNo': totalPageNo},
			success : function(data) {
				console.log(data);
				$('#pageNo').html(data);
			}
		});
	}	
	function goMain(){
		location.href = "http://192.168.1.33:8000/difficulty_of_chosing";
	}
	
		// initialize with defaults
		$("#input-id").rating();

		// with plugin options (do not attach the CSS class "rating" to your input if using this approach)
		$("#input-id").rating({'size':'lg'});

</script>

<!-- Bootstrap -->
<link type="text/css" rel="stylesheet"	href="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/profile.css?2017062601" />

<!-- default styles -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.css" rel="stylesheet">
<link href="path/to/css/star-rating.css" media="all" rel="stylesheet" type="text/css" />

<!-- optionally if you need to use a theme, then include the theme CSS file as mentioned below -->
<link href="path/to/themes/krajee-svg/theme.css" media="all" rel="stylesheet" type="text/css" />

<!-- important mandatory libraries -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.js"></script>
<script src="path/to/js/star-rating.js" type="text/javascript"></script>

<!-- optionally if you need to use a theme, then include the theme JS file as mentioned below -->
<script src="path/to/themes/krajee-svg/theme.js"></script>

<!-- optionally if you need translation for your language then include locale file as mentioned below -->
<script src="path/to/js/locales/<lang>.js"></script>

<!-- 첨부파일!!!!!!!!!!!!!!!!!!!!!!!!<script>

var $input = $("#input-705");

$input.fileinput({

    uploadUrl: "http://localhost/file-upload-batch/2", // server upload action

    uploadAsync: false,

    showUpload: false, // hide upload button

    showRemove: false, // hide remove button

    minFileCount: 1,

    maxFileCount: 5

}).on("filebatchselected", function(event, files) {

    // trigger upload method immediately after files are selected

    $input.fileinput("upload");

});

</script> -->


</head>
<body>
	
	<div id="enc_item_area">
		<div id="item-header">
			<div class="item-container" style="width: 70%;">
				<div id="item-header-top">
					<div id="item-header-left">
						<div id="item-rn">
							<span class="item-rn-title">${ bistroDetail.bName }</span> <span
								class="item-rn-divider"></span> <span class="item-rn-subtitle">${ bistroDetail.fName }</span>
						</div>
						<div id="item-category"></div>
					</div>
					<div id="item-header-right" >
						<h2 class="item-rn-title" onclick="goMain()">선택장애답정너<!-- <img src="/difficulty_of_chosing/image/logo2.png" id="home"> --></h2>	
					</div>
				</div>
				<div id="item-header-divider"></div>
				<div id="item-header-bottom">
					<div id="item-header-left">

						<div id="item-stats">
							<div class="item-stats">
								<div class="item-stats-count" id="avgScore">${ param.avgScore }</div>
								<div class="item-stats-title">점수</div>
							</div>

							<div class="item-stats" ng-if="profile.review_total>0">
								<a ng-click="#enc-review-area" title="바로가기">
									<div class="item-stats-count" ng-bind="profile.review_total" id="revCnt">${ param.revCnt }</div>
									<div class="item-stats-title">평가</div>
								</a>
							</div>
						</div>
                	</div>
	                <div id="item-header-right" style="margin-top:10px;">
	                    <div class="pull-right">
	                        <div class="item-button-review">
	                            <a ng-click="profile.composerInit();">
	                                <div id="review-icon"></div>
	                                <div id="review-text">
	                                	<button type="button" data-toggle="modal" data-target="#reviewForm">평가하기</button>
	                                </div>
	                            </a>
	                        </div>					
	
						</div>
					</div>	
				</div>
			</div>
		</div>
		<div id="item-body">
			<div class="item-container" style="width: 66%;">
				<div id="item-body-contents">
					<div class="item-information">
						<div class="item-information-icon">
							<img
								src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/profile/main/icon-profile-address@2x.png">
						</div>
						<div class="item-information-text">${ bistroDetail.addr }</div>
					</div>
					<div class="item-information" id="item-tel">
						<div class="item-information-icon">
							<img
								src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/profile/main/icon-profile-call@2x.png">
						</div>
						<div class="item-information-text">${ bistroDetail.tel }</div>
					</div>
						<div class="rest-menu _flex_1">
			            	<div class="rest-info-icon"><img src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/profile/main/icon-profile-menu@2x.png"></div><br/><br/>
				           		<div class="rest-info-contents">
					           		<div class="rest-menu-block">
					               	<div class="rest-menu-left">${ bistroDetail.fName } : ${ bistroDetail.price } 원</div>
					            </div>
					        </div>
				        </div>
				        <div id="enc_review_area">
				        	<div id="reviewList"></div>
				        	<div id="pageNo">
				        		
				        	<div>
				        </div>
           			</div>
				</div>
			</div>
		</div>
		<div style='width: 1150px; margin: 0 auto;'>
			<div class="rest-info-wrapper" style="float: left;">
				<div class="rest-time _flex_1"></div>
			</div>
			<div style='clear: both;'></div>
		</div>
	</div>
	<!-- <div id="reviewList"></div>	 -->		
	</div>

	<div class="container">
	  
	  <!-- Modal -->
	  <div class="modal fade" id="reviewForm" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
		        <div class="modal-header">
					<div class="review-uprof">
						<img id="user_img" src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/login/ic_login_setting_user.png">
					</div>
		          <h4 class="modal-title">${ email }</h4>
		          <h4 class="modal-title" align="right"> 
		          	<input id="input-id" type="text" class="rating" data-min="0" data-step="1" data-size=""/> 
		          	<!-- <input id="input-id" name="input-1" class="rating" data-min="0" data-max="5" data-step="1" data> -->
			      </h4>           
		        </div>
		        <div class="modal-body">
		        <textarea rows="10" cols="78" id="content" ></textarea>
		          <p></p>
		        </div>
		        <div class="modal-footer">
		        	<%-- <input type="hidden" value=${ bistroDetail.bName } name="bName"> --%>
		        	<button type="button" class="btn btn-default" data-dismiss="modal" onclick="sendNewReview()">확인</button>
		          	<button type="button"  class="btn btn-default" data-dismiss="modal" onclick="cancel()" >취소</button>
		        </div>
		        
		        <!-- 첨부파일!!!!!!!!!!!!!!!!!!!!!!!!!! <input id="input-705" name="kartik-input-705[]" type="file" multiple class="file-loading">  -->
		     <!-- </form> -->
		   </div>     
	    </div>
	  </div>
  
</div>
</body>
</html>