/**
 * modal창에서 음식 경우 선택 처리 js
 */

$(document).ready(function(){
	var key ="";
	$('#rice').click(function(){
		key=key+'1';
	});
	$('#no_rice').click(function(){
		key=key+'2';
	});
	$('#soup').click(function(){
		key=key+'3';
		console.log(key);
		if(key=='13'){
			$('#finalStep1').html("<button type='button' id='red' data-dismiss='modal'><img class='choose' src='/difficulty_of_chosing/image/spicysoup.jpg'/></button>");
			$('#finalStep2').html("<button type='button' id='white' data-dismiss='modal'><img class='choose' src='/difficulty_of_chosing/image/nonspicysoup.jpg'/></button>");
			$('#red').click(function(){
				key=key+'1';
				$('#sub').val(key);
				document.getElementById("frm").submit();
				key="";
			});
			$('#white').click(function(){
				key=key+'2';
				$('#sub').val(key);
				document.getElementById("frm").submit();
				key="";
			});
		}
		else if(key=='23'){
			$('#finalStep1').html("<button type='button' id='hot' data-dismiss='modal'><img class='choose' src='/difficulty_of_chosing/image/hot.jpg'/></button>");
			$('#finalStep2').html("<button type='button' id='cold' data-dismiss='modal'><img class='choose' src='/difficulty_of_chosing/image/cold.jpg'/></button>");
			$('#hot').click(function(){
				key=key+'1';
				$('#sub').val(key);
				document.getElementById("frm").submit();
				key="";
			});
			$('#cold').click(function(){
				key=key+'2';
				$('#sub').val(key);
				document.getElementById("frm").submit();
				key="";
			});
		}
	});
	$('#no_soup').click(function(){
		key=key+'4';
		if(key=='14'){
			$('#finalStep1').html("<button type='button' id='meat' data-dismiss='modal'><img class='choose' src='/difficulty_of_chosing/image/meatfish.jpg'/></button>");
			$('#finalStep2').html("<button type='button' id='no_meat' data-dismiss='modal'><img class='choose' src='/difficulty_of_chosing/image/nomeatfish.jpg'/></button>");
			$('#meat').click(function(){
				key=key+'1';
				$('#sub').val(key);
				document.getElementById("frm").submit();
				key="";
			});
			$('#no_meat').click(function(){
				key=key+'2';
				$('#sub').val(key);
				document.getElementById("frm").submit();
				key="";
			});
		}
		else if(key=='24'){
			$('#finalStep1').html("<button type='button' id='noodle' data-dismiss='modal'><img class='choose' src='/difficulty_of_chosing/image/noodle.jpg'/></button>");
			$('#finalStep2').html("<button type='button' id='no_noodle' data-dismiss='modal'><img class='choose' src='/difficulty_of_chosing/image/nonoodle.jpg'/></button>");
			$('#noodle').click(function(){
				key=key+'1';
				$('#sub').val(key);
				document.getElementById("frm").submit();
				key="";
			});
			$('#no_noodle').click(function(){
				key=key+'2';
				$('#sub').val(key);
				document.getElementById("frm").submit();
				key="";
			});
		}
		function doForm(){
			var form = document.getElementById("frm");
			form.submit();
		}
		
	});
	$('.btn.btn-default').click(function(){
	      key="";
	});
	
});