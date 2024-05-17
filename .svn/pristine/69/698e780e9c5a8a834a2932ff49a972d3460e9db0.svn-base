<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
<script src="https://mozilla.github.io/pdf.js/build/pdf.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<style>

/* 	.table > :not(caption) > * > * { */
/*     	padding: 1rem 4rem; */
/* 	} */


	.table td {
    white-space: nowrap;
	}
	
</style>
<div class="page-content-wrapper border">

		<!-- Title -->
		<div class="row">
			<div class="col-12">
				<h1 class="h5 mb-2 mb-sm-0">인재 검색</h1>
			</div>
		</div>
			
		<div class="card bg-transparent">

			<!-- Card header START -->
			<div class="card-header bg-transparent border-bottom px-0">
				<!-- Search and select START -->
				<div class="row g-3 align-items-center justify-content-between">

					<div class="col-md-8">
<!-- 					carrer local pstnCmmncdNm availLangCmmncdNm -->
						<form class="rounded position-relative" action="/myPage/enterprise/searchTalent.do" method="post" >
							<div class="input-group">
								<!-- <input class="form-control bg-transparent me-2 rounded-2 w-25" type="search" placeholder="Search" aria-label="Search"> -->
								<!-- Select Box 1 -->
								<select class="form-select me-2 rounded-2" aria-label="Select box 1"
								id="carrer" name="carrer">
<%-- 									<c:set var="scarrer" value="${option.scarrer }"/> --%>
									<option selected value="">경력여부</option>
									<option value="0">신입</option>
									<option value="1">경력</option>
								</select>
								<!-- Select Box 2 -->
<!-- 								//option langList pstnList -->
								<!-- option.langList option.pstnList 
										private List<String> langList; //언어 옵션 목록
										private List<String> pstnList;
								--> 
								<c:set var="langList" value="${option.langList }"/>
								<c:set var="pstnList" value="${option.pstnList }"/>
								<c:set var="lclList" value="${option.localList }"/>
								<c:set var="slang" value="${option.lang }"/>
								<c:set var="spstn" value="${option.pstn }"/>
								<c:set var="slcl" value="${option.lcl }"/>
								
								<select class="form-select me-2 rounded-2" aria-label="Select box 2" id="lang" name="lang">
									<option selected value="">언어</option>
									<c:forEach var="lang" items="${langList}">
										<option value="${lang }">${lang }</option>
<%-- 										<c:choose> --%>
<%-- 											<c:when test="${ }"> --%>
												
<%-- 											</c:when> --%>
<%-- 											<c:otherwise> --%>
<%-- 												 <option value="${lang }">${lang }</option> --%>
<%-- 											</c:otherwise> --%>
<%-- 										</c:choose> --%>
									   
									</c:forEach>	
									
								</select>
								<!-- Select Box 3 -->
								<select class="form-select me-2 rounded-2" aria-label="Select box 3" id="pstn" name="pstn">
									<option selected value="">분야</option>
									<c:forEach var="pstn" items="${pstnList}">
										<option value="${pstn }">${pstn }</option>
<%-- 									    <c:choose> --%>
<%-- 											<c:when test=""> --%>
											
<%-- 											</c:when> --%>
<%-- 											<c:otherwise> --%>
<%-- 												 <option value="${pstn }">${pstn }</option> --%>
<%-- 											</c:otherwise> --%>
<%-- 										</c:choose> --%>
									</c:forEach>	
								</select>
<!-- 								carrer lang pstn lcl -->
								<select class="form-select me-2 rounded-2" aria-label="Select box 3" id="lcl" name="lcl">
									<option selected value="">지역</option>
									<c:forEach var="lcl" items="${lclList}">
<%-- 										<c:choose> --%>
<%-- 											<c:when test=""> --%>
											
<%-- 											</c:when> --%>
<%-- 											<c:otherwise> --%>
<%-- 												 <option value="${lcl }">${lcl }</option> --%>
<%-- 											</c:otherwise> --%>
<%-- 										</c:choose> --%>
									    <option value="${lcl }">${lcl }</option>
									</c:forEach>
								</select>
								<button class="btn btn-outline-secondary rounded-2" type="submit">
									<i class="fas fa-search"></i>
								</button>
							</div>
							<sec:csrfInput/>
						</form>
					</div>
				
				</div>
				<!-- Search and select END -->
			</div>
			
			<c:set var="talentList" value="${talentList}"/>
			
			<!-- 이력서 조회 시작 -->
			<div class="card-body px-0">
				<!-- Tabs content START -->
				<div class="tab-content">
					<!-- Tabs content item START -->
					<div class="tab-pane fade show active" id="nav-html-tab-1">
						<div class="table-responsive border-0 rounded-3">
					<!-- Table START class="text-center" -->
					<table class="table table-dark-gray align-middle p-4 mb-0 text-center table-hover">
						<thead>
							<tr>
								<th scope="col" class="border-0 rounded-start text-center">이름</th>
								<th scope="col" class="border-0 text-center">경력</th>
								<th scope="col" class="border-0 text-center">언어</th>
								<th scope="col" class="border-0 text-center">직무</th>
								<th scope="col" class="border-0 text-center">주소</th>
