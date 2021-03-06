<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wotaeng - 회원가입</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<style>
	/* example 로그인 폼을 만들기 위한 css */
	html,
	body {
	  height: 100%;
	}
	
	body {
	  display: -ms-flexbox;
	  display: flex;
	  -ms-flex-align: center;
	  align-items: center;
	  padding-top: 40px;
	  padding-bottom: 40px;
	  background-color: #f5f5f5;
	}
	
	.form-signin {
	  width: 100%;
	  max-width: 330px;
	  padding: 15px;
	  margin: auto;
	}
	.form-signin .checkbox {
	  font-weight: 400;
	}
	.form-signin .form-control {
	  position: relative;
	  box-sizing: border-box;
	  height: auto;
	  padding: 10px;
	  font-size: 16px;
	}
	.form-signin .form-control:focus {
	  z-index: 2;
	}
	.form-signin input[type="email"] {
	  margin-bottom: -1px;
	  border-bottom-right-radius: 0;
	  border-bottom-left-radius: 0;
	}
	.form-signin input[type="password"] {
	  margin-bottom: 10px;
	  border-top-left-radius: 0;
	  border-top-right-radius: 0;
	}
	
	
</style>
</head>
<body>
<jsp:include page="../include/navbar.jsp"></jsp:include>
	<!-- 
		novalidate 는 웹브라우저 자체의 검증기능 사용허지 않기 
		<input type="email"/> 같은 경우 웹브라우저가 직접 개입하기도 한다.
		해당기능 사용하지 않기 위해서는 novalidate 를 form 에 명시해야한다.
	-->
	<form class="form-signin" action="signup.jsp" method="post" id="myForm" novalidate>
		<h1 class="h3 mb-3 font-weight-normal">Please sign up</h1>
		<div class="form-group">
			<label for="id">아이디</label>
			<input class="form-control" type="text" name="id" id="id" />
			<small class="form-text text-muted">영문자 소문자로 5-10글자 이내로 입력하세요</small>
			<div class="valid-feedback">사용할 수 있는 아이디 입니다</div>
			<div class="invalid-feedback">사용할 수 없는 아이디 입니다</div>
			
		</div>
		<div class="form-group">
			<label for="pwd">비밀번호</label>
			<input class="form-control is-valid" type="password" name="pwd" id="pwd" />
			<small class="form-text text-muted">5~10 글자 이내로 입력하세요</small>
			<div class="invalid-feedback">비밀번호를 확인 하세요</div>
		</div>
		<div class="form-group">
			<label for="pwd2">비밀번호 확인</label>
			<input class="form-control" type="password" id="pwd2" />
		</div>
		<div class="form-group">
			<label for="email">이메일</label>
			<input class="form-control is-invalid" type="email" name="email" id="email" />
			<div id="emailFeedback" class="invalid-feedback">이메일 형식을 확인 하세요</small>
			
		</div>
		<button class="btn btn-primary btn-outline-dark" type="submit">가입</button>
		<button class="btn btn-emergency btn-outline-dark" type="button" onclick="javascript:window.location='${pageContext.request.contextPath }/index.jsp'">취소</button>
	</form>
