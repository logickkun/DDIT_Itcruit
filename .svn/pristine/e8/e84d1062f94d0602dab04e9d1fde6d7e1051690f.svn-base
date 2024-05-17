<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<style>

		

		.login-wrapper{
			width: 400px;
			height: 350px;
			padding: 40px;
			box-sizing: border-box;
		}

		.login-wrapper > h2{
			font-size: 24px;
			color: #000;
			margin-bottom: 20px;
		}
		#registerForm > input{
			width: 100%;
			height: 48px;
			padding: 0 10px;
			box-sizing: border-box;
			margin-bottom: 16px;
			border-radius: 6px;
			background-color: #F8F8F8;
		}
		#registerForm > input::placeholder{
			color: #D2D2D2;
		}
		#registerForm > input[type="submit"]{
			color: #fff;
			font-size: 16px;
			background-color: #000;
			margin-top: 20px;
		}
		
		#registerForm > input[type="checkbox"]{
			display: none;
		}
		#registerForm > label{
			color: #999999;
		}
		#registerForm input[type="checkbox"] + label{
			cursor: pointer;
			padding-left: 26px;
			background-image: url("checkbox.png");
			background-repeat: no-repeat;
			background-size: contain;
		}
		#registerForm input[type="checkbox"]:checked + label{
			background-image: url("checkbox-active.png");
			background-repeat: no-repeat;
			background-size: contain;
		}

	</style>
<div class="page-content-wrapper border">

		<!-- Title -->
		<div class="row">
			<div class="col-12">
				<h1 class="h5 mb-2 mb-sm-0">계정 관리</h1>
			</div>
		</div>

		<hr>

		<ul class="nav nav-tabs nav-tabs-line mb-3">
			<li class="nav-item"> <a class="nav-link active" data-bs-toggle="tab" href="#tab-3-2"> 계정 목록 </a> </li>
			<li class="nav-item"> <a class="nav-link" data-bs-toggle="tab" href="#tab-3-1"> 계정 추가</a> </li>
		</ul>
		<div class="tab-content d-flex justify-content-center">
			<div class="tab-pane show" id="tab-3-1">
				<button type="button" id="plusBtn" style="background-color: black; color: white; border:none; border-radius:3px">입력</button>
				<div class="login-wrapper border border-2 rounded-2" style="height: 500px; width: 450px;">
					<h2>계정 생성</h2> 
					<input type="hidden" id="entNo" name="entNo" value=${entNo }>
					<form method="post" action="/myPage/enterprise/signUp.do" id="registerForm">
						<div ><span id="idCheck" style="display: inline-block; width: 200px;" > </span></div>
						<input type="text" name="accountId" id="id" placeholder="아이디(영어대소문자+숫자 조합 4~20자리)" class="border-0">
						<input type="password" name="accountPswd" id="pw" placeholder="비밀번호(영어+숫자+특수문자  포함 8~20자리)" class="border-0" required>
						<input type="password" name="reaccountPswd" id="repw" placeholder="비밀번호(영어+숫자+특수문자  포함 8~20자리)" class="border-0">
						<div ><span id="pwCheck" style="display: inline-block; width: 300px;" > </span></div>
						<input type="text" name="accountNm" id="nm" placeholder="가입자명(ex. 회사명_인사과),(ex. 회사명_이름)" class="border-0">
						<input type="submit" value="등록" id="addBtn" class="border-0" style="background-color: black; color: white;">
						<sec:csrfInput/>
					</form>
				</div>
			</div>
			<div class="tab-pane active" id="tab-3-2">
				<div class="card bg-transparent border" style="width: 600px;">
				<!-- Card header START -->
					<div class="card-header bg-light border-bottom">
						<h5 class="mb-0">계정 목록</h5>
					</div>
					<!-- Card header END -->

					<!-- Card body START -->
					<div class="card-body pb-0">
						<!-- Table START -->
						<div class="table-responsive border-0">
							<table class="table align-middle p-4 mb-0 table-hover">
								<c:set value="${idList }" var="idList"/>
								<c:choose>
									<c:when test="${empty idList }">
										<tr>
											<td colspan="4"> 추가된 계정이 없습니다 </td>
										</tr>
									</c:when>
									<c:otherwise>
								<!-- Table head -->
								<thead style="background-color: black; --bs-table-color: white !important;">
									<tr>
										<th scope="col" class="col-4 rounded-start" style="padding-left: 18px;">번호</th> <!-- 폭 줄임 -->
										<th scope="col" class="col-4" style="padding-left: 13px;">아이디</th> <!-- 폭 넓게 설정 -->
										<th scope="col" class="col-4" style="padding-left: 26px;">이름</th> <!-- 폭 넓게 설정 -->
										<th scope="col" class="col-4 rounded-end">삭제</th> <!-- 폭 줄임 -->
									</tr>
								</thead>

								<!-- Table body START -->
								<tbody>
										<c:forEach items="${idList }" var="id" varStatus="status">
											<!-- Table row -->
											<tr>
												<!-- Table data -->
												<td style="padding-left: 28px;">${status.index + 1 }</td>
												<!-- Table data -->
												<td>
													<h6 class="table-responsive-title mb-0"><a href="#">${id.accountId }</a></h6>
												</td>
												<td>
													<h6 class="table-responsive-title mb-0"><a href="#">${id.accountNm }</a></h6>
												</td>
												<td>
													<button class="btn btn-sm btn-danger mb-0 deleteBtn" data-accountid=${id.accountId } >삭제</button>
												</td>
											</tr>
										</c:forEach>
										</c:otherwise>
									</c:choose>
									
								</tbody>
								<!-- Table body END -->
							</table>
						</div>
						<!-- Table END -->
					</div>
					<!-- Card body END -->
				</div>
			</div>
		</div>
	</div>
	
