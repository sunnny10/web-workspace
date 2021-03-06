<%@page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@page import="kr.ac.kopo.member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");

	MemberDAO dao = new MemberDAO();
	MemberVO member = dao.selectById(id);
	
	pageContext.setAttribute("member", member);
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 상세</title>
<script>
	function doAction(type){
		switch(type) {
		case 'U' :
			location.href = "update.jsp?id=${param.id}";
			break;
		case 'D' :
			if(confirm('삭제하시겠습니까?')) {
				location.href = "delete.jsp?id=${ param.id }"	
			};
			break;
		case 'L' :
			location.href = "memberList.jsp";
			break;
		}
	}
</script>
</head>
<body>
	<div align="center">
		<hr>
		<h2>회원 정보 상세</h2>
		<hr>
		<table border="1" style="width:80%">
			<tr>
				<th width="25%">아이디</th>
				<td>${ member.id }</td>
			</tr>
			<tr>
				<th width="25%">이름</th>
				<td>${ member.name }</td>
			</tr>
			<tr>
				<th width="25%">비밀번호</th>
				<td>${ member.password }</td>
			</tr>
			<tr>
				<th width="25%">이메일</th>
				<td>${ member.email }</td>
			</tr>
			<tr>
				<th width="25%">전화번호</th>
				<td>${ member.tel }</td>
			</tr>
			<tr>
				<th width="25%">우편번호</th>
				<td>${ member.post }</td>
			</tr>
			<tr>
				<th width="25%">주소</th>
				<td>${ member.addr }</td>
			</tr>
			<tr>
				<th width="25%">유형</th>
				<td>${ member.type }</td>
			</tr>
			<tr>
				<th width="25%">가입일</th>
				<td>${ member.regDate }</td>
			</tr>
		</table>
		<br>
		<button onclick="doAction('U')">수   정</button>&nbsp;&nbsp;
		<button onclick="doAction('D')">삭   제</button>&nbsp;&nbsp;
		<button onclick="doAction('L')">목   록</button>&nbsp;&nbsp;
	</div>
</body>
</html>