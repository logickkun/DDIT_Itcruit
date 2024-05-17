<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
	rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
		crossorigin="anonymous">
<meta charset="UTF-8">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<title>Programming Challenge Interface</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script type="text/javascript">
	// ajax 요청시 사용할 csrf 글로벌 변수설정
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
</script>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Webestica.com">
<meta name="description" content="ITcruit - DDIT 403호 Team1">
	
	
<!-- Favicon -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/images/taplogo1(배경X).png">

<!-- Google Font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Rubik:ital,wght@0,300..900;1,300..900&display=swap" rel="stylesheet">
	
	<!-- Plugins CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/vendor/font-awesome/css/all.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/vendor/choices/css/choices.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/vendor/glightbox/css/glightbox.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/vendor/tiny-slider/tiny-slider.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/vendor/quill/css/quill.snow.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/vendor/choices/css/choices.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/vendor/stepper/css/bs-stepper.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/vendor/overlay-scrollbar/css/overlayscrollbars.min.css">
	
	<!-- Theme CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/css/style.css">

	<!-- Plugins CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/vendor/overlay-scrollbar/css/overlayscrollbars.min.css">




	<!-- sweet Alert 사용 라이브러리  -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
 	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	
	<!-- fontawesome 사용을 위한 라이브러리 -->
	<script src="https://kit.fontawesome.com/adfdbdf33f.js" crossorigin="anonymous"></script>
		
<script src="${pageContext.request.contextPath}/resources/websocket.js"></script>
	<script type="text/javascript">
	 	wsConnect();
	</script>

<!-- 코드미러 관련 설정 시작 -->
<link rel=stylesheet href="${pageContext.request.contextPath}/resources/codemirror/doc/docs.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/codemirror/lib/codemirror.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/codemirror/theme/eclipse.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/codemirror/theme/monokai.css">

<script src="${pageContext.request.contextPath}/resources/codemirror/lib/codemirror.js"></script>
<script src="${pageContext.request.contextPath}/resources/codemirror/mode/javascript/javascript.js"></script>
<script src="${pageContext.request.contextPath}/resources/codemirror/addon/selection/active-line.js"></script>
<script src="${pageContext.request.contextPath}/resources/codemirror/addon/edit/matchbrackets.js"></script>
<!-- 코드미러 관련 설정 시작 -->


	
<style>
.navbar-application.navbar-breadcrumb {
    background-color: #1e1e1e;
     width: 100%;
}


@keyframes shake {
    0%, 100% {
        transform: rotate(0);
    }
    10%, 30%, 50%, 70%, 90% {
        transform: rotate(-10deg);
    }
    20%, 40%, 60%, 80% {
        transform: rotate(10deg);
    }
}


.bi-bell.active {
    display: inline-block;
    animation: shake 1s infinite ease-in-out;
}



.arrow_box {
		    display: none;
		    position: absolute;
		    width: 153px;
		    padding: 8px;
		    left: -55px;
		    bottom: -64px;
		    border-radius: 8px;
		    background: #333;
		    color: #fff;
		    font-size: 14px;
		    opacity: 0;  /* 초기 투명도 설정 */
		    transition: opacity 0.5s ease; /* 투명도 변화를 위한 전환 효과 */
		}
		
		.arrow_box:after {
		    position: absolute;
		    bottom: 100%;
		    left: 50%;
		    width: 0;
		    height: 0;
		    margin-left: -10px;
		    border: solid transparent;
		    border-color: rgba(51, 51, 51, 0);
		    border-bottom-color: #333;
		    border-width: 10px;
		    pointer-events: none;
		    content: ' ';
		}


	/* 코드 미러 관련 스타일 */
  .CodeMirror {border: 1px solid black; font-size:13px}
  
	
</style>

<sec:authorize access="isAuthenticated()">
   <sec:authentication property="principal.account.accountId" var="aId"/>
</sec:authorize>

