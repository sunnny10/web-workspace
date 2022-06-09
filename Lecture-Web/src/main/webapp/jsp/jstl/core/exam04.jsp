<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- prefix c 말고 다른 걸로 써도 됨 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- prefix는 여기 c를 말함 -->
	<c:choose>
		<c:when test="${ param.type == 'S' }">
			<h2>반갑습니다 관리자님</h2>
		</c:when>
		<c:when test="${ param.type eq 'U' }">
			<h2>반갑습니다 일반사용자님</h2>
		</c:when>
		<c:otherwise>
			<h2>type파라미터가 전송되지 않았거나, 파라미터의 값이 잘못되었습니다.</h2>
		</c:otherwise>
	</c:choose>
</body>
</html>