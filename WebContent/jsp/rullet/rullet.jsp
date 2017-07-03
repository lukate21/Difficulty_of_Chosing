<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--  rullet -->
 	<link rel="stylesheet" href="/difficulty_of_chosing/css/main.css" type="text/css" />
	<script src="/difficulty_of_chosing/js/rullet/Winwheel.js"></script>
	<script src="/difficulty_of_chosing/js/rullet/httpRequest.js"></script>
	<script	src="http://cdnjs.cloudflare.com/ajax/libs/gsap/latest/TweenMax.min.js"></script>
	<div id="rullet" class="rullet" align="center">
		<table cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td width="300px" height="500px" class="the_wheel" align="center"
					valign="center">
					<canvas id="canvas" width="434" height="434">
                        <p style="color: white" align="center">Sorry, your browser doesn't support canvas. Please try another.</p>
                    </canvas>
				</td>
			</tr>
		</table>
		<script>
		var theWheel = new Winwheel({
			'numSegments' : 3, // Specify number of segments.
			'outerRadius' : 212, // Set outer radius so wheel fits inside the background.
			'textFontSize' : 28, // Set font size as desired.
			'segments' : // Define segments including colour and text.
			[ {
				'fillStyle' : '#eae56f',
				'text' : '${ foodList[0].fName }'
			}, {
				'fillStyle' : '#89f26e',
				'text' : '${ foodList[1].fName }'
			}, {
				'fillStyle' : '#7de6ef',
				'text' : '${ foodList[2].fName }'
			} ],
			'animation' : // Specify the animation to use.
			{
				'type' : 'spinToStop',
				'duration' : 5, // Duration in seconds.
				'spins' : 3, // Number of complete spins.
				/*                   'callbackFinished' : 'submitFood()' */
				'callbackFinished' : 'sendOnClick()'

			}
		});

		// Vars used by the code in this page to do power controls.
		var wheelPower = 0;
		var wheelSpinning = false;
		function powerSelected(powerLevel) {
			// Ensure that power can't be changed while wheel is spinning.
			if (wheelSpinning == false) {
				wheelPower = powerLevel;
				/* document.getElementById('spin_button').src = "spin_on.png";
				document.getElementById('spin_button').className = "clickable";
*/				}
		}

		// -------------------------------------------------------
		// Click handler for spin button.
		// -------------------------------------------------------
		function startSpin() {
			powerSelected(2);
			// Ensure that spinning can't be clicked again while already running.
			if (wheelSpinning == false) {
				theWheel.animation.spins = 8;
				//document.getElementById('spin_button').className = "";
				theWheel.startAnimation();
				//wheelSpinning = true;
			}
		}

		// -------------------------------------------------------
		// Function for reset button.
		// -------------------------------------------------------
		function resetWheel() {
			theWheel.stopAnimation(false); // Stop the animation, false as param so does not call callback function.
			theWheel.rotationAngle = 0; // Re-set the wheel angle to 0 degrees.
			theWheel.draw(); // Call draw to render changes to the wheel.
			wheelSpinning = false; // Reset to false to power buttons and spin can be clicked again.
			$("#alert").text('SPIN버튼을 눌러 룰렛을 돌려주세요');
			document.getElementById("foodImg").innerHTML = '<img src="/difficulty_of_chosing/image/rullet/menu2.png" id="menu"/>';
		}
		function sendOnClick() {
			sendProcess("GET", "/difficulty_of_chosing/jsp/rullet/foodKind.jsp", null, callback);
		}
		function callback() {
			if (httpRequest.readyState == 4) {
				if (httpRequest.status == 200) {
					var winningSegment = theWheel.getIndicatedSegment();
					var data = httpRequest.responseText;
					
					var imgData = eval(data);
					console.log(imgData);
					var imgIdx=0;
					//var json = JSON.parse(JSON.stringify(data));
					console.log(winningSegment.text);
					for(key in imgData){
						if(imgData[key].name == winningSegment.text){
							imgIdx = key;
							break;
						}
					} 
					document.getElementById("foodImg").innerHTML=
						"<img src='/difficulty_of_chosing/food/"+imgData[imgIdx].file+"' id='foodData'/>"
					document.getElementById("fName").value=imgData[imgIdx].name;
					$("#alert").text('다시하려면 "재설정" 버튼을 누르고 다시 시도해주세요.'); 
				}
			}
		}
		</script>
		
	</div>
	<div>
		<table>
			<tr>
				<td id="foodImg"><img src="/difficulty_of_chosing/image/rullet/menu2.png" id="menu"/></td>
			</tr>
		</table>
		<br />
		<form action="bistroList.do">
			<input type="hidden" id="fName" name="fName" />
			<input id="btn_dining" class="btn btn-primary" type="submit" value="식당 알아보기" />
		</form>
	</div>
