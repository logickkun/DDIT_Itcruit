<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>


<style>
.BoDeleteBtn, .CoDeleteBtn {
	color: red;
	background-color: #FBE9EB;
	border: none;
	padding: 6px 12px;
	border-radius: 5px;
}

.BoDeleteBtn:hover, .CoDeleteBtn:hover {
	color: white;
	background-color: #D6293E;
}

/* 목록 페이징 버튼 */
.pagination-primary-soft .page-link {
	font-size: 12px; /* 페이지네이션 링크의 폰트 크기 조절 */
	padding: 8px 10px; /* 페이지네이션 버튼의 패딩을 조절하여 크기 조절 */
	color: black; /* 페이지네이션 링크 텍스트 색상 */
	background-color: #DCD8FC; /* 페이지네이션 배경 색상 */
	border-color: #DCD8FC; /* 페이지네이션 테두리 색상 */
}

.pagination-primary-soft .page-item.active .page-link {
	color: black;
	background-color: #baabfc; /* 활성화된 페이지네이션 배경 색상 */
	border-color: #DCD8FC; /* 활성화된 페이지네이션 테두리 색상 */
}

.pagination-primary-soft .page-item.disabled .page-link {
	color: black; /* 비활성화된 페이지네이션 링크 텍스트 색상 */
	pointer-events: none; /* 비활성화된 페이지네이션 클릭 이벤트 방지 */
}

.pagination-primary-soft .page-item.disabled .page-link:hover {
	background-color: #fdfdfd; /* 비활성화된 페이지네이션 호버 배경 색상 */
	border-color: #ffffff; /* 비활성화된 페이지네이션 호버 테두리 색상 */
}

.pagination-primary-soft .page-item:hover .page-link {
	background-color: #DCD8FC; /* 호버시 배경색 없애기 */
	border-color: #DCD8FC; /* 호버시 테두리 색상 */
}
</style>

