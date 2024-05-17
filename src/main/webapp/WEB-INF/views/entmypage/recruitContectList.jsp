<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
<script src="https://mozilla.github.io/pdf.js/build/pdf.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<style>
        #pdf-container {
            width: 100%;
            height: 100%; /* 크기를 조정할 수 있습니다. */
        }
        
        /* 모달 기본 스타일 */
/* 모달 헤더 및 본문 기본 스타일 */
.modal-header {
    background: #f8f9fa; 
    border-bottom: none; 
    padding: 20px;
}

.modal-title {
    font-size: 1.5rem;
    color: #333;
}

.modal-body {
    padding: 20px;
}

/* 질문 영역 스타일 */
#qstn {
    padding: 15px;
    margin-bottom: 10px;
    background-color: #ffffff; /* 하얀색 배경 */
    border-left: 5px solid #007bff; /* 왼쪽 경계선 강조 */
    font-family: 'Roboto', sans-serif;
    font-weight: 700; /* 폰트 굵기 조정 */
    
}

/* 답변 영역 스타일 */
#answer {
    padding: 15px;
    background-color: #e9ffe8; /* 답변 배경 색상 */
    border-color: #28a745; /* 답변 경계선 색상 */
    font-size: 1.1rem; /* 글자 크기 증가 */
    line-height: 1.5; /* 줄 간격 조정 */
}

/* 탭 스타일 */
.nav-pills .nav-link {
    border-radius: 0.25rem;
    color: #007bff;
}

.nav-pills .nav-link.active {
    color: #fff;
    background-color: #007bff;
}

.card {
    background-color: #fff; /* 카드 배경색 */
    border: none; /* 테두리 제거 */
}

.card-title {
    color: #212529; /* 카드 내 글자색 */
}

.text-secondary {
    color: #6c757d; /* 보조 글자색 */
}

.code-block {
    background-color: #f8f9fa; /* 코드 블록 배경색 */
    padding: 10px; /* 내부 여백 */
    font-family: 'Courier New', Courier, monospace; /* 고정 폭 글꼴 */
    white-space: pre-wrap; /* 줄 바꿈 유지 */
    overflow-x: auto; /* 수평 스크롤 */
}

        
</style>
<c:if test="${empty recruitList}">
    <script>
        alert('채용 공고가 없습니다.');
        window.history.back();
    </script>
</c:if>

<div class="page-content-wrapper border">

<div class="d-flex justify-content-between mb-3">
	<span class="h5" style="width: 100%;">지원자 목록</span> 
		<select class="form-select" aria-label="Default select example" id="tabSelect">
		<c:forEach items="${recruitList}" var="recruit">
			<option value="#tab-2-1" data-pstnCmmncdNm="${recruit.pstnCmmncdNm}" data-recruitNo="${recruit.recruitNo}"<c:if test="${recruitTtl == recruit.recruitTtl}">selected</c:if> >${recruit.recruitTtl}</option>
		</c:forEach>
	</select>
</div>

<div class="tab-content">

	<div class="tab-pane" id="tab-2-1">

		<ul class="nav nav-tabs nav-justified mb-3" id="tableTab">
		</ul>

		<div class="tab-content">

			<div class="tab-pane show active" id="tab-3-1">

				<div class="table-responsive border-0">

					<table class="table table-dark-gray align-middle p-4 mb-2 table-hover">
						<thead class="text-center">
							<tr id="tableHeader">
							</tr>
						</thead>

						<tbody id="tableBody">
						
						</tbody>
					</table>
				</div>
				
				
				<div class="d-sm-flex justify-content-sm-end align-items-sm-center" id="pagination-container">
					
				</div>
			</div>
		</div>
	</div>
</div>
</div>


<div class="modal fade" id="checkQstnAnswer" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-scrollable modal-xl" role="document">
	<div class="modal-content">
		<div class="modal-header">
		<h5 class="modal-title" id="modalLabel">문항 내역</h5>
		</div>
			<div class="modal-body">
			
				<div class="row">
				  <div class="col-4 col-sm-3">
				    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
				    
				      
				    </div>
				  </div>
				  <div class="col-8 col-sm-9">
				    <div class="tab-content pt-0" id="v-pills-tabContent">
				    
				    	
				    </div>
				  </div>
				</div>
				
			</div>
		<div class="modal-footer">
		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		</div>
	</div>
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
var tableTab = $("#tableTab");
var tabSelect = $("#tabSelect");
var recruitNo = tabSelect.find("option:selected").data("recruitno");
var pstnCmmncdNm = tabSelect.find("option:selected").data("pstncmmncdnm");
var paginationContainer = $("#pagination-container");
var tableBody = $("#tableBody");
var vPillsTab = $("#v-pills-tab");
var vPillsTabContent = $("#v-pills-tabContent");