<script type="text/javascript">
$(function(){

    var idCheckFlag = false;
	
    $("#id").on("keyup", function(){
        
    	var id = $("#id").val();
        var idCheckDiv = $("#idCheck");
    	
        
        idCheckDiv.text("");
        
        $.ajax({
            url: "/myPage/enterprise/idCheck.do",
            type: "POST",
            data: {
                id: id
            },
            beforeSend: function(xhr) { // 데이터를 전송 하기 전, 헤더에 csrf값 설정
                xhr.setRequestHeader(header, token);
            },
            success: function(res) {
                if (res == "NOTEXIST") {
                    $("#idCheck").text("사용가능한 아이디 입니다").css("color", "green");
                    idCheckFlag = true;
                } else {
                    $("#idCheck").text("이미 사용중인 아이디 입니다").css("color", "red");
                    idCheckFlag = false;
                }
            }
        });
    });


    var pwFlag = false;
    
    $("#pw, #repw").on("keyup",function(){
        var pw = $("#pw").val();
        var repw = $("#repw").val();
        
        
	    if(pw != '' && repw != ''){
	    	if(pw == repw){
	    		$("#pw,#repw").css("color","green");
	    		$("#pwCheck").text("비밀번호가 일치합니다").css("color","green");
	    		pwFlag = true;
	    	}else{
	    		$("#pw,#repw").css("color","red");
	    		$("#pwCheck").text("비밀번호가 일치하지 않습니다").css("color","red");
	    		pwFlag = false;
	    	}
	    }else{
	    	$("#pw,#repw").css("color","");
	    }
    });  
    
    
    $("#addBtn").on("click",function(){
    
    	
    	console.log(idCheckFlag);
    	console.log(pwFlag);
    	
    	const idPattern = /^[0-9a-zA-Z]{6,20}$/;
    	const pwPattern = /^(?=.*[0-9])(?=.*[\W_])(?!.*[가-힣]).{8,20}$/;
    	const nmPattern = /^[가-힣a-zA-Z_]+$/;
    	
    	var registerForm = $("#registerForm");
    	
    	var id = $("#id").val();
    	var pw = $("#pw").val();
    	var repw = $("#repw").val();
    	var entNo = $("#entNo").val();
    	var nm = $("#nm").val();
    	
    	if (id == "" || !idPattern.test(id)) {
    	    alert("아이디는 영어대소문자+숫자 조합 4~20자리 이하로 설정해주세요");
    	    $("#id").focus();
    	    return false;
    	}
    	if (pw == "" || !pwPattern.test(pw)) {
    	    alert("비밀번호는 영어+숫자+특수문자 포함 8~20자리 이하로 설정해주세요");
    	    $("#pw").focus();
    	    return false;
    	}
    	if (nm == "" || !nmPattern.test(nm)) {
    	    alert("이름은 (회사명_부서) 또는 (회사명_이름)을 입력해주세요");
    	    $("#nm").focus();
    	    return false;
    	}
		
	    if (!idCheckFlag) {
	        alert("아이디 중복을 확인해주세요");
	        $("#id").focus();
	        return false;
	    }
	    if (!pwFlag) {
	        alert("비밀번호를 확인해주세요");
	        $("#pw").focus();
	        return false;
	    }
    
		$.ajax({
			url : "/myPage/enterprise/countId.do",
			type : "post",
			data : {
				entNo : entNo
			},
			beforeSend: function(xhr) { // 데이터를 전송 하기 전, 헤더에 csrf값 설정
                xhr.setRequestHeader(header, token);
            },
            success: function(count) {
                if (count >= 6) {
                    console.log(count);
                    alert("추가 계정은 5개까지만 생성가능합니다");
                    location.reload();
                    return false; // AJAX 요청이 성공하더라도 서브밋을 방지하기 위해 false 반환
                } else {
                    // 5개 미만일 경우 서브밋
                    registerForm.submit();
                }
            },
            error: function() {
                alert("서버 오류가 발생했습니다. 다시 시도해주세요.");
                return false; 
            }
        });

        return false;
    });
    
    
    $(".deleteBtn").on("click",function(){
    	
    	var accountId = $(this).data("accountid");
    	
    	var deleteBtn = $(this);
    	
    	console.log(accountId);
    	
    	Swal.fire({
    		   title: '계정을 삭제 하시겠습니까?',
    		   icon: 'warning',
    		   
    		   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
    		   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
    		   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
    		   confirmButtonText: '승인', // confirm 버튼 텍스트 지정
    		   cancelButtonText: '취소', // cancel 버튼 텍스트 지정
    		   
    		   reverseButtons: false, // 버튼 순서 거꾸로
    		   
    		}).then(result => {
    		   // 만약 Promise리턴을 받으면,
    		   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
    		   		
					$.ajax({
						url : "/myPage/enterprise/deleteId.do",
						type : "post",
						data : {
							accountId : accountId
						},
						beforeSend: function(xhr) { // 데이터를 전송 하기 전, 헤더에 csrf값 설정
			                xhr.setRequestHeader(header, token);
			            },
			            success: function(res){
			            	deleteBtn.closest("tr").remove();
			            },
			            error: function(xhr, status, error) {
			                console.error(error);
			                alert("삭제 중 오류가 발생했습니다.");
			            }
			            
					})
    			   
    		
    		   }
    		});
    	
    });
    
    
    $("#plusBtn").on("click",function(){
    	
    	$("#id").val("daangn1");
    	$("#pw").val("123qwe!@#QWE");
    	$("#repw").val("123qwe!@#QWE");
    	$("#nm").val("당근_인사팀");
    	
    });
    
    
});




</script>