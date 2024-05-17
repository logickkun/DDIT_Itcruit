<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/jobzillaassets/css/bootstrap.min.css"><!-- BOOTSTRAP STYLE SHEET --> --%>
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




<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
/* 헤더,푸더랑 좌우간격 맞춤 */
.page-content {
  margin-left: 0rem;
}
.twm-log-reg-form-wrap {
    width: 1300px;
    margin: 0 auto;
    padding: 30px 0;
    border-radius: 10px;
    background-color: #fff;
}
.twm-log-reg-form-wrap .twm-log-reg-inner .twm-tabs-style-2 {
    text-align: center;
/*     border: 1px black solid; */
}
.form-control {
    height: 50px;
    padding: 5px;
    background-color: #e4e1fc;
}
.twm-tabs-style-2 {
    width: 600px;
    margin: 0 auto;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100%;
}
}
.twm-tabs-style-2 .nav-tabs .nav-item .nav-link {
	padding: 0px;
	margin: 0px;
	border-radius: 0px;
}
.tab-content {
    width: 100%;
    text-align: center; /* 내부 요소들을 가운데 정렬 */
}
.twm-log-reg-form-wrap .twm-log-reg-inner {
	padding: 20px 20px;
}
.container-fluid {
	padding-top: 100px;
	padding-bottom: 50px;
}
/* 아이디찾기, 비밀번호찾기 글꼴 */
.twm-log-reg-head .log-reg-form-title {
    font-size: 27px;
}
/* 아이디찾기, 비밀번호찾기 버튼 */
.site-button {
    background-color: #8d7ffc;
}
.site-button:hover {
    background-color: #7065c9;
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
<!--                             <div class="twm-log-reg-logo-head"> -->
<!--                                 <a href="index.html"> -->
<%--                                     <img src="${pageContext.request.contextPath }/resources/assets/images/logo1(배경0).png" alt="" class="logo"> --%>
<!--                                 </a>  -->
<!--                             </div> -->
                            
<!--                             <div class="col-md-2"></div> -->
							<div style="display: flex; justify-content: center;">
                            <div class="col-md-5" style="border: 1px #786be4 solid;">
                                <div class="twm-log-reg-inner">
                                    <div class="twm-log-reg-head">
                                        <div class="twm-log-reg-logo">
                                            <span class="log-reg-form-title">아이디 찾기</span>
                                            <p class="log-reg-form-content">회원가입시 등록한 이름과 이메일을 입력해주세요.</p>
                                        </div>
                                    </div>
									<div style="display: flex; justify-content: center;">
                                    <div class="twm-tabs-style-2">
                                        <div class="tab-content" id="myTab2Content">
                                            <div class="tab-pane fade show active" id="twm-login-candidate">
                                            
												<form action="/account/member/searchId.do" id="idFind" method="post">
	                                               <div class="row" style="justify-content: center;"> 
	                                                   <div class="col-md-9">
	                                                       <div class="form-group mb-3">
	                                                           <input name="accountNm" id="accountNm" type="text" required class="form-control" placeholder="이름을 입력해주세요.">
	                                                       </div>
	                                                       <div class="form-group mb-3">
	                                                           <input name="accountMail" id="accountMail" type="text" class="form-control" required placeholder="이메일을 입력해주세요.">
	                                                       </div>
	                                                   </div>
	                                                   
	                                                   <div class="col-md-9" >
	                                                       <div class="form-group">
	                                                           <button type="button" id="idFindBtn" 
	                                                           	class="site-button">아이디 찾기</button>
	                                                       </div>
	                                                   </div>
	                                                   <!-- 모달 -->
	                                                   <!-- <a data-bs-toggle="modal" href="#saved-jobs-view" role="button" class="custom-toltip">
	                                                       <span class="fa fa-eye"></span>
	                                                       <span class="custom-toltip-block">Veiw</span>
	                                                   </a> -->
	                                               </div>
	                                               <sec:csrfInput/>
												</form>
												
                                            </div>
                                        </div>
                                    </div>
									</div>
                                </div>
                            </div>

                            <div class="col-md-5" style="border: 1px #786be4 solid;">
                                <div class="twm-log-reg-inner">
                                    <div class="twm-log-reg-head">
                                        <div class="twm-log-reg-logo">
                                            <span class="log-reg-form-title">비밀번호 찾기</span>
                                            <p class="log-reg-form-content">회원가입시 등록한 아이디, 이름, 이메일을 입력해주세요.</p>
                                        </div>
                                    </div>
									<div style="display: flex; justify-content: center;">
                                    <div class="twm-tabs-style-2">
                                        <div class="tab-content" id="myTab2Content">
                                            <div class="tab-pane fade show active" id="twm-login-candidate">
												
												<form action="/account/member/searchPw.do" id="pwFind" method="post">													
	                                               <div class="row" style="justify-content: center;">
	
	                                                   <div class="col-md-9">
	                                                       <div class="form-group mb-3">
	                                                           <input name="accountId" id="pwaccountId" type="text" required class="form-control" placeholder="아이디를 입력해주세요.">
	                                                       </div>
	                                                       <div class="form-group mb-3">
	                                                           <input name="accountNm" id="pwaccountNm" type="text" class="form-control" required placeholder="이름을 입력해주세요.">
	                                                       </div>
	                                                       <div class="form-group mb-3">
	                                                           <input name="accountMail" id="pwaccountMail" type="text" class="form-control" required placeholder="이메일을 입력해주세요.">
	                                                       </div>
	                                                   </div>
	                                                   
	                                                   <div class="col-md-9">
	                                                       <div class="form-group">
	                                                           <button type="button" id="pwFindBtn" class="site-button">비밀번호 찾기</button>
	                                                       </div>
	                                                   </div>
	                                               </div>
												</form>
												
                                            </div>
                                        </div>
                                    </div>
									</div>
                                </div>
                            </div>
<!--                             <div class="col-md-2"></div> -->
						</div>
                        </div>
                    </div>
                </div>
            </div>   
            <!-- Login Section End -->
        </div>
        <!-- CONTENT END -->


        <!--Model Popup Section Start-->
        <!-- 아이디 찾기 -->
        <div class="modal fade twm-saved-jobs-view" id="findid" aria-hidden="true" aria-labelledby="saved_job_view" tabindex="-1">
	
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <form>
    
                        <div class="modal-header">
                            <h2 class="modal-title" id="saved_job_view">ITcruit</h2>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
    
                        <div class="modal-body">
                            <ul class="list-unstyled idcheck">
                                <li><strong>아이디는 ****** 입니다</strong></li>
                            </ul>
                        </div>
    
                        <div class="modal-footer">
                            <button type="button" class="site-button" data-bs-dismiss="modal">확인</button>
                        </div>
    
                    </form>
                </div>
            </div>
            
        </div>
        <!-- 비밀번호 찾기 -->
        <div class="modal fade twm-saved-jobs-view" id="findpw" aria-hidden="true" aria-labelledby="saved_job_view" tabindex="-1">
	
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <form>
    
                        <div class="modal-header">
                            <h2 class="modal-title" id="saved_job_view">ITcruit</h2>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
    
                        <div class="modal-body">
                            <ul class="list-unstyled ">
                                <li><strong>임시 비밀번호가 전송되었습니다.</strong></li>
                                <li><p>메일 주소를 확인해주세요.</p></li>
                            </ul>
                        </div>
    
                        <div class="modal-footer">
                            <button type="button" class="site-button" data-bs-dismiss="modal">확인</button>
                        </div>
    
                    </form>
                </div>
            </div>
            
        </div>



 	</div>

</body>
<script type="text/javascript">
$(function(){
	var idFind = $("#idFind");
	var idFindBtn = $("#idFindBtn");
	var pwFind = $("#pwFind");
	var pwFindBtn = $("#pwFindBtn");

	// id찾기
	idFindBtn.on("click", function(){
		
		var accountNm = $("#accountNm").val();
		var accountMail = $("#accountMail").val();
		
		if (accountNm.trim() === '' || accountMail.trim() === '') {
	        console.log("입력값이 비어있습니다.");
	        return; 
	    }
		
		console.log("id찾기", accountNm, accountMail);
		
		var userObj = {
			accountNm : accountNm,
			accountMail : accountMail
		}

		$.ajax({
			type : "post",
			url : "/account/member/searchId.do",
			contentType : "application/json; charset=utf-8",
			data : JSON.stringify(userObj),
			beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
            },
			success : function(result){
// 				console.log(result);
				if(result != ""){
					console.log(result.accountId);
					var accountId = result.accountId;
			        var maskedAccountId = accountId.slice(0, -3) + "***"; 
			        $(".idcheck").find("strong").text("아이디는 " + maskedAccountId + " 입니다");
			        $('#findid').modal('show'); // 모달 출력
			        $('#accountNm').val('');
			        $('#accountMail').val('');
				}else{
					alert("다시 입력해주세요.");
				}
			}
		});
		
	});
	
	// pw찾기
	pwFindBtn.on("click", function(){
		var pwaccountId = $("#pwaccountId").val();
		var pwaccountNm = $("#pwaccountNm").val();
		var pwaccountMail = $("#pwaccountMail").val();
		
		if (pwaccountId.trim() === '' || pwaccountNm.trim() === '' || pwaccountMail.trim() === '') {
	        console.log("입력값이 비어있습니다.");
	        return; 
	    }
		
		console.log("pw찾기", pwaccountId, pwaccountNm, pwaccountMail);
		
		var userObj = {
			accountId : pwaccountId,
			accountNm : pwaccountNm,
			accountMail : pwaccountMail
		}
		
		$.ajax({
			type : "post",
			url : "/account/member/searchPw.do",
			contentType : "application/json; charset=utf-8",
			data : JSON.stringify(userObj),
			beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
            },
			success : function(result){
				
				if(result.accountPswd != null){
					console.log(result.accountPswd);
			        $('#findpw').modal('show'); // 모달 출력
			        $('#pwaccountId').val('');
			        $('#pwaccountNm').val('');
			        $('#pwaccountMail').val('');
				}else{
					alert("다시 입력해주세요.");
				}
			}
		});


	});
	
	
	
});
</script>