<%@page import="jsp.users.UsersDao"%>
<%@page import="jsp.users.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String id=(String)session.getAttribute("id");
    	String pwd=request.getParameter("pwd");
    	String newPwd=request.getParameter("newPwd");
    	
    	UsersDto dto=new UsersDto();
    	dto.setId(id);
    	dto.setPwd(pwd);
    	dto.setNewPwd(newPwd);
    	
    	boolean isSuccess=UsersDao.getInstance().updatePwd(dto);
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wootaeng's ok</title>
</head>
<body>
	<%if(isSuccess){ //비밀번호 수정 성공이면
		//다시 로그인 하도록 로그아웃 처리를 한다
		session.removeAttribute("id");%>
			
		
		<p>
			<strong><%=id %></strong>님 비밀번호를 수정했습니다.
			<a href="${pageContext.request.contextPath }/users/loginform.jsp">다시 로그인하기</a>
		</p>
	<%}else{ %>
		<p>
			이전 비밀번호가 일치 하지 않습니다.
			<a href="pwd_updateform.jsp">다시시도</a>
		</p>
	<%} %>
</body>
</html>