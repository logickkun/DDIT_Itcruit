<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.table > :not(caption) > * > * {
  padding: 1rem 3rem;
}

</style>

<div class="page-content-wrapper border">

		<!-- Title -->
		<div class="row mb-3">
			<div class="col-12 d-sm-flex justify-content-between align-items-center">
				<h1 class="h5 mb-2 mb-sm-0">문의내역</h1>
				<a href="instructor-create-course.html" class="btn btn-sm btn-primary mb-0">작성</a>
			</div>
		</div>

		<!-- Card START -->
		<div class="card bg-transparent border">

			<!-- Card header START -->
			<div class="card-header bg-light border-bottom">
				<!-- Search and select START -->
				<div class="row g-3 align-items-center justify-content-between">

					<!-- Search bar -->
					<div class="col-md-8">
						<form class="rounded position-relative">
							<input class="form-control bg-body" type="search" placeholder="검색" aria-label="Search">
							<button class="bg-transparent p-2 position-absolute top-50 end-0 translate-middle-y border-0 text-primary-hover text-reset" type="submit">
								<i class="fas fa-search fs-6 "></i>
							</button>
						</form>
					</div>

				</div>
				<!-- Search and select END -->
			</div>
			<!-- Card header END -->

			<!-- Card body START -->
			<div class="card-body">
				<!-- Course table START -->
				<div class="table-responsive border-0 rounded-3">
					<!-- Table START -->
					<table class="table table-dark-gray align-middle p-4 mb-0 table-hover">
						<!-- Table head -->
						<thead>
							<tr>
								<th scope="col" class="border-0 rounded-start" style="padding-left: 85px;">문의제목</th>
								<th scope="col" class="border-0" style="padding-left: 74px;">날짜</th>
								<!-- <th scope="col" class="border-0">Rating</th> -->
								<th scope="col" class="border-0">답변상태</th>
								<th scope="col" class="border-0 rounded-end" style="padding-left: 78px;">확인</th>
							</tr>
						</thead>

						<!-- Table body START -->
						<tbody>
							
							<!-- Table row -->
							<tr>
								<!-- Table data -->
								<td>
									<div class="d-flex align-items-center position-relative">
										<!-- Title -->
										<h6 class="table-responsive-title mb-0 ms-2">	
											<a href="admin-course-detail.html" class="stretched-link">기업승인에 관련해서..</a>
										</h6>
									</div>
								</td>

								<!-- Table data -->
								<td>
									<div class="d-flex align-items-center">
										<!-- Info -->
										<div class="ms-2">
											<h6 class="mb-0 fw-light">2020-11-21</h6>
										</div>
									</div>
								</td>

								<!-- Table data
								<td>
									<ul class="list-inline mb-0">
										<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
										<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
										<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
										<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
										<li class="list-inline-item me-0 small"><i class="far fa-star text-warning"></i></li>
									</ul>
								</td> -->

								<!-- Table data -->
								<td> 답변 완료</td>

								<!-- Table data -->
								<td>
									<a href="#" class="btn btn-sm btn-primary me-1 mb-1 mb-md-0">관리자 확인</a>
								</td>
							</tr>

						</tbody>
						<!-- Table body END -->
					</table>
					<!-- Table END -->
				</div>
				<!-- Course table END -->
			</div>
			<!-- Card body END -->

			<!-- Card footer START -->
			<div class="card-footer bg-transparent pt-0">
				<!-- Pagination START -->
				<div class="d-sm-flex justify-content-sm-between align-items-sm-center">
					<!-- Content -->
					<p class="mb-0 text-center text-sm-start"></p>
					<!-- Pagination -->
					<nav class="d-flex justify-content-center mb-0" aria-label="navigation">
						<ul class="pagination pagination-sm pagination-primary-soft d-inline-block d-md-flex rounded mb-0">
							<li class="page-item mb-0"><a class="page-link" href="#" tabindex="-1"><i class="fas fa-angle-left"></i></a></li>
							<li class="page-item mb-0 active"><a class="page-link" href="#">1</a></li>
							<li class="page-item mb-0"><a class="page-link" href="#">2</a></li>
							<li class="page-item mb-0"><a class="page-link" href="#">3</a></li>
							<li class="page-item mb-0"><a class="page-link" href="#"><i class="fas fa-angle-right"></i></a></li>
						</ul>
					</nav>
				</div>
				<!-- Pagination END -->
			</div>
			<!-- Card footer END -->
		</div>
		<!-- Card END -->
	</div>