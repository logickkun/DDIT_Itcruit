<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
<script src="https://mozilla.github.io/pdf.js/build/pdf.js"></script>
<style>
.logo-container img {
    width: 100%;         /* 컨테이너 너비에 맞춤 */
    height: 150px;       /* 고정 높이 설정 */
    object-fit: contain; /* 비율을 유지하면서 요소에 맞춤 */
    display: block;      /* 블록 레벨 요소로 표시 */
    margin: 0 auto;      /* 중앙 정렬 */
}

</style>
<!-- Page main content START -->
<div class="page-content-wrapper border">
    <!-- Title -->
    <sec:authorize access="isAuthenticated()">
   		<sec:authentication property="principal.account.accountId" var="aId"/>
	</sec:authorize>
    <div class="row mb-3">
        <div class="col-12 d-sm-flex justify-content-between align-items-center">
            <h1 class="h5 mb-2 mb-sm-0">관심기업</h1>
        </div>
    </div>

    <!-- Courses Row START -->
    <div class="row g-4">
        <!-- Course information START -->
        <div class="col-lg-6">
            <div class="card bg-transparent border rounded-3 h-100">
                <div class="card-header bg-light border-bottom">
                    <h5 class="h6 card-header-title">기업 목록</h5>
                </div>
                					<!-- Card body START -->
					<div class="card-body pb-0">
						<!-- Table START -->
						<div class="table-responsive border-0">
							<c:set value="${likeEntPagingVO.dataList }" var="entList"/>
							<table class="table align-middle p-4 mb-0 table-hover" style="text-align: center;">
								<thead style="background-color: black;">
									<tr>
										<th scope="col" class="col-4 rounded-start" style="color: white;">기업명</th> <!-- 폭 줄임 -->
										<th scope="col" class="col-4" style="color: white;">채용공고</th> <!-- 폭 줄임 -->
										<th scope="col" class="col-4 rounded-end" style="color: white;">관심기업 해제</th> <!-- 폭 줄임 -->
									</tr>
								</thead>
								<c:choose>
								<c:when test="${empty entList }">
									<tr>
										<td colspan='4'> <span>관심 기업이 등록되지 않았습니다</span> </td>
									</tr>
								</c:when>
								<c:otherwise>
									<tbody>
										<c:forEach items="${entList }" var="entList">
											<!-- Table row -->
											<tr>
												<!-- Table data -->
												<td style="text-align: start;">
													<a href="#" class="selectEnt" data-entno=${entList.entNo } style="color: gray; text-decoration: none;" onmouseover="this.style.color='#3399FF';" onmouseout="this.style.color='gray';">
														<span style="font-weight: bold; padding-left: 6px; color: black;"> ${entList.entNm } </span>
													</a>
												</td>
												<!-- Table data -->
												<td> <span style="font-weight: bold; color: black;"> ${entList.recruitCount } 개 진행중</span></td>
												<!-- Table data -->
												<td>
													<button class="btn btn-sm btn-danger mb-0 deleteBtn"
														data-entno=${entList.entNo }>해제</button>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</c:otherwise>
							</c:choose>
							</table>
						</div>
						<!-- Table END -->
						<form method="post" id="likeEntListForm">
							<input type="hidden" id="likeEntListPage" name="likeEntListPage">
							<sec:csrfInput/>
						</form>
						<div id="likeEntListPagingArea" class="d-sm-flex justify-content-sm-between align-items-sm-center mt-1 mt-sm-0">
						<p class="mb-0 text-center text-sm-start"></p>
						${likeEntPagingVO.pagingHTML }
						</div>
					</div>
					<!-- Card body END -->
            </div>
        </div>
        <!-- Course information START -->
        <div class="col-lg-6">
            <div class="card bg-transparent border rounded-3 h-100">
                <div class="card-header bg-light border-bottom">
                    <h5 class="h6 card-header-title">공고 정보</h5>
                </div>
                <div class="card-body">
                    <div class="row g-4">
						<div id="imgClass" class="">
						    <a id="detail">
						        <img id="entImg" src="#" class="rounded" alt="">
						    </a>
						</div>
                    </div>
                    <br>
					<div class="card-body pb-0">
						<!-- Table START -->
						<div class="table-responsive border-0">
							<table class="table align-middle p-4 mb-0 table-hover" id="recruitTable">
								
										<tbody>
										<tr id="emptyRecruit">
											
										</tr>
												
											
										</tbody>
							</table>
						</div>
						<!-- Table END -->
