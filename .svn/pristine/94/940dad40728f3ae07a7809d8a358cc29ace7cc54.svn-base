<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
	
	
	
	<style>
    thead th, tbody td {
        text-align: center;
        vertical-align: middle; /* 수직 중앙 정렬 */
    }
    .checkbox-col {
        margin-right: 10px; /* 체크박스와 이름 사이의 간격 */
    }
    .flex-row {
        display: flex; /* Flexbox 레이아웃 활성화 */
        align-items: center; /* 세로 중앙 정렬 */
    }
    .btn-sm {
        margin-right: 5px; /* 버튼 사이의 마진 */
    }
	</style>
	
<main>

	<!-- Page main content START -->
	<div class="page-content-wrapper border">

		<!-- Title -->
		<div class="row mb-3">
			<div class="col-12 d-sm-flex justify-content-between align-items-center">
				<h1 class="h3 mb-2 mb-sm-0"></h1>
			</div>
		</div>
				
		<div class="row g-4">

			<!-- Student review START -->
			<div class="col-12">
				<div class="card bg-transparent border">

					<!-- Card header START -->
					<div class="card-header">
						<h5 class="mb-0">기업회원 가입 요청</h5>
					</div>
					<!-- Card header END -->

					<!-- Card body START -->
					<div class="card-body pb-0">
						<!-- Table START -->
						<div class="table-responsive border-0" style="height: 425px;">
							<table
								class="table table-white align-middle p-4 mb-0 table-hover" id="example-table">
								<c:set value="${atchPagingVO.dataList }" var="entSttsList"/>
								<c:choose>
									<c:when test="${empty entSttsList }">
										<tr>
											<td>요청 기업이 존재하지 않습니다</td>
										</tr>
									</c:when>
									<c:otherwise>
										<!-- Table head -->
										<thead style="background-color: #DCD8FC;">
											<tr>
												<th scope="col" class="border-0 rounded-start">
													<div class="flex-row">
														<div class="checkbox-col">
															<input type="checkbox" name="registerCheckbox" id="registerCheckbox" style="margin-left: 10px;">
														</div>
														<div class="name-col" style="margin-left: 10px;">기업명</div>
													</div>
												</th>
												<th scope="col" class="border-0">가입서류</th>
												<th scope="col" class="border-0 rounded-end">승인/거절</th>
											</tr>
										</thead>
										<tbody id="entBody">
											<c:forEach items="${entSttsList }" var="entSttsList">
												<tr>
													<td>
														<div class="flex-row">
															<div class="checkbox-col">
																<input type="checkbox" class="registerChildCheckbox" value="${entSttsList.accountId }" name="" id="" style="margin-left: 10px;">
															</div>
															<div class="name-col" style="margin-left: 10px;">
																<h6>${entSttsList.entNm }</h6>
															</div>
														</div>
													</td>
													<td>
														<h6 class="mb-0" style="display: inline-block;">${entSttsList.orgnCmmncd }</h6>
														<a href="" style="display: inline-block;" data-imgid="checkImage" > 
															
															<i class="fas fa-search" data-entno="${entSttsList.entNo }"></i>
														</a>
													</td>
													<td>
														<button type="button" class="btn btn-sm btn-info-soft addBtn" data-accountid="${entSttsList.accountId }">승인</button>
														<button type="button" class="btn btn-sm btn-danger-soft readyBtn">거절</button>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</c:otherwise>
								</c:choose>
								<!-- Table body END -->
							</table>
						</div>
						<!-- Table END -->
					</div>
					<!-- Card body END -->

					<!-- Card footer START -->
					<div class="card-footer bg-transparent">
						<!-- Pagination START -->
						<div
							class="d-sm-flex justify-content-sm-between align-items-sm-center" id="entSttsPagingArea">
							<!-- Content -->
							<p class="mb-0 text-center text-sm-start"> <button type="button" class="btn btn-sm btn-info-soft" id="fullAddBtn">전체 승인</button> </p>
							<!-- Pagination -->
							<form method="post" id="entSttsListForm">
							<input type="hidden" id="entSttsListPage" name="entSttsListPage">
							<sec:csrfInput/>
						</form>
							${atchPagingVO.pagingHTML }
						</div>
						<!-- Pagination END -->
					</div>
					<!-- Card footer END -->
				</div>
			</div>
				<!-- Student review END --> 
			<hr class="mt-5" style="border:#8d7ffc solid 1px;"/>

			<!-- Student review START -->
			<div class="col-12">
				<div class="card bg-transparent border">

					<!-- Card header START -->
					<div class="card-header">
						<h5 class="mb-0">신고된 회원 계정</h5>
					</div>
					<!-- Card header END -->
		
					<!-- Card body START -->
					<div class="card-body pb-0">
						<!-- Table START -->
						<div class="table-responsive border-0">
							<table class="table align-middle p-4 mb-0 table-hover">
								<c:set value="${reportPagingVO.dataList }" var="reportList"/>
								 <c:choose>
								 	<c:when test="${empty reportList }">
										<tr>
											<td>
												신고된 계정이 없습니다
											</td>
										</tr>
								 	</c:when>
								 	<c:otherwise>
								<!-- Table head -->
								<thead style="background-color: #DCD8FC;" >
									<tr>
										<th scope="col" class="border-0 rounded-start">번호</th>
										<th scope="col" class="border-0">
											<div class="flex-row">
												<div class="name-col" style="margin-left: 10px;">신고 계정</div>
											</div>
										</th>
										
										<th scope="col" class="border-0">닉네임</th>
										<th scope="col" class="border-0">신고 사유</th>
										<th scope="col" class="border-0">신고 날짜</th>
										<th scope="col" class="border-0 rounded-end">처리여부</th>
									</tr>
								</thead>
		
								<!-- Table body START -->
								<tbody id="reportBody" style="text-align: center";>
								 		<c:forEach items="${reportList }" var="reportList" varStatus="status">
								 		<!-- Table row -->
										<tr>
											<td>${status.index + 1 } </td>
										
											<!-- Table data -->
											<td>
												<div class="flex-row">
													<div class="name-col" style="margin-left: 10px;">
														<h6>${reportList.accountId }</h6>
													</div>
												</div>
											</td>
											
											<td>
												<div class="flex-row">
													<div class="name-col" style="margin-left: 10px;">
														<h6>${reportList.writeId }</h6>
													</div>
												</div>
											</td>
			
											<!-- Table data -->
											<td>
												<a href="/freeBoard/detail.do?bbsNo=${reportList.bbsNo }"><h6 class="mb-0">${reportList.bbsReportCmmncd }</h6></a>
											</td>
											
											
											<!-- Table data -->
											<td>
												<h6> <fmt:formatDate value="${reportList.reportYmd }" pattern="yyyy-MM-dd"/></h6>
											</td>
			
											<!-- Table data -->
											<td>
												<button class="btn btn-sm btn-info-soft reportBtn" data-writeid="${reportList.writeId }" data-reportno="${reportList.reportNo }">해제</button>
												<button class="btn btn-sm btn-danger-soft deleteBtn" data-writeid="${reportList.accountId }">정지</button>
										</tr>
										</c:forEach>
									 	</c:otherwise>
									 </c:choose>
								</tbody>
								<!-- Table body END -->
							</table>
						</div>
						<!-- Table END -->
					</div>
					<!-- Card body END -->
		
					<!-- Card footer START -->
					<div class="card-footer bg-transparent">
						<!-- Pagination START -->
						<form method="post" id="reportListForm">
							<input type="hidden" id="reportListPage" name="reportListPage">
							<sec:csrfInput/>
						</form>
						<div id="reportListPagingArea" class="d-sm-flex justify-content-sm-between align-items-sm-center mt-1 mt-sm-0">
							<!-- Content -->
							<p class="mb-0 text-center text-sm-start"></p>
							<!-- Pagination -->
							${reportPagingVO.pagingHTML }
						</div>
						<!-- Pagination END -->
					</div>
					<!-- Card footer END -->
				</div>
			</div>
			<!-- Student review END -->

		</div> <!-- Row END -->
	</div>
	<!-- Page main content END -->

