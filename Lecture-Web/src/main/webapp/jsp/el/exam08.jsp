<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="kr.ac.kopo.board.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
	// 1. 자바빈즈클래스 + 콜렉션
	BoardVO board = new BoardVO();
	board.setTitle("성공");
	
	List <BoardVO> boardList = new ArrayList<>();
	boardList.add(board);
	
	pageContext.setAttribute("boardList", boardList);
*/

/*
	// 2. 자바빈즈클래스 + 배열
	BoardVO board = new BoardVO();
	board.setTitle("성공");
	
	BoardVO[] boardList = new BoardVO[]{board};
	
	pageContext.setAttribute("boardList", boardList);
*/	

/*
	// 3. 맵객체 + 배열
	// boardList는 맵객체의 배열이고 title은 맵의 키인 경우
	Map<String, String> board = new HashMap<>();
	board.put("title", "성공");
	
	Map[] boardList = {board};

	pageContext.setAttribute("boardList", boardList);
*/

/*
	// 4. 맵객체 + 컬렉션
	Map<String, String> board = new HashMap<>();
	board.put("title", "성공");
	
	List <Map<String, String>> boardList = new ArrayList<>();
	boardList.add(board);
	
	pageContext.setAttribute("boardList", boardList);
*/

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- boardList : 컬렉션이나 배열 / . 은 자바빈즈나 맵 객체일 때 접근 가능-->
	성공/실패? ${ boardList[0].title }<br>
	<!-- ${ board.['title'] -->
</body>
</html>