</div>
<script>
	
	


	// 아이디를 검증할 정규 표현식
	// 영문자 소문자로 시작하고 5~10 글자 이내인지 검증
	let reg_id=/^[a-z].{4,9}$/;
	
	// 비밀번호를 검증할 정규 표현식
	//5~10 글자 이내인지 검증
	let reg_pwd=/^.{5,10}$/;
	// 이메일을 검증할 정규 표현식 (정확히 검증하려면 javascript 이메일 정규 표현식 검색해서 사용!)
	// @ 가 포함되어 있는지 검증
	let reg_email=/@/;
	
	//아이디 유효성 여부를 관리할 변수 만들고 초기값 부여하기
	let isIdValid=false;
	//비밀번호 유효성 여부를 관리할 변수 만들고 초기값 부여하기
	let isPwdValid=false;
	//이메일 유효성 여부를 관리할 변수 만들고 초기값 부여하기
	let isEmailValid=false;
	//폼 전체의 유효성 여부를 관리할 변수 만들고 초기값 부여하기
	let isFormValid=false;
	
	
	//폼에 submit 이벤트가 일어 났을때 jquery 를 활용해서 폼에 입력한 내용 검증하기
	

	
	// id 가 myForm 인 요소에 submit 이벤트가 일어 났을때 실행할 함수 등록 
	$("#myForm").on("submit",function(){
		//폼 전체의 유효성 여부를 얻어낸다.
		isFormValid = isIdvalid && isPwdValid && isEmailValid;
		//만일 폼 이 유효하지 않는다면
		if(!isFormValid){
			return false; //폼 전송 막기
			
		}
	});
	
	//이메일을 입력했을때 실행할 함수 등록
	$("#email").on("input", function(){
		let inputEmail=$("#email").val();
		//일단 모든 검증 클래스를 제거하고
		$("#email").removeClass("is-valid is-invalid");
		//만일 이메일이 정규표현식에 매칭되지 않는다면
		if(!reg_email.test(inputEmail)){
			isEmailValid=false;
			$("#email").addClass("is-invalid");
		}else{
			isEmailValid=true;
			$("#email").addClass("is-valid");
		}
	});
	
	// id 가 pwd 와  pwd2 인 요소에 input(입력) 이벤트가 일어 났을때 실행할 함수 등록 
	$("#pwd, #pwd2").on("input", function(){
		// input 이벤트가 언제 일어나는지 확인 요망!
		//console.log("input!!");
		
		//입력한 두 비밀번호를 읽어온다.
		let pwd=$("#pwd").val();
		let pwd2=$("#pwd2").val();
		//일단 모든 검증 클래스를 제거하고
		$("#pwd").removeClass("is-valid is-invalid");
		
		//비밀번호가 정규식 표현식에 매칭되지 않으면
		if(!reg_pwd.test(pwd)){
			//비밀번호가 유효하지 않았다고 표시하고
			$("#pwd").addClass("is-invalid");
			isPwdValid=false;
			//함수를 여기서 종료
			return;
		}
		
		//두 비밀번호가 같은지 확인해서
		if(pwd==pwd2){//만일 같으면 
			//유효하다는 클래스를 추가 
			$("#pwd").addClass("is-valid");
			isPwdValid=true;
		}else{//다르면
			//유효하지 않다는 클래스 추가 
			$("#pwd").addClass("is-invalid");
			isPwdValid=false;
		}
	});
	
	$("#id").on("input",function(){
		//1. 입력한 아이디를 읽어와서
		let inputId=$("#id").val();
		
		
		//2. 서버에 ajax 요청으로 보내서 사용 가능 여부를 응답 받아서 반응을 보여준다.
		//일단 모든 검증 클래스를 제거하고
		
	
		
		$("#id").removeClass("is-valid is-invalid");
		//입력한 문자열이 정규표현식과 매칭되는지 테스트
		
		if(!reg_id.test(inputId)){//만일 매칭되지 않으면
			//아이디가 유효하지 않다고 표시하고
			$("id").addClass("is-invalid");
			//함수를 여기서 종료한다
			return;
		}
		$.ajax({
			url:"checkid.jsp",
			method:"GET",
			data:"inputId="+inputId,
			success:function(responseData){
				/*
					checked.jsp 페이지에서 응답할 때 
					contentType="application/json" 이라고 설정하면
					함수의 인자로 전달되는 responseData 는 object 이다
					{isExist:true} or {isExist:false}
					형식의 object 이기 때문에 바로 사용할 수 있다.
				*/
				console.log(responseData);
					if(responseData.isExist){
						$("#id").addClass("is-invalid");
						isIdValid=false;
					}else{
						$("#id").addClass("is-valid");
						//아이디가 유효 하다고 표시한다. 
						isIdValid=true;
					}
			}
			
				
		});
		
	});
</script>
</body>
</html>