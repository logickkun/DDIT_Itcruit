<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<style>
.pale-purple-btn {
    background-color: #E6E6FA; /* 연한 라벤더 색상 */
    color: #4B0082; /* 어두운 보라색 */
    transition: all 0.3s ease; /* 부드러운 전환 효과 */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
}

.pale-purple-btn:hover {
    transform: translateY(-5px); /* Y축 방향으로 -5px 이동 */
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2); /* 호버 시 그림자 증가 */
}

.pale-purple-btn:active {
    transform: translateY(1px); /* Y축 방향으로 1px 이동 (눌림 효과) */
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2); /* 눌렀을 때 그림자 */
}

.processingBtn {
	padding: 0.4rem;
}

</style>
<div class="page-content-wrapper border">


		<!-- Title -->
		<div class="row">
			<div class="col-12 mb-3">
				<h1 class="h3 mb-2 mb-sm-0"></h1>
			</div>
		</div>

		<!-- Counter boxes START -->
		<div class="row g-4 mb-4">
<!-- 			<!-- Counter item -->
<!-- 			<div class="col-md-6 col-xxl-3"> -->
<!-- 				<div class="card card-body bg-white bg-opacity-15 h-100"> -->
<!-- 					<div class="d-flex justify-content-between align-items-center"> -->
<!-- 						<div> -->
<!-- 							<img src="logo-removebg-preview.png" alt="logo"> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->

			<!-- Counter item -->
			<div class="col-md-6 col-xxl-3">
				<div class="card card-body bg-info bg-opacity-10 p-4 h-100">
					<div class="d-flex justify-content-between align-items-center">
						<!-- Digit -->
						<div>
							<div class="d-flex">
								<h2 class="purecounter mb-0 fw-bold" data-purecounter-start="0" data-purecounter-end="4200"	data-purecounter-delay="200">${entStatVO.todayApply }</h2>
								<span class="mb-0 h2 ms-1">명</span>
							</div>
							<span class="mb-0 h6 fw-light">오늘 지원자</span>
						</div>
						<!-- Icon -->
						<div class="icon-lg rounded-circle bg-info text-white mb-0"><i class="bi bi-people"></i></div>
					</div>
				</div>
			</div>
			
			<!-- Counter item -->
			<div class="col-md-6 col-xxl-3">
				<div class="card card-body bg-purple bg-opacity-10 p-4 h-100">
					<div class="d-flex justify-content-between align-items-center">
						<!-- Digit -->
						<div>
							<div class="d-flex">
								<h2 class="purecounter mb-0 fw-bold" data-purecounter-start="0" data-purecounter-end="4200"	data-purecounter-delay="200">${entStatVO.totalRecruitCount}</h2>
								<span class="mb-0 h2 ms-1">개</span>
							</div>
							<span class="mb-0 h6 fw-light">채용 공고 수</span>
						</div>
						<!-- Icon -->
						<div class="icon-lg rounded-circle bg-purple text-white mb-0"><i class="bi bi-clipboard-check"></i></i></div>
					</div>
				</div>
			</div>

			<!-- Counter item -->
			<div class="col-md-6 col-xxl-3">
				<div class="card card-body bg-primary bg-opacity-10 p-4 h-100">
					<div class="d-flex justify-content-between align-items-center">
						<!-- Digit -->
						<div>
							<div class="d-flex">
								<h2 class="purecounter mb-0 fw-bold" data-purecounter-start="0" data-purecounter-end="329"	data-purecounter-delay="200">${entStatVO.totalApply }</h2>
								<span class="mb-0 h2 ms-1">명</span>
							</div>
							<span class="mb-0 h6 fw-light">총 지원자</span>
						</div>
						<!-- Icon -->
						<div class="icon-lg rounded-circle bg-primary text-white mb-0"><i class="bi bi-people-fill"></i></div>
					</div>
				</div>
			</div>

			<!-- Counter item -->
			<div class="col-md-6 col-xxl-3">
				<div class="card card-body bg-success bg-opacity-10 p-4 h-100">
					<div class="d-flex justify-content-between align-items-center">
						<!-- Digit -->
						<div>
							<div class="d-flex">
								<h2 class="purecounter mb-0 fw-bold" data-purecounter-start="0" data-purecounter-end="845"	data-purecounter-delay="200">${entStatVO.endedRecruitCount}</h2>
								<span class="mb-0 h2 ms-1">개</span>
							</div>
							<span class="mb-0 h6 fw-light">마감 공고 수</span>
						</div>
						<!-- Icon -->
						<div class="icon-lg rounded-circle bg-success text-white mb-0"><i class="bi bi-calendar-check"></i></i></div>
					</div>
				</div>
			</div>
		</div>
		<!-- Counter boxes END -->

		<!-- Chart and Ticket START -->
		<div class="row g-4 mb-4">

			<!-- Chart START -->
			<div class="col-xxl-8">
				<div class="card shadow h-100">

					<!-- Card header -->