<!-- 						<form method="post" id="likeEntListForm"> -->
<!-- 							<input type="hidden" id="likeEntListPage" name="likeEntListPage"> -->
<%-- 							<sec:csrfInput /> --%>
<!-- 						</form> -->
<!-- 						<div id="likeEntListPagingArea" -->
<!-- 							class="d-sm-flex justify-content-sm-between align-items-sm-center mt-1 mt-sm-0"> -->
<!-- 							<p class="mb-0 text-center text-sm-start"></p> -->
<%-- 							${likeEntPagingVO.pagingHTML } --%>
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					Card body END -->


				</div>
            </div>
        </div>
        <!-- Course information END -->
    </div>
    <!-- Courses Row END -->
</div>








		<!-- 이력서 모달 -->
        <div class="modal fade twm-saved-jobs-view" id="resumeView" aria-hidden="true" aria-labelledby="saved_job_view" tabindex="-1">
	
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <form>
    
                        <div class="modal-header">
<!--                             <h2 class="modal-title" id="saved_job_view">ITcruit</h2> -->
                            <h5>이력서를 선택해주세요.</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
    
                        <div class="modal-body" id="resumeModalBody">
                            
                        </div>
    
                        <div class="modal-footer">
                            <button type="button" class="btn btn-info site-button" data-bs-dismiss="modal">확인</button>
                        </div>
    
                    </form>
                </div>
            </div>
            
        </div>
        <form id="resumeForm" action="/resume/registerView" method="post">
        	<input type="hidden" name="accounId" id="accountId" value="${aId }">
        <sec:csrfInput/>
        </form>
	
	<div class="modal fade" id="pdfModal" tabindex="-1" role="dialog" aria-labelledby="pdfModalLabel" aria-hidden="true">
	    <div class="modal-dialog modal-xl" role="document"> <!-- 크기를 'modal-xl'로 설정 -->
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="pdfModalLabel">PDF Viewer</h5>
	               <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <div class="modal-body">
	                <iframe id="pdfViewer" style="width:100%; height:800px;"></iframe> <!-- 높이를 증가 -->
	            </div>
	        </div>
	    </div>
	</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.6.347/pdf.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.23/jspdf.plugin.autotable.min.js"></script>