// var vPillsTab2 = $("#v-pills-tab2");
// var vPillsTabContent2 = $("#v-pills-tabContent2");

var orderNumber = 1;
var modal;
// var codingtestmodal;

var documentScreenName = "";
var codingTestName = "";

var recruitTtl = tabSelect.find("option:selected").text().trim();
$(function(){
	
	modal =  new bootstrap.Modal(document.getElementById("checkQstnAnswer"));
// 	codingtestmodal =  new bootstrap.Modal(document.getElementById("codingtestmodal"));
	
	tabSelect.on("change", function(){
			
		recruitNo = tabSelect.find("option:selected").data("recruitno");
		pstnCmmncdNm = tabSelect.find("option:selected").data("pstncmmncdnm");
// 		console.log("tabSelect : ", recruitNo, pstnCmmncdNm);
		
		recruitTtl = $(this).find("option:selected").text().trim();
		
		
        getApplyProcessList(recruitNo, pstnCmmncdNm);
        getApplicantList(recruitNo, pstnCmmncdNm, 1, 1);
        
	});
	
	tableTab.on("click",".nav-link", function(e){
		
		orderNumber = parseInt($(this).text().split("차")[0].trim());
		var clsNm = $(this).text().split("차")[1].trim();
		var text = e.target.innerText;
		var startIndex = text.indexOf("차") + 1;
		var endIndex = text.indexOf("(");
		var orderName = text.substring(startIndex, endIndex).trim();
		console.log(orderName);	
		
		if(orderName == "화상 면접"){
			
			console.log("ddd");
			tableBody.html("");
			getApplicantRtclist(recruitNo, pstnCmmncdNm, orderNumber, 1);
			getTableHeader(orderName, clsNm);
			
		}else{
			
			tableBody.html("");
			getApplicantList(recruitNo, pstnCmmncdNm, orderNumber, 1);
			getTableHeader(orderName, clsNm);
			
		}
		
		
	});
	
	paginationContainer.on("click", "a.page-link", function(e){
		
		e.preventDefault();
        var page = $(this).data("page");
// 		console.log(page);

		getApplicantList(recruitNo, pstnCmmncdNm, orderNumber, page);
		
	})
	
	
	tableBody.on("click", ".qstnCheck", function() {
		
		var id = $(this).closest("tr").find("#accountId").val();
		var accountNm = $(this).closest("tr").find("#accountNm").text();
		var age = $(this).closest("tr").find("#age").text();
		var gender = $(this).closest("tr").find("#gender").text();
		var career = $(this).closest("tr").find("#career").text();
		
		console.log(accountNm, age, gender, career);
// 		console.log(id);
		
		getQstnAnswer(id, recruitNo, pstnCmmncdNm, orderNumber, accountNm, age, gender, career)
		
    });
	
	tableBody.on("click", ".resumeCheck", function() {
		
		
		console.log("ss");
// 		var id = $(this).closest("tr").find("#accountId").val();
// 		var accountNm = $(this).closest("tr").find("#accountNm").text();
// 		var age = $(this).closest("tr").find("#age").text();
// 		var gender = $(this).closest("tr").find("#gender").text();
// 		var career = $(this).closest("tr").find("#career").text();
		var rsmNo = $(this).closest("tr").find("#rsmNo").val();
		console.log(rsmNo);
		

		getResumePdf(rsmNo);
    });
	
	tableBody.on("click", ".passBtn", function() {
		
		var entNm = "${sessionScope.SessionInfo.entNm}";
		var applyNo = $(this).closest("tr").find("#applyNo").val();
		var eachProcessSeq = $(this).closest("tr").find("#eachProcessSeq").val();
		var passYn = $(this).closest("tr").find("#passYn").val();
		var processSeq = $(this).closest("tr").find("#processSeq").val();
		var rsmNo = $(this).closest("tr").find("#rsmNo").val();
		var id = $(this).closest("tr").find("#accountId").val();

		Swal.fire({
			  title: '합격 시키겠습니까?',
		  showCancelButton: true,
		  confirmButtonText: '네',
		  cancelButtonText: '아니오'
		}).then((result) => {
		  if (result.isConfirmed) {
			  
		    updateApplicantPass(eachProcessSeq, orderNumber, recruitNo, pstnCmmncdNm, processSeq, passYn, applyNo, rsmNo);
		    
		       var message = {
		               type: 'passStatus', //카테고리
		               isPass: true, // 합격/불합격
		               rcvrId: id, // 받는사람
		               sndrId: entNm, //보내는 사람
		               recruitTtl : recruitTtl, // 공고제목
		               alramtime : new Date().toISOString()
	           };		
			    
		       wsAlarmServer.send(JSON.stringify(message));
		       
		   	   $(this).closest("tr").remove();
		   	   
		        Swal.fire({
		            title: '합격 처리되었습니다.',
		            icon: 'success',
		            confirmButtonText: '확인'
		        });
		  }
		});
		
    });
	
	tableBody.on("click", ".unpassBtn", function(){
		
		var entNm = "${sessionScope.SessionInfo.entNm}";
		var eachProcessSeq = $(this).closest("tr").find("#eachProcessSeq").val();
		
		Swal.fire({
			  title: '불합격 시키겠습니까?',
			  showCancelButton: true,
			  confirmButtonText: '네',
			  cancelButtonText: '아니오',
			  icon: 'warning'
			}).then((result) => {
			  if (result.isConfirmed) {
				  
			    updateApplicantFail(eachProcessSeq);

		       var message = {
		    		   
		               type: 'passStatus', //카테고리
		               isPass: false, // 합격/불합격
		               rcvrId: id, // 받는사람
		               sndrId: entNm, //보내는 사람
		               recruitTtl : recruitTtl, // 공고제목
		               alramtime : new Date().toISOString()
	           };		
			    
		       wsAlarmServer.send(JSON.stringify(message));


			    $(this).closest("tr").remove();
			    
			    
			   	   $(this).closest("tr").remove();
			   	   
			        Swal.fire({
			            title: '불합격 처리되었습니다.',
			            icon: 'success',
			            confirmButtonText: '확인'
			        });
			  }
			});

	});
	
	tableBody.on("click", ".codingTestCheck", function(){
		
		//accountId applyNo, entCodingtestNo --- ansrList(entCodingtestNoOrder, ctPassYn)
		
		var accountId = $(this).closest("tr").find("#accountId").val();
		var accountNm = $(this).closest("tr").find("#accountNm").text();
		
		var applyNo = $(this).closest("tr").find("#applyNo").val();
		var entCodingtestNo = $(this).closest("tr").find("#entCodingtestNo").val();
		var ansrList = $(this).closest("tr").find("#ansrList").val();
		
		var age = $(this).closest("tr").find("#age").text();
		var gender = $(this).closest("tr").find("#gender").text();
		
 		getCodingTest(accountId, accountNm, applyNo, age, gender, entCodingtestNo, ansrList);
//  		var entCodingtest = { 
//  				accountId: accountId, 
//  				applyNo : applyNo, 
//  				entCodingtestNo : entCodingtestNo
//  		};
//  		getCodingTest(accountId, accountNm, applyNo, entCodingtestNo, ansrList)
		
	});
	
	
	initTab();
	getApplyProcessList(recruitNo,pstnCmmncdNm);
	getApplicantList(recruitNo, pstnCmmncdNm, orderNumber, 1);
	
});



