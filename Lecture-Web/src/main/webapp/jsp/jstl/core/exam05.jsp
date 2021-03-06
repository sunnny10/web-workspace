<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String[] names = {"홍길동", "강길동", "윤길동", "박길동"};
	
	pageContext.setAttribute("names", names);
	pageContext.setAttribute("length", names.length-1);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	이름배열의 개수 : ${ fn:length(names) }<br>
	<c:forEach begin="0" end="${ fn:length(names)-1 }" var="i">
		<%-- <c:if test="${i ne 0}">
			,
		</c:if> --%>
		${ names[i] }
		<c:if test="${ i ne fn:length(names)-1 }">
			,
		</c:if>
	</c:forEach>
	<br>
	<c:forEach items="${ names }" var="name" varStatus="loop">
		<!-- . 으로 접근하는 것은 자바빈즈 클래스거나 맵 일때 접근 -->
		<c:if test="${ not loop.first }">
			,
		</c:if>
		${ name }
		<%-- ${ names[loop.index] } --%>
	</c:forEach>
	<br>
	<!-- 반복과 관련된, 한번 반복을 돌때마다 걔에 대한 속성을 지정할 때 사용 -->
	<!-- 루프를 돌때마다 걔에 대한 상태를 저장하는 변수를 loop로 지정, map 형태 -->
	<c:forEach items="${ names }" var="name" varStatus="loop">
		<!-- index는 0부터, count는 1부터 증가 -->
		${ loop.first } : ${ loop.last } : ${ loop.index } : ${ loop.count }<br>
	</c:forEach>
	<br>
	<c:set var="cnt" value="1" />
	<c:forEach items="${ names }" var="name">
		<c:if test="${ cnt ne 1 }">
			,
		</c:if>
		${ name }
		<c:set var="cnt" value = "${ cnt+1 }" />
	</c:forEach>
	<c:remove var="cnt" scope="page"/>
	<br>
	<c:forEach begin="0" end="${ length }" var="i">
		<%-- <c:if test="${i ne 0}">
			,
		</c:if> --%>
		${ names[i] }
		<c:if test="${ i ne length }">
			,
		</c:if>
	</c:forEach>
	<br>
	<!-- 각 데이터에 var라는 변수로 접근가능 -->
	<c:forEach items="${ names }" var="name">
		${ name }
	</c:forEach>


	<h2>1 ~ 10사이의 정수 출력</h2>
	<!-- var는 공유영경역에 있다  -->
	<c:forEach begin="1" end="10" var="i">
		${ i }<br>
	</c:forEach>
	<br>
	년도선택 : 
	<select>
		<!-- 큰 수에서 작은 수는 안됨 -->
		<c:forEach begin="1970" end="2022" step="10" var="year">
			<option>${ year }</option>
		</c:forEach>
	</select>
	<%-- <%
		for(int i = 1; i<=10; i++){
	%>
		<%=i %>
	<%
		}
	%> --%>
</body>
</html>