<!-- Page main content START -->
<div class="page-content-wrapper border">

	<!-- Title -->
	<div class="row">
		<div class="col-12">
			<h1 class="h3 mb-2 mb-sm-0">자유게시판</h1>
			<br>
		</div>
	</div>

	<!-- Card START -->
	<div class="card bg-transparent">
		<div class="row">

			<!-- 탭 메뉴 시작 -->
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="board-tab" data-bs-toggle="tab" data-bs-target="#board" type="button" role="tab" aria-controls="board" aria-selected="true">게시글 신고</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="comment-tab" data-bs-toggle="tab" data-bs-target="#comment" type="button" role="tab" aria-controls="comment" aria-selected="false">댓글 신고</button>
				</li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<!-- 첫 번째 탭 - 게시글 신고 -->
				<div class="tab-pane fade show active" id="board" role="tabpanel" aria-labelledby="board-tab">
					<!-- 첫 번째 카드 -->
					<div class="card bg-transparent">
						<div class="card-body px-0" style="text-align: center;">

							<form method="get" id="searchForm">
								<input type="hidden" name="page" id="page" /> <input type="hidden" name="commentPage" id="commentPage" />
							</form>
							<div class="table-responsive border-0">
								<table class="table align-middle p-4 mb-0 table-hover">
									<thead>
										<tr style="background-color: #DCD8FC;">
											<th scope="col" class="border-0 rounded-start" style="color: black;">신고번호</th>
											<th scope="col" class="border-0" style="color: black;">신고자</th>
											<th scope="col" class="border-0" style="color: black;">신고사유</th>
											<th scope="col" class="border-0" style="color: black;">페이지이동</th>
											<th scope="col" class="border-0 rounded-end">삭제</th>
										</tr>
									</thead>

									<tbody>
										<tr>
											<c:set value="${boardPagingVO.dataList}" var="list" />
											<c:choose>
												<c:when test="${empty list}">
													<td colspan="5">신고 게시글이 없습니다.</td>
												</c:when>
												<c:otherwise>
													<c:forEach items="${list}" var="reportList">
														<tr>
															<td>${reportList.reportNo}</td>
															<td>${reportList.bbsReportId}</td>
															<td>${reportList.bbsReportCmmncd}</td>
															<c:if test="${reportList.bbsNo eq '삭제'}">
																<td colspan="2">처리됨</td>
															</c:if>

															<c:if test="${reportList.bbsNo ne '삭제'}">
																<td><a href="/freeBoard/detail.do?bbsNo=${reportList.bbsNo}"><button type="button" class="btn btn-secondary-soft mb-0">페이지이동</button></a></td>
																<td>
																	<form id="boardDeleteBtn" action="/myPage/admin/freeBoardDelete.do" method="post">
																		<input type="hidden" name="bbsNo" id="bbsNo" value="${reportList.bbsNo}" /> <input type="button" id="BoDeleteBtn" class="BoDeleteBtn" data-bbsno="${reportList.bbsNo }" value="삭제">
																		<sec:csrfInput />
																	</form>
																</td>
															</c:if>
														</tr>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="card-footer bg-transparent p-0">
							<!-- Pagination START -->
							<div class="d-sm-flex justify-content-sm-between align-items-sm-center">
								<!-- Content -->
								<p class="mb-0 text-center text-sm-start"></p>
								<!-- Pagination -->
								<div class="card-footer clearfix" id="pagingArea" style="margin-top: -10px; padding: 0px;">${boardPagingVO.pagingHTML }</div>
							</div>
							<!-- Pagination END -->
						</div>
					</div>
				</div>


				<!-- 두 번째 탭 - 댓글 신고 -->
				<div class="tab-pane fade" id="comment" role="tabpanel" aria-labelledby="comment-tab">
					<div class="card bg-transparent">
						<div class="card-body px-0" style="text-align: center;">
							<div class="table-responsive border-0">
								<table class="table align-middle p-4 mb-0 table-hover">
									<thead>
										<tr style="background-color: #DCD8FC;">
											<th scope="col" class="border-0 rounded-start" style="color: black;">신고번호</th>
											<th scope="col" class="border-0" style="color: black;">신고자</th>
											<th scope="col" class="border-0" style="color: black;">신고사유</th>
											<th scope="col" class="border-0" style="color: black;">상세보기</th>
											<th scope="col" class="border-0 rounded-end">삭제</th>
										</tr>
									</thead>

									<tbody>
										<tr>
											<c:set value="${commentPagingVO.dataList}" var="commentList" />
											<c:choose>
												<c:when test="${empty commentList}">
													<td colspan="5">신고 댓글이 없습니다.</td>
												</c:when>
												<c:otherwise>
													<c:forEach items="${commentList}" var="commentReportList">
														<tr>
															<td>${commentReportList.reportNo}</td>
															<td>${commentReportList.bbsReportId}</td>
															<td>${commentReportList.bbsReportCmmncd}</td>
															<c:if test="${commentReportList.handlingYn eq 'Y'}">
																<td colspan="2">처리됨</td>
															</c:if>
															<c:if test="${commentReportList.handlingYn ne 'Y'}">
																<td><a href="#" class="btn btn-secondary-soft mb-0 commentReport" data-reportno="${commentReportList.reportNo}" data-bbsreportid="${commentReportList.bbsReportId}" data-bbsreportcmmncd="${commentReportList.bbsReportCmmncd}" data-bsscmntno="${commentReportList.bssCmntNo}" data-bsscmnttm="${commentReportList.bssCmntTm}" data-bsscmntcn="${commentReportList.bssCmntCn}" data-bsscmntwriter="${commentReportList.bssCmntWriter}" data-bs-toggle="modal" data-bs-target="#viewReview">상세보기 </a></td>
																<td>
																	<form id="commentDeleteBtn" action="/myPage/admin/freeBoardCommentDelete.do" method="post">
																		<input type="hidden" name="cmmtNo" id="cmmtNo" value="${commentReportList.cmmtNo}" /> <input type="button" id="CoDeleteBtn" class="CoDeleteBtn" data-bsscmntno="${commentReportList.bssCmntNo }" value="삭제">
																		<sec:csrfInput />
																	</form>
																</td>
															</c:if>
														</tr>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="card-footer bg-transparent p-0">
							<!-- Pagination START -->
							<div class="d-sm-flex justify-content-sm-between align-items-sm-center">
								<!-- Content -->
								<p class="mb-0 text-center text-sm-start"></p>
								<!-- Pagination -->
								<div class="card-footer clearfix" id="pagingCmmArea">${commentPagingVO.pagingHTML }</div>
							</div>
							<!-- Pagination END -->
						</div>
					</div>
				</div>
			</div>
			<!-- 탭 메뉴 끝 -->
		</div>
	</div>
