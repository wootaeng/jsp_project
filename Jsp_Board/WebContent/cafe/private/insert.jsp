<%@page import="jsp.cafe.CafeDao"%>
<%@page import="jsp.cafe.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 폼 전송되는 글 제목과 내용을 읽어와서
	String writer=(String)session.getAttribute("id");
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	//2. DB 에 저장하고
	CafeDto dto=new CafeDto();
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setContent(content);
	boolean isSuccess=CafeDao.getInstance().insert(dto);
	
	//3. 응답한다
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wootaeng's ok!</title>
</head>
<body>
	<%if(isSuccess){ %>
		<script>
			alert("새 글이 추가 되었습니다");
			location.href="${pageContext.request.contextPath }/cafe/list";
		</script>
	<%}else{ %>
		<script>
			alert("글 작성 실패!");
			location.href="${pageContext.request.contextPath }/cafe/private/insertform.jsp";
		</script>
	<%} %>
</body>
</html>