<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script src="https://cdn.jsdelivr.net/npm/moment/min/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
    #course-pills-tab {
        display: flex;
        justify-content: center; /* 전체 탭 리스트를 중앙 정렬 */
        width: 100%;
    }
    .orderItem {
        flex: 1; /* 모든 nav-item에 동일한 공간 할당 */
        display: flex;
        justify-content: center; /* 내부 요소 수평 중앙 정렬 */
        align-items: center; /* 내부 요소 수직 중앙 정렬 */
    }
    .orderLink {
        width: 100%; /* 버튼이 nav-item의 전체 너비를 차지하도록 */
        text-align: center; /* 버튼 텍스트 중앙 정렬 */
    }
    .modal-content {
        border-radius: 12px;
        box-shadow: 0 8px 16px rgba(0,0,0,0.2);
    }
    
    .modal-header, .modal-footer {
        border-bottom: none;
        border-top: none;
    }
    .btn-close {
        background-color: transparent;
        border: none;
        outline: none;
        color: #aaa;
    }
    .modal-title {
        font-size: 20px;
        font-weight: 500;
    }
    .btn {
        border-radius: 30px;
        padding: 10px 20px;
    }
    .btn-primary {
        background-color: #007bff;
        border: none;
    }
    .btn-secondary {
        background-color: #6c757d;
        border: none;
    }
    .form-control {
        border-radius: 30px;
        border: 1px solid #ced4da;
    }
    .tab-pane {
    display: none; /* 모든 탭의 내용을 기본적으로 숨깁니다 */
	}
	
	.tab-pane.active {
	    display: block; /* 활성화된 탭의 내용만 보여줍니다 */
	}
</style>
    

