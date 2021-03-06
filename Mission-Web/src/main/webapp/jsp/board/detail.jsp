<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// http://localhost:9999/Mission-Web/jsp/board/detail.jsp?no=21
	
	/*
		작업순서
		1. no 파라미터 추출
		2. 추출된 no의 해당 게시물 조회(t_board) : 여기까지 자바코드
		3. 조회된 게시물을 화면 출력 : 얘만 html로 만들어줌.
	*/

	int no = Integer.parseInt(request.getParameter("no"));

	BoardDAO dao = new BoardDAO();
	BoardVO board = dao.selectByNo(no);	// BoardVO로 묶어도 된다.
	
	pageContext.setAttribute("board", board);
	
	/* Connection conn = new ConnectionFactory().getConnection();
	StringBuilder sql = new StringBuilder();
	sql.append("select no, title, writer, content, view_cnt, to_char(reg_date, 'yyyy-mm-dd') reg_date");
	sql.append(" from t_board");
	sql.append(" where no=?");
	
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	pstmt.setInt(1, no);
	
	ResultSet rs = pstmt.executeQuery(); */
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function doAction(type){
		switch(type) {
		case 'U' :
			location.href = "update.jsp?no=${param.no}";
			break;
		case 'D' :
			if(confirm('삭제하시겠습니까?')) {
				location.href = "delete.jsp?no=${ param.no }"	
			};
			break;
		case 'L' :
			location.href = "list.jsp";
			break;
		}
	}
</script>
</head>
<body>
	<div align="center">
		<hr>
		<h2>게시판 상세</h2>
		<hr>
		<table border="1" style="width:80%">
			<tr>
				<th width="25%">번호</th>
				<td>${ board.no }</td>
			</tr>
			<tr>
				<th width="25%">제목</th>
				<td><c:out value="${ board.title }" /></td>
			</tr>
			<tr>
				<th width="25%">작성자</th>
				<td>${ board.writer }</td>
			</tr>
			<tr>
				<th width="25%">내용</th>
				<td><c:out value="${ board.content }" /></td>
			</tr>
			<tr>
				<th width="25%">조회수</th>
				<td>${ board.viewCnt }</td>
			</tr>
			
			<tr>
				<th width="25%">등록일</th>
				<td>${ board.regDate }</td>
			</tr>		
		</table>
		<br>
		<button onclick="doAction('U')">수   정</button>&nbsp;&nbsp;
		<button onclick="doAction('D')">삭   제</button>&nbsp;&nbsp;
		<button onclick="doAction('L')">목   록</button>&nbsp;&nbsp;
	</div>
</body>
</html>