</head>
<body>

	<header class="navbar-light navbar-sticky" >
        <!-- Logo Nav START -->
        <nav class="navbar navbar-expand-xl">
            <div class="container">
                <!-- Logo START -->
                <a class="navbar-brand" href="/main/index">
                    <img src="${pageContext.request.contextPath }/resources/assets/images/logo1(배경0).png" alt="" width="200px">
                </a>
                <!-- Logo END -->

                
                <!-- Nav Search END -->

                <!-- if문 사용해서 밑에 부분 로그인 했을때 출력 -->
				<c:if test="${not empty SessionInfo }">
				
                <!-- Profile and notification START -->
                <ul class="nav flex-row align-items-center list-unstyled ms-xl-auto">
                    <!-- Notification dropdown START -->
                    <li class="nav-item ms-0 ms-md-3 dropdown" >
                        <!-- Notification button -->
                        <a class="btn btn-light btn-round mb-0" href="#" role="button" data-bs-toggle="dropdown"
                            aria-expanded="false" data-bs-auto-close="outside" id="alarmBtn">
                            <i class="bi bi-bell fa-fw"></i>
                        </a>
                        <!-- Notification dote -->
                        <div id="notis-badge">
                        
                        </div>
							 <p class="arrow_box">알림이 도착했습니다.</p>                        

                        <!-- Notification dropdown menu START -->
                        <div
                            class="dropdown-menu dropdown-animation dropdown-menu-end dropdown-menu-size-md p-0 shadow-lg border-0">
                            <div class="card bg-transparent">
                            	<div id="alarm-header">
                            	</div>
                                <div class="card-body p-0">
                                 <ul class="list-group list-unstyled list-group-flush"  id="alarm-container">
                                 </ul>
                                </div>
                            </div>
                        </div>
                    </li>

                    <!-- Profile dropdown START -->
                    <li class="nav-item ms-3 dropdown">
                        <!-- Avatar -->
                        <a class="avatar avatar-sm p-0" href="#" id="profileDropdown" role="button"
                            data-bs-auto-close="outside" data-bs-display="static" data-bs-toggle="dropdown"
                            aria-expanded="false">
                            <img class="avatar-img rounded-circle" src="${pageContext.request.contextPath }/resources/assets/images/avatar/01.jpg" alt="avatar">
                        </a>

                        <!-- Profile dropdown START -->
                        <ul class="dropdown-menu dropdown-animation dropdown-menu-end shadow pt-3"
                            aria-labelledby="profileDropdown" style="width: 50px;">
                            <!-- Profile info -->
                            <li class="px-3 mb-3">
                                <div class="d-flex align-items-center">
                                    <div>
                                        <a class="h6" href="#">${sessionScope.SessionInfo.accountNick }</a>
                                        <p class="small m-0">${sessionScope.SessionInfo.accountMail }</p>
                                    </div>
                                </div>
                            </li>
                            <!-- Links -->
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <c:choose>
								<c:when test="${sessionScope.SessionInfo.authCmmncd eq 'AUTH102' }">
	                            	<li><a class="dropdown-item" href="/myPage/member"><i class="bi bi-person fa-fw me-2"></i>마이페이지</a></li>
								</c:when>
								<c:when test="${sessionScope.SessionInfo.authCmmncd eq 'AUTH103' }">
	                            	<li><a class="dropdown-item" href="/myPage/enterprise/entInfo"><i class="bi bi-person fa-fw me-2"></i>마이페이지</a></li>
								</c:when>
                            </c:choose>
                            
                            
                            <li><form id="logoutForm" action="/logout" method="post" class="dropdown-item dropdown-footer bg-danger-soft-hover">
								    <a id="logoutBtn" href="#" class="bg-danger-soft-hover">
								        <i class="bi bi-power fa-fw me-2"></i>로그아웃
								    </a>
								    <sec:csrfInput/>
								</form>
							</li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                        </ul>
                        <!-- Profile dropdown END -->
                    </li>
                    <!-- Profile dropdown END -->
                </ul>
                <!-- Profile and notification END -->
                </c:if>
            </div>
        </nav>
        <!-- Logo Nav END -->
    </header>
    <!-- Header END -->

    
    <main>

        
        <c:if test="${empty entCodingtest }">
        	문제가 없습니다.
        </c:if>
        
        <c:set var = "entCodingtest" value="${entCodingtest }"/>
        
<%--         ${entCodingtest.entNm} (${entCodingtest.recruitNo})<br/> --%>
        
<%--         ${entCodingtest.entCodingtestNo}<br/> --%>
<%--         ${entCodingtest.processNo}  ${entCodingtest.processNoOrder}<br/> --%>
<%--         ${entCodingtest.recruitNo} ${entCodingtest.pstnCmmncdNm}<br/> --%>
<%--         ${entCodingtest.strtDt} ${entCodingtest.endDt}<br/> --%>
        
        <c:set var = "testList" value="${entCodingtest.entCodingtestList }"/>
        