<script>
	
	var recruitNo = "${apList[0].recruitNo}";
	var pstnCmmncdNm = "${apList[0].pstnCmmncdNm}";
	var indexOrderNumber = 0;
	var myModal;
	var dateSaved = false;
	var updateDateSeq = 0;
	var isEditing = false;
	var count = 0;
	
	//exmlModal
	var exmplModal;
	
	document.addEventListener("DOMContentLoaded", function(){
		
		var closeButton = document.getElementById("closeButton");
		var saveButton = document.getElementById("saveButton");

		myModal = new bootstrap.Modal(document.getElementById("dateModal"), {
	        backdrop: 'static',
	        keyboard: false
	    });
	    
	    $('#dateRange').daterangepicker({
	        locale: {
	            format: 'YYYY-MM-DD HH:mm'
	        },
	        minDate: moment(),
	        maxDate: moment().add(30, 'days'),
	        timePicker: true,
	        timePicker24Hour: true,
	        timePickerIncrement: 15,
	    });

	    
	    closeButton.addEventListener("click", function(){
	    	
	        if (!dateSaved) {
	        	
	        	if(confirm("날짜를 작성하지 않았습니다 나가시겠습니까?")){
	        		
	        		myModal.hide();
	        	}
	            
			} else {
				
			  myModal.hide();
			  
			}
	    });
	    
	    saveButton.addEventListener("click", function(){
	    	
	    	submitDate(updateDateSeq);
	    	
	    })
	    
	    function submitDate(updateDateSeq) {
	    	
		    var dateRange = $('#dateRange').val();
		    console.log(dateRange);
		    $.ajax({
		      url: '/myPage/enterprise/saveDate',
		      type: 'POST',
		      contentType: "application/json; charset=utf-8",
		      data: JSON.stringify({ dateRange: dateRange, updateSeq : updateDateSeq }),
		      beforeSend: function(xhr) {
                  xhr.setRequestHeader(header, token);
              },
		      success: function(response) {
		    	
		    	if(response == "SUCCESS"){
		    		
			        dateSaved = true;
			        
			        Swal.fire({
			            title: '저장 완료!',
			            text: '날짜 저장이 완료되었습니다!',
			            icon: 'success',
			            confirmButtonText: '확인'
			        });

			        
			        myModal.hide();
			        location.reload();
		    		
		    	}else{
		    		
		    		Swal.fire({
		    		    title: '오류 발생!',
		    		    text: '날짜 저장에 실패하였습니다.',
		    		    icon: 'error',
		    		    confirmButtonText: '다음'
		    		}).then((result) => {
		    		    if (result.isConfirmed) {
		    		        Swal.fire({
		    		            title: '확인 필요',
		    		            text: '시작일과 종료일을 확인해주세요.',
		    		            icon: 'warning',
		    		            confirmButtonText: '확인'
		    		        });
		    		    }
		    		});
		    	}	    	  
		      }
		    });
	  	}
	    var orderClick = document.getElementById("course-pills-tab");
		orderClick.addEventListener("click", function(e){
			
			//프로세스 텍스트 추출. 서류 전형..Coding test..화상 면접...
			var text = e.target.innerText;
			var startIndex = text.indexOf("차") + 1;
			var endIndex = text.indexOf("(");
			var orderName = text.substring(startIndex, endIndex).trim();
			console.log(orderName);
			
			//프로세스 차수 추출. 1차.. 2차.. 3차..
			var orderNumber = e.target.innerText.split("차")[0].trim();
			
			
			if(orderName == "서류 전형"){
				
				getOrderContentByListName(recruitNo, pstnCmmncdNm, orderNumber);
				
			}else if(orderName == "Coding test"){
				
				console.log("Coding test")
				getCodingTestList(recruitNo, pstnCmmncdNm, orderNumber);
				
			}else if(orderName == "화상 면접"){
				
				console.log("화상 면접")
				getApplicantWebRtcDateSet(recruitNo, pstnCmmncdNm, orderNumber);	
			}
			
		});
		
	    

	    // 탭 클릭 자체를 막기 위한 이벤트 리스너
	    var orderClick = document.getElementById("v-pills-tab");
	    orderClick.addEventListener("click", function (e) {
	        if (isEditing) {
	            e.preventDefault(); // 기본 동작 취소
	            e.stopPropagation(); // 이벤트 전파 중단

	            Swal.fire({
	                title: '문항을 수정중입니다!',
	                text: '저장을 해주세요.',
	                icon: 'warning',
	                confirmButtonText: '확인'
	            });

	            return false; // 이벤트 핸들러 종료
	        }
	    });
	    
		init();
	});
	
	
	
	
	//첫번째 탭 활성화 함수
	function init() {
		
		var defaultTab = document.getElementById("course-pills-1");
		defaultTab.classList.add("show", "active");
		
		getOrderContentByListName(recruitNo, pstnCmmncdNm, 1);
		getTabList(recruitNo, pstnCmmncdNm);
		
	}
	
	
	//탭 리스트 활성화 함수
	function getTabList(recruitNo, pstnCmmncdNm) {
		
		var xhr = new XMLHttpRequest();
		
		xhr.open("GET", "getApplyProcessList?recruitNo="+encodeURIComponent(recruitNo)+"&pstnCmmncdNm="+encodeURIComponent(pstnCmmncdNm), true)
		
		xhr.onreadystatechange = function () {
			
			if(xhr.readyState === XMLHttpRequest.DONE){
				
				if(xhr.status === 200){
					var res = xhr.responseText;
					var parseRes = JSON.parse(res);
					
					console.log(parseRes);
					
					var orderListHTML = "";
					var orderIndex = 0;
					var flag = false;
					parseRes.forEach(function(list, index){
						
						console.log(list.strtYmd);
						console.log(list.prsntnYmd);
						
						if(index == 0){
							
							if(list.clsNm == "서류 전형"){
								
									orderListHTML += 
										'<li class="nav-item orderItem" data-index="'+ orderIndex +'" role="presentation">' +
							            	'<button class="nav-link mb-2 mb-md-0 orderLink active show" id="course-pills-tab-'+(index + 1)+'" data-bs-toggle="pill" data-bs-target="#course-pills-'+ 1 +'" type="button" role="tab" aria-controls="course-pills-'+(index + 1)+'" aria-selected="true">'+(index + 1)+'차 '+(list.clsNm)+ formatPeriod(list.strtYmd, list.prsntnYmd) + '</button>'+
							        	'</li>'	;
									orderIndex += 1;
								
								}else{
									
									orderListHTML += 
										'<li class="nav-item orderItem" role="presentation">' +
							            	'<button class="nav-link mb-2 mb-md-0 orderLink active show" id="course-pills-tab-'+(index + 1)+'" data-bs-toggle="pill" data-bs-target="#course-pills-'+ 1 +'" type="button" role="tab" aria-controls="course-pills-'+(index + 1)+'" aria-selected="true">'+(index + 1)+'차 '+(list.clsNm)+ formatPeriod(list.strtYmd, list.prsntnYmd) + '</button>'+
							        	'</li>'	;
									
								}			
							
							
						}else{
							
							if(list.clsNm == "Coding test"){
								orderListHTML += 
									'<li class="nav-item orderItem" data-index="'+ orderIndex +'" role="presentation">' +
						            	'<button class="nav-link mb-2 mb-md-0 orderLink" id="course-pills-tab-'+(index + 1)+'" data-bs-toggle="pill" data-bs-target="#course-pills-'+ 1 +'" type="button" role="tab" aria-controls="course-pills-'+(index + 1)+'" aria-selected="true">'+(index + 1)+'차 '+(list.clsNm)+ formatPeriod(list.strtYmd, list.prsntnYmd) + '</button>'+
						        	'</li>'	;
								orderIndex += 1;
								
							} 
							else{
								
								orderListHTML += 
									'<li class="nav-item orderItem" role="presentation">' +
						            	'<button class="nav-link mb-2 mb-md-0 orderLink" id="course-pills-tab-'+(index + 1)+'" data-bs-toggle="pill" data-bs-target="#course-pills-'+ 1 +'" type="button" role="tab" aria-controls="course-pills-'+(index + 1)+'" aria-selected="true">'+(index + 1)+'차 '+(list.clsNm)+ formatPeriod(list.strtYmd, list.prsntnYmd) + '</button>'+
						        	'</li>'	;
							}
							
						}
						
						
						
					});
					var orderList = document.querySelector(".orderList");
					orderList.insertAdjacentHTML("beforeend", orderListHTML);
					
				}else{
 					
					console.log("요청 실패");
				}
			}
		}
		xhr.send();
	}
	
	function formatPeriod(startDate, endDate) {
		
	    const epochDate = new Date(0);  

	    function isDefaultDate(date) {
	        return date.getTime() === epochDate.getTime();
	    }

	    const start = new Date(startDate);
	    const end = new Date(endDate);

	    if (isDefaultDate(start) || isDefaultDate(end)) {
	        return "(미정)";
	    }

	    const startMonth = start.getMonth() + 1;
	    const startDay = start.getDate();	
	    const endMonth = end.getMonth() + 1;
	    const endDay = end.getDate();

	    return " ("+startMonth + "월 " + startDay + "일 ~ " + endMonth + "월 " + endDay + "일" + ")";
	}
	
	
	///서류 전형 문항 개수 전역 변수.
	var documentScreeingCount = 0;
	
	//  탭 누르면 종목 변경되는 놈    
	function getOrderContentByListName(recruitNo, pstnCmmncdNm, orderNumber) {
	    var xhr = new XMLHttpRequest();
	    xhr.open("GET", "getQstnDSNCTList?recruitNo=" + encodeURIComponent(recruitNo) + "&pstnCmmncdNm=" + encodeURIComponent(pstnCmmncdNm) + "&orderNumber=" + encodeURIComponent(orderNumber), true);
	    xhr.onreadystatechange = function () {
	        if (xhr.readyState === XMLHttpRequest.DONE) {
	            if (xhr.status === 200) {
	                var res = xhr.responseText;
	                var parseRes = JSON.parse(res);
	                
	                ////////////////////////////////
	                console.log("문항 개수 : ", parseRes.length);
	                documentScreeingCount = parseRes.length;
	                /////////////////////////////////
	                
	                var codingTestBorder = document.getElementById("codingTestBorder");
	                
// 	                if (parseRes.length == 0) {
// 	                    Swal.fire({
// 	                        title: '목록이 없습니다!',
// 	                        text: '문항을 작성해 주세요!',
// 	                        icon: 'warning',
// 	                        confirmButtonText: '확인'
// 	                    });
// 	                }

	                var vpillstabHTML = "";
	                parseRes.forEach(function (res, index) {
	                    if (index === 0) {
	                        vpillstabHTML += '<a class="nav-link active" id="v-pills-home-tab-' + index + '" data-bs-toggle="pill" href="#v-' + (index + 1) + '" role="tab" aria-controls="v-pills-home" style="width: 100%;" aria-selected="true">' + (orderNumber == 1 ? '자기소개서 ' : '코딩테스트 ') + (index + 1) + ' 문항</a>';
	                    } else {
	                        vpillstabHTML += '<a class="nav-link" id="v-pills-home-tab-' + index + '" data-bs-toggle="pill" href="#v-' + (index + 1) + '" role="tab" aria-controls="v-pills-home" style="width: 100%;" aria-selected="false">' + (orderNumber == 1 ? '자기소개서 ' : '코딩테스트 ') + (index + 1) + ' 문항</a>';
	                    }
	                });
	
	                var vpillstabContentHTML = "";
	                parseRes.forEach(function (res, index) {
	                    if (index === 0) {
	                        vpillstabContentHTML += '<div class="tab-pane fade show active" id="v-' + (index + 1) + '" role="tabpanel" data-seq="' + res.entIntroQstnDsnctSeq + '" aria-labelledby="v-pills-home-tab-' + index + '">' + res.entIntroQstnCn + '</div>';
	                    } else {
	                        vpillstabContentHTML += '<div class="tab-pane fade" id="v-' + (index + 1) + '" role="tabpanel" data-seq="' + res.entIntroQstnDsnctSeq + '" aria-labelledby="v-pills-home-tab-' + index + '">' + res.entIntroQstnCn + '</div>';
	                    }
	                });
					
	                codingTestBorder.style.border = "1px solid";
	                codingTestBorder.style.padding = "20px";
	                var vpillstab = document.getElementById("v-pills-tab");
	                vpillstab.innerHTML = vpillstabHTML;
	
	                var vpillstabContent = document.getElementById("v-pills-tabContent");
	                vpillstabContent.innerHTML = vpillstabContentHTML;
	            }
	        }
	    };
	    xhr.send();
	}
	
	function getCodingTestList(recruitNo, pstnCmmncdNm, orderNumber) {
		
		var obj = {
				
				recruitNo : recruitNo,
				pstnCmmncdNm : pstnCmmncdNm,
				orderNumber : orderNumber
				
		}
		var params = new URLSearchParams(obj).toString();
		
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "getCodingTestList", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.setRequestHeader(header, token);
		xhr.onreadystatechange = function () {
			
			if (xhr.readyState === XMLHttpRequest.DONE) {
				
				if(xhr.status === 200) {
					var vpillstab = document.getElementById("v-pills-tab");
	                var vpillstabContent = document.getElementById("v-pills-tabContent");
	                var codingTestBorder = document.getElementById("codingTestBorder");
	                var res = xhr.responseText;
					var parseRes = JSON.parse(res);
					
					//////문항 개수/////
					console.log(parseRes.length);
					console.log(parseRes);
					//////문항 개수/////
				
					
					
					if(parseRes.length == 0) {
						
// 						Swal.fire({
// 	                        title: '문항이 없습니다!',
// 	                        text: '문항을  등록해주세요!',
// 	                        icon: 'warning',
// 	                        confirmButtonText: '확인'
//                     	})
						
					 	var vpillstabHTML = "";
		                var vpillstabContentHTML = "";
                        vpillstabHTML += '<a class="nav-link active" id="v-pills-home-tab-1" data-bs-toggle="pill" href="#v-2" role="tab" aria-controls="v-pills-home" style="width: 100%;" aria-selected="true">문항 없음</a>';
                		
                        vpillstabContentHTML += '<div class="tab-pane fade show active" id="v-2" role="tabpanel" data-seq=3" aria-labelledby="v-pills-home-tab-1">';
	                    vpillstabContentHTML +=       	
	                    						'<div class="row row-cols-2">' +
	                    						'<div class="mb-3 p-3 bg-light border">'+
	                    							'<strong>문제</strong>'+
	                    							'<div class="bg-white rounded-1 p-3 border" style="min-height: 100px;">문제가 존재하지않습니다.</div>'+
	                                                '<strong>제약사항</strong>'+
	                                                '<div class="bg-white rounded-1 p-3 border" style="min-height: 100px;">제약사항이 존재하지않습니다.</div>' +
	                                            '</div>'+
	                                            '<div class="mb-3 p-3 bg-light border">'+
	                                            	'<strong>문제 내용</strong>'+
	                                            	'<div class="bg-white rounded-1 p-3 border" style="min-height: 225px;">문제내용이 존재하지않습니다.</div>' +
	                                            '</div>'+    
	                                            '</div>';
	                    vpillstabContentHTML += '</div>';
			                		
			                		
		                codingTestBorder.style.border = "none";
		                codingTestBorder.style.padding = "1px";
		                vpillstab.innerHTML = vpillstabHTML;
		                vpillstabContent.innerHTML = vpillstabContentHTML;
			    		                		
			                	
					}else{
						
						var vpillstabHTML = "";
		                var vpillstabContentHTML = "";
						updateDateSeq = parseRes[0].processSeq;
						
		                if(parseRes[0].strtYmd == null){
// 		            		Swal.fire({
// 			                        title: '일정이 없습니다!.',
// 			                        text: '일정을 정해주세요.',
// 			                        icon: 'warning',
// 			                        confirmButtonText: '확인'
// 		                    }).then((result) => {
		                    	
// 		                		myModal = new bootstrap.Modal(document.getElementById("dateModal"), {
// 		                	        backdrop: 'static',
// 		                	        keyboard: false
// 		                	    });
		                		
// 		                		myModal.show();
	
// 				    		});

	                		myModal = new bootstrap.Modal(document.getElementById("dateModal"), {
	                	        backdrop: 'static',
	                	        keyboard: false
	                	    });
	                		
	                		myModal.show();
	            		}
					 	

		                parseRes.forEach(function (res, index) {
			                	
		                	if(index == 0){
		                		// 첫번째 탭 활성화.
		                        vpillstabHTML += '<a class="nav-link active" id="v-pills-home-tab-' + index + '" data-bs-toggle="pill" href="#v-' + (index + 1) + '" role="tab" aria-controls="v-pills-home" style="width: 100%;" aria-selected="true">' + (orderNumber == 1 ? '자기소개서 ' : '코딩테스트 ') + (index + 1) + ' 문항</a>';
		                		
		                	}else{
		                		
		                        vpillstabHTML += '<a class="nav-link" id="v-pills-home-tab-' + index + '" data-bs-toggle="pill" href="#v-' + (index + 1) + '" role="tab" aria-controls="v-pills-home" style="width: 100%;" aria-selected="true">' + (orderNumber == 1 ? '자기소개서 ' : '코딩테스트 ') + (index + 1) + ' 문항</a>';
		                	}
			           
		                });
			                
			                
						parseRes.forEach(function (res, index) {
			                	
			                	if(index == 0){
			                		
			                		vpillstabContentHTML += '<div class="tab-pane fade show active" id="v-' + (index + 1) + '" role="tabpanel" data-seq="' + res.entIntroQstnDsnctSeq + '" aria-labelledby="v-pills-home-tab-' + index + '">';
				                    vpillstabContentHTML +=       	
				                    						'<div class="row row-cols-2">' +
				                    						'<div class="mb-3 p-3 bg-light border">'+
				                    							'<strong>문제</strong>'+
				                    							'<div class="bg-white rounded-1 p-3 border" style="min-height: 100px;">'+ res.qstnTtl+'</div>'+
				                                                '<strong>제약사항</strong>'+
				                                                '<div class="bg-white rounded-1 p-3 border" style="min-height: 100px;">'+res.restriction+'</div>' +
				                                            '</div>'+
				                                            '<div class="mb-3 p-3 bg-light border">'+
				                                            	'<strong>문제 내용</strong>'+
				                                            	'<div class="bg-white rounded-1 p-3 border" style="min-height: 225px;">'+res.qstnCn +'</div>' +
				                                            '</div>'+    
				                                            '</div>';
				                    vpillstabContentHTML += '</div>';
			                		
			                	}else{
			                		
			                		vpillstabContentHTML += '<div class="tab-pane fade" id="v-' + (index + 1) + '" role="tabpanel" data-seq="' + res.entIntroQstnDsnctSeq + '" aria-labelledby="v-pills-home-tab-' + index + '">';
				                    vpillstabContentHTML +=       	
				                    						'<div class="row row-cols-2">' +
				                    						'<div class="mb-3 p-3 bg-light border">'+
				                    							'<strong>문제</strong>'+
				                    							'<div class="bg-white rounded-1 p-3 border" style="min-height: 100px;">'+ res.qstnTtl+'</div>'+
				                                                '<strong>제약사항</strong>'+
				                                                '<div class="bg-white rounded-1 p-3 border" style="min-height: 100px;">'+res.restriction+'</div>' +
				                                            '</div>'+
				                                            '<div class="mb-3 p-3 bg-light border">'+
				                                            	'<strong>문제 내용</strong>'+
				                                            	'<div class="bg-white rounded-1 p-3 border" style="min-height: 225px;">'+res.qstnCn +'</div>' +
				                                            '</div>'+    
				                                            '</div>';
				                    vpillstabContentHTML += '</div>';
			                	}
		                });
						
						codingTestBorder.style.border = "none";
		                codingTestBorder.style.padding = "1px";
		                vpillstab.innerHTML = vpillstabHTML;
		                vpillstabContent.innerHTML = vpillstabContentHTML;
					}
				}
			}
		};
		xhr.send(params);
	}
	
	
	function getApplicantWebRtcDateSet(recruitNo, pstnCmmncdNm, orderNumber) {
		
		var obj = {
				
				recruitNo : recruitNo,
				pstnCmmncdNm : pstnCmmncdNm,
				orderNumber : orderNumber
				
		}
		var params = new URLSearchParams(obj).toString();
		
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "getApplicnatDate", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.setRequestHeader(header, token);
		xhr.onreadystatechange = function () {
			
			if (xhr.readyState === XMLHttpRequest.DONE) {
				
				if(xhr.status === 200) {
					
	                var res = xhr.responseText;
					var parseRes = JSON.parse(res);
					
	                if(parseRes.strtYmd == null){
	                	
                		myModal = new bootstrap.Modal(document.getElementById("dateModal"), {
                	        backdrop: 'static',
                	        keyboard: false
                	    });
                		
                		updateDateSeq = parseRes.processSeq;
                		
                		
                		myModal.show();
	                	
	                }
					
					
				}
				
			}
			
		};
		
		xhr.send(params);
	}
	
	//문항추가 함수
	function addQuestionBtn(){
		
		var activeTabIndex = $('.nav-link.active').parent().data('index');
		console.log(activeTabIndex);
		if(activeTabIndex == 0)	{
			
			var activePane = $('.tab-pane.active');
// 			var seq = activePane.data("seq");
// 			console.log(seq);
			var questionNumber = ${entIntroQstnNo};
			var vPillsTab = $("#v-pills-tab");
			var vPillsTabContent = $("#v-pills-tabContent");
	
			var qstnNo = questionNumber[activeTabIndex].entIntroQstnNo;
				
			var insertCn = 
				"[업무를 효율적으로 만드는 IT 개발자  이전부터 개발자로서 주도적으로 업무를 수행하며 직무와 관련된 커리어를 쌓을 수 있고, 회사와 함께 성장해 나갈 수 있는 회사에서 일하기를꿈꿔왔습니다. 우아한 형제들은 개발자들에 대한 투자를 아끼지 않으며 뛰어나신 개발 능력을 갖춘 개발자 분들이 많다고 들었습니다."+ 
				"그뿐만 아니라 체계적인 신입 교육 제도를 갖추고 있어 빠르게 업무능력을 키우고 업무 관련 프로젝트를 진행할 수 있다고 생각했습니다. 이를 통해 우아한 형제들에서 일하게 된다면 주변의 뛰어난 선후배들과 함께 개발 능력에 대한 전문성을 빠르게 키울수 있을 것이라 생각하여 지원하게 되었습니다. 또한, 개발자로서 주도적으로 프로젝트를 진행하며 업무 역량을 키우"+
				"고 회사와 함께 성장하고 싶습니다";
			
			console.log(qstnNo);
			
			insertQTSNDSNCT(insertCn ,qstnNo);
			
		}else{
			
            var myModal = new bootstrap.Modal(document.getElementById('codingTestModal'), {
                keyboard: true
            });
            myModal.show();
			
			
		}
		
	}
	
	var insertValue = "dd";  // 함수 외부에 변수 선언

	function updateBtn(button) {
        var buttonText = $(button).text();
        var activePane = $('.tab-pane.active');

        if (buttonText === "문항수정") {
            console.log("ㅇㅇㅇㅇ");
            // 기존 텍스트를 가져와서 textarea에 삽입
            var insertValue = activePane.text().trim();
            $(button).text("문항등록");
            activePane.html("<textarea style='border: none; width: 100%;' rows='9'>" + insertValue + "</textarea>");
            isEditing = true;
            console.log(isEditing);
        } else {
            // textarea에서 값을 가져와서 텍스트로 전환
            var updateValue = activePane.find("textarea").val();
            activePane.text(updateValue);

            // 데이터 속성에서 seq 값을 가져와서 업데이트 함수 호출
            var seq = activePane.data("seq");
            updateQTSNDSNCT(updateValue, seq);

            Swal.fire({
                title: '완료!',
                text: '문항이 수정되었습니다.',
                icon: 'success',
                confirmButtonText: '확인'
            });

            $(button).text("문항수정");
            isEditing = false;
        }
    }

	
	function delBtn(button) {
	    event.stopPropagation();

	    var activePane = $(".tab-pane.active");
	    var activeLink = $("#v-pills-tab").find(".nav-link.active");
		
	   	var deleteCn = activePane.html();
	    var prevLink = activeLink.prev("a");
	    var nextLink = activeLink.next("a");

	    var targetId = activeLink.attr("href");
	    $(targetId).remove();
	    activeLink.remove();

	    if (prevLink.length > 0) {
	    	
	    	var prevTargetId = prevLink.attr('href');
	        prevLink.addClass('active').attr('aria-selected', 'true');
	        $(prevTargetId).addClass('active show');
	        
	    } else if (nextLink.length > 0) {
	    	
	    	 var nextTargetId = nextLink.attr('href');
	         nextLink.addClass('active').attr('aria-selected', 'true');
	         $(nextTargetId).addClass('active show');
	        
	    } else {
	    	Swal.fire({
	    	    title: '안내',
	    	    text: '더 이상 문항이 없습니다.',
	    	    icon: 'info',
	    	    confirmButtonText: '확인'
	    	});
	    }
	    
	    var activeTabIndex = $(".nav-link.active").parent().data('index');
	    var questionNumber = ${entIntroQstnNo};
        var index = questionNumber[activeTabIndex].entIntroQstnNo;
        var seq = activePane.data("seq");
        
        
        
	    deleteQTSNDSNCT(seq);
	    
	}


	
	
	function insertQTSNDSNCT(insertCn, qstnNo) {
		
		var sendObj = {
				
			entIntroQstnNo : qstnNo,
			entIntroQstnInsertCn : insertCn
		};
		
		var insertCnAJAX = "";
		
		$.ajax({
			
			type : "get",
			url : "/myPage/enterprise/qstnDSNCTInsert", 
			data : sendObj,
			
			success: function(res) {
				
				if(count == 0){
	
					insertCnAJAX = 
					"1. 자기소개를 적어주세요";
					
					count += 1;
				}else if(count == 1) {
					
					insertCnAJAX = 
						"2. 입사 후 포부를 적어주세요";
					count += 1;
				}else{
					
					insertCnAJAX =
					"본인의 프로젝트에 대해 설명해주세요";
					
					count += 1;
				}
				
				
				
				//문항 추가를 호출 할 때마다 서류 전형 문항 개수 카운트 전역 변수에다가 +1 저장.
				documentScreeingCount +=1;

			    var vPillsTab = $("#v-pills-tab");
			    var vPillsTabContent = $("#v-pills-tabContent");
			    
			    vPillsTab.find(".nav-link.active").removeClass("active");
	            vPillsTabContent.find(".tab-pane.show.active").removeClass("show active");

			    vPillsTab.append('<a class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill" href="#v-' + documentScreeingCount + '" role="tab" aria-controls="v-pills-home" style="width: 100%;" aria-selected="true">자기소개서 ' + documentScreeingCount + ' 문항</a>');
			    vPillsTabContent.append('<div class="tab-pane fade show active" id="v-' + documentScreeingCount + '" data-seq="' + res + '" role="tabpanel" aria-labelledby="v-pills-home-tab">'+insertCnAJAX+'</div>');
			}


		});
	}
	
	function updateQTSNDSNCT(updateCn, seq) {
		
		var sendObj = {
				
			entIntroQstnSeqNo : seq,
			entIntroQstnUpdateCn : updateCn
		};
		
		$.ajax({
			
			type : "get",
			url : "/myPage/enterprise/qstnDSNCTUpdate", 
			data : sendObj,
			
			success : function(res){
				
				if(res === "SUCCESS") {
					
					console.log("수정 완료");
				}
			}
		});
	}
	
	function deleteQTSNDSNCT(seq) {
		
		//문항 삭제를 호출 할 때 마다 서류 전형 문항 개수 전역 변수 -1.
		documentScreeingCount -= 1;
		
		var sendObj = {
				
			entIntroQstnSeqNo : seq
			
		}
		
		$.ajax({
			
			type : "get",
			url : "/myPage/enterprise/deleteQTSNDSNCT",
			data : sendObj,
			success : function (res) {
				
				console.log("요청성공");
				
				if(res === "SUCCESS") {
					    Swal.fire({
					        title: '완료!',
					        text: '문항이 삭제되었습니다.',
					        icon: 'success',
					        confirmButtonText: '확인'
					    });
				}else{
					
					Swal.fire({
				        title: '오류!',
				        text: '삭제에 실패하였습니다.',
				        icon: 'error',
				        confirmButtonText: '닫기'
				    });
					
				}
			}
		});
	}
	
	