function initTab() {
	
	var selectedTabValue = tabSelect.find("option:selected").val();
	$(".tab-pane").removeClass("show active");
	$(".nav-link").removeClass("active");
	$(selectedTabValue).addClass("show active");
	$(selectedTabValue + " .nav-link:first").addClass("active");
	$(selectedTabValue + " .tab-pane:first").addClass("show active");

}

function getApplyProcessList(recruitNo, pstnCmmncdNm) {
	
	var tableTab = $("#tableTab");
    var tableTabHTML = "";
    var initClsNm = "";
	
	$.ajax({
		
		url : "/myPage/enterprise/getApplyProcessList",
		method : "GET",
		data : { recruitNo : recruitNo, pstnCmmncdNm : pstnCmmncdNm},
		success : function(res) {
			
			$.each(res, function(idx, list) {
				
				if(idx == 0){
					
	                tableTabHTML += 
	                '<li class="nav-item"><a class="nav-link active" data-bs-toggle="tab" data-order="'+
					list.applyProcessOrder + 
					'" href="#tab-' + list.applyProcessOrder +
					'">' + list.applyProcessOrder + '차 ' + list.clsNm +  '</a></li>';
					
					//
					initClsNm = list.clsNm;
					
				}else{
					let prsntnYmd = new Date(list.prsntnYmd);
					let year = prsntnYmd.getFullYear();
					let month = ('0' + (prsntnYmd.getMonth() + 1)).slice(-2);
					let day = ('0' + prsntnYmd.getDate()).slice(-2);
					
					console.log(prsntnYmd);
					console.log(year);
					console.log(month);
					console.log(day);
					
					if(year != 1970){
		                tableTabHTML += 
	                	'<li class="nav-item"><a class="nav-link" data-bs-toggle="tab" data-order="' +
						list.applyProcessOrder + '" href="#tab-' + list.applyProcessOrder +
						'">' + list.applyProcessOrder + '차 ' + list.clsNm + ' (' + year +'-'+month+'-'+day  + ')' + '</a></li>';
					} else{
		                tableTabHTML += 
	                	'<li class="nav-item"><a class="nav-link" data-bs-toggle="tab" data-order="' +
						list.applyProcessOrder + '" href="#tab-' + list.applyProcessOrder +
						'">' + list.applyProcessOrder + '차 ' + list.clsNm + ' ( 날짜 미정 )' + '</a></li>';
					}
					
				}
				
            });
			
			tableTab.html(tableTabHTML);
			getTableHeader(initClsNm, initClsNm);
		}
		
	});
}

