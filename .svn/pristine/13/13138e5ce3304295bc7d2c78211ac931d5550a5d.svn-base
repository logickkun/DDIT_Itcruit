<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/jobzillaassets/css/bootstrap.min.css"><!-- BOOTSTRAP STYLE SHEET -->
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/jobzillaassets/css/font-awesome.min.css"><!-- FONTAWESOME STYLE SHEET --> --%>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/jobzillaassets/css/feather.css"><!-- FEATHER ICON SHEET --> --%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/jobzillaassets/css/owl.carousel.min.css"><!-- OWL CAROUSEL STYLE SHEET -->
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/jobzillaassets/css/magnific-popup.min.css"><!-- MAGNIFIC POPUP STYLE SHEET --> --%>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/jobzillaassets/css/lc_lightbox.css"><!-- Lc light box popup -->      --%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/jobzillaassets/css/bootstrap-select.min.css"><!-- BOOTSTRAP SLECT BOX STYLE SHEET  -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/jobzillaassets/css/dataTables.bootstrap5.min.css"><!-- DATA table STYLE SHEET  -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/jobzillaassets/css/select.bootstrap5.min.css"><!-- DASHBOARD select bootstrap  STYLE SHEET  -->     
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/jobzillaassets/css/dropzone.css"><!-- DROPZONE STYLE SHEET --> --%>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/jobzillaassets/css/scrollbar.css"><!-- CUSTOM SCROLL BAR STYLE SHEET --> --%>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/jobzillaassets/css/datepicker.css"><!-- DATEPICKER STYLE SHEET --> --%>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/jobzillaassets/css/flaticon.css"> <!-- Flaticon --> --%>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/jobzillaassets/css/swiper-bundle.min.css"><!-- Swiper Slider --> --%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/jobzillaassets/css/style.css"><!-- MAIN STYLE SHEET -->

<!-- THEME COLOR CHANGE STYLE SHEET -->
<%-- <link rel="stylesheet" class="skin" type="text/css" href="${pageContext.request.contextPath }/resources/jobzillaassets/css/skins-type/skin-6.css"> --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
/* 헤더,푸더랑 좌우간격 맞춤 */
.page-content {
  margin-left: 0rem;
}
.twm-log-reg-form-wrap {
    width: 1300px; /* 너비 설정 */
    margin: 0 auto; /* 좌우 여백을 auto로 설정하여 요소를 가운데 정렬 */
    padding: 30px 0; /* 위아래 여백 설정 */
    border-radius: 10px;
    background-color: #fff;
}
.twm-log-reg-form-wrap .twm-log-reg-inner .twm-tabs-style-2 {
    text-align: center;
    border: 1px black solid;
}
.form-control {
    height: 50px;
    padding: 5px;
}
.twm-tabs-style-2 {
    border: 1px black solid;
    width: 600px;
    margin: 0 auto;
}
.twm-tabs-style-2 .nav-tabs .nav-item .nav-link {
	padding: 0px;
	margin: 0px;
	border-radius: 0px;
}
</style>
<body>
<div class="page-wraper">
	<!-- CONTENT START -->
	<div class="page-content">
		<!-- Login Section Start -->
		<div class="section-full site-bg-white">
			<div class="container-fluid">
				<div class="row">
				
					<div class="twm-log-reg-form-wrap">
