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
	sql.append("select no, title, writer, content, view_cnt, to_char(reg_date, 'yyyy-mm-dd') reg_date");
	sql.append(" from t_board");
	sql.append(" where no=?");
	
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	pstmt.setInt(1, no);
	
	ResultSet rs = pstmt.executeQuery();
	
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
			<%
				if(rs.next()) {
					no 		   = rs.getInt("no");
					String title   = rs.getString("title");
					String writer  = rs.getString("writer");
					String content = rs.getString("content");
					int view_cnt   = rs.getInt("view_cnt");
					String reg_date = rs.getString("reg_date");
			%>
			<tr>
				<th>번호</th>
				<td><%= no %></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><%= title %></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%= writer %></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td><%= view_cnt %></td>
			</tr>
			
			<tr>
				<th>등록일</th>
				<td><%= reg_date %></td>
			</tr>		
			<%
				}
			%>
		</table>
		<br>
		<button id="updateBtn">수정</button>
		<button id="deleteBtn">삭제</button>
		<button id="listBtn"><a href="list.jsp">목록</a></button>	
	</div>
</body>
</html>