<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<div class="review-wrapper">
	<div id="review-title">유저 평가</div>
	<div class="review-list">
	<div id="review-area">
	<c:forEach items="${ reviewList }" var="review" varStatus="loop">
              <!-- ngRepeat: item in profile.review -->
		<dc-review ng-repeat="item in profile.review" ng-model="item" index="$index" class="ng-pristine ng-untouched ng-valid ng-scope ng-isolate-scope">
        <div class="review-directive" ng-show="self.render">
			<div class="review-viewer">
				<div class="review-header">
					<div class="review-uprof">
						<img id="user_img" src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/login/ic_login_setting_user.png">
					</div>
				<div class="_flex_1">
					<div class="review-user">
						<span id="review_id" class="review-uname ng-binding" ng-bind="self.u.name">${ review.mId }</span><!-- ngIf: self.u.intro -->
					</div>
				<!-- ngIf: self.r.isVisible -->
				<div class="review-rate ng-scope" ng-if="self.r.isVisible">
					<dc-rate-star data-rate-class="review" data-rate="self.r.score" max="5" class="ng-isolate-scope">
					<div ng-class="self.rateStarClass" class="rate-star-review">
	<!-- ngRepeat: i in self.range track by $index -->
					<c:forEach begin="1" end="${ review.score }" >
						<div ng-repeat="i in self.range track by $index" ng-class="self.rate_class($index+1)" class="ng-scope rate-star-review-on">
						</div><!-- end ngRepeat: i in self.range track by $index -->
					</c:forEach>
					<c:forEach begin="1" end="${ 5 - review.score }" >
						<div ng-repeat="i in self.range track by $index" ng-class="self.rate_class($index+1)" class="ng-scope rate-star-review-off">
						</div><!-- end ngRepeat: i in self.range track by $index -->
					</c:forEach>
						
					</div>
<!-- ngIf: self.showCount() -->
					</dc-rate-star>
				</div><!-- end ngIf: self.r.isVisible -->
				<!-- ngIf: !self.r.isVisible -->
				<div class="review-date ng-binding" ng-bind="self.r.date">${ review.regDate }
				</div>
				</div>
			</div>
		
			<div class="review-body">
			<!-- ngIf: self.r.comment.length>0 -->
				<div class="review-content ng-scope ng-isolate-scope" ng-if="self.r.comment.length>0" ng-text-truncate="self.r.comment" ng-tt-lines-threshold="8" ng-linky-apply="" ng-no-less="">
					<span class="ntt-text ng-binding" ng-bind-html="truncatedText | linky:'_blank'">${ review.content }</span>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" onclick="delReview(${ review.no }, ${ review.score })">삭제</button>

<!-- ngIf: useLess&&text.length==truncatedText.length -->
				</div><!-- end ngIf: self.r.comment.length>0 -->
				</div>
			</div>
		</div></dc-review><!-- end ngRepeat: item in profile.review -->
		</c:forEach>
	</div>
	<div align="center">
		
	</div>
</div>
</div>  
