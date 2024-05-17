<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

<style>

@font-face {
    font-family: 'Freesentation-5Medium';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2404@1.0/Freesentation-5Medium.woff2') format('woff2');
    font-weight: 500;
    font-style: normal;
}

.card {
    /* 일반적인 카드 스타일 */
/*     width: 200px; */
/*     height: 300px; */
/*     background-color: #fff; */
/*     border-radius: 10px; */
/*     box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); */
    transition: transform 0.3s ease; /* transform 속성에 대한 애니메이션 효과를 추가합니다. */
}

.card:hover {
    transform: translateY(-5px); /* 마우스 호버시 카드를 위로 약간 이동시킵니다. */
}
/* 모달 배경 색상 */
.modal-content {
    background-color: #ffffff;
    border-radius: 10px;
}

/* 모달 제목 스타일 */
.modal-title {
    color: #333333;
    font-size: 24px;
}

/* 모달 본문 스타일 */
.modal-body {
    padding: 20px;
}

/* 모달 확인 버튼 스타일 */
.site-button {
    background-color: #007bff;
    color: #ffffff;
    border: none;
    border-radius: 5px;
    padding: 10px 20px;
    font-size: 18px;
    cursor: pointer;
}

/* 모달 확인 버튼 호버 효과 */
.site-button:hover {
    background-color: #0056b3;
}

.logo-container img {
    width: 100%;         /* 컨테이너 너비에 맞춤 */
    height: 150px;       /* 고정 높이 설정 */
    object-fit: contain; /* 비율을 유지하면서 요소에 맞춤 */
    display: block;      /* 블록 레벨 요소로 표시 */
    margin: 0 auto;      /* 중앙 정렬 */
}
</style>
<c:if test="${likeRecruit eq 'y' }">
	<script>
        $(function() {
            $('.bi-star-fill').toggleClass('text-warning');
        });
    </script>
</c:if>
<sec:authorize access="isAuthenticated()">
   <sec:authentication property="principal.account.accountId" var="aId"/>