<%--         <c:if test="${not empty testList }"> --%>
<%--         	<c:forEach var="test" items="${testList }"> --%>
<%-- 	        	${test.orderNo }   ${test.qstnTtl } (${test.qstnNo })<br/> --%>
<%-- 	        </c:forEach> --%>
<%--         </c:if> --%>
   <div class="container"> 
        <div class="page-content-wrapper border">

		<h5 class="h5" style="display: inline-block; margin-bottom: 0px; position: relative; padding: 25px 22px 13px 56px;">${entCodingtest.entNm}(${entCodingtest.recruitNo}) - ${entCodingtest.pstnCmmncdNm}</h5> 
		<div style="display: inline-block;">
			<span style="position: absolute; top: 15.5%; right: 131px; font-weight: 600; font-size: 13px;">시작시간 : ${entCodingtest.strtDt}</span>
			<span style="position: absolute; top: 18%; right: 131px; font-weight: 600; font-size: 13px;">종료시간 : ${entCodingtest.endDt}</span>
		</div>
		
		<p style="padding-left: 56px;">응시자번호: ${entCodingtest.applyNo}</p>
		
		
		
		
		<!-- Card START -->
		<div class="card border rounded-3 mb-5">
			<div id="stepper" class="bs-stepper stepper-outline">
				<!-- Card header -->
				<div class="card-header bg-light border-bottom px-lg-5">
					<!-- Step Buttons START -->
					<div class="bs-stepper-header" role="tablist">

						<div class="step" data-target="#step-0">
							<div class="d-grid text-center align-items-center">
								<button type="button" class="btn btn-link step-trigger mb-0" role="tab" id="steppertrigger4" aria-controls="step-0">
									<span class="bs-stepper-circle">0</span>
								</button>
								<h6 class="bs-stepper-label d-none d-md-block">안내사항</h6>
							</div>
						</div>
						<div class="line"></div>
						
						
						<c:forEach var="test" items="${testList }">
<%-- 				        	${test.orderNo }.   ${test.qstnTtl } (${test.qstnNo })<br/> --%>

				        	<div class="step" data-target="#step-${test.orderNo }">
							<div class="d-grid text-center align-items-center">
								<button type="button" class="btn btn-link step-trigger mb-0" role="tab" id="steppertrigger1" aria-controls="step-1">
									<span class="bs-stepper-circle">${test.orderNo }</span>
								</button>
									<h6 class="bs-stepper-label d-none d-md-block">문제${test.orderNo }</h6>
								</div>
							</div>
							<c:if test="${test.orderNo ne 4 }"> 
								<div class="line"></div>
							</c:if>
				        	
				        </c:forEach>
						

					</div>
				</div>

				<!-- Card body START -->
				<div class="card-body px-1 px-sm-4">
					<!-- Step content START -->
					<div class="bs-stepper-content">
						
							<!-- Step0 content START -->
							<div id="step-0" role="tabpanel" class="content fade" aria-labelledby="steppertrigger1">
								
								<hr> 
								
								<div class="row g-4">

									<div class="col-12">
									
										<div class="bg-body border rounded-bottom h-400px overflow-hidden" id="quilleditor">
											<br>
											<h3>테스트 참가자 주의사항</h3>
											<br>
												
											<p>테스트에서 진행될 모든 문제의 저작권은 ITcruit(이하 당사)와 한화(이하 지원회사)에 있음을 안내드립니다.</p><br/>
											
											
											<p>아래의 경우 형사처벌의 대상이 될 수 있으니 유의 바랍니다</p>
											<p>1. 당사와 지원회사의 허가없이 외부에 문제를 유출하실 경우 </p>
											<p>2. 당사와 지원회사의 허가없이 외부에 테스트 링크를 유출하실 경우</p><br/>
											
											<p>테스트문제의 입력은 참가자 개인이 평소 사용하는 IDE를 사용하실 수 있습니다.</p>
											<p>다만 참가자 개인의 IDE의 사용으로 인한 불이익은 전적으로 참가자 본인에게 있음을 알려드립니다.</p><br/>
											
											<p>각 문제풀이의 순서는 문제번호와 관계없이 참가자가 선택하여 제출하실 수 있습니다.</p>
											<p>각 문제풀이의 제출 횟수에는 제한이 없으나 시험이 종료된 이후에는 제출이 되지 않으니 이점 유의 바랍니다.</p>
											<p>참가자 께서는 미리 시간을 체크하여 제출을 하여주시길 바랍니다.</p><br/>


											<p>시험도중 브라우저 창이 종료되어도 시험시간 내에는 다시 참가하실 수 있습니다</p>
											<p>참가자께서는 도중에 브라우저 창이 종료되더라도 당황하지 마시고 빠르게 참여하시길 바랍니다</p>
											<p>또한 새로고침(f5) 기능을 사용하실 경우 기존에 작성하시던 데이터가 사라질 수 있으니 이 점 유의 바랍니다.</p><br/>
											
											<p>끝으로 챗지피티와 같은 AI를 사용한 문제풀이나 다른사람의 문제풀이를 복사해서 제출하신 것이 적발될 경우</p>
											<p>1. 참가자의 해당 시험은 무효처리 됩니다</p>
											<p>2. 당사의 서비스를 이용하실 수 없게 계정이 정지처리됩니다.</p>
											<p>3. 지원회사의 규정에 따라 회사 내규에 따른 불이익이 발생할 수 있습니다.</p><br/>

											<p>위 모든 사항을 유의하시길 바라며
												참가자 여러분께 좋은 결과가 있기를 바랍니다.
											</p>

											<br/>
										</div>
									</div>	

									<!-- Step 0 button -->
									<div class="d-flex justify-content-end mt-3">
										<button class="btn btn-primary next-btn mb-0">Next</button>
									</div>
								</div>
							</div>


						<c:forEach var="test" items="${testList }">

							<div id="step-${test.orderNo }" role="tabpanel" class="content fade" aria-labelledby="steppertrigger1">
								
								<input type="hidden" id="c${test.orderNo }" name="c${test.orderNo }" value="${test.c }">
							  	<input type="hidden" id="cs${test.orderNo }" name="cs${test.orderNo }" value="${test.cs }">
							  	<input type="hidden" id="cpp${test.orderNo }" name="cpp${test.orderNo }" value="${test.cpp }">
							  	<input type="hidden" id="java${test.orderNo }" name="java${test.orderNo }" value="${test.java }">
							  	<input type="hidden" id="javascript${test.orderNo }" name="javascript${test.orderNo }" value="${test.javascript }">
							  	<input type="hidden" id="python${test.orderNo }" name="python${test.orderNo }" value="${test.python }">
								
								<input type="hidden" id="qstnNo${test.orderNo }" value="${test.qstnNo }"/>
								
								<h4>문제${test.orderNo }</h4>