</script>

<div class="page-content-wrapper border">

	<!-- Title -->
<div class="row mb-4">
    <div class="col-md-8 d-flex flex-column align-items-start">
        <h5 style="margin: 0; padding: 0; font-weight: 700; text-transform: uppercase;">공고제목</h5>
        <h4 style="margin-top: 0.5em; color: #007bff; font-size: 1.5em;">${recruitTtl}${recruitNo}</h4>
    </div>
</div>

	
	<div class="card-header border-bottom mb-4">
	    <ul class="nav nav-bottom-line py-0 orderList" id="course-pills-tab" role="tablist">
	    
			<!-- 각 차수를 표시하는 목록  동적 AJAX -->
<!-- 	        <li class="nav-item orderItem" role="presentation"> -->
<!-- 	            <button class="nav-link mb-2 mb-md-0 orderLink active" id="course-pills-tab-1" data-bs-toggle="pill" data-bs-target="#course-pills-1" type="button" role="tab" aria-controls="course-pills-1" aria-selected="true">1차 지원 접수</button> -->
<!-- 	        </li> -->
	        
<!-- 	        <li class="nav-item orderItem" role="presentation"> -->
<!-- 	            <button class="nav-link mb-2 mb-md-0 orderLink" id="course-pills-tab-2" data-bs-toggle="pill" data-bs-target="#course-pills-2" type="button" role="tab" aria-controls="course-pills-2" aria-selected="false">2차 코딩 테스트</button> -->
<!-- 	        </li> -->
	        
