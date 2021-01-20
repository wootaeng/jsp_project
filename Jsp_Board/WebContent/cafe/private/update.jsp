<%@page import="jsp.cafe.CafeDao"%>
<%@page import="jsp.cafe.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	//1. 폼 전송된 수정할 글의 번호, 제목, 내용을 읽어와서
    	int num=Integer.parseInt(request.getParameter("num"));
    	String title=request.getParameter("title");
    	String content=request.getParameter("content");
    	
    	//2. DB 에 수정 반영하고
    	CafeDto dto=new CafeDto();
    	dto.setNum(num);
    	dto.setTitle(title);
    	dto.setContent(content);
    	boolean isSuccess=CafeDao.getInstance().update(dto);
    	//3. 응답하기
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
			alert("수정했습니다.");
			location.href="${pageContext.request.contextPath }/cafe/detail.jsp?num=<%=num%>";
		</script>
	<%}else{ %>
		<script>
			<h1>알림</h1>
			<p>
				글 수정 실패!
				<a href="updateform.jsp?num=<%=num%>">다시시도</a>
			</p>
		</script>
	<%} %>
</body>
</html>