<%-- 								<button id="autoInput${test.orderNo }">자동완성</button> --%>
								
								<hr> <!-- Divider -->

								<!-- Basic information START -->
								<div class="row g-4">
									
									<div class="col-12">
										<label class="form-label">제목 </label>
										<input class="form-control" type="text" 
										value="${test.qstnTtl }" readonly>
									</div>
									
									
									<div class="col-12">
										<label class="form-label">설명</label>
										<div class="bg-light border border-bottom-0 rounded-top py-3" id="quilltoolbar" style="padding-left: 20px;">
											제출버튼을 누르지 않을 경우 저장이 되지 않습니다 주의해주세요
										</div>
										
										<div class="bg-body border rounded-bottom h-300px overflow-hidden" id="quilleditor${test.orderNo }" style="padding-left: 20px;">
											<br>
											<c:set var = "qstnCn" value="${test.qstnCn }  "/>
<!-- 											fn -->
											${fn:replace(fn:replace(list.no, '&lt;', ''), '&gt;', '')}
											${test.qstnCn }
										</div>
									</div>	
									<div class="section">
									    <span style="float: left;">언어: 
											<select id="selectLang${test.orderNo }">
												<option selected value="c">C</option>
												<option value="cpp">C++</option>
												<option value="cs">C#</option>
												<option value="java">JAVA</option>
												<option value="javascript">JAVASCRIPT</option>
												<option value="python">PYTHON</option>
											</select>
										</span>	
<%-- 										${test.orderNo } --%>
										
										<button id="autoInput${test.orderNo }" style="float: left;">자동완성</button>
								      <span style="float: right;">테마: <!-- selectTheme -->
										  <select onchange="selectTheme${test.orderNo }()" id="select${test.orderNo }">
											<option selected>default</option>
											<option>eclipse</option>
											<option>monokai</option>
										</select>
									 </span>
										<br/>
									</div>   
											
									<textarea id="code${test.orderNo }" name="code${test.orderNo }"></textarea>
									
									<div class="d-flex justify-content-between mt-3">
										<button class="btn btn-secondary prev-btn mb-0">이전문제</button>
										
										<div class="text-md-end" style="float: rignt;">
											<a href="#" style="color: white; margin-right: 10px;" class="btn btn-success mb-2 mb-sm-0" id="submitCode${test.orderNo }">제출</a>