function getTableHeader(orderName, clsNm) {
	
	var tableHeader = $("#tableHeader");
	var tableHeaderHTML = "";
	
	
	if(clsNm === "서류 전형"){
		
		tableHeaderHTML +=
			
			'<th scope="col" class="border-0 rounded-start" style="width: 400px;">지원자명</th>'+
			'<th scope="col" class="border-0" style="width: 180px;">나이</th>'+
			'<th scope="col" class="border-0" style="width: 180px;">성별</th>'+
			'<th scope="col" class="border-0" style="width: 180px;">경력</th>'+
			'<th scope="col" class="border-0" style="width: 180px;">이력서</th>'+
			'<th scope="col" class="border-0" style="width: 180px;">문항보기</th>'+
			'<th colspan="2" scope="col" class="border-0 rounded-end" style="width: 20%;">합격여부</th>';
			
	}else if(orderName === "화상 면접"){
		
		tableHeaderHTML +=
			
			'<th scope="col" class="border-0 rounded-start" style="width: 400px;">지원자명</th>'+
			'<th scope="col" class="border-0" style="width: 180px;">성별</th>'+
			'<th scope="col" class="border-0" style="width: 180px;">나이</th>'+
			'<th scope="col" class="border-0" style="width: 180px;">이력서</th>'+
			'<th scope="col" class="border-0" style="width: 180px;">코딩테스트문항</th>'+
			'<th scope="col" class="border-0" style="width: 180px;">자기소개서문항</th>'+
			'<th colspan="3" scope="col" class="border-0 rounded-end" style="width: 20%;">합격여부</th>';
		
		
	} else if(orderName === "Coding test"){
		
		tableHeaderHTML +=
			
			'<th scope="col" class="border-0 rounded-start" style="width: 400px;">지원자명</th>'+
			'<th scope="col" class="border-0" style="width: 180px;">나이</th>'+
			'<th scope="col" class="border-0" style="width: 180px;">성별</th>'+
			'<th scope="col" class="border-0" style="width: 180px;">맞은 문항</th>'+
			'<th scope="col" class="border-0" style="width: 180px;">제출 문항</th>'+
			'<th scope="col" class="border-0" style="width: 180px;">문항보기</th>'+
			'<th colspan="3" scope="col" class="border-0 rounded-end" style="width: 20%;">합격여부</th>';
	}
	
	tableHeader.html(tableHeaderHTML);
}

function getApplicantList(recruitNo, pstnCmmncdNm, orderNumber, page) {
	
	//여기서 orderNumber로 가져올 데이터 구분
	var tableBodyHTML = "";
	
	$.ajax({
		//컨트롤러에서 오더넘버 체크해서 가져올 쿼리 달라짐
		url : "/myPage/enterprise/getOrderList",
		method : "GET",
		data : {recruitNo : recruitNo, pstnCmmncdNm : pstnCmmncdNm, orderNumber : orderNumber, page: page},
		success : function(res) {
			updateTable(res.dataList, orderNumber);
			updatePagination(res.pagingHTML);
		}
		
	});	
	
}

function getApplicantRtclist(recruitNo, pstnCmmncdNm, orderNumber, page) {
	
	var tableBodyHTML = "";
	
	$.ajax({
		
		url : "/myPage/enterprise/getApplicantRtclist",
		method : "GET",
		data : {recruitNo : recruitNo, pstnCmmncdNm : pstnCmmncdNm, orderNumber : orderNumber, page: page},
		success : function(res) {
			console.log(res);
			
			updateRtcTable(res.dataList, orderNumber);
			updatePagination(res.pagingHTML);
		}
		
	});	
	
}

