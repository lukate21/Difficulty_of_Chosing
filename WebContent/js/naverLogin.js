/**
 * 네이버 아이디로 로그인
 */

var naver_id_login = new naver_id_login("gzui5dYVq33eDJdsXVi4", "http://192.168.0.14:8000/difficulty_of_chosing/jsp/login/callback.jsp");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("green", 3,50);
  	naver_id_login.setDomain("YOUR_SERVICE_URL");
  	naver_id_login.setState(state);
  	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();