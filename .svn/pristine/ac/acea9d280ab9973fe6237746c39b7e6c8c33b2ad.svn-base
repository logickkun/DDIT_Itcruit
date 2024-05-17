<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
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

        .btn-custom {
            background-color: #007bff;
            border-color: #007bff;
            color: #fff;
            font-weight: bold;
            padding: 10px 20px;
            border-radius: 50px;
            display: inline-flex;
            align-items: center;
            text-transform: uppercase;
        }

        .btn-custom:hover {
            background-color: #0056b3;
            border-color: #0056b3;
            color: #fff;
        }

        .btn-custom i {
            margin-right: 10px;
        }
</style>


<!-- Page main content START -->
<div class="page-content-wrapper border">

	<!-- Title -->
	<div class="row">
		<div class="col-12">
			<h1 class="h5 mb-3">지원한 채용 공고 목록</h1>
		</div>
	</div>

	<!-- Card START -->
	<div class="card bg-transparent">

		<!-- Card header START -->
		<div class="bg-transparent border-bottom px-0">
			<!-- Search and select START -->
			<div class="row g-3 align-items-center justify-content-between">

			</div>
			<!-- Search and select END -->
		</div>

		<!-- Card header END -->

		<!-- Card body START -->
		<div class="card-body px-4">
			
			<div class="table-responsive border-0">
				<table class="table table-dark-gray align-middle p-4 mb-0 table-hover">
					<!-- Table head -->
					<c:set value="${processList}" var="list" />
					
					<c:choose>
							<c:when test="${empty list}">
								<div>지원한 채용공고 목록이 없습니다</div>
							</c:when>
							<c:otherwise>

								<div id="accordionFlushExample" class="accordion">
									<c:forEach items="${list}" var="process" varStatus="loop">
										<div class="accordion-item">
											<h2 class="accordion-header" id="flush-heading${loop.index}">
												<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" 
															data-bs-target="#flush-collapse${loop.index}" aria-expanded="false" 
															aria-controls="flush-collapse${loop.index}">[${process.entNm}] ${process.recruitTtl } (채용지원 일자: ${process.applyDt })
												</button>
											</h2>
											<!-- applyNo accountId entNm, recruitNo, pstnCmmncdNm,entNo -->
											<div id="flush-collapse${loop.index}" class="accordion-collapse collapse" aria-labelledby="flush-heading${loop.index}" data-bs-parent="#accordionFlushExample">
											    <div class="accordion-body">
											    <c:set var = "isFail" value="true"/>
											    	<span style="font-size: 17px; font-weight: 600; color: black;">${process.pstnCmmncdNm} &nbsp;(지원번호: ${process.applyNo } )</span>
											    	<c:forEach items="${process.memberProcessStatList}" var="each" varStatus="status">
														<div id="flush-collapse${loop.index}" class="accordion-collapse collapse" aria-labelledby="flush-heading${loop.index}" data-bs-parent="#accordionFlushExample">
															<div class="accordion-body" style="display: flex; justify-content: space-between; align-items: center; width: 100%;">
																${each.eachOrder}차: ${each.clsNm} (${ each.strtDt } ~ ${ each.endDt })
																<c:if test="${isFail }">
																																
																<c:choose>
																	<c:when test="${each.passYn eq 'Y'}">
																		<span class="badge bg-success rounded-pill" style="align: right; color:white">합격</span>
																	</c:when>
																	<c:when test="${each.passYn eq 'N'}">
																		<span class="badge bg-primary rounded-pill" style="align: right; color:white">진행중</span>
																	</c:when>
																	<c:when test="${each.passYn eq 'D'}">
																		<span class="badge bg-danger rounded-pill" style="align: right; color:white">불합격</span>
																	</c:when>
																	<c:when test="${each.passYn eq 'F'}">
																		<span class="badge bg-warning rounded-pill" style="align: right; color:white">최종합격</span>
																	</c:when>
																	<c:otherwise>
																		<span class="badge bg-light rounded-pill" style="align: right; color:black">시작전</span>
																	</c:otherwise>
																</c:choose>
																</c:if>
																
<%-- 																<c:if test="${each.entCodingtestNo ne 0}"> --%>
																		<%-- 	기업코테번호: ${ each.entCodingtestNo } /  프로세스 시퀀스번호: ${ each.processSeq } / 프로세스 시퀀스 오더${ each.eachOrder }  --%>
<%-- 																		기업코테시작시간: ${ each.strtDt } /  기업코테종료시간: ${ each.endDt } pstnCmmncdNm --%>
<%-- 																</c:if> --%>
																<!-- process.passYn -->
															</div>
															<c:if test="${each.clsNm eq '화상 면접'}">
															<div class="d-flex justify-content-start">
														        <a href="https://192.168.143.213:3001/" class="btn btn-custom" target="_blank" id="videoInterviewBtn-${loop.index}" data-start="${each.strtDt}" data-end="${each.endDt}" style="height: 30px; margin-right: 20px;">
																    <i class="fas fa-arrow-right"></i> 화상면접장
																</a>

														        <strong class="pt-2">입장 전에 채용번호와 채용공고번호 그리고 지원포지션을 확인해주세요.</strong>
														     </div>															
															</c:if>
															
															<c:if test="${isFail }">
																<c:if test="${each.passYn eq 'N'}">					
																	<c:if test="${each.entCodingtestNo ne 0}">
																		<div class="accordion-body" style="display: flex; justify-content: space-between; width: 480px; align-items: center; margin-left: 53px; padding: 0px;">
																					<%-- 	기업코테번호: ${ each.entCodingtestNo } /  프로세스 시퀀스번호: ${ each.processSeq } / 프로세스 시퀀스 오더${ each.eachOrder }  --%>
																					${each.eachOrder}차 ${each.clsNm}(${ each.strtDt } ~ ${ each.endDt }) 
			<!-- 																		process_seq each_order -->
																					<a href="#" class="btn btn-info" style="padding: 4px; margin: 0px" onclick="moveTestPage( '${each.strtDt}', '${each.endDt}','${each.entCodingtestNo}', '${ each.processSeq }', '${ each.eachOrder }' );">시험응시</a>
																		</div>
																	</c:if>
																</c:if>	
															</c:if>	
																
														</div>
														
														
													</c:forEach>
											    </div>												
											</div>
										</div>
									</c:forEach>
									
									
									
								</div>
								
							</c:otherwise>
						</c:choose>
					
					
