<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<style>
.btn-primary-soft:active, .btn-primary-soft:hover {
    color: white !important;
    background-color: black !important;
    border-color: black !important;
}
h5 > a:hover {
    color: gray;
}
.bg-primary {
    --bs-bg-opacity: 1;
    background-color: #aaa0fc !important;
}
</style>

<!-- Page main content START -->
<div class="page-content-wrapper border">

	<!-- Title -->
	<div class="row">
		<div class="col-12" style="display: inline-block;">
			<h1 class="h5 mb-3" style="display: inline-block;">이력서 관리</h1>
			<button class="btn btn-primary-soft" style="float: right; background-color: gray; color: white; padding: 4px 10px; font-size: 14px;" onclick="location.href='/resume/registerView'">이력서 등록</button>
		</div>
	</div>
		
	<div class="card bg-transparent">

		<!-- Card header START -->
		<div class="bg-transparent border-bottom px-0">
			<!-- Search and select START -->
			<div class="row g-3 align-items-center justify-content-between">
			<div class="row align-items-center justify-content-between">

				<!-- Search bar -->
<!-- 				<div class="col-md-8"> -->
<!-- 					<form class="rounded position-relative"> -->
<!-- 						<input class="form-control bg-transparent" type="search" placeholder="Search" aria-label="Search"> -->
<!-- 						<button class="bg-transparent p-2 position-absolute top-50 end-0 translate-middle-y border-0 text-primary-hover text-reset" type="submit"> -->
<!-- 							<i class="fas fa-search fs-6 "></i> -->
<!-- 						</button> -->
<!-- 					</form> -->
<!-- 				</div> -->

				<!-- Tab button -->
<!-- 				<div class="col-md-3"> -->
					<!-- Tabs START -->
<!-- 					<ul class="list-inline mb-0 nav nav-pills nav-pill-dark-soft border-0 justify-content-end" id="pills-tab" role="tablist"> -->
					<!-- Grid tab -->
<!-- 						<li class="nav-item"> -->
<!-- 							<a href="#nav-preview-tab-1" class="nav-link mb-0 me-2 active" data-bs-toggle="tab"> -->
<!-- 								<i class="fas fa-fw fa-th-large"></i> -->
<!-- 							</a> -->
<!-- 						</li> -->
					<!-- List tab -->