<script type="text/javascript">
const { jsPDF } = window.jspdf;
$(function(){
	
	
	var likeEntListPagingArea = $("#likeEntListPagingArea");
	var likeEntListForm = $("#likeEntListForm");
	
	likeEntListPagingArea.on("click", "a" ,function(e){
		e.preventDefault();
		var likeEntListPagingNo = $(this).data("recruitminipage");
		likeEntListForm.find("#likeEntListPage").val(likeEntListPagingNo);
		likeEntListForm.submit();
	})
	
	
	$('.deleteBtn').on("click",function(){
		
		var entNo = $(this).data("entno")
		
		var deleteBtn = $(this);
		
		console.log(entNo);
		
		Swal.fire({
			title: "관심 기업를 해지하시겠습니까?",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '확인',
            cancelButtonText: '취소',
            reverseButtons: false
		}).then((result) => {
			if(result.value){
				$.ajax({
					url : "/myPage/member/deleteEnt.do",
					type : "post",
					data : {
						entNo : entNo 
					},
					beforeSend : function(xhr){
						xhr.setRequestHeader(header,token);
					},
					success : function(res){
						deleteBtn.closest("tr").remove();
					}
					
				});
			}
		})
	});

	

		
		

	
	$(".selectEnt").on("click",function(e){
		e.preventDefault();
		
		var entNo = $(this).data("entno");
		
		console.log(entNo);

		
		$.ajax({
			url : "/myPage/member/likeEntRecruit.do",
			type : "post",
			data : {
				entNo : entNo
			},
			beforeSend : function(xhr){
				xhr.setRequestHeader(header,token);
			},
			 success: function(res) {
		            if (res && res.length > 0) {
		                console.log(res[0].entNo);
		                
		                // 이미지 소스와 링크 업데이트
		                $("#imgClass").addClass("logo-container");
		                $("#imgClass").removeClass("col-md-6");
		                $("#detail").attr("href", "/ent/detail.do?entNo=" + res[0].entNo);
		                $("#entImg").attr("src", "/main/logodisplay?entNo=" + res[0].entNo);

		                // 기존 테이블 데이터 삭제
		                $("#recruitTable tbody").empty();

		                // 테이블에 새로운 데이터 추가
		                res.forEach(function(item) {
		                    console.log(item.recruitTtl);
		                    var row = '<tr>';
		                    row += '<td style="text-align: start;"><a href="/main/recruitDetail.do?recruitNo=' + item.recruitNo + '&pstnCmmncdNm=' + item.pstnCmmncdNm + '"';
		                    row += ' class="recruitTtl" style="color: gray; text-decoration: none;"';
		                    row += ' onmouseover="this.style.color=\'#3399FF\';" onmouseout="this.style.color=\'gray\';">';
		                    row += '<span style="font-weight: bold;">' + item.recruitTtl + '</span></a></td>';
		                    row += '<td>';
		                    row += '<button class="btn btn-sm mb-0 recruitBtn" style="background-color: black; color: white;"';
		                    row += ' data-recruitno="' + item.recruitNo + '" data-pstncmmncdnm="' + item.pstnCmmncdNm + '"><span style="font-weight: bold;">공고 지원 </span></button>';
		                    row += '</td>';
		                    row += '</tr>';

		                    $("#recruitTable tbody").append(row);
		                });
		            } else {
		                // 데이터가 없을 경우 이미지와 링크 제거 및 메시지 출력
		                $("#detail").attr("href", "#");
		                $("#entImg").attr("src", "");
		                
		                $("#imgClass").removeClass("logo-container");
		                $("#imgClass").addClass("col-md-6");
		                
		                $("#recruitTable tbody").html('<tr id="emptyRecruit"><td colspan="4"><span>채용 공고가 등록되지 않았습니다</span></td></tr>');
		            }
		        },
		        error: function(xhr, status, error) {
		            console.error("Error: " + error);
		            $("#recruitTable tbody").html('<tr><td colspan="4">데이터를 불러오는 중 오류가 발생했습니다.</td></tr>');
		            $("#entImg").attr("src", ""); // 에러가 발생했을 때 이미지 제거
		        }
				
		});
		
		
		
		
		
		
		
		
		
		
		
		
// 		$.ajax({
// 			type : "post",
// 			url : "/ent/modalDetail.do",
// 			data : {
// 				entNo : entNo
// 			},
//             beforeSend: function(xhr) {
//                 xhr.setRequestHeader(header, token);
//             },
// 			success : function(res) {
// 				console.log(res);
				
// 				console.log("ㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㅇㅁㄴㅇㅁㅇㅁㄴㅇㅁㄴㅇ");

// 				$("#entNo").val(res.entVO.entNo);
// 				$("#entImg").attr("src", "/main/logodisplay?entNo=" + res.entVO.entNo);
// 				$("#detail").attr("href","/ent/detail.do?entNo=" + res.entVO.entNo);

				
				
// 				$("#tksdjq").text("산업");
// 				$("#rldjqrnqns").text("기업구분");
// 				$("#wkqhsrma").text("자본금");
// 				$("#eovy").text("대표");
// 				$("#tkdnjstn").text("사원수");
// 				$("#tjfflqdlf").text("설립일");
// 				$("#wjssusaocnf").text("전년매출");
// 				$("#wnth").text("주소");
				
				
				
// 				$("#ksicNm").text(res.entVO.ksicNm); // 산업	
// 		        $("#entCnt").text(res.entVO.empCnt + " 명"); // 사원수
// 		        $("#bizTypeNm").text(res.entVO.bizTypeNm); // 기업구분
		     	
// 		        // 날짜 문자열 추출
// 		        var dateString = res.entVO.fndnYr;

// 		        // 날짜 형식으로 변환
// 		        var dateObject = new Date(dateString.substring(0, 4), // 연도
// 		                                  dateString.substring(4, 6) - 1, // 월 (0부터 시작하므로 -1)
// 		                                  dateString.substring(6, 8)); // 일

// 		        // 날짜를 원하는 형식으로 형식화
// 		        var formattedDate = dateObject.getFullYear() + '-' + ('0' + (dateObject.getMonth() + 1)).slice(-2) + '-' + ('0' + dateObject.getDate()).slice(-2);

// 		        // 결과를 출력
// 		        $("#fndnYr").text(formattedDate);
		        
// 		        // 3자리마다 ,를 찍기위한 작업
// 		        var number = res.entVO.cptl; // 자본금
// 		        var cptl = number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","); 
// 		        $("#cptl").text(cptl + " 원");
		        
// 		        var number1 = res.entVO.entSlsAmt;
// 		        var entSlsAmt = number1.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
// 		        $("#entSlsAmt").text(entSlsAmt + " 원"); // 전년매출
// 		        $("#rprsvNm").text(res.entVO.rprsvNm); // 대표
// 		        $("#address").text(res.entVO.accountAddr1 +  res.entVO.accountAddr2); // 주소
// 			}
// 		})


	});
	

});


