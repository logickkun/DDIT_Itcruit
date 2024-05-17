<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>


<style>

	.pt-5 {
		display: none;
	}
	
    p {
        word-wrap: break-word;
    }
    
	#cont {
		margin: 50px auto;
		width: 50%;
		height: 70%;
		background-color: white;
		
		color: black;
	}
	
	/* 풀캘린더 헤드툴바 글자크기 설정 */
	.fc-header-toolbar .fc-toolbar-title {
        font-size: 20px; 
    }
    
    /* 풀캘린더 헤드툴바 center속성을 가로졍렬 설정 */
 	.fc-toolbar-chunk {
        display: flex;
        align-items: center;
    }
    
    
    
    /* 날짜의 폰트 크기, 색상을 수정합니다 */
    .fc-daygrid-day-number {
        font-size: 13px;
        color: #000000;
    }

	/* 풀캘린더 요일 폰트 수정 */
	.fc-col-header-cell-cushion {
		color: #000000;
	}
	
	
  	/* 풀캘린더 요일 폰트 수정 */
  	.fc-event-time {
  	 	display: none;
  	}
  	
  	/* 풀캘린더 스케줄 시작시간 수정 */
  	.fc-event-title {
  		color: #000000;
  	}
  	
  	/* 풀캘린더 날짜 표시 위치 수정 */
  	.fc-daygrid-day-top {
        display: flex;
        justify-content: flex-start;
    }
  	
  	/*
  		 버튼 내용? 변경
  		.fc-prev-button, .fc-next-button, .fc-today-button {
        color: #ae48c7; 
    }
    
    .fc-button-bg-color {
  		color: #ae48c7; 
  	}
  	
  	
  	.fc .fc-button  >> 꺽쇠표시가 변경ㄱ되
  	*/

    
    .fc .fc-button-primary {
    	background-color: #cc77ff;
    }
  
  	.fc .fc-button-primary:disabled {
    	background-color: #E4B7FF;
    }
  	
</style>


<main>
	<!-- Page main content START -->
	<div class="page-content-wrapper border">

		<!-- Title -->
		<div class="row">
			<div class="col-12 mb-3">
				<h2 class="h3 mb-2 mb-sm-0">채용목록 관리</h2>
			</div>
		</div>

		<!-- Chart and Ticket START -->
		<div class="row g-4 mb-4">

	
			<!-- 관리자-달력 시작 -->
			<div class="col-xxl-8">
				<div class="card shadow h-100">

					<!-- Card header -->