</main>

<!-- 체크박스 상태 동기화를 위한 JavaScript -->
<script>
    
$(function(){
	
		var entSttsPagingArea = $("#entSttsPagingArea");
		var entSttsListForm = $("#entSttsListForm");
	
		entSttsPagingArea.on("click", "a" , function(e){
			e.preventDefault();
			var entSttsListPagingNo = $(this).data("entsttspage");
			entSttsListForm.find("#entSttsListPage").val(entSttsListPagingNo);
			entSttsListForm.submit();
		});
	
	
		$("#entBody").on("click", ".addBtn", function() {
			var accountId = $(this).data("accountid");

			console.log(">>>>>>>>>>>>>" + accountId);

			var data = {
				accountId : accountId
			}

			$.ajax({
				url : "/myPage/admin/entApproval.do",
				type : "post",
				contentType : "application/json; charset=utf-8",
				data : JSON.stringify(data),
				beforeSend : function(xhr) {
					xhr.setRequestHeader(header, token);
				},
				success : function(res) {
					console.log(">>>>>>> " + res)
					alert('승인이 완료되었습니다.');
					window.location.reload();
				}
			})
		});
		
		$("#fullAddBtn").on("click", function() {
	        var checkedValues = $('.registerChildCheckbox:checked').map(function() {
	            return $(this).val(); // 체크된 체크박스의 value 값을 수집
	        }).get();

	        if (checkedValues.length === 0) {
	            alert('승인할 항목을 선택해주세요.'); // 체크된 항목이 없을 경우 경고
	            return; // 아무 것도 선택되지 않았으면 여기서 함수 종료
	        }
	        
	        var entryAccountId = {
	        	
	        	accountIds : checkedValues
	        	
	        	
	        }
 
	        console.log(entryAccountId);

	        $.ajax({
	            url: "/myPage/admin/entApproval.do",
	            type: "POST",
	            contentType: "application/json; charset=utf-8",
	            data: JSON.stringify(entryAccountId),
				beforeSend : function(xhr) {
					xhr.setRequestHeader(header, token);
				},
	            success: function(response) {
	                console.log("Success:", response);
	                alert('승인이 완료되었습니다.');
	                window.location.reload(); // 요청 처리 후 페이지 새로고침
	            },
	            error: function(xhr, status, error) {
	                console.error("Error:", error);
	                alert('승인 처리 중 오류가 발생했습니다.');
	            }
	        });
	    });
		
		var reportListPagingArea = $("#reportListPagingArea");
		var reportListForm = $("#reportListForm");

		reportListPagingArea.on("click", "a" , function(e){
			e.preventDefault();
			var reportListPagingNo = $(this).data("recruitminipage");
			reportListForm.find("#reportListPage").val(reportListPagingNo);
			reportListForm.submit();
		});

		$("#reportBody").on("click", ".reportBtn", function(){
			
			console.log("click <<<<<<<<<<<<<<<<");
			
			var writeId = $(this).data("writeid");
			var reportNo = $(this).data("reportno");
			console.log(">>>>>>>>>>>>" + writeId)
			
			var data = {
				reportNo : reportNo,
				writeId : writeId
			}
		
			$.ajax({
				url : "/myPage/admin/handlingYn.do",
				type : "POST",
				contentType : "application/json; charset=utf-8",
				data : JSON.stringify(data),
				beforeSend : function(xhr) {
					xhr.setRequestHeader(header, token);
				},
	            success: function(response) {
	                console.log("Success:", response);
	                alert('처리가 완료되었습니다.');
	                window.location.reload(); // 요청 처리 후 페이지 새로고침
	            }
				
			});
		
		});
		
		
		$("#reportBody").on("click", ".deleteBtn" , function(){
			
			var writeId = $(this).data("writeid");
			
			console.log(">>>>>>>>>" + writeId);
			
			var data = {
	
					accountId : writeId
					
			}
			
			
			$.ajax({
				url : "/myPage/admin/stopAccount.do",
				type : "post",
				contentType : "application/json; charset=utf-8",
				data : JSON.stringify(data),
				beforeSend : function(xhr) {
					xhr.setRequestHeader(header, token);
				},
	            success: function(response) {
	                console.log("Success:", response);
	                alert('처리가 완료되었습니다.');
	                window.location.reload(); // 요청 처리 후 페이지 새로고침
	            }
			});
			
			
		});
		
		
		
		// 주 체크박스의 요소를 가져온다
		var registerCheckbox = document.getElementById('registerCheckbox');

		// 체크박스가 존재하는지 확인
		if (registerCheckbox) {
		    // 존재한다면 이벤트 리스너를 추가
		    registerCheckbox.addEventListener('change', function() {
		        var isChecked = this.checked; // 주 체크박스가 체크되었는지 상태 저장
		        var checkboxes = document.querySelectorAll('.registerChildCheckbox');
		        checkboxes.forEach(function(checkbox) {
		            checkbox.checked = isChecked; // 각 체크박스를 주 체크박스의 상태에 맞추어 설정
		        });
		    });
		}

		// 하위 체크박스 요소를 모두 가져온다
		var childCheckboxes = document.querySelectorAll('.registerChildCheckbox');

		// 각 하위 체크박스에 이벤트 리스너 추가
		childCheckboxes.forEach(function(childCheckbox) {
		    childCheckbox.addEventListener('change', function() {
		        // 모든 하위 체크박스가 체크되었는지 확인
		        var allChecked = true;
		        childCheckboxes.forEach(function(box) {
		            if (!box.checked) {
		                allChecked = false;
		            }
		        });
		        // 주 체크박스의 상태를 업데이트
		        registerCheckbox.checked = allChecked;
		    });
		});
		
		
		
	});
	