</sec:authorize>
<main>
	<section class="pt-0">
	    <div class="container">
	        <div class="row">
	            <div class="col-12" style="max-height: 350px">
	                <!-- Slider START -->
	                <div class="tiny-slider arrow-round arrow-blur arrow-hover rounded-2 overflow-hidden">
	                    <div class="tiny-slider-inner" data-autoplay="false" data-gutter="0" data-arrow="true" data-dots="false" data-items="1">
	
	                        <a href="https://softeerbootcamp.hyundaimotorgroup.com/" target="_blank">
	                            <div class="card overflow-hidden h-500px h-md-350px text-center rounded-0" style="background-image:url(${pageContext.request.contextPath }/resources/assets/images/main/4.png); background-position: center; background-size: contain; background-repeat: no-repeat;"></div>
	                        </a>
	
	                        <a href="https://www.sw.or.kr/site/sw/edu/selectEduListGallery.do" target="_blank">
	                            <div class="card overflow-hidden h-500px h-md-350px text-center rounded-0" style="background-image:url(${pageContext.request.contextPath }/resources/assets/images/main/5.png); background-position: center; background-size: contain; background-repeat: no-repeat;"></div>
	                        </a>
	                        <a href="https://playdata.io/bootcamp_backend?utm_source=jasoseol&utm_mediu%20m=paidother&utm_campaign=swcamp_backend&utm_content=w_mainbanner" target="_blank">
	                            <div class="card overflow-hidden h-500px h-md-350px text-center rounded-0" style="background-image:url(${pageContext.request.contextPath }/resources/assets/images/main/6.png); background-position: center; background-size: contain; background-repeat: no-repeat;"></div>
	                        </a>
	                        <a href="https://youth-crm101.com/" target="_blank">
	                            <div class="card overflow-hidden h-500px h-md-350px text-center rounded-0" style="background-image:url(${pageContext.request.contextPath }/resources/assets/images/main/7.png); background-position: center; background-size: contain; background-repeat: no-repeat;"></div>
	                        </a>
	                        <a href="https://dgb.recruiter.co.kr/app/jobnotice/view?systemKindCode=MRS2&jobnoticeSn=178815" target="_blank">
	                            <div class="card overflow-hidden h-500px h-md-350px text-center rounded-0" style="background-image:url(${pageContext.request.contextPath }/resources/assets/images/main/8.png); background-position: center; background-size: contain; background-repeat: no-repeat;"></div>
	                        </a>
	                        <a href="https://www.sw.or.kr/site/sw/edu/selectEduView.do?eduNo=1674" target="_blank">
	                            <div class="card overflow-hidden h-500px h-md-350px text-center rounded-0" style="background-image:url(${pageContext.request.contextPath }/resources/assets/images/main/9.png); background-position: center; background-size: contain; background-repeat: no-repeat;"></div>
	                        </a>
	                    </div>
	                </div>
	                <!-- Slider END -->
	            </div>
	        </div>
	    </div>
	</section>

	<c:if test="${not empty recommendRecruitList }">
	<section style="padding: 0px; padding-bottom: 30px;">
		<div class="container">
			<div class="row mb-2">
				<h3 style="font-family: 'Freesentation-5Medium'; font-size: 36px; letter-spacing: 2.5px" >추천공고</h3>
					<br><br>
			</div>
			
			<!-- Tabs content START -->
			<div class="tab-content" id="course-pills-tabContent">
				<!-- Content START -->
				<div class="tab-pane fade show active" id="course-pills-tabs-0" role="tabpanel" aria-labelledby="course-pills-tab-1">
					<div class="row g-4">
						
						<!-- Card item START -->
						<c:forEach items="${recommendRecruitList }" var="recruit">
						<div class="col-sm-6 col-lg-4 col-xl-3">
							<div class="card shadow h-100">
								<!-- Image -->
								<div class="logo-container">
								<img src="/main/logodisplay?entNo=${recruit.entNo }" alt="기업로고" style="width: 85%; height: 150px; object-fit: contain;">
								</div>
								<!-- Card body -->
								<div class="card-body pb-0">
									<!-- Badge and favorite -->
									<div class="d-flex justify-content-between mb-2">
									</div>
									<!-- Title -->
									<c:choose>
										<c:when test="${fn:startsWith(recruit.recruitEndDt, 'D')}">
											<a class="atag" href="/main/recruitDetail.do?recruitNo=${recruit.recruitNo }&pstnCmmncdNm=${recruit.pstnCmmncdNm}">
												<p class="mb-2 text-truncate-2">${recruit.entNm }</p>
												<h5 class="card-title" style="font-size: 128%;">${recruit.recruitTtl }</h5>
											</a>
										</c:when>
										<c:when test="${fn:endsWith(recruit.recruitEndDt, '전')}">
											<a class="atag" href="/main/recruitDetail.do?recruitNo=${recruit.recruitNo }&pstnCmmncdNm=${recruit.pstnCmmncdNm}">
												<p class="mb-2 text-truncate-2">${recruit.entNm }</p>
												<h5 class="card-title" style="font-size: 128%;">${recruit.recruitTtl }</h5>
											</a>
										</c:when>
										<c:otherwise>
											<a class="atagDone" href="">
												<p class="mb-2 text-truncate-2">${recruit.entNm }</p>
												<h5 class="card-title">${recruit.recruitTtl }</h5>
											</a>
										</c:otherwise>
									</c:choose>
									
									
								</div>
								<!-- Card footer -->
								<div class="card-footer pt-0 pb-3">
									<hr>
									<div class="d-flex justify-content-between">
										<span class="h6 fw-light mb-0 endDate">
										<c:if test="${fn:startsWith(recruit.recruitEndDt, 'D')}"><i class="far fa-clock text-danger me-2"></i></c:if> 
										<c:if test="${fn:endsWith(recruit.recruitEndDt, '전')}"><i class="far fa-clock text-danger me-2"></i></c:if> 
										<font <c:if test="${fn:startsWith(recruit.recruitEndDt, '공고')}">color="lightgray"</c:if>>${recruit.recruitEndDt }</font></span>
										<a class="h6 mb-0" ><i id="likeRecruitBtn" class="bi bi-star-fill" style="color: darkgray; cursor: pointer;"></i></a>
									</div>
								</div>
							</div>
						</div>
						</c:forEach>
						
						
					</div>
				</div>
			</div>
		</div>
	</section>
	</c:if>


	<!-- =======================공고 START -->
	<section style="padding: 0;">
		<div class="container">
			<!-- Title -->
			<div class="row mb-2">
				<!-- <div class="col-lg-8 mx-auto text-center"> -->
