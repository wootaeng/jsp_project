<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wootaeng's 잡소리</title>
<jsp:include page="include/resource.jsp"></jsp:include>
<style>
	background-color: #f5f5f5;
</style>


</head>
<body>
<jsp:include page="include/navbar.jsp"></jsp:include>
<div class="container">
	<img style="width:320px;height:180px" src="${pageContext.request.contextPath }/images/laptop-3214756_1280.png"  >
	<ul>
		<li><a href="${pageContext.request.contextPath }/users/signup_form.jsp">회원가입</a></li>
		<li><a href="${pageContext.request.contextPath }/users/loginform.jsp">로그인</a></li>
		<li><a href="${pageContext.request.contextPath }/cafe/list">카페 글 목록 보기</a></li>
		<li><a href="${pageContext.request.contextPath }/file/list">자료실 목록 보기</a></li>
	</ul>
	
	
</div>
	
</body>
</html>