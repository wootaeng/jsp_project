<%@page import="jsp.users.UsersDao"%>
<%@page import="jsp.users.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	//폼 전송되는 가입할 회원의 정보를 읽어온다
    	String id=request.getParameter("id");
    	String pwd=request.getParameter("pwd");
    	String email=request.getParameter("email");
    	//UserDto  객체에 회원 정보를 담고
    	UsersDto dto=new UsersDto();
    	dto.setId(id);
    	dto.setPwd(pwd);
    	dto.setEmail(email);
    	//UserDao 객체를 이용해서 DB 저장
    	boolean isSuccess=UsersDao.getInstance().insert(dto);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환영합니다!</title>
</head>
<body>
<div class="container">
	<h1>알림</h1>
	<%if(isSuccess){ %>
		<p>
			<strong><%=id %></strong> 회원님 가입 되었습니다.
			<a href="${pageContext.request.contextPath }/users/loginform.jsp">로그인 하러가기</a>
		</p>
	<%}else{ %>
		<p>
			가입이 실패 했습니다. 
			<a href="${pageContext.request.contextPath }/users/signup_form.jsp">다시 시도</a>
		</p>
	<%} %>
</div>

</body>
</html>