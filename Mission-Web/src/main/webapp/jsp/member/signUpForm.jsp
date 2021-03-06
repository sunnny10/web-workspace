<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입폼</title>
<script>
	window.onload = ()=> {
		document.querySelector("#listBtn").onclick = function() {
			location.href = 'memberList.jsp';
		}	
	}
	
	function checkForm() {
		
		let f = document.signUpForm;
		
		if(f.id.value === ''){
			alert('아이디를 입력하세요')
			f.id.focus()
			return false;
		}
		
		if(f.password.value == ''){
			alert('비밀번호를 입력하세요')
			f.password.focus()
			return false;
		}
		
		if(f.name.value == ""){
			alert('이름을 입력하세요')
			f.name.focus()
			return false;
		}
		
		if(f.email.value == ""){
			alert('이메일을 입력하세요')
			f.email.focus()
			return false;
		}
		
		if(f.tel.value == ""){
			alert('전화번호를 입력하세요')
			f.tel.focus()
			return false;
		}
		
		if(f.post.value == ""){
			alert('우편번호를 입력하세요')
			f.post.focus()
			return false;
		}
		
		if(f.basicAddr.value == ""){
			alert('주소를 입력하세요')
			f.basicAddr.focus()
			return false;
		}
		
		if(f.detailAddr.value == ""){
			alert('상세주소를 입력하세요')
			f.detailAddr.focus()
			return false;
		}
	
		return true;	
	}

</script>
</head>
<body>
	<div align="center">
	<hr>
	<h2>회원 가입폼</h2>
	<hr>
	<form action="signUp.jsp" method="post" name="signUpForm" onsubmit="return checkForm()">
		<table border="1" style="width=80%">
			<tr>
				<th width="25%">아이디</th>
				<td><input type="text" name="id" size="80"></td>
			</tr>
			<tr>
				<th width="25%">비밀번호</th>
				<td><input type="password" name="password" size="80"></td>
			</tr>
			<tr>
				<th width="25%">이름</th>
				<td><input type="text" name="name" size="80"></td>
			</tr>
			<tr>
				<th width="25%">이메일</th>
				<td><input type="email" name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" placeholder="abc@email.com" size="80"></td>
			</tr>
			<tr>
				<th width="25%">전화번호</th>
				<td><input type="tel" name="tel" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="000-0000-0000" size="80"></td>
			</tr>
			<tr>
				<th width="25%">우편번호</th>
				<td><input type="text" name="post" size="80"></td>
			</tr>
			<tr>
				<th width="25%">주소</th>
				<td><input type="text" name="basicAddr" placeholder="OO시" size="80"></td>
			</tr>
			<tr>
				<th width="25%">상세주소</th>
				<td><input type="text" name="detailAddr" placeholder="OO구 OO동" size="80"></td>
			</tr>
			<tr>
				<th width="25%">유형</th>
				<td>
				<select name="type">
					<option value="S">슈퍼계정</option>
					<option value="U">일반계정</option>
				</select>
				</td>
			</tr>
		</table>
		<br>
		<input type="submit" value="가  입">&nbsp;&nbsp;
		<button type="button" id="listBtn">목   록</button>
	</form>
	</div>
</body>
</html>