<%-- 											<c:if test="${test.orderNo ne 4}"> --%>
<!-- 												<button class="btn btn-primary next-btn mb-0">다음문제</button> -->
<%-- 											</c:if> --%>
											<c:choose> 
												<c:when test="${test.orderNo ne 4}">
													<button class="btn btn-primary next-btn mb-0">다음문제</button>
												</c:when>
												<c:otherwise> 
													<button class="btn btn-danger" id="endCodingTest">시험종료</button>
												</c:otherwise> 
											</c:choose>  
											
										</div>
									</div>
								</div>
							</div>
							
<%-- 							<c:if test="${test.orderNo ne 4 }">  --%>
<!-- 								<div class="line"></div> -->
<%-- 							</c:if> --%>
							
				        	<!-- 반복 끝 -->
				        	
				        </c:forEach>
						
					</div>
				</div>
				<!-- Card body END -->
			</div>
		</div>
		<!-- Card END -->
	</div>
 </div>
    </main>
   <input type="hidden" id="input1"
	value="public class Solution {

	public int solution(int num) {
		
		int sum = 0;
		for(int i = 1; i <= num; i++) {
			if(num % i == 0)
				sum+=i;
		}
		
		return sum;
	}
}"> 
	
	
	
	
	<input type="hidden" id="input2"
	value="public class Solution {

	public int solution(int num) {
		
		int sum = 0;
		for(int i = 1; i <= num; i++) {
			if(i % 2 == 0)
				sum+= i;
		}
		
		return sum;
	}
}"> 
	
	
	
	
	<input type="hidden" id="input3"
	value="public class Solution {

	public int solution(int num) {
		
		
		int res = 0;
		
		if(num % 2 == 0)
			res = num*num;
		else res = num*2;
		
		return res;
		
	}
}"> 
	
	
	
	
	<input type="hidden" id="input4"
	value="public class Solution {

	public int solution(int num) {
		
		int res = num;
		
		int sqrt = getSqrt(num);
		
		for(int i = 2; i < sqrt; i++) {
			if(num % i == 0) {
				res = i;
				break;
			}
		}
		return res;
	}
	
	public static int getSqrt(int num) {
		
		int res = 0;
		for(int i = 2; i < num; i++) {
			
			if(i*i > num) {
				res = i;
				break;
			}
		}
		
		return res;
	}
}"> 
    
    
    <footer>
        <p>© ITCurit</p>
    </footer>
</body>

<!-- Back to top -->
<div class="back-top"><i class="bi bi-arrow-up-short position-absolute top-50 start-50 translate-middle"></i></div>

<!-- Bootstrap JS -->
<script src="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<!-- Vendors -->
<script src="${pageContext.request.contextPath}/resources/assets/vendor/choices/js/choices.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/vendor/glightbox/js/glightbox.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/vendor/quill/js/quill.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/vendor/stepper/js/bs-stepper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/vendor/overlay-scrollbar/js/overlayscrollbars.min.js"></script>

<!-- Template Functions -->
<script src="${pageContext.request.contextPath}/resources/assets/js/functions.js"></script>




<script>
// code${test.orderNo}
// select${test.orderNo}
// quilleditor${test.orderNo }
// selectLang${test.orderNo }
//  submitCode${test.orderNo }
	