<!-- 								<th scope="col" class="border-0 text-center">일치율</th> -->
								<th scope="col" class="border-0 rounded-end text-center">제안</th>
							</tr>
						</thead>
						<tbody>
						    
						    <c:choose>
						        <c:when test="${empty talentList}">
						            <tr>
						                <td colspan="7" class="table-hover text-center">원하는 인재 조건을 설정 후 검색해주세요</td>
						            </tr>
						        </c:when>
						        <c:otherwise>
						        
						        	<c:forEach var="talent" items="${talentList}">
									    <tr>
<!-- 							                <td class="text-center"> -->
<!-- 							                    <div class="d-flex align-items-center position-relative"> -->
<!-- 							                        <div class="mb-0 ms-3"> -->
<!-- 							                            <h6 class="mb-0" style="text-align: center;"> -->
<!-- 							                                <a href="#" class="stretched-link text-center" > -->
<%-- 							                                ${talent.accountNm}</a> --%>
<!-- 							                            </h6> -->
<!-- 							                        </div> -->
<!-- 							                    </div> -->
<!-- 							                </td> -->
<!-- 							availLangVOList rsmPositionVO -->
											<td>

												<a href="#" onclick="getResumePdf(${talent.rsmNo});"
												class="text-center" >

							                    ${talent.accountNm}</a>
							                </td>
							
							                <c:choose>
							                		<c:when test="${talent.rsmCareerYear eq 0}">
							                			<td>신입</td>
							                		</c:when>
								                	<c:otherwise>
								                		<td>${talent.rsmCareerYear}년</td>
								                	</c:otherwise>
							                </c:choose>
<!-- 							                slang -->
							                
							                <c:set var="langlist" value="${talent.availLangVOList}"/>
							                <c:choose>
							                	<c:when test="${empty slang}">
							                		<td>무관</td>
							                	</c:when>
								             <c:otherwise>
								                <c:forEach var="lang" items="${langlist}">
										            <c:if test="${lang.availLangCmmncdNm eq slang }">
										                <td>${lang.availLangCmmncdNm }</td>
										             </c:if>
										         </c:forEach>
								               </c:otherwise>
							                </c:choose>
							                
							                

<%-- 							                <td class="availLang">${talent.availLangCmmncdNm}</td> --%>
							                
							                <c:set var="pstnlist" value="${talent.rsmPositionVOList}"/>
							                <c:choose>
							                		<c:when test="${empty spstn}">
							                			<td class="availLang">무관</td>
							                		</c:when>
								                	<c:otherwise>
								                		<c:forEach var="pstn" items="${pstnlist}">
										                	<c:if test="${pstn.pstnCmmncdNm eq spstn }">
										                		<td class="availLang">${pstn.pstnCmmncdNm}</td>
										                	</c:if>
										                </c:forEach>
								                	</c:otherwise>
							                </c:choose>
							
							                <td>
							                    <div class="text-center">
							                        <div class="mb-0 ms-3">
							                            <span class="text-body small">
							                                <i class="fas fa-fw fa-map-marker-alt me-1 mt-1"></i>
															${talent.accountAddr1}
							                            </span>
							                        </div>
							                    </div>
							                </td>
							
<!-- 							                <td class="text-center text-sm-start"> -->
							                	