function updateRtcTable(dataList, orderNumber) {
	
	var tableBody = $("#tableBody");
	var tableBodyHTML = "";
	console.log(dataList);
	
	if(dataList.length === 0 ){
	    tableBodyHTML +=
	    	
		'<tr class="text-center">'+
			'<td colspan="7">'+
					'<h6 class="bold""> 채용 지원자가 존재하지 않습니다.</h6>'+
			'</td>'+
		'</tr>';
		 tableBody.html(tableBodyHTML);
	}
	
		
	$.each(dataList, function(idx, list) {
		
    	var birthDate = new Date(list.birthYmd);
        var today = new Date();
        var age = today.getFullYear() - birthDate.getFullYear();
		
        if (today.getMonth() < birthDate.getMonth() || 
            (today.getMonth() === birthDate.getMonth() && today.getDate() < birthDate.getDate())) {
            age--;
        }
        
        var sex = "";
        if(list.gender === 'M')
        {sex = "남자";}
        else{sex = "여자";}
        
        if(idx == 0){
        	
        }
        
        tableBodyHTML +=
       	
		'<tr>'+
			'<input type="hidden" id="accountId" value="'+list.accountId+'">'+
			'<input type="hidden" id="applyNo" value="'+list.applyNo+'">'+
			'<input type="hidden" id="eachProcessSeq" value="'+list.eachProcessNo+'">'+
			'<input type="hidden" id="processSeq" value="'+list.processSeq+'">'+
			'<input type="hidden" id="passYn" value="'+list.passYn+'">'+
			'<input type="hidden" id="rsmNo" value="'+list.rsmNo+'">'+
			'<input type="hidden" id="entCodingtestNo" value="'+list.entCodingtestNo+'">'+
			'<td>'+
				'<div>'+
					'<div>'+
						'<h6 class="text-center" id="accountNm">'+list.accountNm+'</h6>'+
// 						'<span class="text-body small" style="margin-left: 5px;"><i class="fas fa-fw fa-map-marker-alt me-1 mt-1"></i>'+list.accountAddr1+'</span>'+
					'</div>'+
				'</div>'+
			'</td>'+
			'<td>'+
				'<h6 class="text-center" id="gender">'+sex+'</h6>'+
			'</td>'+
			'<td>'+
				'<h6 class="text-center" id="age">만 '+age+'세</h6>'+
			'</td>'+
			'<td>'+
				'<h6 class="text-center">'+
					'<i class="bi bi-file-earmark-pdf resumeCheck" style="font-size: 30px;"></i>'+
				'</h6>'+
			'</td>'+
			
			'<td>'+
				'<h6 class="text-center">'+
					'<i class="bi bi-clipboard-check codingTestCheck" style="font-size: 30px;"></i>'+
				'</h6>'+
			'</td>'+
			'<td>'+
			'<h6 class="text-center">'+
				'<i class="bi bi-clipboard-check qstnCheck" style="font-size: 30px;"></i>'+
			'</h6>'+
			'</td>'+
			'<td class="text-center">'+
				'<button type="button" class="btn btn-success passBtn">합격</button>'+
			'</td>'+
				
			'<td class="text-center">'+
				'<button type="button" class="btn btn-danger unpassBtn">불합격</button>'+
			'</td>'+
		'</tr>';
		
        tableBody.html(tableBodyHTML);
        
	});
	
}


