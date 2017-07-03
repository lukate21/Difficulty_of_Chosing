/**
 *  Ajax와 관련된 함수 집합
 */

var httpRequest = null;

function getXMLHttpRequest(){
	if(window.ActiveXObject)
		return new ActiveXObject("Microsoft.XMLHTTP");
	if(window.XMLHttpRequest)
		return new XMLHttpRequest();
	return null;
}

function sendProcess(method, url, params, callback){
	httpRequest = getXMLHttpRequest();
	httpRequest.onreadystatechange = callback;
	
	var httpMethod = method;
	if(httpMethod != 'GET' && httpMethod != "POST"){
		httpMethod = 'GET';
	}
	
	httpParams = '';
	if(params != null && params != ''){
		for(var key in params){
			if(httpParams != '')
				httpParams += '&'
			httpParams += key + '=' + encodeURIComponent(params[key]);
		}
	}
	
	httpUrl = url;
	if(httpMethod == "GET" && httpParams != ''){
		httpUrl = httpUrl + "?" + httpParams;
	}
	
	console.log(httpParams);
	
	httpRequest.open(httpMethod, httpUrl, true);
	if(httpMethod == "POST"){
		httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	}
	httpRequest.send(httpMethod == 'GET' ? null : httpParams);
}