<!-- 					<h2 class="fs-1" >채용공고</h2> -->
					<h3 style="font-family: 'Freesentation-5Medium'; font-size: 36px; letter-spacing: 2.5px">채용공고</h3>
					<br><br>
					<!-- <p class="mb-0">Choose from hundreds of courses from specialist organizations</p> -->
				<!-- </div> -->
			</div>

			<div class="tab-content" id="course-pills-tabContent">
				<!-- Content START -->
				<div class="tab-pane fade show active" id="course-pills-tabs-1" role="tabpanel" aria-labelledby="course-pills-tab-1">
					<div class="row g-4 cardArea">
					
					<c:choose>
						<c:when test="${empty initRecruitList }">
							<div class="col-sm-6 col-lg-4 col-xl-3">
							<div class="card shadow h-100">
							
								<!-- Image -->
								<img src="${pageContext.request.contextPath }/resources/assets/images/logoITcruitSolid.png" class="card-img-top" alt="course image" style="padding: 10px;">
								
								<!-- Card body -->
								<div class="card-body pb-0">
									<!-- Badge and favorite -->
									<div class="d-flex justify-content-between mb-2">
										<!-- <a href="#" class="badge bg-purple bg-opacity-10 text-purple">All level</a> -->
										
									</div>
									<!-- Title -->
									<a href="#">
									<p class="mb-2 text-truncate-2">정보없음</p>
									<h5 class="card-title fw-normal">정보없음</h5>
									</a>
									<!-- Rating star -->
									<!-- <ul class="list-inline mb-0">
										<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
										<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
										<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
										<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
										<li class="list-inline-item me-0 small"><i class="far fa-star text-warning"></i></li>
										<li class="list-inline-item ms-2 h6 fw-light mb-0">4.0/5.0</li>
									</ul> -->
								</div>
								<!-- Card footer -->
								<div class="card-footer pt-0 pb-3">
									<hr>
									<div class="d-flex justify-content-between">
										<span class="h6 fw-light mb-0"><i class="far fa-clock text-danger me-2"></i>정보없음</span>
										<a href="#" class="h6 mb-0"><i class="bi bi-star-fill" style="color: darkgray; cursor: pointer;"></i></a>
									</div>
								</div>
							</div>
						</div>
						</c:when>
						
						<c:otherwise>
						<!-- Card item START -->
						<c:forEach items="${initRecruitList }" var="recruit">
						<div class="col-sm-6 col-lg-4 col-xl-3">
							<div class="card shadow h-100">
								<!-- Image -->
								
								
								<div class="logo-container">
								<img src="/main/logodisplay?entNo=${recruit.entNo }" alt="기업로고" style="width: 85%; height: 150px; object-fit: contain;">
								</div>
								
								<!-- Card body -->
								
								
								
								<div class="card-body pb-0">
									<!-- Badge and favorite -->
									<div class="d-flex justify-content-between mb-2">
									</div>
									<!-- Title -->
									<c:choose>
										<c:when test="${fn:startsWith(recruit.recruitEndDt, 'D')}">
											<a class="atag" href="/main/recruitDetail.do?recruitNo=${recruit.recruitNo }&pstnCmmncdNm=${recruit.pstnCmmncdNm}">
												<p class="mb-2 text-truncate-2">${recruit.entNm }</p>
												<h5 class="card-title" style="font-size: 128%;">${recruit.recruitTtl }</h5>
											</a>
										</c:when>
										<c:when test="${fn:endsWith(recruit.recruitEndDt, '전')}">
											<a class="atag" href="/main/recruitDetail.do?recruitNo=${recruit.recruitNo }&pstnCmmncdNm=${recruit.pstnCmmncdNm}">
												<p class="mb-2 text-truncate-2">${recruit.entNm }</p>
												<h5 class="card-title" style="font-size: 128%;">${recruit.recruitTtl }</h5>
											</a>
										</c:when>
										<c:otherwise>
											<a class="atagDone" href="">
												<p class="mb-2 text-truncate-2">${recruit.entNm }</p>
												<h5 class="card-title fw-normal" >${recruit.recruitTtl }</h5>
											</a>
										</c:otherwise>
									</c:choose>
									
