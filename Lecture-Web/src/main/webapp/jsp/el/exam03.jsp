<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		객체등록 : 공유영역.setAttribute("이름", "값");
		객체조회 : 공유영역.getAttribute("이름");
		JSP 공유영역 4가지 : pageContext, request, session, application
	*/
	pageContext.setAttribute("msg", "pageContext영역에 등록완료");
		
	// "id"라는 이름으로 "홍길동" 값을 가진 객체 등록(pageContext)
	pageContext.setAttribute("id", "홍길동");
	
	request.setAttribute("msg", "request영역에 등록완료");
	// 따로 등록시켜놔야 함
	pageContext.setAttribute("length", "request영역에 등록완료".length());
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--
		EL 공유영역 4가지 : pageScope, requestScope, sessionScope, applicationScope
	--%>
	empty msg : ${ empty msg }<br>
	msg : <%= pageContext.getAttribute("msg") %><br>
	el msg : ${ msg }<br>
	el id : ${ id }<br>
					<!-- el로 뽑아낸 것은 자바 객체가 아니다 스트링 객체 이런게 아니기 때문에 length(자바문법) 못 씀 그래서 공유영역에 따로 저장해놔야 한다-->
	request msg : ${ requestScope.msg }<br>
							<!-- 형변환 시켜줘야 length 알 수 있음 -->
	request msg length : <%= ((String)request.getAttribute("msg")).length() %><br>
	<!-- 값이 없으면 empty -->
	request msg length : ${ length }<br>
</body>
</html>