<!-- 	        <li class="nav-item orderItem" role="presentation"> -->
<!-- 	            <button class="nav-link mb-2 mb-md-0 orderLink" id="course-pills-tab-3" data-bs-toggle="pill" data-bs-target="#course-pills-3" type="button" role="tab" aria-controls="course-pills-3" aria-selected="false">3차 화상 면접</button> -->
<!-- 	        </li> -->
	        
<!-- 	        <li class="nav-item orderItem" role="presentation"> -->
<!-- 	            <button class="nav-link mb-2 mb-md-0 orderLink" id="course-pills-tab-4" data-bs-toggle="pill" data-bs-target="#course-pills-4" type="button" role="tab" aria-controls="course-pills-4" aria-selected="false">4차 임원 면접</button> -->
<!-- 	        </li> -->
			<!--각 차수를 표시하는 목록 -->
	        
	    </ul>
	</div>
	<div class="first-tab-pane fade" id="course-pills-1" role="tabpanel" aria-labelledby="course-pills-tab-1">
		
		<div class="row">
			<div class="col-4 col-sm-3">
					<!-- 각 차수 마다 불러올 목록. 페이지를 로드 할때 활성화 init() 함수, 동적 AJAX-->
				<div class="nav flex-column nav-pills d-flex justify-content-start" id="v-pills-tab" role="tablist" aria-orientation="vertical">