function updateTable(dataList, orderNumber){
	
	var tableBody = $("#tableBody");
	var tableBodyHTML = "";
	
	console.log(dataList);
	if(dataList.length === 0 ){
	    tableBodyHTML +=
	    	
		'<tr class="text-center">'+
			'<td colspan="7">'+
					'<h6 class="bold""> 채용 지원자가 존재하지 않습니다.</h6>'+
			'</td>'+
		'</tr>';
		 tableBody.html(tableBodyHTML);
	}
	
	if(orderNumber == 1) {
		
		$.each(dataList, function(idx, list) {
			
	    	var birthDate = new Date(list.birthYmd);
	        var today = new Date();
	        var age = today.getFullYear() - birthDate.getFullYear();
			
	        if (today.getMonth() < birthDate.getMonth() || 
	            (today.getMonth() === birthDate.getMonth() && today.getDate() < birthDate.getDate())) {
	            age--;
	        }
	        
	        var sex = "";
	        if(list.gender === 'M')
	        {sex = "남자";}
	        else{sex = "여자";}
	        
	        if(idx == 0){
	        	
	        }
	        
	        tableBodyHTML +=
	       	
			'<tr>'+
				'<input type="hidden" id="accountId" value="'+list.accountId+'">'+
				'<input type="hidden" id="applyNo" value="'+list.applyNo+'">'+
				'<input type="hidden" id="eachProcessSeq" value="'+list.eachProcessNo+'">'+
				'<input type="hidden" id="processSeq" value="'+list.processSeq+'">'+
				'<input type="hidden" id="passYn" value="'+list.passYn+'">'+
				'<input type="hidden" id="rsmNo" value="'+list.rsmNo+'">'+
				'<td>'+
					'<div>'+
						'<div>'+
							'<h6 class="text-center" id="accountNm">'+list.accountNm+'</h6>'+
	// 						'<span class="text-body small" style="margin-left: 5px;"><i class="fas fa-fw fa-map-marker-alt me-1 mt-1"></i>'+list.accountAddr1+'</span>'+
						'</div>'+
					'</div>'+
				'</td>'+
				'<td>'+
					'<h6 class="text-center" id="age">만 '+age+'세</h6>'+
				'</td>'+
				'<td>'+
					'<h6 class="text-center" id="gender">'+sex+'</h6>'+
				'</td>'+
				'<td>'+
					'<h6 class="text-center" id="career">'+list.rsmCareerYear+'</h6>'+
				'</td>'+
				'<td>'+
					'<h6 class="text-center">'+
						'<i class="bi bi-file-earmark-pdf resumeCheck" style="font-size: 30px;"></i>'+
					'</h6>'+
				'</td>'+
				
				'<td>'+
					'<h6 class="text-center">'+
						'<i class="bi bi-clipboard-check qstnCheck" style="font-size: 30px;"></i>'+
					'</h6>'+
				'</td>'+
				
				'<td class="text-center">'+
					'<button type="button" class="btn btn-success passBtn">합격</button>'+
				'</td>'+
					
				'<td class="text-center">'+
					'<button type="button" class="btn btn-danger unpassBtn">불합격</button>'+
				'</td>'+
			'</tr>';
			
	        tableBody.html(tableBodyHTML);
	        
		});
	}
	
	else {
		//코딩테스트 결과 동적으로 뿌리기
		$.each(dataList, function(idx, list) {
			
	    	var birthDate = new Date(list.birthYmd);
	        var today = new Date();
	        var age = today.getFullYear() - birthDate.getFullYear();
			
	        if (today.getMonth() < birthDate.getMonth() || 
	            (today.getMonth() === birthDate.getMonth() && today.getDate() < birthDate.getDate())) {
	            age--;
	        }
	        
	        var sex = "";
	        if(list.gender === 'M')
	        {sex = "남자";}
	        else{sex = "여자";}
	        
	        if(idx == 0){
	        	
	        }
	        //코테 제출 결과를 보기 위해선 문항보기 클릭시 
	        //ecqd, ecqa로 가져오기(accountId, entCodingtestNo, entCodingtestNoOrder로 가쟈오기)
	        
	    	//account_id, account_nm, birth_ymd, apply_no, each_process_no
			// process_seq, recruit_no, each_order, pstn_cmmncd_nm, pass_yn,
			// correctCount, submitCount, entCodingtestNo, 
			// ansrList[ent_codingtest_no_order, ct_pass_yn]
	        
	        tableBodyHTML +=
	        	
			'<tr>'+
				'<input type="hidden" id="accountId" value="'+list.accountId+'">'+
				'<input type="hidden" id="applyNo" value="'+list.applyNo+'">'+
				'<input type="hidden" id="eachProcessSeq" value="'+list.eachProcessNo+'">'+
				'<input type="hidden" id="processSeq" value="'+list.processSeq+'">'+
				'<input type="hidden" id="passYn" value="'+list.passYn+'">'+
				'<input type="hidden" id="rsmNo" value="'+list.rsmNo+'">'+
				'<input type="hidden" id="entCodingtestNo" value="'+list.entCodingtestNo+'">'+
				'<input type="hidden" id="ansrList" value="'+list.ansrList+'">'+
				//accountId applyNo, entCodingtestNo --- ansrList(entCodingtestNoOrder, ctPassYn)
				'<td>'+
					'<div>'+
						'<div>'+
							'<h6 class="text-center" id="accountNm">'+list.accountNm+'</h6>'+
	// 						'<span class="text-body small" style="margin-left: 5px;"><i class="fas fa-fw fa-map-marker-alt me-1 mt-1"></i>'+list.accountAddr1+'</span>'+
						'</div>'+
					'</div>'+
				'</td>'+
				'<td>'+
					'<h6 class="text-center" id="age">만 '+age+'세</h6>'+
				'</td>'+
				'<td>'+
					'<h6 class="text-center" id="gender">'+sex+'</h6>'+
				'</td>'+
				'<td>'+
					'<h6 class="text-center" id="career">' +  list.correctCount + "/" + 4  + '</h6>'+
				'</td>'+
				'<td>'+
					'<h6 class="text-center" id="career">' +  list.submitCount + "/" + 4  + '</h6>'+
				'</td>'+
				'<td>'+
					'<h6 class="text-center">'+
						'<i class="bi bi-file-earmark-pdf codingTestCheck" style="font-size: 30px;"></i>'+
					'</h6>'+
				'</td>'+
				
				'<td class="text-center">'+
					'<button type="button" class="btn btn-success passBtn">합격</button>'+
				'</td>'+
					
				'<td class="text-center">'+
					'<button type="button" class="btn btn-danger unpassBtn">불합격</button>'+
				'</td>'+
			'</tr>';
			
	        tableBody.html(tableBodyHTML);
	        
		});
		
		
	}
	
}

