<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

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

        <div class="row g-4">

            <!-- Student review START -->
            <div class="col-12">
                <div class="card bg-transparent border">
                    <div class="d-flex justify-content-between align-items-center">
                        <!-- Card header START -->
                        <div class="card-header">
                            <h5 class="mb-0">기업 정보 관리</h5>
                        </div>
                        <div class="col-md-8 d-flex justify-content-end align-items-center">
                            <form class="rounded position-relative d-flex" id="searchForm" method="post" action="/myPage/admin/entInfoManagement">
                                <input type="hidden" id="page" name="page" />
                                <select class="form-control me-2" name="searchType" style="width: 45%;">
                                    <option value="entNo" <c:if test="${searchType eq 'entNo' }">selected</c:if>>기업코드</option>
                                    <option value="entNm" <c:if test="${searchType eq 'entNm' }">selected</c:if>>기업명</option>
                                </select>
                                <input class="form-control bg-body flex-grow-1" name="searchWord" value="${searchWord }" type="text" placeholder="Search">
                                <button class="bg-transparent p-2 border-0 text-primary-hover text-reset" type="submit">
                                    <i class="fas fa-search fs-6"></i>
                                </button>
                                <sec:csrfInput />
                            </form>
                        </div>
                    </div>
                    <!-- Card header END -->

                    <!-- Card body START -->
                    <div class="card-body pb-0">
                        <!-- Table START -->
                        <div class="table-responsive border-0" style="height: auto;">
                            <table class="table table-white align-middle p-4 mb-0 table-hover" id="example-table">

                                <!-- Table head -->
                                <thead style="background-color: #DCD8FC;">
                                    <tr>
                                        <th scope="col" class="border-0 rounded-start" width="15%;">기업코드</th>
                                        <th scope="col" class="border-0">기업명</th>
                                        <th scope="col" class="border-0 rounded-end">상세보기</th>
                                    </tr>
                                </thead>
                                <tbody id="entBody">
                                    <c:set value="${pagingVO.dataList }" var="entList" />
                                    <c:choose>
                                        <c:when test="${empty entList }">
                                            <tr>
                                                <td colspan="3">요청 기업이 존재하지 않습니다</td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach items="${entList }" var="list">
                                                <tr>
                                                    <td>
                                                        <div class="name-col" id="entNo">${list.entNo }</div>
                                                    </td>
                                                    <td>
                                                        <div class="name-col" id="entNm">${list.entNm }</div>
                                                    </td>
<!--                                                     <td> -->
<!--                                                     	<div class="name-col"></div> -->
<!--                                                     </td> -->
                                                    <td>
                                                        <div class="name-col">
                                                            <a class="modal-detail-trigger" style="color: black; cursor: pointer;">[상세보기]</a>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                </tbody>
                                <!-- Table body END -->
                            </table>
                        </div>
                        <div class="card-footer clearfix" align="right" id="pagingArea">
                            ${pagingVO.pagingHTML }</div>
                    </div>
                    <!-- Card body END -->
                </div>
            </div>
        </div>
        
        <div class="modal fade twm-saved-jobs-view" id="detailEnt" aria-hidden="true" aria-labelledby="saved_job_view" tabindex="-1">
		    <div class="modal-dialog modal-xl modal-dialog-centered">
		        <div class="modal-content">
		            <form>
		
		                <div class="modal-header">
<!-- 		                    <h2 class="modal-title" id="saved_job_view">ITcruit</h2> -->
		                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		                </div>
						
		                <div class="modal-body" id="modal-body">
		                    <!-- 모달 내용은 이 부분에 동적으로 추가됩니다. -->
		                </div>
		
		                <div class="modal-footer">
		                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
		                </div>
		
		            </form>
		        </div>
		    </div>
		</div>
    </div>
</main>

<script type="text/javascript">
$(function(){
	var searchForm = $("#searchForm");
// 	console.log(searchForm);
	var pagingArea = $("#pagingArea");
	
	pagingArea.on("click", "a", function(event){
		event.preventDefault();
		var pageNo = $(this).data("page");
		searchForm.find("#page").val(pageNo);
		searchForm.submit();
	});
	
	
	
	// 상세보기 링크 클릭 시 모달을 보여주는 함수
    $(document).on("click", ".modal-detail-trigger", function() {
        // 클릭된 상세보기 링크의 부모 요소(tr)에서 기업 코드와 기업명을 가져옵니다.
        var entNo = parseInt($(this).closest("tr").find("#entNo").text()); // 기업코드
        var entNm = $(this).closest("tr").find("#entNm").text(); // 기업명
        
        // 모달 내용을 동적으로 생성하여 로드합니다.
        $.ajax({
            type: "post",
            url: "/ent/detail.do",
            data: { entNo: entNo },
            beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
            },
            success: function(response) {
                // AJAX 요청 성공 시 모달에 페이지 내용을 표시합니다.
                var body = $(response).closest("main").html();
//                 console.log(body);

				var mainCard = $(body).closest(".py-3").html();
				var mainContent = $(response).find(".p-sm-4 .card-body").html();

                $('#detailEnt .modal-body').empty();
                
//                 $('#detailEnt .modal-body').append(mainCard);
//                 $('#detailEnt .modal-body').append(mainContent);
                
                // 이미지가 있는 섹션을 추가합니다.
			    $('#detailEnt .modal-body').append('<section class="py-3">' + mainCard + '</section>');
			    
                $('#detailEnt .modal-body').append('<hr/>');
			    
			    // 내용이 있는 섹션을 추가합니다.
			    $('#detailEnt .modal-body').append('<section>' + mainContent + '</section>');
                
//              	// 수정/취소 버튼 추가
//                 var buttonHtml = '<button type="button" class="btn btn-primary" id="modifyButton">수정</button>';
//                 buttonHtml += '<button type="button" class="btn btn-secondary" id="cancelButton" data-dismiss="modal">취소</button>';
//                 $('#detailEnt .modal-body').append(buttonHtml);
                
                // 모달을 보여줍니다.
                $('#detailEnt').modal('show');
            },
            error: function(xhr, status, error) {
                // AJAX 요청 실패 시 에러를 출력합니다.
                console.error("AJAX request failed:", status, error);
            }
        });
    });
});
</script>