<!-- 					<div class="card-header p-4"> -->
<!-- 						<h5 class="card-header-title mb-4">기업 정보</h5> -->

<!-- 						<hr> -->

<!-- 					<div class="row p-1"> -->
<!-- 					    <div class="col-md-5"> -->
<!-- 					        <div class="mb-3"> -->
<!-- 					            <h6 class="text-secondary mb-2"><strong>회사명</strong></h6> -->
<%-- 					            <p class="text-dark"><strong>${entStatVO.enterMyInfo.entNm}</strong></p> --%>
<!-- 					            <hr> -->
<!-- 					        </div> -->
<!-- 				        <div class="mb-3"> -->
<!-- 				            <h6 class="text-secondary mb-2"><strong>기업구분</strong></h6> -->
<%-- 				            <p class="text-dark"><strong>${entStatVO.enterMyInfo.bizTypeNm}</strong></p> --%>
<!-- 				            <hr> -->
<!-- 				        </div> -->
<!-- 				        <div class="mb-3"> -->
<!-- 				            <h6 class="text-secondary mb-2"><strong>설립일</strong></h6> -->
<%-- 				            <p class="text-dark"><strong>${entStatVO.enterMyInfo.fndnYr}</strong></p> --%>
<!-- 				            <hr> -->
<!-- 				        </div> -->
<!-- 				        <div class="mb-3"> -->
<!-- 				        <h6 class="text-secondary mb-2"><strong>홈페이지</strong></h6> -->
<%-- 				            <p class="text-dark"><a href="${entStatVO.enterMyInfo.entUrl}" target="_blank"><strong>${entStatVO.enterMyInfo.entUrl}</strong></a></p> --%>
<!-- 				            <hr/> -->
<!-- 				        </div> -->
<!-- 				    </div> -->
				
<!-- 				    <div class="col-md-7"> -->
<!-- 				        <div class="mb-3"> -->
<!-- 				        	<h6 class="text-secondary mb-2"><strong>대표자</strong></h6> -->
<%-- 				            <p class="text-dark"><strong>${entStatVO.enterMyInfo.rprsvNm}</strong></p> --%>
<!-- 				            <hr> -->
<!-- 				             구분선 추가 -->
<!-- 				        </div> -->
<!-- 				        <div class="mb-3"> -->
<!-- 				        	<h6 class="text-secondary mb-2"><strong>주요사업</strong></h6> -->
<%-- 				            <p class="text-dark"><strong>${entStatVO.enterMyInfo.ksicNm}</strong></p> --%>
<!-- 				            <hr> 구분선 추가 -->
<!-- 				        </div> -->
<!-- 				        <div class="mb-3"> -->
<!-- 				            <h6 class="text-secondary mb-2"><strong>주소</strong></h6> -->
<%-- 				            <p class="text-dark"><strong>${entStatVO.enterMyInfo.accountAddr1} ${entStatVO.enterMyInfo.accountAddr2}</strong></p> --%>
<!-- 				            <hr> -->
<!-- 				        </div> -->
				        
<!-- 				        <div class="d-flex justify-content-end"> -->
<!-- 						    <button type="button" class="btn btn-success mt-4" style="width: 20%;" id="editEntInfo">수정</button> -->
<!-- 						</div> -->
<!-- 				    </div> -->
<!-- 				</div> -->