<%-- <%-- 							                	<c:set var="ratio" value="${(talent.select / talent.cnt) * 100}" /> --%> 
<%-- <%-- 												<fmt:formatNumber var="roundedRatio" value="${ratio}" pattern="#.#" /> --%> 
<!-- 							                    <div class="overflow-hidden"> -->
<!-- 							                        <h6 class="mb-0"></h6> -->
<!-- 							                        <div class="progress progress-sm bg-primary bg-opacity-10"> -->
<!-- 							                            <div class="progress-bar bg-primary aos" role="progressbar" data-aos="slide-right" data-aos-delay="200" data-aos-duration="1000" data-aos-easing="ease-in-out" style="width: 85%" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100"></div> -->
<!-- 							                        </div> -->
<!-- 							                    </div> -->
<!-- 							                </td> -->
							
							                <td>
							                	<input type="hidden" value="${talent.accountId}">
							                    <a href="javascript:void(0);" class="btn btn-light btn-round me-1 mb-1 mb-md-0 offerBtn">
							                        <i class="bi bi-envelope"></i>
							                    </a>
							                </td>
						            </tr>
									</c:forEach>	
						            
						        </c:otherwise>
						    </c:choose>
						</tbody>
						<!-- Table body END -->
					</table>
					<!-- Table END -->
				</div>
					</div>

				</div>
				
			</div>
			
			<!-- 이력서 조회 끝 -->

			
			<!-- Card footer START -->
<!-- 			<div class="card-footer bg-transparent pt-0 px-0"> -->
<!-- 				Pagination START -->
<!-- 				<div class="d-sm-flex justify-content-sm-between align-items-sm-center"> -->
<!-- 					Content -->
<!-- 					<p class="mb-0 text-center text-sm-start"></p> -->
<!-- 					Pagination -->
<!-- 					<nav class="d-flex justify-content-center mb-0" aria-label="navigation"> -->
<!-- 						<ul class="pagination pagination-sm pagination-primary-soft mb-0 pb-0 px-0"> -->
<!-- 							<li class="page-item mb-0"><a class="page-link" href="#" tabindex="-1"><i class="fas fa-angle-left"></i></a></li> -->
<!-- 							<li class="page-item mb-0"><a class="page-link" href="#">1</a></li> -->
<!-- 							<li class="page-item mb-0 active"><a class="page-link" href="#">2</a></li> -->
<!-- 							<li class="page-item mb-0"><a class="page-link" href="#">3</a></li> -->
<!-- 							<li class="page-item mb-0"><a class="page-link" href="#"><i class="fas fa-angle-right"></i></a></li> -->
<!-- 						</ul> -->
<!-- 					</nav> -->
<!-- 				</div> -->
<!-- 				Pagination END -->
<!-- 			</div> -->
			<!-- Card footer END -->
		</div>
	</div>
	
	
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
	
	
	
	<script>
		const { jsPDF } = window.jspdf;
		
		document.addEventListener("DOMContentLoaded", function() {
			
			var accountNm = "${sessionScope.SessionInfo.accountNm}";
			
		    document.querySelectorAll(".offerBtn").forEach(function(button) {
		    	
		        button.addEventListener("click", function() {
		        	
	            var entNm = "${sessionScope.SessionInfo.entNm}";
	            var accountId = this.closest("td").querySelector('input[type="hidden"]').value;
	            var availLang = this.closest("tr").querySelector(".availLang").innerText.trim();
	            console.log(availLang);
	            console.log(accountId);

	            
	    		Swal.fire({
		  			  title: '인재제안 하시겠습니까?',
		  		  showCancelButton: true,
		  		  confirmButtonText: '네',
		  		  cancelButtonText: '아니오'
			  		}).then((result) => {
			  		  if (result.isConfirmed) {
			  		    
			  		       var message = {
			  		               type: 'offerTalent', //카테고리
			  		               rcvrId: accountId, // 받는사람
			  		               sndrId: entNm, //보내는 사람 담당자 소속
			  		               availLang : availLang, //포지션
			  		               alramtime : new Date().toISOString()
			  	           };		
			  			    
			  		       wsAlarmServer.send(JSON.stringify(message));
			  		       
			  		    
			  		   	   $(this).closest("tr").remove();
			  		   	   
		  		        Swal.fire({
		  		            title: '제안하였습니다.',
		  		            icon: 'success',
		  		            confirmButtonText: '확인'
		  		        });
			  		  }
			  		});
		            
		        });
		    });
		});

		function getResumePdf(rsmNo){
			$.ajax({
				
				url : "/myPage/enterprise/getResumePdf",
				method : "GET",
				data : {rsmNo : rsmNo},
				beforeSend: function(xhr) {
		            xhr.setRequestHeader(header, token);
		        },
				success : function(res) {
					
//		 			console.log(JSON.parse(res.experience));
					console.log(res.education);
					////
					var photo;
					if(res.photo != null){
						photo = res.photo;
					}else{
						photo = "";
					}
					
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
					doc.addImage(photo, 'JPEG', 15, 30, 40, 45);  

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
					doc.text("학 력 사 항", 15, 85, { align: 'left' });

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
		            $('#pdfModal').modal('show'); 
				}
			});
		}
	
	</script>