<!-- 					<a class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" style="width: 300px;" aria-selected="true">Home</a>  -->
<!-- 					<a class="nav-link" id="v-pills-profile-tab" data-bs-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" style="width: 300px;" aria-selected="false">Profile</a>  -->
<!-- 					<a class="nav-link" id="v-pills-messages-tab" data-bs-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" style="width: 300px;"aria-selected="false">Messages</a> -->
<!-- 					<a class="nav-link" id="v-pills-settings-tab" data-bs-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings"  style="width: 300px;" aria-selected="false">Settings</a> -->
				</div>
				<div class="d-flex align-items-center justify-content-end">
					<button type="button" class="btn btn-primary" id="addQuestion" onclick="addQuestionBtn()">문항추가</button>
				</div>
			</div>
			<div class="col-8 col-sm-9 " >
				<div class="rounded-2 p-4" id="codingTestBorder" style="border: 1px solid; width: 100%; height: 400px;">
					<div class="tab-content pt-0" id="v-pills-tabContent">
	<!-- 					<div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">내용</div> -->
	<!-- 					<div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">We pride ourselves on the service we give to our clients. Our friendly team members are always willing to help you understand your present technology requirements and provide suggestions on your future needs. It can be the packaging of an item or the design of its website and Applications.</div> -->
	<!-- 					<div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">Eduport an innovative Internet marketing solutions company that offers comprehensive web development, SMO services, SEO strategies and various other types of Internet marketing related services. With us at your side, you will find the IT solution to achieve your strategic and financial goals.</div> -->
	<!-- 					<div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">Our friendly team members are always willing to help you understand your present technology requirements and provide suggestions on your future needs. It can be the packaging of an item or the design of its website and Applications. We pride ourselves on the service we give to our clients.</div> -->
						<!-- 각 차수 마다 불러올 목록. -->
					</div>
				</div>
				<div class="d-flex align-items-center justify-content-end mt-3">
					<button type="button" class="btn btn-primary" onclick="updateBtn(this)">문항수정</button>
					<button type="button" class="btn btn-primary" onclick="delBtn(this)" style="margin-left: 10px;">문항삭제</button>
				</div>
			</div>
		</div>
	</div>
	<div class="d-flex justify-content-center" style="margin-top: 60px;">
		<button type="button" class="btn btn-primary" style="width: 25%" id="confirmBtn">문항완료</button>
	</div>