function updatePagination(pagingHTML) {
	
	paginationContainer.html(pagingHTML);
	
}

function getQstnAnswer(id, recruitNo, pstnCmmncdNm, orderNumber, accountNm, age, gender, career) {
	
	
	
	var qstnAnswer = { 
			
			id: id, 
			recruitNo : recruitNo, 
			pstnCmmncdNm : pstnCmmncdNm , 
			orderNumber : orderNumber
			
	};
	
	
	$.ajax({
	
		url : "/myPage/enterprise/getQstnAnswer",
		method : "POST",
		contentType : "application/json; charset=utf-8",
		data : JSON.stringify(qstnAnswer),
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
        },
        success: function (res) {
            var orderListHTML = "";
            var qstnAnswerListHTML = "";
            
            orderListHTML +=
         	'<div class="container my-3">'+
            '<div class="row justify-content-center">'+
                '<div class="col-md-8"  style="width: 100%;">'+
                    '<div class="card mb-3 shadow">'+
                        '<div class="card-body">'+
                            '<h6 class="card-title mb-3 fs-6">이름: <span class="text-secondary fs-5">'+accountNm+'</span></h6>'+
                            '<hr>'+
                            '<h6 class="card-title mb-3 fs-6">나이: <span class="text-secondary fs-5">'+age+'</span></h6>'+
                            '<hr>'+
                            '<h6 class="card-title mb-3 fs-6">성별: <span class="text-secondary fs-5">'+gender+'</span></h6>'+
                            '<hr>'+
                            '<h6 class="card-title mb-3 fs-6">경력: <span class="text-secondary fs-5">'+career+'년</span></h6>'+
                        '</div>'+
                    '</div>'+
                '</div>'+
            '</div>'+
       		'</div>';

		
            $.each(res, function(idx, list){
                    orderListHTML +=
                        '<a class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill" href="#v-pills-'+idx+'" role="tab" aria-controls="v-pills-home" aria-selected="true" style="display: none;"></a>';
                    qstnAnswerListHTML +=
                        '<div class="tab-pane fade show active" id="v-pills-'+idx+'" role="tabpanel" aria-labelledby="v-pills-messages-tab">'+
                            '<div class="container mt-2">'+
                                '<div id="qstn" class="p-3 mb-2 border-primary" style="font-weight: 300; font-size: 20px;">'+list.ENT_INTRO_QSTN_CN+'</div>'+
                                '<div id="answer" class="p-3 bg-light rounded-1 border border-success" style="font-weight: 600;">'+list.ENT_INTRO_QSTN_ANSR+'</div>'+
                            '</div>'+
                        '</div>';
            });

            vPillsTab.html(orderListHTML);
            vPillsTabContent.html(qstnAnswerListHTML);
        }
		
	});
	
	modal.show();
	
}