// 	console.log(document.getElementById("code1"));
	
	
	const submitCode1 = document.getElementById("submitCode1");
	const submitCode2 = document.getElementById("submitCode2");
	const submitCode3 = document.getElementById("submitCode3");
	const submitCode4 = document.getElementById("submitCode4");
	
	const endCodingTest = document.getElementById("endCodingTest");
	
	const autoInput1 = document.getElementById("autoInput1");
	const autoInput2 = document.getElementById("autoInput2");
	const autoInput3 = document.getElementById("autoInput3");
	const autoInput4 = document.getElementById("autoInput4");
	
	var inputValue;
	
	$(function(){ 
		
		autoInput1.addEventListener("click", function() {
			inputValue	= document.getElementById("input1").value;
			editor1.setValue(inputValue);

		});
		
		autoInput2.addEventListener("click", function() {
			inputValue	= document.getElementById("input2").value;
			editor2.setValue(inputValue);

		});
		
		autoInput3.addEventListener("click", function() {
			inputValue	= document.getElementById("input3").value;

			editor3.setValue(inputValue);
		});
		
		autoInput4.addEventListener("click", function() {
			inputValue	= document.getElementById("input4").value;
			editor4.setValue(inputValue);

		})
		
	});
	
	
	
	
	
	
	
	
	
	
	
	
 /////////////////////////1번 문항 시작////////////////////////////////////////////
	var code1 = document.getElementById("code1");
	
	var editor1 = CodeMirror.fromTextArea(code1, {
	  lineNumbers: true,
	  styleActiveLine: true,
	  matchBrackets: true,
	});
	
	var input1 = document.getElementById("select1");
	
	function selectTheme1() {
		var theme = input1.options[input1.selectedIndex].textContent;
		editor1.setOption("theme", theme);
		location.hash = "#" + theme;
	}
	
	var choice1 = (location.hash && location.hash.slice(1)) ||
	           (document.location.search &&
	            decodeURIComponent(document.location.search.slice(1)));
	if (choice1) {
		input1.value = choice1;
		editor1.setOption("theme", choice1);
	}
	CodeMirror.on(window, "hashchange", function() {
		var theme = location.hash.slice(1);
		if (theme) { input1.value = theme; selectTheme1(); }
	});

	  $(function(){
		  
		  //언어 선택시 바뀔 코드 부분 시작
	    $("#selectLang1").on('change', function(){
	        var lang = $(this).val();
	        var code = '';
	        switch(lang) {
	            case 'c':
	                code = document.getElementById("c1").value;
	                break;
	            case 'cpp':
	                code = document.getElementById("cpp1").value;
	                break;
	            case 'cs':
	                code = document.getElementById("cs1").value;
	                break;
	            case 'java':
	                code = document.getElementById("java1").value;
	                break;
	            case 'javascript':
	                code = document.getElementById("javascript1").value;
	                break;
	            case 'python':
	                code = document.getElementById("python1").value;
	                break;
	        }
	        	editor1.setValue(code);
		    });
		});
	
	  /////////////////////////1번 문항 끝////////////////////////////////////////////
	  
	  
	  
	  
	  
	  /////////////////////////2번 문항 시작////////////////////////////////////////////
		var code2 = document.getElementById("code2");
		
		var editor2 = CodeMirror.fromTextArea(code2, {
		  lineNumbers: true,
		  styleActiveLine: true,
		  matchBrackets: true,
		});
		
		var input2 = document.getElementById("select2");
		
		function selectTheme2() {
			var theme = input2.options[input2.selectedIndex].textContent;
			editor2.setOption("theme", theme);
			location.hash = "#" + theme;
		}
		
		var choice2 = (location.hash && location.hash.slice(1)) ||
		           (document.location.search &&
		            decodeURIComponent(document.location.search.slice(1)));
		if (choice2) {
			input2.value = choice2;
			editor2.setOption("theme", choice2);
		}
		CodeMirror.on(window, "hashchange", function() {
			var theme = location.hash.slice(1);
			if (theme) { input2.value = theme; selectTheme2(); }
		});

		  $(function(){
			  
			  //언어 선택시 바뀔 코드 부분 시작
		    $("#selectLang2").on('change', function(){
		        var lang = $(this).val();
		        var code = '';
		        switch(lang) {
		            case 'c':
		                code = document.getElementById("c2").value;
		                break;
		            case 'cpp':
		                code = document.getElementById("cpp2").value;
		                break;
		            case 'cs':
		                code = document.getElementById("cs2").value;
		                break;
		            case 'java':
		                code = document.getElementById("java2").value;
		                break;
		            case 'javascript':
		                code = document.getElementById("javascript2").value;
		                break;
		            case 'python':
		                code = document.getElementById("python2").value;
		                break;
		        }
		        	editor2.setValue(code);
			    });
			});
		  /////////////////////////2번 문항 끝////////////////////////////////////////////
		  
		  
		  
		  
		  
		  
		  
		  /////////////////////////3번 문항 시작////////////////////////////////////////////
		var code3 = document.getElementById("code3");
		
		var editor3 = CodeMirror.fromTextArea(code3, {
		  lineNumbers: true,
		  styleActiveLine: true,
		  matchBrackets: true,
		});
		
		var input3 = document.getElementById("select3");
		
		function selectTheme3() {
			var theme = input3.options[input3.selectedIndex].textContent;
			editor3.setOption("theme", theme);
			location.hash = "#" + theme;
		}
		
		var choice3 = (location.hash && location.hash.slice(1)) ||
		           (document.location.search &&
		            decodeURIComponent(document.location.search.slice(1)));
		if (choice3) {
			input3.value = choice3;
			editor3.setOption("theme", choice3);
		}
		CodeMirror.on(window, "hashchange", function() {
			var theme = location.hash.slice(1);
			if (theme) { input3.value = theme; selectTheme3(); }
		});

		  $(function(){
			  
			  //언어 선택시 바뀔 코드 부분 시작
		    $("#selectLang3").on('change', function(){
		        var lang = $(this).val();
		        var code = '';
		        switch(lang) {
		            case 'c':
		                code = document.getElementById("c3").value;
		                break;
		            case 'cpp':
		                code = document.getElementById("cpp3").value;
		                break;
		            case 'cs':
		                code = document.getElementById("cs3").value;
		                break;
		            case 'java':
		                code = document.getElementById("java3").value;
		                break;
		            case 'javascript':
		                code = document.getElementById("javascript3").value;
		                break;
		            case 'python':
		                code = document.getElementById("python3").value;
		                break;
		        }
		        	editor3.setValue(code);
			    });
			});
		  /////////////////////////3번 문항 끝////////////////////////////////////////////
		  
		  
		  
		  
		  
		  
		  
		  /////////////////////////4번 문항 시작////////////////////////////////////////////
		var code4 = document.getElementById("code4");
		
		var editor4 = CodeMirror.fromTextArea(code4, {
		  lineNumbers: true,
		  styleActiveLine: true,
		  matchBrackets: true,
		});
		
		var input4 = document.getElementById("select4");
		
		function selectTheme4() {
			var theme = input4.options[input4.selectedIndex].textContent;
			editor4.setOption("theme", theme);
			location.hash = "#" + theme;
		}
		
		var choice4 = (location.hash && location.hash.slice(1)) ||
		           (document.location.search &&
		            decodeURIComponent(document.location.search.slice(1)));
		if (choice4) {
			input4.value = choice4;
			editor4.setOption("theme", choice4);
		}
		CodeMirror.on(window, "hashchange", function() {
			var theme = location.hash.slice(1);
			if (theme) { input4.value = theme; selectTheme4(); }
		});

		  $(function(){
			  
			  //언어 선택시 바뀔 코드 부분 시작
		    $("#selectLang4").on('change', function(){
		        var lang = $(this).val();
		        var code = '';
		        switch(lang) {
		            case 'c':
		                code = document.getElementById("c4").value;
		                break;
		            case 'cpp':
		                code = document.getElementById("cpp4").value;
		                break;
		            case 'cs':
		                code = document.getElementById("cs4").value;
		                break;
		            case 'java':
		                code = document.getElementById("java4").value;
		                break;
		            case 'javascript':
		                code = document.getElementById("javascript4").value;
		                break;
		            case 'python':
		                code = document.getElementById("python4").value;
		                break;
		        }
		        	editor4.setValue(code);
			    });
			});
		  /////////////////////////4번 문항 끝////////////////////////////////////////////
				
