<%@page import="jsp.users.UsersDao"%>
<%@page import="jsp.users.UsersDto"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String url=request.getParameter("url");
    	String encodedUrl=URLEncoder.encode(url);
    	
    	String id=request.getParameter("id");
    	String pwd=request.getParameter("pwd");
    	UsersDto dto=new UsersDto();
    	dto.setId(id);
    	dto.setPwd(pwd);
    	
    	boolean isValid=UsersDao.getInstance().isValid(dto);
    	
    	String isSave=request.getParameter("isSave");
    	
    	if(isSave == null){//체크 박스를 체크 안했다면
    		//저장된 쿠키 삭제 
    		Cookie idCook=new Cookie("savedId", id);
    		idCook.setMaxAge(0);//삭제하기 위해 0 으로 설정 
    		response.addCookie(idCook);
    		
    		Cookie pwdCook=new Cookie("savedPwd", pwd);
    		pwdCook.setMaxAge(0);
    		response.addCookie(pwdCook);
    	}else{//체크 박스를 체크 했다면 
    		//아이디와 비밀번호를 쿠키에 저장
    		Cookie idCook=new Cookie("savedId", id);
    		idCook.setMaxAge(60*60);//하루동안 유지
    		response.addCookie(idCook);
    		
    		Cookie pwdCook=new Cookie("savedPwd", pwd);
    		pwdCook.setMaxAge(60*60);
    		response.addCookie(pwdCook);
    	}
    	
    %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wootaeng's ok</title>
</head>
<body>
<div class="container">
	<h1>알림</h1>
	<%if(isValid){ 
		//로그인 했다는 의미에서 session scope  에  "id"  라는 키값으로 로그인된 아이디를 담는다.
		session.setAttribute("id", id);%>
		<p>
			<strong><%=id %></strong>님 로그인 되었습니다.
			<a href="<%=url%>">확인</a>
		</p>
	<%}else{ %>
		<p>
			아이디 혹은 비밀번호가 틀려요!
			<a href="loginform.jsp?url=<%=encodedUrl %>">다시 시도</a>
		</p>
	<%} %>
</div>
</body>
</html>