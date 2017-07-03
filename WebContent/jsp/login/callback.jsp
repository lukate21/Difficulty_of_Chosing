<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>네이버 아이디로 로그</title>
<script type="text/javascript" src="/difficulty_of_chosing/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("gzui5dYVq33eDJdsXVi4", "http://192.168.0.14:8000/difficulty_of_chosing/jsp/login/callback.jsp");
  // 접근 토큰 값 출력
  //alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
	var email = naver_id_login.getProfileData('email');
    //alert(email);

    location.href = "/difficulty_of_chosing/login.do?email="+email;
  /*   opener.parent.location = "http://192.168.1.3:8000/difficulty_of_chosing";
  	window.close(); */
  }
  
</script>
</head>
<body>

</body>
</html>