<!-- 					<div class="accordion accordion-flush" id="accordionFlushExample"> -->
<!-- 						processList -->
<%-- 						<c:set value="${pagingVO.dataList}" var="list" /> --%>
<%-- 						<c:choose> --%>
<%-- 							<c:when test="${empty list}"> --%>
<!-- 								<div>지원한 채용공고 목록이 없습니다</div> -->
<%-- 							</c:when> --%>
<%-- 							<c:otherwise> --%>
<!-- 								<form action="/myPage/admin/faqDelete.do" id="editdelForm" method="post"> -->
<%-- 									<input type="hidden" name="bbsNo" id="bbsNo" value="${boardVO.bbsNo }" /> --%>
<%-- 									<sec:csrfInput /> --%>
<!-- 								</form> -->

<!-- 								<div id="accordionFlushExample" class="accordion"> -->
<%-- 									<c:forEach items="${list}" var="faqList" varStatus="loop"> --%>
<!-- 										<div class="accordion-item"> -->
<%-- 											<h2 class="accordion-header" id="flush-heading${loop.index}"> --%>
<%-- 												<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse${loop.index}" aria-expanded="false" aria-controls="flush-collapse${loop.index}">${faqList.bbsTtl}</button> --%>
<!-- 											</h2> -->
<%-- 											<div id="flush-collapse${loop.index}" class="accordion-collapse collapse" aria-labelledby="flush-heading${loop.index}" data-bs-parent="#accordionFlushExample"> --%>
<%-- 											    <div class="accordion-body">${faqList.bbsCn}</div>												 --%>
<%-- 											    <input type="button" class="deleteBtn" id="deleteBtn" data-bbsno="${faqList.bbsNo }" value="삭제 ">  --%>
<%-- 											    <input type="button" class="updateBtn" id="updateBtn" data-bbsno="${faqList.bbsNo }" value="수정 "> --%>
<!-- 											</div> -->
<!-- 										</div> -->
<%-- 									</c:forEach> --%>
<!-- 								</div> -->
<%-- 							</c:otherwise> --%>
<%-- 						</c:choose> --%>
<!-- 					</div> -->
					
					
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

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript">


document.addEventListener('DOMContentLoaded', function() {
    var buttons = document.querySelectorAll('.btn-custom');

    buttons.forEach(function(button) {
        button.addEventListener('click', function(event) {
            var startDate = new Date(button.getAttribute('data-start'));
            var endDate = new Date(button.getAttribute('data-end'));
            var currentDate = new Date();

            if (currentDate < startDate || currentDate > endDate) {
                event.preventDefault(); // 링크 이동을 막음
                Swal.fire({
                    title: '알림',
                    text: '현재 날짜와 시간은 화상 면접장 입장 가능한 기간이 아닙니다.',
                    icon: 'warning',
                    confirmButtonText: '확인'
                });
            }
        });
    });
});

$(function() {
    var searchForm = $("#searchForm");
    var pagingArea = $("#pagingArea");

    pagingArea.on("click", "a", function(event) {
        event.preventDefault();
        var pageNo = $(this).data("page");
        console.log(pageNo);
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
        Swal.fire({
            title: '정말로 삭제하시겠습니까?',
            text: "이 작업은 되돌릴 수 없습니다!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: '예',
            cancelButtonText: '아니요'
        }).then((result) => {
            if (result.isConfirmed) {
                $("#bbsNo").val(bbsNo);
                $("#editdelForm").submit(); // 폼 제출
            } else if (result.dismiss === Swal.DismissReason.cancel) {
                Swal.fire(
                    '취소됨',
                    '삭제 작업이 취소되었습니다.',
                    'error'
                );
            }
        });
    });
});

function moveTestPage(strt, end, ctNo, processSeq, eachOrder) {
    const now = new Date();
    const strtTime = new Date(strt);
    const endTime = new Date(end);

    if (endTime < now) {
        Swal.fire({
            title: '알림',
            text: '이미 종료된 시험입니다',
            icon: 'error',
            confirmButtonText: '확인'
        });
        return;
    }

    Swal.fire({
        title: '시험 페이지로 이동합니다',
        text: "시험 페이지로 이동하시겠습니까?",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: '예',
        cancelButtonText: '아니요'
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = "/codingtest/entTestList.do?entCodingtestNo=" + ctNo + "&processSeq=" + processSeq + "&eachOrder=" + eachOrder;
        }
    });
}


</script>