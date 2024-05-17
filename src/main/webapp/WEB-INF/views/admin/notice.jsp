<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

<!-- Page main content START -->
	<div class="page-content-wrapper border">

		<!-- Title -->
		<div class="row">
			<div class="col-12">
				<h1 class="h3 mb-2 mb-sm-0">공지사항</h1>
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
					<form class="input-group input-group-sm" method="post" id="searchForm">
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
						<a class="btn" href="/myPage/admin/noticeInsertForm" style="background-color: #DCD8FC">등록하기</a>
					</div>
					
				<!-- Search and select END -->
			</div>
			
			<!-- Card header END -->

			<!-- Card body START -->
			<div class="card-body px-0" style="text-align: center;">
				<div class="table-responsive border-0">
					<table class="table align-middle p-4 mb-0 table">
						<thead>
							<tr style="background-color: #DCD8FC;">
								<th scope="col" class="border-0 rounded-start" style="color: black;">글번호</th>
								<th scope="col" class="border-0" style="color: black;">제목</th>
								<th scope="col" class="border-0" style="color: black;">작성일</th>
							</tr>
						</thead>
				
						<tbody>
							<tr>
								<c:set value="${pagingVO.dataList}" var="list"/>
								<c:choose>
								    <c:when test="${empty list}">
								    <tr>
								    	<td colspan="5">없다</td>
								    </tr>
								    </c:when>
								    <c:otherwise>
							            <c:forEach items="${list}" var="noticeList">
							            <tr>
											<td>${noticeList.bbsNo}</td>
											<td style="text-align: left; padding-left: 95px;">
												<a href="/myPage/admin/noticeDetail.do?bbsNo=${noticeList.bbsNo }" style="color: black;">${noticeList.bbsTtl}</a>
											</td>
											<td>
												<fmt:formatDate value="${noticeList.bbsRegDt}" pattern="yyyy-MM-dd"/>
											</td>
							            </tr>
							            </c:forEach>
								    </c:otherwise>
								</c:choose>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<!-- Card body END -->

			<!-- Pagination START -->
			<div class="card-footer bg-transparent p-0">
				<!-- Pagination START -->
				<div class="d-sm-flex justify-content-sm-between align-items-sm-center">
					<!-- Content -->
					<p class="mb-0 text-center text-sm-start"></p>
					<!-- Pagination -->
					<div class="card-footer clearfix" id="pagingArea" style="margin-top: -10px; padding: 0px;">
					${pagingVO.pagingHTML }
					</div>
				</div>
			</div>
		</div>
		<!-- Card END -->
	</div>
	<!-- Page main content END -->

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