<!-- 					<div class="card-header p-4 border-bottom"> -->
<!-- 						<h5 class="card-header-title">채용목록</h5> -->
<!-- 					</div> -->

					<!-- Card body -->
					<div class="card-body">
						<div id="Wrapper">
							<div id='calendar'></div>
						 </div>
					</div>
				</div>
			</div>
			<!-- 관리자-달력 끝 -->

			<!-- Ticket START -->
			<div class="col-xxl-4">
				<div class="card shadow h-100">
					<!-- 정보수정 요청 목록 시작 -->
					<div class="card-header border-bottom d-flex justify-content-between align-items-center p-4">
						<h5 class="card-header-title">채용정보변경 요청 목록</h5>
						<a href="#" class="btn btn-link p-0 mb-0">View all</a>
					</div>

					<!-- Card body START -->
					<div class="card-body p-4">
						<div class="col-sm-6 mx-auto">
							<div id="ChartTrafficViews"></div>
						</div>
						<!-- Content -->
						<ul class="list-group list-group-borderless mt-3">
							<li>여기에는 기업이 채용정보 변경을 요청한 목록이 생깁니다 </li>
							<li>신고된 댓글 삭제와 같이 두가지 버튼이 있습니다 </li>
							<li>버튼1은 댓글상세내용 보기와 같이 요청내용을 볼 수 있는 버튼 </li>
							<li>버튼2는 해당 내용을 수정후 처리완료를 누를 버튼</li>
						</ul>
					</div>
					<!-- 정보수정 요청 목록 끝 -->
					
					<div class="card-header border-bottom d-flex justify-content-between align-items-center p-4">
					</div>
					
					
					<!-- 수정 정보 입력  -->
					<div class="card-header border-bottom d-flex justify-content-between align-items-center p-4">
						<h5 class="card-header-title" id="selectedRecruit">변경할 채용정보</h5>
					</div>

					
					<div class="card-body p-4" id="updateBody">
						<div class="col-sm-6 mx-auto">
							<div id="ChartTrafficViews"></div>
						</div>
						<span id="printPositionList">
						
						<!-- Content -->
						<!-- readonly disabled 
							수정 불가능하게 할 정보는
							둘중 하나 사용해서 수정 불가능하게 만들면 됩니다
							readonly는 선택및 수정은 불가하지만 폼데이터로 정보 전송은가능
							disabled는 정보 전송도 안됨
							취향에 따라 만들 기능에 따라 알아서 선택하기	
						-->
						
						<select class="form-select form-select-sm js-choice" aria-label=".form-select-sm" id = "position">
							<option value="">변경할 채용을 선택해주세요</option>
						</select>
						</span>
						
						<br/>
						<div id="showDetail">
							<p></p>
						</div>
						
					</div>
					<!-- 정보수정 요청 목록 끝 -->
					
				</div>
			</div>
			<!-- Ticket END -->
		</div>
		<!-- Chart and Ticket END -->

	</div>
	<!-- Top listed Cards END -->

	<!-- Page main content END -->
	<!-- Page content END -->
	
	
	
	<script>
		
		//db에서 뽑아낸 데이터 json파일로 가져와서 달력에 넣는 방식
		//eventSources
		//var eventSources = ${eventSources};
        //const mySchStart = document.querySelector("#schStart"); 
       // const mySchEnd = document.querySelector("#schEnd");
       // const mySchTitle = document.querySelector("#schTitle");	
       // const mySchAllday = document.querySelector("#allDay");	//allday옵션
       // const mySchBColor = document.querySelector("#schBColor"); //배경컬러
        //const mySchFColor = document.querySelector("#schFColor"); //폰트컬러
		var modalBody = document.querySelector('.modal-body');
		
		var selectedRecruit = document.getElementById("selectedRecruit");
        
		//달력에 노출할 데이터 검색어 설정
		var date;	//날짜
		var entNm;	//회사명
		var pstnCmmncdNm; //모집분야
		var lang;	//언어
		var cmmncdGrpCd;//근무지
		var cmmncdNm1;//상세
		
		var recruitInfo;
		var minDate;
    	
    	var maxDate;

    	var strtday;
    	
		document.addEventListener('DOMContentLoaded', function() {
		//var eventSources = ${eventSources};
        //캘린더 헤더 옵션
	        const headerToolbar = {
	            left: 'title',
	            center: '', 
	            right: 'prev,today,next'
	        }
	                 
       		const calendarEl = document.querySelector('#calendar'); //달력지정

	        const calendarOption = {
	        	eventLimit : 999,
	            contentHeight: 'auto',
	           
	            expandRows: true, // 화면에 맞게 높이 재설정
	             	slotMinTime: '09:00', // Day 캘린더 시작 시간
	             	slotMaxTime: '18:00', // Day 캘린더 종료 시간
	          
				// 맨 위 헤더 지정
	            headerToolbar: headerToolbar,
	            initialView: 'dayGridMonth',  
	            locale: 'kr',        // 언어 설정
	            selectable: true,    // 영역 선택
	            editable: false,      // event(일정) 
	            /* 시작일 및 기간 수정가능여부
	            eventStartEditable: false,
	            eventDurationEditable: true,
	            */
	           
	            contentHeight: 800,
	            nowIndicator: true,
	            //events: eventSources,
	            
	            datesSet: function(info) {
	            
	            	var startOfMonth = info.view.currentStart;
		            var startYear = startOfMonth.getFullYear();
		            
		      		var startMonth;
		      		if(startOfMonth.getMonth()+1 < 10) {
		      			startMonth = "0"+(startOfMonth.getMonth()+1);
		      		} else {
		      			startMonth = (startOfMonth.getMonth()+1)
		      		}
		      		
				    date = startYear+"-"+startMonth;
				    
				    refreshCalendar();
			    }
	        }

			//검색어 입력시 ajax로 달력 새로 그리기
		      $(document).ready(function() {
			    $('#entNm').on('keyup', function() {
			    	refreshCalendar();
			    });
			});

	        // 캘린더 생성
	        const calendar = new FullCalendar.Calendar(calendarEl, calendarOption);
       
       		calendar.render();
		
			//달력 새로 그리기 위한 함수
			function refreshCalendar() {
				
				entNm = $("#entNm").val();
				pstnCmmncdNm = $("#pstnCmmncdNm").val(); //모집분야
				lang = $("#lang").val();	//언어
				cmmncdGrpCd = $("#cmmncdGrpCd").val();//근무지
				cmmncdNm1 = $("#pstnCmmncdNm").val();//상세
	
				var calDate = {
					time: date,
					entNm : entNm,
					pstnCmmncdNm : pstnCmmncdNm,
					lang : lang,
					cmmncdGrpCd : cmmncdGrpCd,
					pstnCmmncdNm : cmmncdNm1,
				}
				
				//console.log(calDate);
				
			   $.ajax({
					type : "post",
					url : "/recruit/list.do",
					contentType : "application/json; charset=utf-8",
					data : JSON.stringify(calDate),
					beforeSend: function(xhr) {
	             	xhr.setRequestHeader(header, token);
	           	    },
		          	success : function(res) {
		          		calendar.removeAllEvents();
				        calendar.addEventSource(res);
				        calendar.render();
					}
				})
			}

		
	        calendar.on("eventClick", info => {
				
	        	var recruitNo = info.event.extendedProps.recruitNo;
				$.ajax({
					type : "post",
					url : "/recruit/info",
					contentType : "application/json; charset=utf-8",
					data : JSON.stringify({
						recruitNo : recruitNo
					}),
					beforeSend: function(xhr) {
	                	xhr.setRequestHeader(header, token);
	          		},
	          		success : function(res) {
	          			showSelectedRecruit(res);
	          			//console.log(res);
					}
				})
				
				
	// 			$("#detailModal").modal("show");         
	        });
	        
        
	        var printPositionList = document.getElementById("printPositionList");
	        var showDetail = document.getElementById("showDetail");
        	
	        function showSelectedRecruit(res) {
	        	
	        	recruitInfo = res;
	        	console.log(res[0]);
	        	var today = new Date();
	        	var strtDay = new Date(res[0].recruitStrtDt);
	        	var endDay = new Date(res[0].recruitEndDt);
	        	       	
	        	if(today > endDay){
	        		alert("지난 공고는 수정할 수 없습니다");
	        		
	        		var html = "변경할 채용정보";
	        		showDetail.innerHTML = "";
	        		selectedRecruit.innerHTML = html;
	        		html = '<select class="form-select form-select-sm js-choice" aria-label=".form-select-sm" id = "position">';
	        		html += '<option value="">변경할 채용을 선택해주세요</option></select>';
	            	printPositionList.innerHTML = html;
	            	
	        		return;
	        	}
	        	
	        	//현재날짜
	        	var min = new Date(today.getFullYear(), today.getMonth(), today.getDate()+1);
	        	minDate = min.toISOString().split("T")[0] + "T00:00";
	        	maxDate = new Date(today.getFullYear(), today.getMonth(), today.getDate()+30);
	        	
	        	var updateBody = document.getElementById("updateBody");
	        	
	        	var html = "변경할 채용정보";
	        	html += "<br/>";
	        	//selectedRecruit에 넣을 정보
	        	html += res[0].entNm + "(";
	        	html += res[0].recruitNo + ")";
	        	
	        		
	        	selectedRecruit.innerHTML = html;
	        	//var position = res[0].pstnCmmncdNm;
	        	
	        	//이곳 부터는 상세내용이 입력될 것
	        	html = '<select class="form-select form-select-sm js-choice" aria-label=".form-select-sm" id = "position">';
				html +=	'<option value="">전체일정</option>';
				
				for(var i = 0; i < res.length; i++){
					html += '<option value="' + res[i].pstnCmmncdNm + '">' + res[i].pstnCmmncdNm  + '</option>';
				}
						
	        	html += "</select>";
	        	
	        	printPositionList.innerHTML = html;
	        	
	        	//리스트에서 채용 선택마다 다른 정보가 보여지도록 하기 위함 기본값으로는 전체 채용일정이기 때문에 시작시간과 종료시간을 바꿀 수 있음
	        	//recruitEndDt / recruitStrtDt
	        	html = '<span>시작일(변경 전): <input type="text" id = "strtDay" value="' + res[0].recruitStrtDt + '" readonly></span><br/>'
	        	html += '<span>시작일(변경 후): ';
	
	        	html += '<input type="datetime-local"';
	        	html +=	'id="recruitStrtDt" name="recruitStrtDt"';
	        	html +=	'min="' + minDate + '"';
	        	html +=	'pattern="\d{4}-\d{2}-\d{2}T\d{2}:\d{2}">';
	        	html += '</span><br/>';
	        	html += '<span>종료일(변경 전): <input type="text" id = "endDay" value="' + res[0].recruitEndDt + '" readonly></span><br/>'
	        	
	        	html += '<span>종료일(변경 후): ';
	        	html += '<input type="datetime-local"';
	        	html +=	'id="recruitEndDt" name="recruitEndDt"';
	        	html +=	'min="' + minDate + '"';
	        	html +=	'pattern="\d{4}-\d{2}-\d{2}T\d{2}:\d{2}">';
	        	html += '</span><br/>';
	        	showDetail.innerHTML = html;
	        	
	        	selectStrtDate();
	        	
	        	var existingButton = updateBody.querySelector('button');
	        	if(!existingButton){
	        		updateBody.style.position = 'relative';
	        		//style="position: absolute; bottom: 0; right: 0;"
	        		var button = '<button type="button" class="btn btn-primary btn-sm" style="float: right;" >수정</button>';
	        		updateBody.insertAdjacentHTML('beforeend', button);
 	        		button = '<button type="button" class="btn btn-danger btn-sm" style="float: right;" >삭제</button>';
	        		updateBody.insertAdjacentHTML('beforeend', button);
	        	}
	        }
        
      //  calendar.on("eventMouseEnter", info => console.log("eEnter:", info));
      //  calendar.on("eventMouseLeave", info => console.log("eLeave:", info));
       // calendar.on("dateClick", info => console.log("dateClick:", info));

// 			const recruitStrtDtElement = document.getElementById("recruitStrtDt");
			
			//공고가 시작된 경우 시작일 변경 불가
			//document.querySelector("#showDetail")
			function selectStrtDate(){
				document.querySelector("#recruitStrtDt").addEventListener("click", function(e){
		        	var today = new Date();
		        	strtday = new Date(document.getElementById("strtDay").value);
	        		document.getElementById("recruitStrtDt").value = document.getElementById("strtDay").value;
	        		
		        	if(today > strtday){
		        		alert("진행중인 공고의 시작일은 변경할수 없습니다.");
		        		return;
		        	}
		        });
			}
			
// 			function selectEndDate(){
// 				document.querySelector("#recruitEndDt").addEventListener("click", function(e){
// 		        	var selectDay = new Date();
		        	
// 		        	if(today > strtday ){		        		
// 		        	}
// 		        });
// 			}
			
			
	        document.querySelector("#showDetail").addEventListener("change", function(e){
	        	var today = new Date();
	        	var strtday;
	        	var targetElement = e.target;
	        	if (targetElement.id === "recruitStrtDt") {
	        		strtday = new Date(targetElement.value);
	        		if(strtday < today) {
		        		alert("현재 시간보다 이전 시간으로 변경할 수 없습니다");
		        		document.getElementById("recruitStrtDt").value = "";
		        	}
	            }
	        	
	        	if (targetElement.id === "recruitEndDt") {
	        		
	        		var selectday = new Date(targetElement.value);
	        		strtday = document.getElementById("recruitStrtDt").value;
	        		var startday = new Date(strtday);
	        		if(selectday < startday){
	        			alert("종료일은 시작일보다 빠를 수 없습니다");
		        		document.getElementById("recruitEndDt").value = "";
	        		}
	        	}
	        });
			
	        
	        
	        
	        
	        document.querySelector("#printPositionList").addEventListener("change", function(e){
	        	//console.log(e.target.value);
	        	//cmmncdGrpCd, cmmncdNm1, entUrl, entNo, entNm
	        	//recruitCareerCodeNm- 요구 경력, recruitPay-급여, recruitCnt - 채용인원
	        	//recruitInfo에 채용 목록에 대한 정보가 담겨있음
	        	
	        	var pstn = e.target.value; //수정대상의 직무
	        	
	        	var cmmncdGrpCd; //근무지
	        	var cmmncdNm1; //근무지상세
	        	var recruitCareerCodeNm//경력여부
	        	var recruitPay;
	        	var recruitCnt;
	        	
	        	if(e.target.value == "" || e.target.value == null) {
	        		
        			html = '<span>시작일(변경 전): <input type="text" id = "strtDay" value="' + recruitInfo[0].recruitStrtDt + '" readonly></span><br/>'
    	        	html += '<span>시작일(변경 후): ';
    	
    	        	html += '<input type="datetime-local"';
    	        	html +=	'id="recruitStrtDt" name="recruitStrtDt"';
    	        	html +=	'min="' + minDate + '"';
    	        	html +=	'pattern="\d{4}-\d{2}-\d{2}T\d{2}:\d{2}">';
    	        	html += '</span><br/>';
    	        	//selectEndDate selectStrtDate
    	        	html += '<span>종료일(변경 전): <input type="text" id = "endDay" value="' + recruitInfo[0].recruitEndDt + '" readonly></span><br/>'
    	        	
    	        	html += '<span>종료일(변경 후): ';
    	        	html += '<input type="datetime-local"';
    	        	html +=	'id="recruitEndDt" name="recruitEndDt"';
    	        	html +=	'min="' + minDate + '"';
    	        	html +=	'pattern="\d{4}-\d{2}-\d{2}T\d{2}:\d{2}">';
    	        	html += '</span><br/>';
    	        	showDetail.innerHTML = html;
    	        	
        		} else {
        			for(var i=0; i < recruitInfo.length; i++){
    	        		
    	        		
    	        		if(recruitInfo[i].pstnCmmncdNm == pstn) {
//     	        			entNo = recruitInfo[i].entNo;
//     	        			entNm = recruitInfo[i].entNm;
    	        			cmmncdGrpCd = recruitInfo[i].cmmncdGrpCd;
    	        			cmmncdNm1 = recruitInfo[i].cmmncdNm1;
    	        			recruitCareerCodeNm = recruitInfo[i].recruitCareerCodeNm;
    	        			recruitPay = recruitInfo[i].recruitPay;
    	        			recruitCnt = recruitInfo[i].recruitCnt;
    	        			
							html = '<table>';
							html += '<tr><td><span>직무:</span></td><td><input type="text" value="' + pstn + '"></td></tr>';
							html += '<tr><td><span>근무지:</span></td><td><input type="text" value="' + cmmncdGrpCd + '"></td></tr>';
							html += '<tr><td><span>근무지:</span></td><td><input type="text" value="' + cmmncdNm1 + '"></td></tr>';
							html += '<tr><td><span>요구경력:</span></td><td><input type="text" value="' + recruitCareerCodeNm + '"></td></tr>';
							html += '<tr><td><span>급여:</span></td><td><input type="text" value="' + recruitPay + '"></td></tr>';
							html += '<tr><td><span>채용인원:</span></td><td><input type="text" value="' + recruitCnt + '"></td></tr>';
							html += '</table>';

    	        			break;
    	        		}
    	        	}
        			
        		}
	        	showDetail.innerHTML = html;
	        	
	        });
        
	});
		
		
    </script>
</main>