$(document).on("click", ".recruitBtn", function() {
    console.log("버튼 클릭됨.");
    
    var accountId = $("#accountId").val();
    var recruitNo = $(this).data("recruitno");
    var pstnCmmncdNm = $(this).data("pstncmmncdnm");

    console.log(accountId);
    console.log("공고 번호:", recruitNo, "포지션 코드:", pstnCmmncdNm);

    var obj = {
        	accountId : accountId,
        	recruitNo : recruitNo,
        	pstnCmmncdNm : pstnCmmncdNm
        }
    	
        $.ajax({
        	type : "post",
        	url : "/like/apply.do",
        	contentType : "application/json; charset=utf-8",
        	data : JSON.stringify(obj),
        	beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
            },
            success : function(result){
//             	console.log(result);
//             	console.log(result.resumeList);
//             	console.log(result.recruit);
            	
            	
            	var resumeList = result.resumeList;
            	var recruit = result.recruit;
            	
            	var processYn = recruit.processYn;
            	var entUrl = recruit.entUrl;
            	var resumeCheck = recruit.resumeCheck;
            	var applicantCheck = recruit.applicantCheck;
//             	console.log(processYn);
//             	console.log(entUrl);
//             	console.log(resumeCheck);
//             	console.log(applicantCheck);


// 				// 지원내역  확인
				if(applicantCheck == 'Y'){
					Swal.fire(
			      			  '지원내역이 있습니다.'
			      			)
					return;
				}else{
					// 이력서 확인
					if(resumeCheck == 'N'){
						Swal.fire({
							  title: '이력서 미작성 회원입니다. 이동하시겠습니까?',
							  icon: 'warning',
							  showCancelButton: true,
							  confirmButtonText: '확인',
							  cancelButtonText: '취소'
							}).then((result) => {
							  if (result.isConfirmed) {
							    // 확인 버튼을 클릭한 경우
								   $("#resumeForm").submit();
							  } else {
							    // 취소 버튼을 클릭한 경우
							    return;
							  }
							});
					}else{
						
						
						var modalBody = $('#resumeView .modal-body');
						modalBody.empty(); // 모달 내용 초기화
						
// 				        var rsmNo = resume.rsmNo;
// 				        var accountId = resume.accountId;
// 				        var rsmGender = resume.rsmGender;
// 				        var rsmTtl = resume.rsmTtl;
// 				        var rsmCareerYear = resume.rsmCareerYear;
// 				        var rsmRlsYn = resume.rsmRlsYn;
// 				        var rsmPhoto = resume.rsmPhoto;
// 				        var rsmIntroduction = resume.rsmIntroduction;
// 				        var eduEnd = resume.eduEnd;
// 				        var eduNm = resume.eduNm;
// 				        var grade = resume.grade;
// 				        var full = resume.full;
// 				        var rsmMjrNm = resume.rsmMjrNm;
// 				        var rsmMjrCd = resume.rsmMjrCd;
// 				        var rsmNewCareer = resume.rsmNewCareer;
// 				        var eduAcdmcr = resume.eduAcdmcr;

		                // 테이블 생성
						var table = $('<table class="table"><thead><tr><th></th><th>번호</th><th style="padding-left: 57px;">이름</th><th>보기</th></tr></thead><tbody></tbody></table>');
						modalBody.append(table);
						var tbody = table.find('tbody');
						console.log("resumeList");
						console.log(resumeList);
						$.each(resumeList, function(index, resume) {
							var row = $('<tr>' +
					                  '<td><input class="form-check-input resume-checkbox" type="checkbox" value="' + resume.rsmNo + '" id="resumeCheckbox' + index + '"></td>' +
					                  '<td>' + (index + 1) + '번</td>' +
					                  '<td style="cursor: pointer;" onclick="location.href=\'/resume/updateView?rsmNo='+ resume.rsmNo +'\'">' + resume.rsmTtl + '</td>' +
					                  '<td style="cursor: pointer;"><i class="bi bi-search resume-view-icon" data-rsm-no="' + resume.rsmNo + '"></i></td>' +
					              '</tr>');
					    	tbody.append(row);
						
						    // 체크박스 클릭 이벤트 처리
						    row.find('.resume-checkbox').on('change', function() {
						        if ($(this).is(':checked')) {
// 						        	console.log(resume.rsmNo);
						        	var rsmNo = resume.rsmNo;
// 						            resumePdf(rsmNo);
						            
						            // 다른 체크박스들의 체크를 해제
						            $('.resume-checkbox').not(this).prop('checked', false);
						
						            // 선택된 이력서의 소개를 보여주는 div 생성
// 						            var introductionDiv = $('<div class="resume-introduction">' +
// 						                                        '<h4>' + resume.rsmTtl + '</h4>' +
// // 						                                        '<p>' + resumePdf(rsmNo) + '</p>' +
// 						                                    '</div>');
// 						            var pdfViewer = $('<iframe id="pdfViewer" style="width:100%; height:800px;" src="' + resumePdf(rsmNo) + '"></iframe>');

// 						         	// iframe을 introductionDiv 안에 추가
// 						         	introductionDiv.append(pdfViewer);
						         	// 기존에 선택된 이력서 내용이 있다면 삭제
						            $('.resume-introduction').remove();
// 						            modalBody.append(introductionDiv);
						        } else {
						            // 선택 해제된 경우 해당 이력서의 소개를 보여주는 div 제거
						            $('.resume-introduction').remove();
						        }
						        
						        
						    });
					        // 돋보기 누르면 모달로 이력서 pdf 추가
					        modalBody.find('table').on('click', '.resume-view-icon', function() {
					            var rsmNo = $(this).data('rsm-no');
					            console.log('Clicked resume number:', rsmNo);
					            resumePdf(rsmNo);
					        });
						});
		                
		                // 이력서 선택 모달 열기
		                $('#resumeView').modal('show');
		                
		                
		             	// 모달이 닫힐 때 한 번만 실행되는 이벤트 핸들러
		                $('.site-button').on('click', function () {
		                    // 선택한 이력서 정보를 담을 배열
		                    var selectedResumes = [];
		                    // 선택된 체크박스의 값을 배열에 추가
		                    $('.resume-checkbox:checked').each(function () {
		                        selectedResumes.push($(this).val());
		                    });

		                 	// 선택된 이력서가 없는 경우
		                    if (selectedResumes.length === 0) {
		                        return; // 함수 종료
		                    }
		                    
							var rsmNo = selectedResumes[0];
// 							console.log(rsmNo);
		                    
							// 이력서번호 포함해서 다시 보내기
							var obj = {
									rsmNo: rsmNo,
							        accountId: accountId,
							        recruitNo: recruitNo,
							        pstnCmmncdNm: pstnCmmncdNm
							    };
							
							
							 $.ajax({
						        	type : "post",
						        	url : "/like/applyInsert.do",
						        	contentType : "application/json; charset=utf-8",
						        	data : JSON.stringify(obj),
						        	beforeSend: function(xhr) {
						                xhr.setRequestHeader(header, token);
						            },
						            success : function(result){
// 						            	console.log(result);
						            	
						            	// 프로세스 확인
										if(processYn == "Y"){
						            		location.href = "/main/introForm.do?recruitNo=" + recruitNo + "&pstnCmmncdNm=" + pstnCmmncdNm;
						            	}else{
						            		if (!entUrl.startsWith("http://") && !entUrl.startsWith("https://")) {
						            	        // 상대 URL인 경우, 절대 URL로 변환
						            	        entUrl = "http://" + entUrl;
						            	    }
						            	    window.open(entUrl, "_blank");
						            	}
						            }
						            
							 });
							 
							
		                });
		                
						
					}

				}
            }          
        });
    
    
});
function resumePdf(rsmNo){
	console.log("!!#@#");
	console.log(rsmNo);
	$.ajax({
		
		url : "/myPage/enterprise/getResumePdf",
		method : "GET",
		data : {rsmNo : rsmNo},
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
        },
		success : function(res) {
			
			console.log(res);
			
			
			var sex;
			
			if(res.resume.gender == "M"){
				sex = "남자";
			}else{
				sex = "여자";
			}
			////
			var date = new Date(res.resume.birthYmd);
			var year = date.getFullYear();
			var month = date.getMonth() + 1;
			var day = date.getDate();

			month = month < 10 ? "0" + month : month;
			day = day < 10 ? "0" + day : day;

			var formatDate = year + "/" + month + "/" + day;
			
			////
			var careers = JSON.parse(res.career);
			var formatCareers = careers.map(function(career) {
			    var resignationDate = career.careerRsgntnYm === "0000/00" ? "재직중" : career.careerRsgntnYm;
			
			    return [
			        career.careerJncmpYm + " ~ " + resignationDate,
			        career.careerCoNm, 
			        career.careerJbgdNm, 
			        career.careerTkcgTaskNm 
			    ];
			}).slice(0,3);
			
			while (formatCareers.length < 3) {
				formatCareers.push(["", "", "", ""]);
			}
			
			console.log(formatCareers);
			////////////////////////
			var availLangs = JSON.parse(res.availLang);
			var langNames = availLangs.map(function(lang) {
			    return lang.availLangCmmncdNm;
			}).join(", ");

			console.log(langNames);
			/////////////////////////
			var portfolios = JSON.parse(res.portfolio);
			
			var formatPortfolios = portfolios.map(function(portfolio) {
			    return [portfolio.portUrlTtl, portfolio.portUrl];
			});
			
			while (formatPortfolios.length < 3) {
				formatPortfolios.push(["", ""]);
			}
			
			console.log(formatPortfolios);
			//////////////////
			var certificates = JSON.parse(res.certificate);
			var formatCertificates = certificates.map(function(certificate) {
			    return [
			        certificate.crtfctQlfcAcqsYm,
			        certificate.crtfctNm,
			        certificate.crtfctPblcnInstNm
			    ];
			});
			
			while (formatCertificates.length < 4) {
				formatCertificates.push(["", "", ""]);
			}
			
			console.log(formatCertificates);
			////////////////////////////
			var experiences = JSON.parse(res.experience);
			
			var formatExperiences = experiences.map(function(experience) {
			    var period = experience.experBgngYm + " ~ " + experience.experEndYm;
			    return [
			        period,
			        experience.experNm,
			        experience.experCoNm ,
			        experience.experCn
			    ];
			});
			
			while (formatExperiences.length < 4) {
				formatExperiences.push(["", "", "", ""]);
			}
			
			console.log(formatExperiences);
			////////
			
			var doc = new jsPDF("p", "mm", "a4");
			var font = res.font; 
			var fontBold = res.fontBold;

			// 일반 및 볼드 폰트 추가
			doc.addFileToVFS("malgun.ttf", font);
			doc.addFont("malgun.ttf", "malgun", "normal");

			doc.addFileToVFS("malgunbd.ttf", fontBold);
			doc.addFont("malgunbd.ttf", "malgun", "bold");

			doc.setFont("malgun");

			doc.setFontSize(18);
			doc.text("이력서", 105, 20, { align: "center" });

			doc.setTextColor(100, 100, 100);
			doc.line(10, 25, 200, 25);  

			doc.setTextColor(0, 0, 0); 
			doc.addImage(res.photo, 'JPEG', 15, 30, 40, 45); 

			doc.setFontSize(11);
			doc.text("이름 : ", 65, 35);
			doc.text("연락처 : ", 65, 45);
			doc.text("이메일 : ", 65, 55);
			doc.text("주소 : ", 65, 65);

			doc.text("성별 : ", 145, 35);
			doc.text("생년월일 : ", 145, 45);
			doc.text("경력 : ", 145, 55);

			doc.text(res.resume.accountNm, 80, 35);
			doc.text(res.resume.accountTell, 80, 45);
			doc.text(res.resume.accountMail, 80, 55);
			doc.text(res.resume.accountAddr1, 80, 65);
			doc.text(sex, 155, 35);
			doc.text(formatDate, 165, 45);
			doc.text(res.education.rsmCareerYear.toString()+"년", 155, 55);
			

			doc.setFontSize(17);
			doc.text("학력사항", 15, 85, { align: 'left' });

			doc.setDrawColor(0);
			doc.setLineWidth(0.5);

			doc.setFontSize(14);
			doc.autoTable({
				head: [['졸 업 년 월', '학 교 명', '전 공 / 분 야', '학 점']],
			    body: [
			    	[res.education.eduEnd, res.education.eduNm, res.education.rsmMjrNm, res.education.grade],
			    ],
			    startY: 90,
			    theme: 'grid',
			    styles: { font: 'malgun', lineColor: [0, 0, 0], lineWidth: 0.5, minRowHeight: 20},
			    headStyles: {
			        fillColor: [220, 220, 220],
			        textColor: [0, 0, 0],
			        fontStyle: 'bold' // 볼드 스타일 적용
			    },
			    bodyStyles: { minRowHeight: 30 }
			});

			doc.setFontSize(17);
			doc.text("경력사항", 15, 120, { align: 'left' });
			doc.autoTable({
			    head: [['기 간', '근 무 처', '직 위', '업 무 내 용']],
			    body: formatCareers,
			    startY: 125,
			    theme: 'grid',
			    styles: { font: 'malgun', lineColor: [0, 0, 0], lineWidth: 0.5 },
			    headStyles: {
			        fillColor: [220, 220, 220],
			        textColor: [0, 0, 0],
			        fontStyle: 'bold' // 볼드 스타일 적용
			    },
			    bodyStyles: { minRowHeight: 12 }
			});

			doc.setFontSize(17);
			doc.text("경험(인턴, 대외활동, 아르바이트)", 15, 170, { align: 'left' });
			doc.autoTable({
				head: [['기 간', '제 목', '회 사 명', '내 용']],
			    body: formatExperiences,
			    startY: 175,
			    theme: 'grid',
			    styles: { font: 'malgun', lineColor: [0, 0, 0], lineWidth: 0.5 },
			    headStyles: {
			        fillColor: [220, 220, 220],
			        textColor: [0, 0, 0],
			        fontStyle: 'bold'
			    },
			    bodyStyles: { minRowHeight: 15 }
			});
			
			doc.text("자격증", 15, 225, { align: 'left' });
			doc.autoTable({
			    head: [['취 득 년 월 일', '자 격 / 면 허 증', '시 행 처']],
			    body: formatCertificates,
			    startY: 230,
			    theme: 'grid',
			    styles: { font: 'malgun', lineColor: [0, 0, 0], lineWidth: 0.5 },
			    headStyles: {
			        fillColor: [220, 220, 220],
			        textColor: [0, 0, 0],
			        fontStyle: 'bold' // 볼드 스타일 적용
			    },
			    bodyStyles: { minRowHeight: 15 }
			});

			doc.setTextColor(100, 100, 100);
			doc.line(10, 287, 200, 287);

	        
			doc.addPage();
			doc.setPage(2);
			doc.setFontSize(17);
			doc.text("포트폴리오", 15, 20, { align: 'left' });
			doc.autoTable({
			    head: [['이 름', 'URL']],
			    body: formatPortfolios,
			    startY: 25,
			    theme: 'grid',
			    styles: { font: 'malgun', lineColor: [0, 0, 0], lineWidth: 0.5 },
			    headStyles: {
			        fillColor: [220, 220, 220],
			        textColor: [0, 0, 0],
			        fontStyle: 'bold' 
			    },
			    bodyStyles: { minRowHeight: 15 }
			});
			
			doc.setFontSize(17);
			doc.text("보유기술", 15, 75, { align: 'left' });
			doc.autoTable({
			    head: [['사 용 언 어']],
			    body: [
			        [langNames]
			    ],
			    startY: 80,
			    theme: 'grid',
			    styles: { font: 'malgun', lineColor: [0, 0, 0], lineWidth: 0.5 },
			    headStyles: {
			        fillColor: [220, 220, 220],
			        textColor: [0, 0, 0],
			        fontStyle: 'bold' 
			    },
			    bodyStyles: { minRowHeight: 15 }
			});

			doc.setTextColor(100, 100, 100);
			doc.line(10, 287, 200, 287);
			
            const pdfBlob = doc.output('blob');
            const blobUrl = URL.createObjectURL(pdfBlob);

            document.getElementById('pdfViewer').src = '/resources/pdfjs-4.2.67-dist/web/viewer.html?file=' + encodeURIComponent(blobUrl) + '#zoom=page-fit';
            $('#pdfModal').modal('show'); // Bootstrap 모달을 표시
		}
	});
}
</script>