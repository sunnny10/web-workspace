<%@page import="kr.ac.kopo.member.dao.MemberDAO"%>
<%@page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
	String post = request.getParameter("post");
	String basicAddr = request.getParameter("basicAddr");
	String detailAddr = request.getParameter("detailAddr");
	String addr = basicAddr + "," + detailAddr;
	String type = request.getParameter("type");
	
	MemberVO member = new MemberVO();
	member.setId(id);
	member.setPassword(password);
	member.setName(name);
	member.setEmail(email);
	member.setTel(tel);
	member.setPost(post);
	member.setAddr(addr);
	member.setType(type);
	
	MemberDAO dao = new MemberDAO();
	dao.insertMember(member);
%>

<script>
	alert("회원가입이 완료되었습니다.");
	location.href="memberList.jsp";
</script>