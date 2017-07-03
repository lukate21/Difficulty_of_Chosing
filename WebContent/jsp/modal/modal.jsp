<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 1단계 음식 선택 모달  -->
<div class="modal fade" id="myModal" role="dialog">

	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h3>STEP1</h3>
			</div>
			<div class="modal-body">
				<button type="button" id="rice" data-toggle="modal"
					data-target="#step2" data-dismiss="modal">
					<img class="choose" src="/difficulty_of_chosing/image/rice.jpg" id="rc" />
				</button>
				<button type="button" id="no_rice" data-toggle="modal"
					data-target="#step2" data-dismiss="modal">
					<img class="choose" src="/difficulty_of_chosing/image/norice.jpg" />
				</button>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="step2" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h3>STEP2</h3>
			</div>
			<div class="modal-body">
				<button type="button" id="soup" data-toggle="modal"
					data-target="#step3" data-dismiss="modal">
					<img class="choose" src="/difficulty_of_chosing/image/soup.jpg" />
				</button>
				<button type="button" id="no_soup" data-toggle="modal"
					data-target="#step3" data-dismiss="modal">
					<img class="choose" src="/difficulty_of_chosing/image/nosoup.jpg" />
				</button>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="step3" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h3>STEP3</h3>
			</div>
			<div class="modal-body">
				<div id="finalStep1"></div>
				<div id="finalStep2"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</div>
<br />
<br />