<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일업로드 - Wootaeng</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../../include/navbar.jsp"></jsp:include>
<div class="container">
	<h1>좋은 자료 부탁해요!</h1>
	<!-- 
		파일 업로드 폼 작성법
		1. method="post"
		2. enctype="multipart/form-data"
		3. <input type="file" />
	 -->
	<form action="upload.jsp" method="post" enctype="multipart/form-data">
		<div class="row mb-3">
			<label for="title" class="col-sm-2 col-form-label">제목</label>
			<div class="col-sm-10">
				<input class="form-control" type="text" name="title" id="title"/>
			</div>
		</div>
		<div class="row mb-3">
			<label class="col-sm-2 col-form-label" for="myFile">첨부파일</label>
			<div class="col-sm-10">
				<input class="form-control" type="file" name="myFile" id="myFile"/>
			</div>
		</div>
		<button class="btn btn-dark" type="submit">업로드</button>
	</form>
</div>
</body>
</html>