<!-- 						<div class="twm-log-reg-logo-head"> -->
<!-- 							<a href="/main/index"> -->
<%-- 								<img src="${pageContext.request.contextPath }/resources/assets/images/logo1(배경0).png" alt="" --%>
<!-- 									class="logo"> -->
<!-- 							</a> -->
<!-- 						</div> -->
						
						<div class="twm-log-reg-inner">
							<div class="twm-log-reg-head">
								<div class="twm-log-reg-logo">
									<span class="log-reg-form-title">추가정보입력</span>
								</div>
							</div>
							
							<div class="twm-tabs-style-2">

								<ul class="nav nav-tabs" id="myTab2" role="tablist">
									<!--Login Candidate-->
									<li class="nav-item">
										<button style="width: 598px; height: 60px;" class="nav-link active"
											data-bs-toggle="tab" data-bs-target="#twm-login-candidate"
											type="button" id="member">
											<i class="fas fa-user-tie"></i>개인회원
										</button>
									</li>
								</ul>

								<div class="tab-content" id="myTab2Content">
									<!-- 개인회원 회원가입 -->
                                       		<form action="/account/member/kakaoInfoUpdate.do" method="post" id="kakaoUpdateForm">
	                                            <!--Candidate Signup Content-->  
	                                            <div class="tab-pane fade show active" id="twm-candidate-Signup">
	                                                <div class="row justify-content-center">
														<input type="hidden" name="token" value="${account.token }">	
	                                                    <div class="col-md-10">
	                                                        <div class="form-group mb-3">
	                                                            <input name="accountId" id="accountId" type="text" maxlength="20" class="form-control" placeholder="아이디">
	                                                            <p id="accountIdMessage"></p>
	                                                        </div>
	                                                    </div>
	
	                                                    <div class="col-md-10">
	                                                        <div class="form-group mb-3">
	                                                            <input name="accountPswd" id="accountPswd" type="password" maxlength="20" class="form-control" placeholder="비밀번호(영어대소문자+숫자+특수문자 조합 10자리 이상)" required>
	                                                        </div>
	                                                    </div>
	
	                                                    <div class="col-md-10">
	                                                        <div class="form-group mb-3">
	                                                            <input name="reaccountPswd" id="reaccountPswd" type="password" maxlength="20" class="form-control" placeholder="비밀번호 확인(영어대소문자+숫자+특수문자 조합 10자리 이상)">
	                                                        </div>
	                                                    </div>
	                                                    
	                                                    
	                                                    
	
	                                                    <div class="col-md-10">
	                                                        <div class="form-group mb-3">
	                                                            <div class="input-group">
	                                                                <input name="accountZip" id="accountZip" type="text" class="form-control" placeholder="">
	                                                                <button type="button" onclick="DaumPostcode()" class="btn btn-primary">주소 찾기</button>
	                                                            </div>
	                                                        </div>
	                                                    </div>
	
	                                                    <div class="col-md-10">
	                                                        <div class="form-group mb-3">
	                                                            <input name="accountAddr1" id="accountAddr1" type="text" class="form-control" placeholder="주소">
	                                                        </div>
	                                                    </div>
	
	                                                    <div class="col-md-10">
	                                                        <div class="form-group mb-3">
	                                                            <input name="accountAddr2" id="accountAddr2" type="text" class="form-control" placeholder="상세주소">
	                                                        </div>
	                                                    </div>
	
	                                                    <div class="col-md-10">
	                                                        <div class="form-group mb-3">
	                                                            <div class="form-check">
	                                                                <input type="checkbox" class="form-check-input" id="agree1">
	                                                                <label class="form-check-label" for="agree1"><i>[전체동의]  </i>필수동의 항목에 모두 동의합니다</label>
	                                                            </div>
	                                                            <hr>
	                                                        </div>
	                                                    </div>
	                                                    
	                                                    <div class="col-md-10">
	                                                        <div class="form-group mb-3">
	                                                            <div class="form-check">
	                                                                <input type="checkbox" class="form-check-input" id="agree2">
	                                                                <label class="form-check-label" for="agree2">
	                                                                    <span><i style="color: red;">[필수]  </i>만 15세 이상입니다</span>
	                                                                </label>
<!-- 	                                                                <input type="checkbox" class="form-check-input"> -->
	                                                            </div>
	                                                            <div class="form-check">
	                                                                <input type="checkbox" class="form-check-input" id="agree3">
	                                                                <label class="form-check-label" for="agree3">
	                                                                    <span><i style="color: red;">[필수]  </i>이용약관 동의</span>
	                                                                </label>