// 		  		formData
// 				ACCOUNT_ID			- 시큐리티 저장값

// 				APPLY_NO			
// 				ENT_CODINGTEST_NO
// 				ENT_CODINGTEST_NO_ORDER
// 				QSTN_ANSR		  
		  
		  document.addEventListener("DOMContentLoaded", function() {
		  
				//여기서 전달받을 값들은 각 문제별 
				const applyNo = "${entCodingtest.applyNo}";
				const entCodingtestNo = "${entCodingtest.entCodingtestNo}";
				var entCodingtestNoOrder;
				var qstnAnsr;
				var qstnNo;
				//위 변수들을 담을 공간
				var formData;
				
				
				//공통으로 쓸 값: applyNo, entCodingtestNo, processNo, processNoOrder
			  
			 submitCode1.addEventListener("click", function() {
				 checkTimeOut();
				 qstnAnsr = editor1.getValue();
				 entCodingtestNoOrder = 1;
				 qstnNo = document.getElementById("qstnNo1").value;
				
				 formData = {
					 applyNo: applyNo,
					 entCodingtestNo : entCodingtestNo,
					 entCodingtestNoOrder : entCodingtestNoOrder,
					 qstnNo : qstnNo,
					 qstnAnsr : qstnAnsr
				 }
				 
				 submitCode(formData);
			 });
			 
			 submitCode2.addEventListener("click", function() {
				 checkTimeOut();
				 qstnAnsr = editor2.getValue();
				 entCodingtestNoOrder = 2;
				 qstnNo = document.getElementById("qstnNo2").value;
				 formData = {
					 applyNo: applyNo,
					 entCodingtestNo : entCodingtestNo,
					 entCodingtestNoOrder : entCodingtestNoOrder,
					 qstnNo : qstnNo,
					 qstnAnsr : qstnAnsr
				 }
				 submitCode(formData);
			 });
			 
			 submitCode3.addEventListener("click", function() {
				 checkTimeOut();
				 qstnAnsr = editor3.getValue();
				 entCodingtestNoOrder = 3;
				 qstnNo = document.getElementById("qstnNo3").value;
				 formData = {
					 applyNo: applyNo,
					 entCodingtestNo : entCodingtestNo,
					 entCodingtestNoOrder : entCodingtestNoOrder,
					 qstnNo : qstnNo,
					 qstnAnsr : qstnAnsr
				 }
				 submitCode(formData);
			 });
			 
			 submitCode4.addEventListener("click", function() {
				 checkTimeOut();
				 qstnAnsr = editor4.getValue();
				 entCodingtestNoOrder = 4;
				 qstnNo = document.getElementById("qstnNo4").value;
				 formData = {
					 applyNo: applyNo,
					 entCodingtestNo : entCodingtestNo,
					 entCodingtestNoOrder : entCodingtestNoOrder,
					 qstnNo : qstnNo,
					 qstnAnsr : qstnAnsr
				 }
				 submitCode(formData);
			 });
			 
			 
			 function checkTimeOut(){
				 // ${entCodingtest.endDt}
				 // String 로 받아오는 endDt와 현재시간을 비교하여
				 // 현재시간이 endDt보다 늦었을 경우 제출을 막음
				 const end = "${entCodingtest.endDt}";
				 const now = new Date();
				 const endTime = new Date(end);
				 
				 console.log(end);
				 
				 console.log(now);
				 console.log(endTime);
				 
				if(endTime < now){
					Swal.fire({
	  		            title: '제출기한이 만료되었습니다. \n 마이페이지로 이동합니다.',
	  		            icon: 'error',
	  		            confirmButtonText: '확인'
	  		        }).then(function(){
						location.href="/myPage/member/recruitCheck.do";                   
					})
					
				} 
			 }
			 
			 //각 제출 버튼들 눌렀을 경우 실행할 함수
			 //ajax를 통해 비동기적으로 작성한 코드를
			 //컴파일 하고 저장할 것
			 function submitCode(formData){
				 
				 console.log(formData);
				 
				 $.ajax({
					 	url: '/codingtest/entcodingSolve.do',
	 		            type: 'POST',
	 		            
	 		    		data: JSON.stringify(formData),
	 		    		beforeSend: function(xhr) {
	 		                xhr.setRequestHeader(header, token);
	 		            },
	 		            contentType : "application/json; charset=utf-8",
	 		            success: data => {
	 		            	console.log(data);
	 		            	if(data == "통과"){
	 		            		Swal.fire({
	 		                        title: "테스트 통과",
	 		                        icon: 'success',
	 		                        buttons: true,
	 		                    })
	 		                 } else if(data == "실패") {
	 		                	Swal.fire({
	 		                        title: "테스트 실패\n 다시 시도해주세요",
	 		                        icon: 'error',
	 		                        buttons: true,
	 		                   })
	 		            	} else {
	 		            		Swal.fire({
	 		                        title: "컴파일 에러!!!",
	 		                        icon: 'warning',
	 		                        buttons: true,
	 		                   })
	 		            	}
	 		            },
	 		            error: function(data){
	 		            	swal({
	 		                    title: "서버에러!",
	 		                    icon: 'error',
	 		                    buttons: true,
	 		             	 })
	 		            }
	 		        }); //ajax 끝
				 
			 	}
		
			 
			 
			 
			 endCodingTest.addEventListener("click", function() {
				
				 Swal.fire({
		                title: '시험을 종료하시겠습니까?',
		                icon: 'warning',
		                showCancelButton: true,
		                confirmButtonText: '종료',
		                cancelButtonText: '취소'
		        	}).then((result) => {
		      		 	if(result.value) {
		      		 		location.href = '/myPage/member/recruitCheck.do';
		      		 	}
		      		 	
		    		})
		 	});
			 
			 
		  });
		  
		  

		  
</script>













</html>