<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	var maxAvg = 0;
	var maxbName = '${ bistroList[0].bName }';
	var revCnt = 0;
	
	<c:forEach items="${ bistroList }" var="bistro" varStatus="loop">
		if('${ bistro.reviewCnt != 0 }' && maxAvg < '${ bistro.tScore / bistro.reviewCnt }') {
			maxAvg = ${ bistro.tScore / bistro.reviewCnt };
			maxAvg = maxAvg.toFixed(1);
			maxbName = '${ bistro.bName }';
			revCnt = ${ bistro.reviewCnt };
		}		
	</c:forEach>
	
	location.href="bistroDetail.do?bName=" + maxbName + "&revCnt=" + revCnt + "&avgScore=" + maxAvg;
</script>
