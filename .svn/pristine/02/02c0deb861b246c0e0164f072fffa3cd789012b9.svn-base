<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/jobzillaassets/css/bootstrap.min.css"><!-- BOOTSTRAP STYLE SHEET -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/jobzillaassets/css/font-awesome.min.css"><!-- FONTAWESOME STYLE SHEET -->
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/jobzillaassets/css/feather.css"><!-- FEATHER ICON SHEET --> --%>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/jobzillaassets/css/owl.carousel.min.css"><!-- OWL CAROUSEL STYLE SHEET --> --%>
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
    
<%-- <link rel="stylesheet" class="skin" type="text/css" href="${pageContext.request.contextPath }/resources/jobzillaassets/css/skins-type/skin-6.css"> --%>

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
.justify-content-center {
	padding-top: 20px;
}
</style>
<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION }">
	<script>
<%-- 	<p style="color:red; font-weight:bold;"> login Failed : ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message }</p> --%>
		Swal.fire({
	        title: '로그인 실패',         
	        text: '다시 입력해주세요.',
	        icon: 'warning',
	        showCloseButton: true
	    }); 
// 		alert("로그인 실패!! 다시 입력해주세요.");
		<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session" />
  	</script>
</c:if>
<body>
	<div class="page-wraper">
        <!-- CONTENT START -->
        <div class="page-content">

            <!-- Login Section Start -->
            <div class="section-full site-bg-white">
                
                <div class="container-fluid">
                    <div class="row">
	                    <div class="twm-log-reg-form-wrap">
<!-- 	                        <div class="twm-log-reg-logo-head"> -->
<!-- 	                            <a href="/main/index"> -->
<%-- 	                                <img src="${pageContext.request.contextPath }/resources/assets/images/logo1(배경0).png" alt="" class="logo"> --%>
<!-- 	                            </a>  -->
<!-- 	                        </div> -->
	
	                        <div class="twm-log-reg-inner" style="padding: 100px;">
	                            <div class="twm-log-reg-head">
	                                <div class="twm-log-reg-logo">
	                                    <span class="log-reg-form-title">관리자 로그인</span>
	                                </div>
	                            </div>
	                            <div class="twm-tabs-style-2">
	                                
	                                <div class="tab-content" id="myTab2Content">
	                                <form action="/login" method="post" id="adminLoginForm">
	                                    <!--Login Candidate Content-->  
	                                    <div class="tab-pane fade show active" id="twm-login-candidate">
	                                        <div class="row justify-content-center">
	
	                                            <div class="col-md-7">
	                                                <div class="form-group mb-3">
	                                                    <input name="username" id="accountId" type="text" required class="form-control" placeholder="아이디">
	                                                </div>
	                                                <div class="form-group mb-3">
	                                                    <input name="password" id="accountPswd" type="password" class="form-control" required placeholder="비밀번호">
	                                                </div>
	                                            </div>
	                                            <input type="hidden" name="type" value="admin"/>
	                                            
	                                            <div class="col-sm-3" >
	                                                <div class="form-group">
	                                                    <button type="button" class="site-button" style="height: 115px; width: 85%" id="adminLoginBtn">로그인</button>
	                                                </div>
	                                            </div>
	
	                                            <div class="col-md-10">
	                                                <div class="twm-forgot-wrap">
	                                                    <div class="form-group mb-3">
	                                                        <div class="form-check">
	                                                            <input type="checkbox" class="form-check-input" id="remember" name="remember-me">
	                                                            <label class="form-check-label rem-forgot" for="remember">로그인 유지</label>
	                                                        </div>
	                                                    </div>
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
        <!-- CONTENT END -->
	</div>

</body>
<script type="text/javascript">
$(function(){
	var adminLoginForm = $("#adminLoginForm");
	const idPattern = /^[0-9a-zA-Z]{0,20}$/;
	const pwPattern = /^[^가-힣]{10,20}$/;
	
	$("#adminLoginBtn").on("click", function(event) {
	    event.preventDefault();
	    adminLogin();
	});
	
	$("#accountId, #accountPswd").on("keyup", function(event) {
	    if (event.keyCode === 13) {
	        event.preventDefault();
	        adminLogin();
	    }
	});
	
	// 기업로그인
	function adminLogin() {
		
		var adminId = $("#accountId").val();
		var adminPw = $("#accountPswd").val();
		
		if(!idPattern.test(adminId)) {
			Swal.fire({
	            icon: 'info',
	            title: '아이디를 다시 작성해주세요.',
	            text: '영어대소문자+숫자조합 20자리',
	            showCloseButton: true,
	            didClose: () => {
	                $(document).unbind("keyup"); // 기존의 keyup 이벤트 바인딩 해제
	            }
	        }).then((result) => {
	            if (result.dismiss === Swal.DismissReason.close || result.dismiss === Swal.DismissReason.backdrop) {
	                return; // 모달이 닫힌 경우에만 아래 코드 실행
	            }

	            // 모달이 닫히지 않은 경우는 엔터 키를 눌렀을 때
	            // 모달을 닫도록 설정
	            $(document).keyup(function(event) {
	                if (event.key === "Enter") {
	                    Swal.close(); // 모달 닫기
	                }
	            });
	        });
            $("#accountId").focus();
            return false;
        }
		if(!pwPattern.test(adminPw)) {
			Swal.fire({
	            icon: 'info',
	            title: '비밀번호를 다시 작성해주세요.',
	            text: '영어대소문자+숫자+특수문자 조합 10~20자리',
	            showCloseButton: true,
	            didClose: () => {
	                $(document).unbind("keyup"); // 기존의 keyup 이벤트 바인딩 해제
	            }
	        }).then((result) => {
	            if (result.dismiss === Swal.DismissReason.close || result.dismiss === Swal.DismissReason.backdrop) {
	                return; // 모달이 닫힌 경우에만 아래 코드 실행
	            }

	            // 모달이 닫히지 않은 경우는 엔터 키를 눌렀을 때
	            // 모달을 닫도록 설정
	            $(document).keyup(function(event) {
	                if (event.key === "Enter") {
	                    Swal.close(); // 모달 닫기
	                }
	            });
	        });
            $("#accountPswd").focus();
            return false;
        }
		
		adminLoginForm.submit();
	}
	
	
	
});
</script>