<!-- 	                                                                <input type="checkbox" class="form-check-input"> -->
	                                                            </div>
	                                                            <div class="form-check">
	                                                                <input type="checkbox" class="form-check-input" id="agree4">
	                                                                <label class="form-check-label" for="agree4">
	                                                                    <span><i style="color: red;">[필수]  </i>개인정보 수집 및 이용 동의</span>
	                                                                </label>
<!-- 	                                                                <input type="checkbox" class="form-check-input"> -->
	                                                            </div>
	                                                        </div>
	                                                    </div>
	                                                    
	                                                    <div class="col-md-10">
	                                                        <div class="form-group">
	                                                            <button type="submit" class="site-button" id="kakaoUpdateBtn">확인</button>
	                                                        </div>
	                                                    </div>
	        
	                                                </div>
	                                            </div>
	                                            <sec:csrfInput/>
                                            </form>
									
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Login Section End -->

	</div>
</div>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
//아이디 비교
$("#accountId").focusout(function() {
	var accountId = $("#accountId").val();
	var data = {
		accountId : accountId
	}
	
	$.ajax({
		type : "post",
		url : "/account/member/checkId.do",
		contentType : "application/json; charset=utf-8",
		data : JSON.stringify(data),
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
        },
		cache : false,
		success : function(data){
// 			console.log(data);
			if (data) {
                // 데이터베이스에 해당 accountId가 이미 존재하는 경우
                $("#accountIdMessage").css("color", "red");
                $("#accountIdMessage").css("font-size", "smaller");
                $("#accountIdMessage").css("text-align", "left");
                $("#accountIdMessage").text("*이미 사용 중인 아이디입니다.");
            } else {
                // 데이터베이스에 해당 accountId가 존재하지 않는 경우
            	$("#accountIdMessage").css("color", "green");
            	$("#accountIdMessage").css("font-size", "smaller");
                $("#accountIdMessage").css("text-align", "left");
                $("#accountIdMessage").text("*사용가능한 아이디입니다.");
            }
		}
	});

});

//비밀번호 비교
$("#accountPswd, #reaccountPswd").keyup(function() {
    var password = $("#accountPswd").val();
    var confirmPassword = $("#reaccountPswd").val();
//     console.log(" password  " + password);
//     console.log(" confirmPassword  " + confirmPassword);

    // 비밀번호와 재입력 비밀번호가 모두 입력되었는지 확인
    if (password !== '' && confirmPassword !== '') {
        // 비밀번호와 재입력 비밀번호가 일치하는지 확인
        if (password === confirmPassword) {
            // 일치할 경우
            $("#accountPswd, #reaccountPswd").css("color", "green"); // 입력 필드의 텍스트 색상을 초록색으로 변경
        } else {
            // 일치하지 않을 경우
            $("#accountPswd, #reaccountPswd").css("color", "red"); // 입력 필드의 텍스트 색상을 빨간색으로 변경
        }
    } else {
        // 비밀번호나 재입력 비밀번호가 아직 입력되지 않은 경우
        $("#accountPswd, #reaccountPswd").css("color", ""); // 입력 필드의 텍스트 색상 초기화
    }
});
$(function(){
	var kakaoUpdateForm = $("#kakaoUpdateForm");
	var kakaoUpdateBtn = $("#kakaoUpdateBtn");
	
	// 동의항목 전체선택/해제
    $("input[id=agree1]").click(function(){
   	  if(  $(this).is(":checked") === true){
   	    $("#agree2").prop("checked", true);
   	    $("#agree3").prop("checked", true);
   	    $("#agree4").prop("checked", true);
   	  }else{
   	    $("#agree2").prop("checked", false);
   	    $("#agree3").prop("checked", false);
   	    $("#agree4").prop("checked", false);
   	  }
   	});
	
	kakaoUpdateBtn.on("click", function(){
		console.log("mem click");
		
		
		kakaoUpdateForm.submit();
	});
   
});

function DaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
            } 

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('accountZip').value = data.zonecode;
            document.getElementById("accountAddr1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("accountAddr2").focus();
            
        }
    }).open();
}
</script>