<!-- 						<li class="nav-item"> -->
<!-- 							<a href="#nav-html-tab-1" class="nav-link mb-0" data-bs-toggle="tab"> -->
<!-- 								<i class="fas fa-fw fa-list-ul"></i> -->
<!-- 							</a> -->
<!-- 						</li> -->
<!-- 					</ul> -->
				<!-- Tabs end -->
			</div>
			</div>
			<!-- Search and select END -->
		</div>
		<!-- Card header END -->

		<!-- Card body START -->
		<div class="card-body px-0">

			<!-- Tabs content START -->
			<div class="tab-content">

				<!-- Tabs content item START -->
				<div class="tab-pane fade show active" id="nav-preview-tab-1">
					<div class="row g-4">

						<!-- Card item START -->
						<c:set value="${rsmManagePagingVO.dataList }" var="resumeList"/>
						<c:choose>
							<c:when test="${empty resumeList }">
								<div class="col-md-6 col-xxl-4">
									<div class="card bg-transparent border h-100"> 
										<!-- Card header -->
										<div class="card-header bg-transparent border-bottom d-flex justify-content-between">
											<div class="d-sm-flex align-items-center">
												<!-- Info -->
												<div class="ms-0 ms-sm-2 mt-2 mt-sm-0">
													<h5 class="mb-0">등록된 이력서가 없습니다</h5>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- Card item END -->
							</c:when>
							<c:otherwise>
								<c:forEach items="${resumeList }" var="resume">
									<div class="col-md-6 col-xxl-4">
										<div class="card bg-transparent border h-100"> 
											<!-- Card header -->
											<div class="card-header bg-transparent border-bottom d-flex justify-content-between">
												<div class="d-sm-flex align-items-center">
													<!-- Info -->
													<div class="ms-0 ms-sm-2 mt-2 mt-sm-0">
														<h5 class="mb-0" id="rsmTtlClick" style="font-size:18px;">
															<a href="/resume/updateView?rsmNo=${resume.rsmNo }">
																${resume.rsmTtl }
															</a>
															<form id="delForm" action="/resume/updateView?rsmNo=${resume.rsmNo }" method="get">
																<input type="hidden" name="rsmNo" value="${resume.rsmNo }"/>
																<sec:csrfInput/>
															</form>
														</h5>
													</div>
												</div>
			
												<!-- Edit dropdown -->
												<div class="dropdown text-end">
													<a href="#" class="btn btn-sm btn-light btn-round small mb-0" role="button" id="dropdownShare2" data-bs-toggle="dropdown" aria-expanded="false">
														<i class="bi bi-three-dots fa-fw"></i>
													</a>
													<!-- dropdown button -->
													<ul class="dropdown-menu dropdown-w-sm dropdown-menu-end min-w-auto shadow rounded" aria-labelledby="dropdownShare2">
														<li>
															<a class="dropdown-item" href="/resume/updateView?rsmNo=${resume.rsmNo }">
																<i class="bi bi-pencil-square fa-fw me-2"></i>수정
															</a>
														</li>
														<li>
															<a class="dropdown-item" href="/resume/delete.do?rsmNo=${resume.rsmNo }">
																<i class="bi bi-trash fa-fw me-2"></i>삭제
															</a>
														</li>
													</ul>
												</div>
											</div>
			
											<div class="card-body">
												<!-- 신입/경력 여부 -->
												<div class="d-flex justify-content-between align-items-center mb-3">
													<div class="d-flex align-items-center">
														<h6 class="mb-0 ms-2 fw-light">${resume.rsmNewCareer }</h6>
													</div>
													<span class="mb-0 fw-bold">연차 : ${resume.rsmCareerYear }년</span>
												</div>
			
												<!-- 이력서 공개여부 -->
												<div class="d-flex justify-content-between align-items-center mb-3">
													<div class="d-flex align-items-center">
														<h6 class="mb-0 ms-2 fw-light">이력서 공개여부</h6>
													</div>
													<span class="mb-0 fw-bold">
														<%-- 이력서 공개 여부에 따른 표시 변경 --%>
														<c:choose>
								                            <c:when test="${resume.rsmRlsYn eq 'Y'}">공개</c:when>
								                            <c:when test="${resume.rsmRlsYn eq 'N'}">비공개</c:when>
								                            <c:otherwise>알 수 없음</c:otherwise>
								                        </c:choose>
													</span>
												</div>
												
												<!-- Total courses -->
												<div class="d-flex justify-content-between align-items-center mb-3">
													<div class="d-flex align-items-center">
														<h6 class="mb-0 ms-2 fw-light">기술스택</h6>
													</div>
													<c:forEach items="${resume.availLangVOList }" var="availLang">
														<span class="mb-0 fw-bold">${availLang.availLangCmmncdNm }</span>
													</c:forEach>
												</div>
												
												<!-- Progress -->
<!-- 												<div class="overflow-hidden"> -->
<!-- 													<h6 class="mb-0">85%</h6> -->
<!-- 													<div class="progress progress-sm bg-primary bg-opacity-10"> -->
<!-- 														<div class="progress-bar bg-primary aos" role="progressbar" data-aos="slide-right" data-aos-delay="200" data-aos-duration="1000" data-aos-easing="ease-in-out" style="width: 85%" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100"> -->
<!-- 														</div> -->
<!-- 													</div> -->
<!-- 												</div> -->
											</div>
										</div>
									</div>
									<!-- Card item END -->
								</c:forEach>
							</c:otherwise>
						</c:choose>


					<!-- eduport 원본 -->
						<!-- Card item START -->
<!-- 						<div class="col-md-6 col-xxl-4"> -->
<!-- 							<div class="card bg-transparent border h-100">  -->
<!-- 								Card header -->
<!-- 								<div class="card-header bg-transparent border-bottom d-flex justify-content-between"> -->
<!-- 									<div class="d-sm-flex align-items-center"> -->
<!-- 										Info -->
<!-- 										<div class="ms-0 ms-sm-2 mt-2 mt-sm-0"> -->
<!-- 											<h5 class="mb-0"><a href="#">Samuel Bishop</a></h5> -->
<!-- 										</div> -->
<!-- 									</div> -->