<!-- 					</div> -->
				</div>
			</div>
			<!-- Chart END -->

			<!-- Ticket START -->
			<div class="col-xxl-4">
				<div class="card shadow h-100">
					<!-- Card header -->
					<div class="card-header border-bottom d-flex justify-content-between align-items-center p-3">
						<h5 class="card-header-title">진행중인 채용(${fn:length(entStatVO.progressRecruit)})</h5>
						<div class="d-flex justify-content-end">
							<span class="input-group-text text-black processingBtn">진행중인 프로세스</span> 
						</div>
					</div>
					
					<div class="card-body p-4">
					<c:choose>
					    <c:when test="${empty entStatVO.progressRecruit}">
					        <!-- 처리할 데이터가 없을 경우의 대체 컨텐츠 -->
					        <h6 class="mb-0 text-center">
					               	진행중인 채용이 존재하지않습니다.
	                        </h6>
					    </c:when>
					    <c:otherwise>
					        <!-- Card body START -->
					        <c:forEach var="recruit" items="${entStatVO.progressRecruit}">
					            <!-- Ticket item START -->
					            <div class="d-flex justify-content-between position-relative w-100">
					                <div class="d-sm-flex w-100">
					                    <!-- Avatar -->
					                    <div class="avatar avatar-md flex-shrink-0">
					                        <div class="avatar-img rounded-circle bg-purple bg-opacity-10">
					                            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
					                                ${recruit.COUNT}
					                            </span>
					                            <span class="text-purple position-absolute top-50 start-50 translate-middle fw-bold"><i class="fas fa-briefcase"></i></span>
					                        </div>
					                    </div>
					                    <!-- Info -->
					                    <div class="ms-sm-3 mt-3 d-flex justify-content-between w-100">
					                        <h6 class="mb-0">
					                            <a href="/myPage/enterprise/recruitContectList?recruitTtl=${recruit.RECRUIT_TTL}">${recruit.RECRUIT_TTL}</a>
					                        </h6>
					                    </div>
					                    <div class="ms-sm-3 mt-3 d-flex justify-content-end w-50">
					                        <h6><span class="badge bg-primary"><c:if test="${empty recruit.EACH_ORDER}">1차</c:if><c:if test="${not empty recruit.EACH_ORDER}">${recruit.EACH_ORDER}차</c:if>${recruit.CLS_NM}</span></h6>
					                    </div>
					                </div>
					            </div>
					            <hr><!-- Divider -->
					            <!-- Ticket item END -->
					        </c:forEach>
					        <!-- Card body END -->
					    </c:otherwise>
					</c:choose>

					</div>
					<!-- Card body END -->
				</div>
			</div>
			<!-- Ticket END -->
		</div>
		<!-- Chart and Ticket END -->

		<!-- Top listed Cards START -->
		<div class="row g-4">

			<!-- Top instructors START -->
			<div class="col-lg-6 col-xxl-6">
				<div class="card shadow h-100">

					<!-- Card header -->
					<div class="card-header border-bottom d-flex justify-content-between align-items-center p-3">
						<h5 class="card-header-title">최근 지원자(${fn:length(entStatVO.recentApply)})</h5>
					</div>

					<!-- Card body START -->
					<div class="card-body p-4">
					<div class="custom-scrollbar h-400px">
					<c:choose>
						<c:when test="${empty entStatVO.recentApply}">
						
							<h6 class="text-center">최근 지원자가 없습니다.</h6>						
						
						</c:when>
						<c:otherwise>
							<c:forEach items="${entStatVO.recentApply}" var="recentApply">
							
							<!-- Instructor item START -->
							<div class="d-sm-flex justify-content-between align-items-center">
								<!-- Avatar and info -->
								<div class="d-sm-flex align-items-center mb-1 mb-sm-0">
									<!-- Info -->
									<div class="ms-0 ms-sm-2 mt-2 mt-sm-0">
										<h6 class="mb-1">${recentApply.ACCOUNT_NM }<i class="bi bi-patch-check-fill text-info small ms-1"></i></h6>
										<ul class="list-inline mb-0 small">
											<li class="list-inline-item fw-light me-2 mb-1 mb-sm-0">${recentApply.POSITION }</li>
											<li class="list-inline-item fw-light me-2 mb-1 mb-sm-0">
											<c:if test="${recentApply.RSM_CAREER_YEAR eq '0'}">
												신입
												
											</c:if>
											<c:if test="${recentApply.RSM_CAREER_YEAR ne '0'}">
												
												경력
												
											</c:if>
											
											</li>
										</ul>
									</div>
								</div>
							</div>
	
							<hr><!-- Divider -->
							
							</c:forEach>
						
						</c:otherwise>
					</c:choose>





					

					
					
					
					
					


						
					</div>
					<!-- Card body END -->
					</div>
				</div>
			</div>
			<!-- Top instructors END -->

			<!-- Notice Board START -->
			<div class="col-lg-6 col-xxl-6">
				<div class="card shadow h-100">
					<!-- Card header -->
					<div class="card-header border-bottom d-flex justify-content-between align-items-center p-3">
						<h5 class="card-header-title">마감 임박 공고(${fn:length(entStatVO.deadLineRecruit)})</h5>
					</div>

					<!-- Card body START -->
					<div class="card-body p-4">
						<div class="custom-scrollbar h-400px">
						<c:choose>
							<c:when test="${empty entStatVO.deadLineRecruit}">
								
							<h6>마감 임박 중인 공고가 없습니다.</h6>
							
							</c:when>
							<c:otherwise>
								<c:forEach items="${entStatVO.deadLineRecruit}" var="recruit">
									<div class="d-flex justify-content-between position-relative">
										<div class="d-sm-flex">
											<div class="icon-lg bg-purple bg-opacity-10 text-purple rounded-2 flex-shrink-0"><i class="fas fa-clock"></i></div>
											<!-- Info -->
											<div class="ms-0 ms-sm-3 mt-2 mt-sm-0">
												<h6 class="mb-0"><a href="#" class="stretched-link"><strong>${recruit.recruitTtl }</strong></a></h6>
												<p class="mb-0">${recruit.recruitCareerCodeNm}, ${recruit.pstnCmmncdNm}, ${recruit.esntlLangCmmncdNm}</p>
												<span class="small">마감 ${recruit.deadLineDay}일전</span>
											</div>
										</div>
									</div>
									<hr> 
								</c:forEach>
							</c:otherwise>
						</c:choose>
				
							<!-- Notice Board item END -->
						</div>
					</div>
					<!-- Card body END -->

				</div>
			</div>
			<!-- Notice Board END -->

			<!-- Traffic sources START -->