document.addEventListener("DOMContentLoaded", function() {
    var checkImageLinks = document.querySelectorAll('a[data-imgid="checkImage"]');
    var modal = new bootstrap.Modal(document.getElementById('checkImageModal'));

    // 모든 링크에 대해 이벤트 리스너를 설정
    checkImageLinks.forEach(function(link) {
        link.addEventListener("click", function(event) {
            event.preventDefault(); // <a> 태그의 기본 동작을 막음

            // event.currentTarget을 사용하여 실제 이벤트 리스너가 부여된 요소를 참조
            var icon = event.currentTarget.querySelector('i');
            var entNo = icon.dataset.entno;  // 해당 아이콘의 data-entno 값을 얻음

            console.log(entNo);

            var xhr = new XMLHttpRequest();
            xhr.open("get", "/myPage/admin/getEntImage.do?entNo=" + entNo, true);
            xhr.responseType = "blob";
            xhr.onload = function() {
                if (this.status === 200) {
                    var blob = this.response;
                    var reader = new FileReader();

                    reader.onload = function(e) {
                        var previewImage = document.getElementById("previewImage");
                        previewImage.src = e.target.result;
                        modal.show(); // 모달 표시
                    };

                    reader.readAsDataURL(blob);
                }
            };

            xhr.send();
        });
    });
});


</script>

<div class="modal fade" id="checkImageModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
	<div class="modal-content">
		<div class="modal-header">
		<h5 class="modal-title" id="modalLabel">사업자등록증</h5>
		</div>
		<div class="modal-body">
		<img id="previewImage" src="" alt="Image preview" class="img-fluid" style="margin-left: 82px;">
		</div>
		<div class="modal-footer">
		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		</div>
	</div>
	</div>
</div>