</div>
<div class="modal fade" id="dateModal" tabindex="-1" aria-labelledby="dateModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="dateModalLabel"><strong>코딩테스트 날짜와 시간을 선택해주세요.</strong></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <input type="text" id="dateRange" class="form-control" placeholder="날짜와 시간 범위 선택...">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" id="closeButton">닫기</button>
                <button type="button" class="btn btn-primary" id="saveButton">저장</button>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="codingTestModal" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalLabel">기업 코딩테스트용 문제 목록</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <input id="qstnTtl" type="hidden">
                <div class="mb-3 d-flex justify-content-between">
                    <select id="qstnGrdFilter" class="form-select" style="width: 150px;">
                        <option value="">난이도</option>
                        <option value="1">초보</option>
                        <option value="2">중급</option>
                        <option value="3">상급</option>
                    </select>
                    <input type="text" id="searchInput" class="form-control" placeholder="제목 검색" style="width: 300px;">
                </div>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col" class="text-center">제목</th>
                            <th scope="col" class="text-center">유형</th>
                            <th scope="col" class="text-center">난이도</th>
                            <th scope="col" style="d" class="text-center">선택</th>
                        </tr>
                    </thead>
                    <tbody id="tbodyPrint">
                        <!-- Rows dynamically populated -->
                    </tbody>
                </table>
                <nav>
                    <ul class="pagination justify-content-center" id="pagination">
                        <!-- Pagination items dynamically populated -->
                    </ul>
                </nav>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" id="regiTest">등록하기</button>
            </div>
        </div>
    </div>