<%-- 									${fn:endsWith() } --%>
								</div>
								<!-- Card footer -->
								<div class="card-footer pt-0 pb-3">
									<hr>
									<div class="d-flex justify-content-between">
										<span class="h6 fw-light mb-0 endDate">
										<c:if test="${fn:startsWith(recruit.recruitEndDt, 'D')}"><i class="far fa-clock text-danger me-2"></i></c:if> 
										<c:if test="${fn:endsWith(recruit.recruitEndDt, '전')}"><i class="far fa-clock text-danger me-2"></i></c:if> 
										<font <c:if test="${fn:startsWith(recruit.recruitEndDt, '공고')}">color="lightgray"</c:if>>${recruit.recruitEndDt }</font></span>
										<a class="h6 mb-0" ><i id="likeRecruitBtn" class="bi bi-star-fill" style="color: darkgray; cursor: pointer;"></i></a>
									</div>
								</div>
							</div>
						</div>
						</c:forEach>
						</c:otherwise>
					</c:choose>
						<!-- Card item END -->
						
					</div> <!-- Row END -->
				</div>
				
		        
		        <div class="modal fade twm-saved-jobs-view" id="resumeCheck" aria-hidden="true" aria-labelledby="saved_job_view" tabindex="-1">
				    <div class="modal-dialog modal-dialog-centered">
				        <div class="modal-content">
				            <form id="resumeForm" action="/resume/registerView" method="post">
				            	<input type="hidden" name="accounId" value="${aId }">
				                <div class="modal-header">
				                    <h2 class="modal-title" id="saved_job_view">ITcruit</h2>
				                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				                </div>
				                <div class="modal-body">
				                    <ul class="list-unstyled idcheck">
				                        <li style="font-size: x-large;"><strong>작성된 이력서가 없습니다.</strong></li>
				                    </ul>
				                </div>
				                <div class="modal-footer">
				                    <a id="resumeMove" href="#" data-bs-dismiss="modal">이력서 작성하러 가기<i class="bi bi-chevron-right"></i></a>
				                </div>
				                <sec:csrfInput/>
				            </form>
				        </div>
				    </div>
				</div>

			</div>
		</div>
	</section>
	
</main>
<script type="text/javascript">
$("#resumeMove").on("click", function(event){
	event.preventDefault();
	$("#resumeForm").submit();
});