function getResumePdf(rsmNo){
	
	$.ajax({
		
		url : "/myPage/enterprise/getResumePdf",
		method : "GET",
		data : {rsmNo : rsmNo},
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
        },
		success : function(res) {
			
// 			console.log(JSON.parse(res.experience));
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
			doc.text("보 유 기 술", 15, 75, { align: 'left' });
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


function updateApplicantPass(eachProcessSeq, orderNumber, recruitNo, pstnCmmncdNm, processSeq, passYn, applyNo, rsmNo) {
	
	var obj = {
			
			eachProcessSeq : eachProcessSeq,
			orderNumber : orderNumber,
			recruitNo : recruitNo,
			pstnCmmncdNm : pstnCmmncdNm,
			processSeq : processSeq,
			passYn : passYn,
			applyNo : applyNo,
			rsmNo : rsmNo
	}
	
	$.ajax({
		
		url:"/myPage/enterprise/updateApplicantPass",
		method : "POST",
		data : JSON.stringify(obj),
		contentType : "application/json; charset=utf-8",
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
        },
		success : function(res) {
			
			if(res === "SUCCESS"){
				  Swal.fire({
				    title: '합격되었습니다!',
				    icon: 'success',
				    confirmButtonText: '확인'
				  });
			}else if(res === "FINAL"){
				Swal.fire({
				    title: '최종합격되었습니다!',
				    icon: 'success',
				    confirmButtonText: '확인'
				  });
			}else if(res === "FAILED"){
				Swal.fire({
				    title: '서버에러! 다시 시도해주세요',
				    icon: 'error',
				    confirmButtonText: '확인'
				  });
			}
		}
	});
	
}

function updateApplicantFail(eachProcessSeq){
	
	var obj = { eachProcessSeq : eachProcessSeq }
	
	$.ajax({
		
		url:"/myPage/enterprise/updateApplicantFail",
		method: "POST",
		data : JSON.stringify(obj),
		contentType : "application/json; charset=utf-8",
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
        },
        success : function(res) {
        	
        	if(res === "FAILURE"){
        		  Swal.fire({
        		    title: '불합격 처리되었습니다.',
        		    icon: 'error',
       		    confirmButtonText: '확인'
       		  });
       		}
        }
	
	});
	
}






function getCodingTest(accountId, accountNm, applyNo, age, gender, entCodingtestNo, ansrList){
	
	//accountId, accountNm, applyNo, entCodingtestNo, ansrList
	//accountId, applyNo, entCodingtestNo 로만 조회 하기 가능
// 	alert("dfadfdsfdsf");
	var codingtestResult;
	
	var entCodingtest = { 
			accountId: accountId, 
			applyNo : applyNo, 
			entCodingtestNo : entCodingtestNo
	};
		
	$.ajax({
		url:"/myPage/enterprise/getCodingTest.do",
		method: "POST",
		data : JSON.stringify(entCodingtest),
		contentType : "application/json; charset=utf-8",
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
        },
        success : function(res) {
        	
        	codingtestResult = res;
        	var orderListHTML = "";
            var codingtestHtml = "";
            orderListHTML +=
             	'<div class="container my-3">'+
            	    '<div class="row justify-content-center">'+
            		'<div class="col-md-8"  style="width: 100%;">'+
            		    '<div class="card mb-3 shadow">'+
            		'<div class="card-body">'+
            		    '<h6 class="card-title mb-3 fs-6">이름: <span class="text-secondary fs-5">'+accountNm+'</span></h6>'+
            		    '<hr>'+
            		    '<h6 class="card-title mb-3 fs-6">나이: <span class="text-secondary fs-5">'+ age+'</span></h6>'+
            		    '<hr>'+
            		    '<h6 class="card-title mb-3 fs-6">성별: <span class="text-secondary fs-5">'+ gender +'</span></h6>'+
            		    '<hr>'+
            		'</div>'+
            		    '</div>'+
            		'</div>'+
            		    '</div>'+
                '</div>';
                
                
                if(res == null || res.length == 0) {
                	codingtestHtml = 
                		'<div class="tab-pane fade show active" id="v-pills" role="tabpanel" aria-labelledby="v-pills-messages-tab">'+
                        '<div class="container mt-2">'+
                            '<div id="answer" class="p-3 bg-light rounded-1 border border-success" style="font-weight: 600;">제출내역이 없습니다</div>'+
                        '</div>'+
                    '</div>';
                } else {
                	$.each(res, function(idx, list){
// 	                	codingtestResult
// 	 					qstnTtl qstnAnsr qstnCn
                        codingtestHtml +=
                        '<div class="tab-pane fade show active" id="v-pills-'+ idx+'" role="tabpanel" aria-labelledby="v-pills-messages-tab">'+
                            '<div class="container mt-2">'+
                                '<div id="qstn" class="p-3 mb-2 border-primary" style="font-weight: 300; font-size: 20px;">'+list.qstnCn +'</div>'+
                                '<div id="answer" class="p-3 bg-light rounded-1 border border-success" style="font-weight: 600;"><pre><code class="code-block">'+list.qstnAnsr+'</code></pre></div>'+
                            '</div>'+
                        '</div>';
					console.log(list)
           		 });		
                }
              
			console.log(codingtestHtml);
			
            vPillsTab.html(orderListHTML);
            vPillsTabContent.html(codingtestHtml);
        }
	
	});
	
	modal.show();
}
























</script>
