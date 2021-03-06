package kr.ac.kopo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 이 uri가 들어왔을 때 처리하는 애
@WebServlet("/servlet/exam")
public class ExamServlet extends HttpServlet{
	/*
		http://localhost:9999/Lecture-Web/servlet/exam?name=hong&hobby=reading&hobby=music&hobby=movie 입력시
		파라미터가 name=hong&hobby=reading&hobby=music 이것만 날아가서 split 함
		
		웹브라우저에 
		이름 : hong
		취미 : reading music movie
	 */

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");	// 제일 처음으로 나온 속성의 값만 나오게 되어있다
		String[] hobby = request.getParameterValues("hobby");	// value 값들을 복수개 갖고 오라는 뜻
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("	<head>");
		out.println("		<title>서블릿연습</title>");
		out.println("	</head>");
		out.println("	<body>");					
		out.println("		이름 : " + name + "<br>");		
		out.println("		취미 : ");	
		for(int i=0; i < hobby.length; i++) {
			out.println(hobby[i] + "&nbsp;&nbsp;");
		}		
		out.println("	<br>");
		out.println("	</body>");
		out.println("</html>");
		out.close();
	}

	
}