</div>
<!-- Popup modal for reviwe START -->
<div class="modal fade" id="viewReview" tabindex="-1" aria-labelledby="viewReviewLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<!-- Modal header -->
			<div class="modal-header bg-purple">
				<h5 class="modal-title text-white" id="viewReviewLabel">댓글 신고</h5>
				<button type="button" class="btn btn-sm btn-light mb-0" data-bs-dismiss="modal" aria-label="Close">
					<i class="bi bi-x-lg"></i>
				</button>
			</div>
			<!-- Modal body -->
			<div class="modal-body">
			   	 신고 번호 :  <span id="reportNo"></span> <br>
			   	 신고자 :   <span id="bbsReportId"></span> <br>
			   	 신고사유 : <span id="bbsReportCmmncd"></span> <br>
			   	 <div style="border: 1px solid lightgray; padding: 5px; margin-top: 10px;">
				   작성자 : <span id="bssCmntWriter" style="font-size: 20px; font-weight: bolder;"></span> <br>
				    내용 : <span id="bssCmntCn"></span>
			   	 </div>
			</div>

		</div>
	</div>
</div>
<!-- Popup modal for reviwe END -->
<!-- Card body END -->


<script type="text/javascript">
	$(document).on("click", ".commentReport", function() {
		// 클릭한 문의의 정보 가져오기
		var reportNo = $(this).data("reportno");
		var bbsReportId = $(this).data("bbsreportid");
		var bbsReportCmmncd = $(this).data("bbsreportcmmncd");
		var bssCmntTm = $(this).data("bsscmnttm");
		var bssCmntCn = $(this).data("bsscmntcn");
		var bssCmntWriter = $(this).data("bsscmntwriter");

		$("#reportNo").text(reportNo);
		$("#bbsReportId").text(bbsReportId);
		$("#bbsReportCmmncd").text(bbsReportCmmncd);
		$("#bssCmntWriter").text(bssCmntWriter);
		$("#bssCmntCn").text(bssCmntCn);
	});

	$(function() {
		var BoDeleteBtn = $(".BoDeleteBtn");
		var CoDeleteBtn = $(".CoDeleteBtn");
		var pagingArea = $("#pagingArea");
		var pagingCmmArea = $("#pagingCmmArea");
		var searchForm = $("#searchForm");

		$("#BoDeleteBtn").click(function() {
		    var bbsNo = $(this).data("bbsno");
		    Swal.fire({
		        title: '정말로 삭제하시겠습니까?',
		        icon: 'warning',
		        showCancelButton: true,
		        confirmButtonText: '확인',
		        cancelButtonText: '취소',
		        reverseButtons: false 
		    }).then((result) => {
		        if (result.isConfirmed) {
		            $("#bbsNo").val(bbsNo);
		            $("#boardDeleteBtn").submit(); 
		        } else if (result.dismiss === Swal.DismissReason.cancel) {
		            Swal.fire('취소되었습니다.', '', 'error');
		        }
		    });
		});

		$("#insertForm").submit(function(event) {
		    event.preventDefault(); // 폼 제출의 기본 동작을 중지

		    Swal.fire({
		        title: '신고되었습니다.',
		        icon: 'info',
		        showCancelButton: true,
		        confirmButtonText: '확인',
		        cancelButtonText: '취소',
		        reverseButtons: true
		    }).then((result) => {
		        if (result.isConfirmed) {
		            this.submit(); 
		        } else if (result.dismiss === Swal.DismissReason.cancel) {
		            Swal.fire('취소되었습니다.', '', 'error');
		        }
		    });
		});


		CoDeleteBtn.on("click", function() {
			// 		var cmmtNo = $(this).data("cmmtno");
			var bssCmntNo = $(this).data("bsscmntno");
			if (confirm("정말로 삭제하시겠습니까?")) {
				//             $("#cmmtNo").val(cmmtNo);
				$("#bssCmntNo").val(bssCmntNo);
				$("#commentDeleteBtn").submit(); // 폼 제출
			}
		});

		pagingArea.on("click", "a", function(event) {
			event.preventDefault();

			var pageNo = $(this).data("page");
			console.log(pageNo);
			searchForm.find("#page").val(pageNo);
			searchForm.submit();
		});

		/* 안돼 */
		pagingCmmArea.on("click", "a", function(event) {
			event.preventDefault();

			var pageNo = $(this).data("page");
			console.log(pageNo);
			searchForm.find("#commentPage").val(pageNo);
			searchForm.submit();
		});

	})
</script>