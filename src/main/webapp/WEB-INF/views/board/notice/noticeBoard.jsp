<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<style>
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

<!-- **************** MAIN CONTENT START **************** -->
<main>
<!-- =======================
Page Banner START -->
<section class="bg-light py-5">
	<div class="container">
		<div class="row g-4 g-md-5 position-relative">
			<!-- SVG decoration -->
			<figure class="position-absolute top-0 start-0 d-none d-sm-block">	
				<svg width="22px" height="22px" viewBox="0 0 22 22">
					<polygon class="fill-purple" points="22,8.3 13.7,8.3 13.7,0 8.3,0 8.3,8.3 0,8.3 0,13.7 8.3,13.7 8.3,22 13.7,22 13.7,13.7 22,13.7 "></polygon>
				</svg>
			</figure>

			<!-- Title and Search -->
			<div class="col-lg-10 mx-auto text-center position-relative">
				<!-- SVG decoration -->
				<figure class="position-absolute top-50 end-0 translate-middle-y">
					<svg width="27px" height="27px">
						<path class="fill-orange" d="M13.122,5.946 L17.679,-0.001 L17.404,7.528 L24.661,5.946 L19.683,11.533 L26.244,15.056 L18.891,16.089 L21.686,23.068 L15.400,19.062 L13.122,26.232 L10.843,19.062 L4.557,23.068 L7.352,16.089 L-0.000,15.056 L6.561,11.533 L1.582,5.946 L8.839,7.528 L8.565,-0.001 L13.122,5.946 Z"></path>
					</svg>
				</figure>
				<!-- Title -->
				<h1 class="display-6">Hello, how can we help?</h1>
				<!-- Search bar -->
				<div class="col-lg-8 mx-auto text-center mt-4">
					<form class="input-group input-group-sm" method="post" id="searchForm">
					<input type="hidden" name="page" id="page"/>
						<div class="input-group">
							<input class="form-control border-0 me-1" type="text"  name="searchWord" value="${searchWord }" placeholder="Ask a question...">
							<button type="submit" class="btn btn-blue mb-0 rounded"><i class="bi bi-search"></i></button>
						</div>
						<sec:csrfInput/>
					</form>
				</div>
			</div>

			<!-- Category START -->
      <div class="col-12">
				<div class="row g-4 text-center">
				  <!-- <p class="mb-0">Choose a category to quickly find the help you need</p> -->
					<!-- Category item -->
					<div class="col-sm-6 col-md-4">
						<div class="card card-body card-border-hover p-0" style="border: 3px solid slategray;">
							<a href="/notice/notice.do" class="p-3">
								<h2><i class="bi bi-megaphone"></i></h2>
								<h6 class="mb-0">공지사항</h6>
							</a>
						</div>
					</div>

					<!-- Category item -->
					<div class="col-sm-6 col-md-4">
						<div class="card card-body card-border-hover p-0">
							<a href="/faq/faq.do" class="p-3">
								<h2><i class="fas fa-hands-helping transition-base"></i></h2>
								<h6 class="mb-0">FAQ</h6>
							</a>
						</div>
					</div>

					<!-- Category item -->
					<div class="col-sm-6 col-md-4">
						<div class="card card-body card-border-hover p-0">
							<a href="/inquiry/form" class="p-3">
								<h2><i class="bi bi-chat-square-text"></i></h2>
								<h6 class="mb-0">문의게시판</h6>
							</a>
						</div>
					</div>

					<!-- Category item -->
					<!-- <div class="col-sm-6 col-md-3">
						<div class="card card-body card-border-hover p-0">
							<a href="#" class="p-3">
								<h2><i class="fas fa-flag transition-base"></i></h2>
								<h6 class="mb-0">Getting started</h6>
							</a>
						</div>
					</div>-->
				</div> <!-- Row END -->
      </div>
			<!-- Category END -->
		</div>
	</div>
</section>
<!-- =======================Page Banner END -->

<!-- =======================Page content START -->
<section class="pt-5 pb-0 pb-lg-5">
	<div class="container">
	
		<div class="row g-4 g-md-5">
			<!-- Main content START -->
			<div class="col-12">
				<!-- Title -->
				<h3 class="mb-4">공지사항</h3>
				
				<table class="table align-middle p-4 mb-0 table-hover">
					<thead>
						<tr style="background-color: #DCD8FC;">
							<th scope="col" class="border-0" style="width: 1000px; text-align: center;">제목</th>
							<th scope="col" class="border-0" style="text-align: center;">공고일</th>
						</tr>
					</thead>
					<tbody>
						<c:set value="${pagingVO.dataList }" var="list"/>
						<c:choose>
							<c:when test="${empty list }">
								<tr>
									<td colspan="3">게시글이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${list }" var="noticeList">
									<tr>
										<td><a href="/notice/noticeDetail.do?bbsNo=${noticeList.bbsNo }" style="color: black;"> ${noticeList.bbsTtl}</a></td>
										<td style="text-align: center;"><fmt:formatDate value="${noticeList.bbsRegDt}" pattern="yyyy-MM-dd" /></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<!-- Pagination START -->
					<div class="card-footer bg-transparent p-0">
						<!-- Pagination START -->
						<div class="d-sm-flex justify-content-sm-between align-items-sm-center">
							<!-- Content -->
							<p class="mb-0 text-center text-sm-start"></p>
							<!-- Pagination -->
							<div class="card-footer clearfix" id="pagingArea">${pagingVO.pagingHTML }</div>
						</div>
					</div>
				</div>
			<!-- Main content END -->
		
		</div><!-- Row END -->
	</div>
</section>
<!-- =======================Page content END -->

</main>
<!-- **************** MAIN CONTENT END **************** -->

<script type="text/javascript">
$(function(){
	
	var searchForm = $("#searchForm");
	var pagingArea = $("#pagingArea");
	
	
	
	pagingArea.on("click", "a", function(event){
		event.preventDefault();
		var pageNo = $(this).data("page");
		searchForm.find("#page").val(pageNo);
		searchForm.submit();
	});
});
</script>