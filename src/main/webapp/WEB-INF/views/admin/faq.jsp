<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.accordion-item {
	overflow: hidden;
}

.updateBtn, .deleteBtn {
	float: right;
	padding: 3px 6px 3px 10px;
	margin: 5px;
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
			<h1 class="h3 mb-2 mb-sm-0">FAQ</h1>
		</div>
	</div>

	<!-- Card START -->
	<div class="card bg-transparent">

		<!-- Card header START -->
		<div class="card-header bg-transparent border-bottom px-0">
			<!-- Search and select START -->
			<div class="row g-3 align-items-center justify-content-between">

				<!-- Search bar -->
					<div class="col-md-4">
					<form class="input-group input-group-sm" method="get" id="searchForm">
						<input type="hidden" name="page" id="page"/>
						<div style="padding: 3px;"></div>
						<div class="input-group" style="width: 500px;">
						    <input type="text" name="searchWord" value="${searchWord }" class="form-control" placeholder="검색">
						    <div class="input-group-append">
						        <button type="submit" class="searchBtn" style="border:none; margin-top:10px; background-color: white;">
						            <i class="fas fa-search"></i>
						        </button>
						    </div>
						</div>
						<sec:csrfInput/>
					</form>
					</div>

				<!-- Primary button -->
					<div class="col-md-3 text-md-end">
						<a class="btn" href="/myPage/admin/faqInsertForm" style="background-color: #DCD8FC">등록하기</a>
					</div>
			</div>
			<!-- Search and select END -->
		</div>

		<!-- Card header END -->

		<!-- Card body START -->
		<div class="card-body px-4">

			<div class="table-responsive border-0">
				<table class="table table-dark-gray align-middle p-4 mb-0 table-hover">
					<!-- Table head -->
					<div class="accordion accordion-flush" id="accordionFlushExample">

						<c:set value="${pagingVO.dataList}" var="list" />
						<c:choose>
							<c:when test="${empty list}">
								<div>없다</div>
							</c:when>
							<c:otherwise>
								<form action="/myPage/admin/faqDelete.do" id="editdelForm" method="post">
									<input type="hidden" name="bbsNo" id="bbsNo" value="${boardVO.bbsNo }" />
									<sec:csrfInput />
								</form>
								<div id="accordionFlushExample" class="accordion">
									<c:forEach items="${list}" var="faqList" varStatus="loop">
										<div class="accordion-item">
											<h2 class="accordion-header" id="flush-heading${loop.index}">
												<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse${loop.index}" aria-expanded="false" aria-controls="flush-collapse${loop.index}">${faqList.bbsTtl}</button>
											</h2>
											<div id="flush-collapse${loop.index}" class="accordion-collapse collapse" aria-labelledby="flush-heading${loop.index}" data-bs-parent="#accordionFlushExample">
											    <div class="accordion-body">${faqList.bbsCn}</div>												
											    <input type="button" class="deleteBtn" id="deleteBtn" data-bbsno="${faqList.bbsNo }" value="삭제 "> 
											    <input type="button" class="updateBtn" id="updateBtn" data-bbsno="${faqList.bbsNo }" value="수정 ">
											</div>
										</div>
									</c:forEach>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</table>
			</div>
		</div>
		<!-- Tabs content END -->
	</div>
	<div class="card-footer bg-transparent p-0">
		<!-- Pagination START -->
		<div class="d-sm-flex justify-content-sm-between align-items-sm-center">
			<!-- Content -->
			<p class="mb-0 text-center text-sm-start"></p>
			<!-- Pagination -->
			<div class="card-footer clearfix" id="pagingArea">
			${pagingVO.pagingHTML }
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">

	$(function() {

		var searchForm = $("#searchForm");
		var pagingArea = $("#pagingArea");

		pagingArea.on("click", "a", function(event) {
			event.preventDefault();
			var pageNo = $(this).data("page");
			console.log(pageNo)
			searchForm.find("#page").val(pageNo);
			searchForm.submit();
		});
	});

	
	$(function() {
	    $(".updateBtn").on("click", function() {
	        var bbsNo = $(this).data("bbsno");
	        console.log("bbsNo:", bbsNo); // 콘솔에 bbsNo 값 출력
	        
	        var editdelForm = $("#editdelForm");
	        $("#bbsNo").val(bbsNo); 
	        editdelForm.attr("method", "GET"); // GET 방식으로 변경
	        editdelForm.attr("action", "/myPage/admin/faqUpdate"); // action 지정
	        editdelForm.submit(); // 폼 제출
	    });
	});

	
	$(function() {
		$(".deleteBtn").on("click", function() {
			var bbsNo = $(this).data("bbsno");
			console.log(bbsNo);
// 			if (confirm("정말로 삭제하시겠습니까?")) {
// 				$("#bbsNo").val(bbsNo);
// 				$("#editdelForm").submit(); // 폼 제출
// 			}
		});
	});

</script>