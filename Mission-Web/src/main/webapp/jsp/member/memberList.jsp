<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.member.dao.MemberDAO"%>
<%@page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%		
	MemberDAO dao = new MemberDAO();
	List<MemberVO> memberList = dao.selectAll();
	
	pageContext.setAttribute("memberList", memberList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>
	$(document).ready(function(){
		$('#signUpBtn').click(function(){
			location.href = 'signUpForm.jsp'
		})
	})

</script>
</head>
<body>
	<div align="center">
		<hr>
		<h2>전체 회원 목록 조회</h2>
		<hr>
		<br>
		<table border = "1" style="width:80%; text-align:center">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>유형</th>
				<th>가입날짜</th>
			</tr>
			<c:forEach items="${ memberList }" var="member">
				<tr>
					<td>
						<a href="memberDetail.jsp?id=${ member.id }">
							<c:out value="${member.id}" />
						</a>
					</td>
					<td><c:out value="${member.name}" /></td>
					<td><c:out value="${member.type}" /></td>
					<td><c:out value="${member.regDate}" /></td>
				</tr>
			</c:forEach>				
		</table>
		<br>
		<button id="signUpBtn">회원가입</button>
	</div>
</body>
</html>