var initialResponse = null;
$(document).ready(function() {

    var accountId = "${account.accountId}";
    var warningStop = localStorage.getItem('warningStop');
    var noResume = localStorage.getItem('noResume');
    
    var authCmmncd = "${account.authCmmncd}";
    
//     console.log(warningStop);
    if (accountId) {
        $.ajax({
            url: "/main/interestList.do?accountId=" + accountId,
            type: "get",
            contentType: "application/json; charset=utf-8",
            beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
            },
            success: function(response) {
//                 console.log(response);
                initialResponse = response; // 서버에서 받은 값을 변수에 저장합니다.
                $('.card').each(function() {
                    var card = $(this);
                    bindCardEvents(card, initialResponse); // 각 카드에 대한 이벤트 바인딩
                });
            }
        });
        
        // 정지된 계정에 모달출력
        $.ajax({
    		url: "/main/selectAccount.do?accountId=" + accountId,
            type: "get",
            contentType: "application/json; charset=utf-8",
            beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
            },
            success: function(response) {
            	
            	if(response != "" && response != null){
            		
	            	if (!warningStop) {
	                    Swal.fire({
	                        title: '정지된 계정입니다!!',         
	                        text: '관리자에서 문의해주세요.',
	                        icon: 'warning'                
	                    });
	                    localStorage.setItem('warningStop', true);
	                }
            	}
            	
		    	// 이력서 확인
		        $.ajax({
		    		url: "/main/checkResume.do?accountId=" + accountId,
		            type: "get",
		            contentType: "application/json; charset=utf-8",
		            beforeSend: function(xhr) {
		                xhr.setRequestHeader(header, token);
		            },
		            success: function(response) {
		            	
		            	if(!response || response.length === 0){
// 		            		console.log("1번");
			            	if (!noResume && authCmmncd === 'AUTH102') {
			            		$('#resumeCheck').modal('show'); // 모달 출력
			            		
			            		// 모달 안의 a 태그에 대한 클릭 이벤트 추가
			                    $('#resumeCheck').on('click', 'a', function() {
			                        // 클릭된 a 태그의 href 속성 값으로 이동
			                        var href = $(this).attr('href');
			                        window.location.href = href;
			                    });
			                    localStorage.setItem('noResume', true);
			                }
			            	
		            	}else{
		            		console.log("이력서 있음");	
		            	}
		            	
		            }
		            
		    	});
		    	
            }
	    	
    	});
        
        
    }
    

    $(".g-4").on("click", ".atagDone", function(event) {
        event.preventDefault();
        Swal.fire(
            '이미 마감된 공고입니다!'
        );
    });

    var slider = tns({
        container: '.tiny-slider-inner',
        items: 1,
        autoplay: true,
        autoplayTimeout: 5000, // 5초
        autoplayButtonOutput: false,
        controls: false,
        nav: false
    });

    let isFetching = false; // 리스트를 가져오는 중인지 여부를 나타내는 변수
    let isEnd = false; // 더 이상 리스트를 가져올 필요가 없는지 여부를 나타내는 변수

    // 스크롤 이벤트 핸들러
    function handleScroll() {
        if (!isFetching && !isEnd) {
            let $window = $(window);
            let scrollTop = $window.scrollTop();
            let windowHeight = $window.height();
            let documentHeight = $(document).height();

            // scrollbar의 thumb가 바닥 전 150px까지 도달 하면 리스트를 가져온다.
            if (scrollTop + windowHeight + 150 > documentHeight) {
                fetchList();
            }
        }
    }

    // 페이지 로드 시 스크롤 이벤트 발생 시켜 리스트를 가져온다.
    $(window).trigger('scroll');

    // 스크롤 이벤트 리스너 등록
    $(window).scroll(handleScroll);

    // 리스트 가져오는 함수
    function fetchList() {
        if (isEnd || isFetching) {
            return;
        }

        // 리스트를 가져오는 중임을 표시
        isFetching = true;

        // 현재 화면에 표시된 리스트 개수
        let currentListSize = $("#course-pills-tabs-1 .card").length;
//         console.log("currentListSize == " + currentListSize);

        // 다음 페이지 계산
        let currentPage = Math.ceil(currentListSize / 20) + 1;
//         let currentPage = currentListSize + 1;
//         console.log("currentPage == " + currentPage);
        
        $.ajax({
            url: "/main/paginationInfo?currentPage=" + currentPage,
            type: "POST",
            contentType: "application/json; charset=utf-8",
            beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
            },
            success: function(response) {
                let initRecruitList = response;
                
                if (initRecruitList.length === 0) {
                    isEnd = true; // 더 이상 데이터가 없으면 isEnd를 true로 설정
                    return;
                }

                // 날짜 형식 변경 및 마감일 계산
//                 initRecruitList.forEach(function(recruit) {
//                     let day = recruit.recruitEndDt;
//                     console.log(day);
// //                     if (day < 0) {
// //                         recruit.recruitEndDt = "공고마감";
// //                     } else {
// //                         recruit.recruitEndDt = "D-" + day;
// //                     }
// 					if(!inNaN(day)){
// 						recruit.recruitEndDt = "D-" + day;
// 					}
//                 });

                // initRecruitList 배열의 각 요소에 접근하여 카드 HTML을 생성
                let cardHTML = "";
                for (let i = 0; i < initRecruitList.length; i++) {
                    let recruit = initRecruitList[i];
                    let endDateElement = document.createElement("span"); // 새로운 span 요소 생성
                    endDateElement.classList.add("h6", "fw-light", "mb-0", "endDate"); // 클래스 추가

                    // 마감일이 "D-"로 시작하는 경우
                    if (recruit.recruitEndDt.startsWith("D-")) {
                        let daysDiff = parseInt(recruit.recruitEndDt.substring(2)); // 남은 일수 추출
                        if (daysDiff < 0) {
                            endDateElement.innerHTML = '<i class="far fa-clock text-danger me-2"></i>공고마감'; // 마감된 경우
                            endDateElement.querySelector("i").style.display = "none"; // 아이콘 숨기기
                        } else {
                            endDateElement.innerHTML = '<i class="far fa-clock text-danger me-2"></i>D-' + daysDiff; // 남은 일수 표시
                        }
                    }
                    // 일전으로 끝나는거
                    else if (recruit.recruitEndDt.endsWith("전")){
                    	endDateElement.innerHTML = '<i class="far fa-clock text-danger me-2"></i>' + recruit.recruitEndDt;
                    }
                    	
                    // 마감일이 "공고마감"인 경우
                    else if (recruit.recruitEndDt === "공고마감") {
                        endDateElement.innerHTML = '<font color="lightgray">공고마감</font>';
                    }

                    // 카드의 마감일 엘리먼트를 찾아 교체
                    let cardFooter = document.querySelector(".endDate:not(:first-child)");
                    if (cardFooter) {
                        cardFooter.parentNode.replaceChild(endDateElement, cardFooter);
                    }
// 					console.log(recruit.entNo);
                    // 카드 HTML 문자열 구성
                    cardHTML += '<div class="col-sm-6 col-lg-4 col-xl-3">' +
                        '<div class="card shadow h-100">' +
                        '<div class="logo-container">' +
                        '<img src="/main/logodisplay?entNo=' + recruit.entNo + '" alt="기업로고" style="width: 85%; height: 150px; object-fit: contain;">' +
                        '</div>' +
                        '<div class="card-body pb-0">' +
                        '<div class="d-flex justify-content-between mb-2">' +
                        '</div>' +
                        '<a class="atag" href="/main/recruitDetail.do?recruitNo=' + recruit.recruitNo + '&pstnCmmncdNm=' + recruit.pstnCmmncdNm + '">' +
                        '<p class="mb-2 text-truncate-2">' + recruit.entNm + '</p>' +
                        '<h5 class="card-title" style="font-size: 128%;">' + recruit.recruitTtl + '</h5>' +
                        '</a>' +
                        '</div>' +
                        '<div class="card-footer pt-0 pb-3">' +
                        '<hr>' +
                        '<div class="d-flex justify-content-between">' +
                        '<span class="h6 fw-light mb-0 endDate">' +
                        endDateElement.innerHTML +
                        '</span>' +
                        '<a class="h6 mb-0"><i id="likeRecruitBtn" class="bi bi-star-fill" style="color: darkgray; cursor: pointer;"></i></a>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</div>';
                }
//                 console.log(cardHTML);
                // 생성된 카드 HTML을 삽입
                $(".cardArea").append(cardHTML);

                // 리스트 가져오기가 완료되었으므로 isFetching 상태 변경
                isFetching = false;

                // 마감된 공고에 대한 처리
                $(".endDate:contains('공고마감')").prev().find(".fa-clock").hide(); // 아이콘 숨기기
                $(".endDate:contains('공고마감')").closest(".card-footer").prev().find(".atag").addClass("atagDone").removeAttr("href"); // 클릭 이벤트 방지

                // 동적으로 생성된 카드에 대한 별 아이콘 상태 설정
                setStarIcons(initialResponse);
            },
            error: function(jqXHR, textStatus, errorThrown) {
//                 console.error("Error fetching pagination info: " + errorThrown);
                // 리스트 가져오기가 실패했으므로 isFetching 상태 변경
                isFetching = false;
            }
        });
    }

 // 동적으로 생성된 카드에 대한 별 아이콘 상태 설정 함수
    function setStarIcons(initialResponse) {
        $('.card').each(function() {
            var card = $(this);
            bindCardEvents(card, initialResponse); // 각 카드에 대한 이벤트 바인딩
        });
    }

    // 카드에 대한 이벤트 바인딩 함수
    function bindCardEvents(card, initialResponse) {
    	
    	if (!initialResponse || initialResponse.length === 0) {
            // 로그인하지 않은 경우 아무 작업도 수행하지 않음
            return;
        }
    	
        $('.card-body', card).each(function() {
            var href = $(this).find('.atag').attr('href');

            if (!href) {
                return;
            }
            // URL에서 '?' 뒤의 쿼리 문자열 추출
            var queryString = href.split('?')[1];

            // 쿼리 문자열을 '&'로 분할하여 각 매개변수 추출
            var queryParams = queryString.split('&');

            var recruitNo, pstnCmmncdNm;

            // 각 매개변수에 대해 반복
            queryParams.forEach(function(param) {
                // '='로 매개변수 이름과 값 분리
                var pair = param.split('=');
                var paramName = pair[0];
                var paramValue = pair[1];

                // 추출된 매개변수에 따라 처리
                if (paramName === 'recruitNo') {
                    recruitNo = paramValue;
                } else if (paramName === 'pstnCmmncdNm') {
                    pstnCmmncdNm = paramValue;
                }
            });

            // 서버에서 받은 데이터와 일치하는지 확인
            var matchingData = initialResponse.find(function(data) {
            	
//                 console.log("matchingData");
//                 console.log(data);
//                 console.log("카드에서 받는거 Recruit No:", recruitNo, "Position:", pstnCmmncdNm);
//                 console.log("리스트에 있는거 No:", data.recruitNo, "Position:", data.pstnCmmncdNm);
                return data.recruitNo === recruitNo && data.pstnCmmncdNm === pstnCmmncdNm;
            });

            // 일치하는 경우, 별표 아이콘 추가
            if (matchingData) {
//                 console.log(matchingData);
                card.find('.bi-star-fill').addClass('text-warning');
            } else {
                // 일치하지 않는 경우, 별표 아이콘 제거
                card.find('.bi-star-fill').removeClass('text-warning');
            }
        });
    }


	// 관심공고 클릭 이벤트 핸들러
    $(document).on("click", ".bi-star-fill", function() {
    	var clickedIcon = $(this);
//     	console.log("!!!!");
    	
   		var card = $(this).closest(".card");
        var href = card.find('.atag').attr('href');
//         console.log("!!!!",href);
        
        if (!href) {
            return;
        }
        
        // URL에서 '?' 뒤의 쿼리 문자열 추출
        var queryString = href.split('?')[1];

        // 쿼리 문자열을 '&'로 분할하여 각 매개변수 추출
        var queryParams = queryString.split('&');

        var recruitNo, pstnCmmncdNm;

        // 각 매개변수에 대해 반복
        queryParams.forEach(function(param) {
            // '='로 매개변수 이름과 값 분리
            var pair = param.split('=');
            var paramName = pair[0];
            var paramValue = pair[1];

            // 추출된 매개변수에 따라 처리
            if (paramName === 'recruitNo') {
                recruitNo = paramValue;
            } else if (paramName === 'pstnCmmncdNm') {
                pstnCmmncdNm = paramValue;
            }
        });
        
//         console.log("recruitNo : " , recruitNo, "pstnCmmncdNm : " , pstnCmmncdNm);
        if(accountId == null || accountId == ""){
        	Swal.fire(
                    '로그인 후 이용해주세요.'
                );
        	return;
        }		
    	
        var obj = {
          	accountId : accountId,
        	recruitNo : recruitNo,
        	pstnCmmncdNm : pstnCmmncdNm
        }
        
       	if(clickedIcon.hasClass('text-warning')){
       		
       		$.ajax({
               	type : "post",
               	url : "/like/hateRecruit.do",
               	contentType : "application/json; charset=utf-8",
               	data : JSON.stringify(obj),
               	beforeSend: function(xhr) {
                       xhr.setRequestHeader(header, token);
                   },
                   success : function(result){
//                    	console.log("!!!!" + result);
                   	if(result == "Y"){
                   		clickedIcon.removeClass('text-warning');
   	                	console.log("관심공고 등록취소");
                   	}else{
                   		console.log("관심공고 등록취소 실패");
                   	}
                   }
                   
               });
       		
       	}else{
       		
       		$.ajax({
               	type : "post",
               	url : "/like/loveRecruit.do",
               	contentType : "application/json; charset=utf-8",
               	data : JSON.stringify(obj),
               	beforeSend: function(xhr) {
                       xhr.setRequestHeader(header, token);
                   },
                   success : function(result){
//                    	console.log("!!!!" + result);
                   	if(result == "Y"){
                   		clickedIcon.addClass('text-warning');
                   		console.log("관심공고 등록성공");
                   	}else{
                   		console.log("관심공고 등록실패");
                   	}
                }
               
            });
       	}  
        
    });

});