</div>








<div class="modal fade" id="exmplModal" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalLabel">문제 요약</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
<!--                 <DIV CLASS="MB-3 D-FLEX JUSTIFY-CONTENT-BETWEEN"> -->
                    
<!--                 </DIV> -->
				<div id="qstnPrint">
                        <!-- Rows dynamically populated -->
                 </div>
               
            </div>
        </div>
    </div>
</div>
































<script type="text/javascript">
	//<input type="hidden" id="ttt" value="${principal}">

	//console.log(${principal});
	// 	if(test != null && test != "") {
	// 	    document.getElementById("qstnSubject").value = "${qstnSubject}";
	// 	}
	// 	test = "${pastQstnCtgryNm}";
	// 	if(test != null && test != ""){
	// 	    document.getElementById("pastQstnCtgryNm").value = "${pastQstnCtgryNm}";
	// 	}

	document
			.addEventListener(
					"DOMContentLoaded",
					function() {

						var arratQstnNo = [];
						
						document.querySelector('tbody').addEventListener('click', function(event) {
						    var target = event.target;
						    if (target.classList.contains('form-check-input')) {
						        var tr = target.closest('tr'); 
						        var qstnNo = target.value;
						        console.log(qstnNo);
						        arratQstnNo.push(qstnNo);
						    }
						});
						
						regiTest.addEventListener("click", function() {
						    var activeTabIndex = $('.nav-link.active').parent().data('index');
						    var questionNumber = ${entCodingTestNo};
						    var codingTestNo = questionNumber[activeTabIndex-1].entCodingtestNo;
						    
						    console.log(activeTabIndex, questionNumber, codingTestNo);

						    var data = {
						        qstnNoArray: arratQstnNo,
						        entCodingTestNo: codingTestNo,
						        entCodingTestNoOrder: arratQstnNo.length
						    };

						    $.ajax({
						        url: '/myPage/enterprise/codingTestInsert',
						        type: 'POST',
						        headers: {
						            'Content-Type': 'application/json',
						            [header]: token // Spring Security 설정
						        },
						        data: JSON.stringify(data),
						        success: function() {
						        	
					        	 Swal.fire({
							            title: '저장 완료!',
							            text: '문항 등록이 완료되었습니다.',
							            icon: 'success',
							            confirmButtonText: '확인'
							        })
						            window.location.reload();
						        },
						        error: function(error) {
						            console.error('Error:', error);
						        }
						    });


						});
						
						var confirmBtn = document.getElementById("confirmBtn");
						confirmBtn.addEventListener("click", function() {
							
					        Swal.fire({
					            title: '저장 완료!',
					            text: '모든 문항 등록이 완료되었습니다.',
					            icon: 'success',
					            confirmButtonText: '확인'
					        }).then((result) => {
				    		    if (result.isConfirmed) {
				    		        
				    		    	location.href = "/myPage/enterprise/recruitProcessQuestion";
				    		    }
				    		});
							
							
							
						});
						
						
						// 전체 데이터.
						var allData = []; 
						//우선 필터링 된 데이터를 담음.
					    var filteredData = [];
					 	// init page 번호
					    var currentPage = 1; 
					 	
					 	// 페이지에 표시할 게시글수
					    var pageSize = 10; 

					    function getCodingTestList() {
					        $.ajax({
					            type: "GET",
					            url: "/myPage/enterprise/codingtestlist",
					            success: function(res) {
					                allData = res; // 서버에서 가져온 데이터를 저장
					                
					             	//데이터를 가져올때 필터링을 하는 함수.
					                applyFilters(); 
					            }
					        });
					    }

					    function applyFilters() {
					        var gradeFilter = document.getElementById("qstnGrdFilter").value;
					        var searchInput = document.getElementById("searchInput").value.toLowerCase();

					        filteredData = allData.filter(function(data) {
					            var matchesGrade = gradeFilter === "" || data.qstnGrd == gradeFilter;
					            var matchesSearch = data.qstnTtl.toLowerCase().includes(searchInput);
					            return matchesGrade && matchesSearch;
					        });

					        currentPage = 1;
					        updateTable(currentPage);
					        updatePagination();
					    }

					    function updateTable(page) {
					        var tbody = document.getElementById("tbodyPrint");
					        tbody.innerHTML = "";
					        var start = (page - 1) * pageSize;
					        var end = start + pageSize;
					        var paginatedData = filteredData.slice(start, end);

					        paginatedData.forEach(function(data, index) {
					            var row = '<tr>' +
					                '<td class="text-center"><a href="#" onclick="getDetail('+data.qstnNo+');">' + data.qstnTtl + '</a></td>' +
					                '<td class="text-center"><div style="text-align: center;">' + data.qstnSubject + '</div></td>' +
					                '<td class="text-center"">' + getGradeBadge(data.qstnGrd) + '</td>' +
					                '<td class="text-center">' +
					                '<div class="">' +
					                '<input class="form-check-input checkTest" type="checkbox" value="' + data.qstnNo + '" id="flexCheck' + index + '">' +
					                '<label class="form-check-label" for="flexCheck' + index + '"></label>' +
					                '</div>' +
					                '</td>' +
					                '</tr>';
					            tbody.insertAdjacentHTML('beforeend', row);
					        });
					    }

					    function updatePagination() {
					        var pagination = document.getElementById("pagination");
					        pagination.innerHTML = ""; // 페이지 네이션 내용 초기화
					        var pageCount = Math.ceil(filteredData.length / pageSize);

					        for (var i = 1; i <= pageCount; i++) {
					            var pageItem = '<li class="page-item ' + (i === currentPage ? 'active' : '') + '">' +
					                '<a class="page-link" href="#">' + i + '</a>' +
					                '</li>';
					            pagination.insertAdjacentHTML('beforeend', pageItem);
					        }

					        var pageLinks = document.querySelectorAll(".page-link");
					        pageLinks.forEach(function(item) {
					            item.addEventListener("click", function(e) {
					                e.preventDefault();
					                currentPage = parseInt(e.target.textContent);
					                updateTable(currentPage);
					                updatePagination();
					            });
					        });
					    }

					    function getGradeBadge(grade) {
					        if (grade === 1) return '<span class="badge text-bg-primary">초보</span>';
					        if (grade === 2) return '<span class="badge text-bg-success">중급</span>';
					        return '<span class="badge text-bg-danger">상급</span>';
					    }

					    document.getElementById("qstnGrdFilter").addEventListener("change", applyFilters);
					    document.getElementById("searchInput").addEventListener("input", applyFilters);

					    getCodingTestList();
					    
						
					});
	
	
	function getDetail(qstnNo){
		
    	event.preventDefault();
    	exmplModal = new bootstrap.Modal(document.getElementById("exmplModal"), {
    	        backdrop: 'static',
    	        keyboard: false
    	});
    	
    	
    	qstn = {
    		qstnNo	: qstnNo	
    	}
    	
	    $.ajax({
	    	
	    	
		      url: '/myPage/enterprise/getTestDetail',
		      type: 'POST',
		      contentType: "application/json; charset=utf-8",
		      data: JSON.stringify(qstn),
		      beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
            	},
		      success: function(response) {
		    	const qstnPrint = document.getElementById("qstnPrint");
		  		var qstnHTMl = "";
		  		console.log(qstnHTMl);
		  		
		    	const qstn = response;
		    	const restriction = qstn.restriction.replace(/\n/g, "<br />");
		    	const qstnExmpl  = qstn.qstnExmpl.replace(/\n/g, "<br />");
		    	const qstnCn  = qstn.qstnCn.replace(/\n/g, "<br />");
		    	
		    	  console.log(qstn);
		    	  qstnHTMl += "<hr />";
		    	  qstnHTMl += "<div> 제목: "+qstn.qstnTtl+"</div>";
		    	  qstnHTMl += "<hr />";
		    	  
		    	  qstnHTMl += "<div>제약사항</div>";
		    	  qstnHTMl += "<div>"+restriction+"</div><hr/>";
		    	  
		    	  qstnHTMl += "<div>출력예시</div>";
		    	  qstnHTMl += "<div>"+qstnExmpl+"</div><hr/>";
		    	  
		    	  qstnHTMl += "<div>문제 설명</div>";
		    	  qstnHTMl += "<div>"+qstnCn+"</div><hr/>";
		    	  
		    	  console.log(qstnHTMl);
		    	  
		    	  qstnPrint.innerHTML = qstnHTMl;
		    	  
		      }
            
		});
    	
    	exmplModal.show();
    	
    }

</script>


