<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="kr.ac.kopo.util.ConnectionFactory"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
	작업순서
	1. t_board 테이블에서 전체게시글 조회
	2. 조회된 게시물을 하나씩 웹브라우저 출력
--%>   


<%-- 얘네들을 다 DAO 클래스로 따로 분리시키고 싶은것
	 DAO는 하나의 테이블에 ACCESS하기 위한 목적으로 만든다.
	 하나의 테이블에 CRUD를 할 수 있는 형태의 하나를 일반적으로 DAO로 만든다. -> BoardDAO 
	 이런 DAO를 보통 인터페이스 형태로 만들고 오라클, MYSQL 등등 여러 DB에서도 사용할 수 있도록 구현함
	 BoardDAO ->(상속) BoardDAOImp(구현)
	 비즈니스 로직이나 서비스를 구현하는 클래스는 인터페이스로 구현한다. (인터페이스, 추상클래스...)
	 비즈니스 로직의 경우 다형성을 구현해야 한다. 변화에 둔감하게 만들어줘야 함.(유지보수 편함)
--%>
<%
	/* Connection conn = new ConnectionFactory().getConnection();
	StringBuilder sql = new StringBuilder();
	sql.append("select no, title, writer, to_char(reg_date, 'yyyy-mm-dd') reg_date");
	sql.append("	from t_board");
	sql.append("	order by no desc ");
	
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	ResultSet rs = pstmt.executeQuery(); */
	
	BoardDAO dao = new BoardDAO();
	List<BoardVO> list = dao.selectAll();
	
	/* list 객체를 el도 사용하기 위해서는 공유영역에 등록을 시켜야 한다.
	   pageContext영역은 list.jsp 안에서만, 자신의 페이지 내에서 등록된 객체만 접근, 객체 공유 가능
	   request는 한번 요청에 응답이 올 때까지 서로 연결되어있는 jsp가 같이 연결될 동안만 접근 가능. jsp는 단발성 형태
	   session : 하나의 클라이언트가 여러 번 요청, 응답을 해도 값을 같이 공유하고 싶은 것.
	   application : 이 서버를 접속하고 있는 모든 클라이언트들이 값을 같이 공유하고 싶은 것.
	*/
	pageContext.setAttribute("list", list);
%> 

 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
<script src="/Mission-Web/resource/js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		$('#addBtn').click(function(){
			location.href = 'writeForm.jsp'
		})
	})

</script>
</head>
<body>
	<div align="center">
		<hr>
		<h2>전체게시글 조회</h2>
		<hr>
		<br>
		<table border="1" style="width:80%">
			<tr>
				<th width="7%">번호</th>
				<th>제목</th>
				<th width="16%">작성자</th>
				<th width="20%">등록일</th>
			</tr>
			<c:forEach items="${ list }" var="board">
			<%-- <c:set var="board" value="${ list[0] } /> --%>
				<tr>
					<td>${ board.no }</td>
					<!-- 문자열만 날아옴 -->
					<td>
						<a href="detail.jsp?no=${ board.no }">
							<%-- ${ board.title } 이렇게 하면 잘못된 링크로 이동할 수 있기 때문에
							화면 출력시 el 태그 말고 out 태그를 이용해서, 태그를 태그로 인식하지 않고 문자로 인식하게 한다--%>
							<c:out value="${ board.title }" />
						</a>
					</td>
					<td>${ board.writer }</td>
					<td><c:out value="${ board.regDate }" /></td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<button id="addBtn">새글등록</button>
	</div>
</body>
</html>