var userCookie = "${userCookie}";
// console.log("userCookie 값:", userCookie); // userCookie 값 출력

if (!userCookie) {
    $(".g-4").on("click", ".atag", function(event) {
        event.preventDefault();
        var endDateText = $(this).closest('.card').find('.endDate').text().trim();
//         console.log(endDateText);

        // D-인 경우 상세페이지로 이동
        if (endDateText.includes("D-")) {
            var href = $(this).attr('href');
            window.location.href = href;
        }

        // D+인 경우 알림 메시지 표시
        else if (endDateText.includes("전")) {
            Swal.fire(
                '채용일정이 아닙니다.'
            );
        }
    });
}

// 비회원인 경우에만 실행할 수 있도록 조건 추가
if (userCookie) {
    var count = sessionStorage.getItem(userCookie); // 세션 스토리지에서 카운트 가져오기
//     console.log("count 초기값:", count); // count 초기값 출력

    $(".cardArea").on("click", ".atag", function(event) {
        var endDateText = $(this).closest('.card').find('.endDate').text().trim();
//         console.log(endDateText);

        // D-인 경우 상세페이지로 이동
        if (endDateText.includes("D-")) {
            if (!count) {
                count = 0; // 카운트가 세션 스토리지에 없으면 0으로 초기화
            }
            
            count++; // 카운트 증가
//             console.log("count 증가 후 값:", count); // count 증가 후 값 출력
            
            sessionStorage.setItem(userCookie, count); // 세션 스토리지에 카운트 저장
//             console.log("세션 스토리지에 저장된 값:", sessionStorage.getItem(userCookie)); // 세션 스토리지에 저장된 값 출력
            
            // 카운트가 3 이상이면 로그인 페이지로 리디렉션
            if (count >= 4) {
                event.preventDefault();
                Swal.fire({
                    title: '<span style="white-space: pre-line">비회원 회원입니다.\n로그인 또는 회원가입 후 이용해주세요.</span>',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: '로그인',
                    cancelButtonText: '회원가입',
                    showCloseButton: true, // 닫기 버튼 표시
                }).then((result) => {
                    if (result.isConfirmed) {
                        // 로그인 버튼을 클릭한 경우
                        location.href = "/main/loginForm.do";
                    } else if (result.dismiss === Swal.DismissReason.cancel) {
                        // 회원가입 버튼을 클릭한 경우
                        location.href = "/main/registerForm.do";
                    } else {
                        return;
                        // 닫기 버튼을 클릭한 경우
                        // 필요한 작업 수행
                    }
                });
                
                // 세션 초기화
                sessionStorage.removeItem(userCookie); // 세션 스토리지에서 해당 세션 제거
            }
        } else {
            // D-가 아닌 경우에는 이동하지 않음
            event.preventDefault();

            // D+인 경우 알림 메시지 표시
            if (endDateText.includes("전")) {
                Swal.fire(
                    '채용일정이 아닙니다.'
                );
            }
        }
    });
}



   

</script>
