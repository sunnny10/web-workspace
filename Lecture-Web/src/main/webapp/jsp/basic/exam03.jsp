<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 외부 라이브러리 사용 --%>
<%@page import="java.util.Random"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--
		1 ~ 10 사이의 난수를 추출하여 출력
	--%>
	<h1>1 ~ 10 사이의 임의의 수 출력</h1>
	<%
	// java.util.Random r = new java.util.Random();
		Random r = new Random();
		int random = r.nextInt(10)+1;
	%>
	추출된 정수 : <%= random %><br>
</body>
</html>