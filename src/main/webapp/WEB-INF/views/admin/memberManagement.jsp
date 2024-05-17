<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!-- Page main content START -->
	<div class="page-content-wrapper border">

		<!-- Title -->
		<div class="row">
			<div class="col-12">
				<h1 class="h3 mb-2 mb-sm-0">회원관리</h1>
			</div>
		</div>

		<!-- Card START -->
		<div class="card bg-transparent">

			<!-- Card header START -->
			<div class="card-header bg-transparent border-bottom px-0">
				<!-- Search and select START -->
				<div class="row g-3 align-items-center justify-content-between">

					<!-- Search bar -->
					<div class="col-md-6">
						<form class="rounded position-relative">
							<input class="form-control bg-transparent" type="search" placeholder="Search" aria-label="Search">
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
			<div class="card-body px-0">
				

					<!-- Tabs content item START -->
					<!-- <div class="tab-pane fade" id="nav-html-tab-1"> -->
						<!-- Table START -->
						<div class="table-responsive border-0">
							<table class="table align-middle p-4 mb-0 table-hover">
								<!-- Table head -->
								<thead style="color: black; background-color: #DCD8FC;">
									<tr>
										<th scope="col" class="border-0 rounded-start" style="text-align: center;">회원아이디</th>
										<th scope="col" class="border-0" style="text-align: center;">잠금일</th>
										<th scope="col" class="border-0" style="text-align: center;">확인</th>
										<th scope="col" class="border-0 rounded-end" style="text-align: center;">잠금사유</th>
									</tr>
								</thead>

								<!-- Table body START -->
								<tbody>
									<!-- Table row -->
									<tr>
										<tr>
											<td style="text-align: center;">A057-390</td>
											<td style="text-align: center;">2020-04-02</td>
											<td style="text-align: center;"><button type="button" class="btn btn-light border">확인</button></td>
											<td style="text-align: center;">
												<select class="form-select" aria-label="Default select example">
													<option selected>선택</option>
													<option value="1">광고</option>
													<option value="2">욕설</option>
													<option value="3">도배</option>
												</select>
											</td>
										</tr>
									</tr>

									

								</tbody>
								<!-- Table body END -->
							</table>
						</div>
						<!-- Table END -->
					<!-- </div> -->
					<!-- Tabs content item END -->

				</div>
				<!-- Tabs content END -->
			</div>
			<!-- Card body END -->

			<!-- Card footer START -->
			<div class="card-footer bg-transparent p-0">
				<!-- Pagination START -->
				<div class="d-sm-flex justify-content-sm-between align-items-sm-center">
					<!-- Content -->
					<p class="mb-0 text-center text-sm-start"></p>
					<!-- Pagination -->
					<nav class="d-flex justify-content-center mb-0" aria-label="navigation">
						<ul class="pagination pagination-sm pagination-primary-soft d-inline-block d-md-flex rounded mb-0">
							<li class="page-item mb-0"><a class="page-link" href="#" tabindex="-1"><i class="fas fa-angle-left"></i></a></li>
							<li class="page-item mb-0"><a class="page-link" href="#">1</a></li>
							<li class="page-item mb-0 active"><a class="page-link" href="#">2</a></li>
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