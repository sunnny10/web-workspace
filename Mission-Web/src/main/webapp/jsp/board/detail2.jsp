<%@page import="kr.ac.kopo.vo.ListVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// http://localhost:9999/Mission-Web/jsp/board/detail.jsp?no=21
%>

<%
	int no = Integer.parseInt(request.getParameter("no"));
	Connection conn = new ConnectionFactory().getConnection();
	StringBuilder sql = new StringBuilder();
	sql.append("select title, writer, content, view_cnt, to_char(reg_date, 'yyyy-mm-dd') reg_date");
	sql.append(" from t_board");
	sql.append(" where no=?");
	
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	pstmt.setInt(1, no);
	
	ResultSet rs = pstmt.executeQuery();
	
	ListVO list = new ListVO();
	
	if(rs.next()){
		list.setTitle(rs.getString("title"));
		list.setWriter(rs.getString("writer"));
		list.setContent(rs.getString("content"));
		list.setView_cnt(rs.getInt("view_cnt"));
		list.setReg_date(rs.getString("reg_date"));
	}
	
	pageContext.setAttribute("list", list);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<hr>
		<h2>게시판 상세</h2>
		<hr>
		<table border="1" style="width:80%; text-align: center">
			<tr>
				<th>번호</th>
				<td>${ param.no }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${ list.title }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${ list.writer }</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${ list.view_cnt }</td>
			</tr>
			
			<tr>
				<th>등록일</th>
				<td>${ list.reg_date }</td>
			</tr>		

		</table>
		<br>
		<button id="updateBtn">수정</button>
		<button id="deleteBtn">삭제</button>
		<button id="listBtn"><a href="list.jsp">목록</a></button>	
	</div>
</body>
</html>