<!-- 									Edit dropdown -->
<!-- 									<div class="dropdown text-end"> -->
<!-- 										<a href="#" class="btn btn-sm btn-light btn-round small mb-0" role="button" id="dropdownShare6" data-bs-toggle="dropdown" aria-expanded="false"> -->
<!-- 											<i class="bi bi-three-dots fa-fw"></i> -->
<!-- 										</a> -->
<!-- 										dropdown button -->
<!-- 										<ul class="dropdown-menu dropdown-w-sm dropdown-menu-end min-w-auto shadow rounded" aria-labelledby="dropdownShare6"> -->
<!-- 											<li><a class="dropdown-item" href="#"><i class="bi bi-pencil-square fa-fw me-2"></i>수정</a></li> -->
<!-- 											<li><a class="dropdown-item" href="#"><i class="bi bi-trash fa-fw me-2"></i>삭제</a></li> -->
<!-- 										</ul> -->
<!-- 									</div> -->
<!-- 								</div> -->

<!-- 								<div class="card-body"> -->
<!-- 									Payments -->
<!-- 									<div class="d-flex justify-content-between align-items-center mb-3"> -->
<!-- 										<div class="d-flex align-items-center"> -->
<!-- 											<div class="icon-md bg-success bg-opacity-10 text-success rounded-circle flex-shrink-0"><i class="bi bi-currency-dollar fa-fw"></i></div> -->
<!-- 											<h6 class="mb-0 ms-2 fw-light">Payments</h6> -->
<!-- 										</div> -->
<!-- 										<span class="mb-0 fw-bold">$3,578</span> -->
<!-- 									</div> -->

<!-- 									Total courses -->
<!-- 									<div class="d-flex justify-content-between align-items-center mb-3"> -->
<!-- 										<div class="d-flex align-items-center"> -->
<!-- 											<div class="icon-md bg-purple bg-opacity-10 text-purple rounded-circle flex-shrink-0"><i class="fas fa-book fa-fw"></i></div> -->
<!-- 											<h6 class="mb-0 ms-2 fw-light">Total Course</h6> -->
<!-- 										</div> -->
<!-- 										<span class="mb-0 fw-bold">14</span> -->
<!-- 									</div> -->
									
<!-- 									Progress -->
<!-- 									<div class="overflow-hidden"> -->
<!-- 										<h6 class="mb-0">30%</h6> -->
<!-- 										<div class="progress progress-sm bg-primary bg-opacity-10"> -->
<!-- 											<div class="progress-bar bg-primary aos" role="progressbar" data-aos="slide-right" data-aos-delay="200" data-aos-duration="1000" data-aos-easing="ease-in-out" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->

<!-- 								Card footer -->
<!-- 								<div class="card-footer bg-transparent border-top"> -->
<!-- 									<div class="d-sm-flex justify-content-between align-items-center"> -->
<!-- 										Rating star -->
<!-- 										<h6 class="mb-2 mb-sm-0"> -->
<!-- 											<i class="bi bi-calendar fa-fw text-orange me-2"></i><span class="text-body">Join at:</span> 18 Jan 2021 -->
<!-- 										</h6> -->
<!-- 										Buttons -->
<!-- 										<div class="text-end text-primary-hover"> -->
<!-- 											<a href="#" class="btn btn-link text-body p-0 mb-0 me-2" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Message" aria-label="Message"> -->
<!-- 												<i class="bi bi-envelope-fill"></i> -->
<!-- 											</a> -->
<!-- 											<a href="#" class="btn btn-link text-body p-0 mb-0" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Block" aria-label="Block"> -->
<!-- 												<i class="fas fa-ban"></i> -->
<!-- 											</a> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
						</div>
						<!-- Card item END -->
					</div>
				</div>
				<!-- Tabs content item END -->
				
			</div>
			<!-- Tabs content END -->
		</div>
		<!-- Card body END -->

		<!-- Card footer START -->
		<!-- Card footer END -->
	</div>
</div>
<!-- Page main content END -->

<script type="text/javascript">
$(function(){
	$('#rsmTtlClick').on
});
</script>