<!-- 			<div class="col-lg-6 col-xxl-4"> -->
<!-- 				<div class="card shadow h-100"> -->

<!-- 					Card header -->
<!-- 					<div class="card-header border-bottom d-flex justify-content-between align-items-center p-4"> -->
<!-- 						<h5 class="card-header-title">기업게시판</h5> -->
<!-- 						<a href="#" class="btn btn-link p-0 mb-0">View all</a> -->
<!-- 					</div> -->

<!-- 					Card body START -->
<!-- 					<div class="card-body p-4"> -->
<!-- 						Chart -->
<!-- 						<div class="col-sm-6 "> -->
<!-- 							<div id="ChartTrafficViews"></div> -->
<!-- 						</div> -->

<!-- 						Content -->
<!-- 						<ul class="list-group list-group-borderless mt-3"> -->
<!-- 							<li class="list-group-item"><i class="text-primary fas fa-circle me-2"></i>Create a Design System in Figma</li> -->
<!-- 							<li class="list-group-item"><i class="text-success fas fa-circle me-2"></i>The Complete Digital Marketing Course - 12 Courses in 1</li> -->
<!-- 							<li class="list-group-item"><i class="text-warning fas fa-circle me-2"></i>Google Ads Training: Become a PPC Expert</li> -->
<!-- 							<li class="list-group-item"><i class="text-danger fas fa-circle me-2"></i>Microsoft Excel - Excel from Beginner to Advanced</li> -->
<!-- 						</ul> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				Card body END -->
<!-- 			</div> -->
			<!-- Traffic sources END -->

		</div>
		<!-- Top listed Cards END -->

	</div>
<script>
</script>