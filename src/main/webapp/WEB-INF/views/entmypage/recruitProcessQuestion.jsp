<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<style>
    
.table > :not(caption) > * > * {
  padding: 1rem 0rem;
}
.searchTop {
  margin-left: -26px;
}
h6, .h6 {
  font-size: 0.8rem;
}

</style>

<div class="page-content-wrapper border">
	

		<!-- Title -->
		<div class="row mb-3">
			<div class="col-12 d-sm-flex justify-content-between align-items-center">
				<h1 class="h5 mb-2 mb-sm-0">채용 공고 관리</h1>
			</div>
		</div>

		<!-- Card START -->
		<div class="card bg-transparent border">

			<!-- Card header START -->
			<div class="card-header bg-light border-bottom px-0">
				<!-- Search and select START -->
				<div class="row g-3 align-items-center justify-content-between ps-5">

					<!-- Search bar -->
					<div class="col-md-12 searchTop">

						<form class="rounded position-relative" id="searchForm">
							<input type="hidden" name="page" id="page"/>
							<div class="input-group">
								<!-- <input class="form-control bg-transparent me-2 rounded-2 w-25" type="search" placeholder="Search" aria-label="Search"> -->
								<!-- Select Box 1 -->
								<input class="form-control bg-body rounded-2 w-10" type="search" placeholder="검색" aria-label="Search" name="searchWord" value="${searchWord}" style="width: 200px; height: 50px;">
								<!-- Select Box 2 -->
								<select class="form-select me-2 rounded-2" aria-label="Select box 2" name="searchType" style="margin-left: 11px; height: 50px;">
									<option value="defaultSort" <c:if test="${searchType eq 'defaultSort' }">selected</c:if>>검색조건</option>
									<option value="descStrtDate" <c:if test="${searchType eq 'descStrtDate' }">selected</c:if>>최근 공고일</option>
									<option value="ascStrtDate" <c:if test="${searchType eq 'ascStrtDate' }">selected</c:if>>나중 공고일</option>
									<option value="descDday" <c:if test="${searchType eq 'descDday' }">selected</c:if>>마감기한 높은순</option>
									<option value="ascDday" <c:if test="${searchType eq 'ascDday' }">selected</c:if>>마감기한 낮은순</option>
									<option value="decsHit" <c:if test="${searchType eq 'decsHit' }">selected</c:if>>지원자수 높은순</option>
									<option value="ascHit" <c:if test="${searchType eq 'ascHit' }">selected</c:if>>지원자수 낮은순</option>
								</select>
								<button class="btn btn-outline-secondary rounded-2" type="submit" style="height: 50px;">
									<i class="fas fa-search"></i>
								</button>
								<div class="ms-1">
									<div class="form-check form-check-md ms-2">
										<input class="form-check-input" type="checkbox" value="Y" id="recruitYn" name="recruitYn" <c:if test="${recruitYn eq 'Y' }">checked</c:if>>
										<label class="form-check-label" for="recruitYn">수시 채용 여부</label>
									</div>
									<div class="form-check form-check-md ms-2">
										<input class="form-check-input" type="checkbox" value=Y id="processYn" name="processYn" <c:if test="${processYn eq 'Y' }">checked</c:if>>
										<label class="form-check-label" for="processYn">채용 프로세스 여부</label>
									</div>
								</div>
							</div>
							<input type="hidden" name="entNo" value="${customPagingVO.dataList[0].entNo }"/>
							<sec:csrfInput/>
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
					<table class="table table-dark-gray align-middle p-4 mb-0 table-hover" >
						<!-- Table head -->
						<thead style="text-align: center;">
							<tr>
								
								<th scope="col" class="border-0 rounded-start ">포지션</th>
								<th scope="col" class="border-0 ">공고제목</th>
								<th scope="col" class="border-0 ">프로세스</th>
								<!-- <th scope="col" class="border-0">Rating</th> -->
								
								<th scope="col" class="border-0 ">공고상태</th>
								<th scope="col" class="border-0 " >공고시작일</th>
								<th scope="col" class="border-0 ">공고마감일</th>
								<th scope="col" class="border-0 rounded-end ">지원자수</th>
							</tr>
						</thead>

						<!-- Table body START -->
						<tbody>
						
						
						<c:set value="${customPagingVO.dataList }" var="recruitList"/>
						
						<c:choose>
						<c:when test="${empty recruitList}">
						
							<tr>
								
								<td colspan="7" class="text-center">
										<c:out value="등록한 공고가 없습니다."/>
								
								</td>
								
							</tr>
						
						</c:when>
						<c:otherwise>
							<c:forEach items="${recruitList}" var="recruit" varStatus="status">
								<!-- Table row -->
								<tr>
								
									<!-- Table date -->
									<td class="text-center">
										
										<h6 style="margin-bottom: 0px;">${recruit.pstnCmmncdNm}</h6>
										
									</td>
									
								
									<!-- Table data -->
									<td>
										<h6 class="table-responsive-title mb-0 ms-4">	
											<a href="/myPage/enterprise/recruitDetail?recruitNo=${recruit.recruitNo}&pstnCmmncdNm=${recruit.pstnCmmncdNm}">${recruit.recruitTtl}</a>
										</h6>
									</td>
	
									<td class="d-flex justify-content-center">
										
										<c:if test="${recruit.processYn eq 'Y' }">
										
											<a href="/myPage/enterprise/processDetail?recruitNo=${recruit.recruitNo}&pstnCmmncdNm=${recruit.pstnCmmncdNm}&recruitTtl=${recruit.recruitTtl } " class="btn btn-primary btn-sm stretched-link">문항보기</a>
											
										</c:if>
										<c:if test="${recruit.processYn eq 'N' }">
										
											<a href="#" class="btn btn-primary stretched-link" id="processN">신청안함</a>
											
										</c:if>
										
									</td>
									
									
									<!-- Table data -->
									
									<c:if test="${recruit.recruitStatus eq '공고전'}">
									
										<td class="text-center"><h6><span class="badge bg-info text-white">${recruit.recruitStatus}</span></h6></td>
									
									</c:if>
									
									<c:if test="${recruit.recruitStatus ne '공고전'}">
									
										<td class="text-center"><h6><span class="badge bg-danger"><c:if test="${recruit.deadLineDay eq 'D+1' }">공고마감</c:if><c:if test="${recruit.deadLineDay ne 'D+1' }">${recruit.deadLineDay}</c:if></span></h6></td>
									
									</c:if>
									
									
									<!-- Table data -->
									<td class="text-center">	
										<h6 class="text-center">${fn:substringBefore(recruit.recruitStrtDt,"T")}</h6>
									</td>
									<td>
										<h6 class="text-center">${fn:substringBefore(recruit.recruitEndDt,"T")}</h6>
									</td>
									
									<!-- Table data -->
									<td class="text-center"><h6>${recruit.entApply}</h6></td>
									
								</tr>
								
							</c:forEach>
						</c:otherwise>						

						</c:choose>


						</tbody>
					</table>
						<!-- Table body END -->
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
<!-- 					<nav class="d-flex justify-content-center mb-0" aria-label="navigation"> -->
<!-- 						<ul class='pagination pagination-sm pagination-primary-soft d-inline-block d-md-flex rounded mb-0'> -->
<!-- 							<li class='page-item mb-0'><a class='page-link' href='' tabindex='-1' data-page'"+(startPage - blockSize)+"'><i class='fas fa-angle-left'></i></a></li>" -->
<!-- 							<li class="page-item mb-0"><a class="page-link" href="#">1</a></li> -->
<!-- 							<li class='page-item mb-0 active'><a class='page-link'>2</a></li> -->
<!-- 							<li class='page-item mb-0'><a class='page-link' href='' data-page='">3</a></li> -->
<!-- 							<li class='page-item mb-0'><a class='page-link' href='' data-page='" + (endPage + 1) + "'><i class='fas fa-angle-right'></i></a></li>" -->
<!-- 						</ul> -->
<!-- 					</nav> -->
					<nav class="d-flex justify-content-center mb-0" aria-label="navigation" id="pagingArea">
						${customPagingVO.pagingHTML }
					</nav>
				</div>
				
				
				
				<!-- Pagination END -->
			</div>
			<!-- Card footer END -->
		</div>
		<!-- Card END -->
	</div>
<script type="text/javascript">
	
document.addEventListener("DOMContentLoaded", function() {
	
    var searchForm = document.getElementById("searchForm");
    var pagingArea = document.getElementById("pagingArea");
    
    pagingArea.addEventListener("click", function(e) {
    	
        if (e.target.tagName === 'A') {
            e.preventDefault();
            var pageNo = e.target.getAttribute("data-page"); 
            var pageElement = searchForm.querySelector('#page');
            pageElement.value = pageNo;

            // 폼 제출
            searchForm.submit();
        }
    });
    
    var processN = document.getElementById("processN");
    
    processN.addEventListener("click", function(){
    	
    	alert("프로세스 이용자가 아닙니다.");
    	
    })
});


</script>