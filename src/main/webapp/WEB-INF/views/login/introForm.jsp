<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<body>
<sec:authorize access="isAuthenticated()">
   <sec:authentication property="principal.account.accountId" var="aId"/>
</sec:authorize>
<main>
    <section class="pb-0 py-lg-5">
        <div class="container">
        
            <div class="row">
                <div class="col-md-4">
                    <div class="d-flex justify-content-flex-start">
<!--                         <button id="settingBtn" class="btn btn-outline-primary d-flex align-items-center"> -->
                        <button id="testBtn" class="btn btn-outline-primary d-flex align-items-center">
                            <i class="bi bi-files">불러오기</i>
                        </button>&nbsp;
                        <button id="saveBtn" class="btn btn-outline-secondary d-flex align-items-center">
	                        <i class="bi bi-save">임시저장</i>
	                    </button>
<!-- 	                    <button type="button" id="testBtn" style="background-color: white; float: right; border: 0px; position: relative;">TEST</button> -->
<!--                         <button id="newIntroBtn" class="btn btn-outline-primary d-flex align-items-center"> -->
<!--                             <i class="bi bi-file-earmark-plus">새자소서</i> -->
<!--                         </button>&nbsp; -->
<!--                         <button id="deleteIntroBtn" class="btn btn-outline-danger d-flex align-items-center"> -->
<!--                             <i class="bi bi-file-earmark-x">삭제</i> -->
<!--                         </button> -->
                    </div>
                </div>
                <div class="col-sm-6">
<!--                     <button id="saveBtn" class="btn btn-outline-secondary d-flex align-items-center"> -->
<!--                         <i class="bi bi-save">저장</i> -->
<!--                     </button> -->
                </div>
<!--                 <div class="col-sm-2 text-right"> -->
<!--                     <div class="d-flex justify-content-end"> -->
<!--                         <input type="button" value="제출"> -->
<!--                     </div> -->
<!--                 </div> -->
                
                <div class="col-sm-2 text-right">
				    <div class="d-flex justify-content-end">
				        <button id="submitBtn" class="btn btn-outline-success">
				            <i class="bi bi-check"></i>
				            <span class="ms-2">제출</span>
				        </button>
				    </div>
				</div>
                
<!--                 <form action="/recruit/insertAnswer.do" method="post" id="insertAnswer"> -->
                <!-- Main content START -->
                <div class="col-lg-12">
                    <div class="card shadow rounded-2 p-0">
                        <!-- Tabs START -->
                        <div class="card-header border-bottom px-4 py-3">
                            <ul class="nav nav-pills nav-tabs-line py-0" id="course-pills-tab" role="tablist">
                                <!-- Tab items START -->
                                <c:choose>
                                    <c:when test="${empty dsnctList}">
                                        <li class="nav-item me-2 me-sm-1" role="presentation">
                                            <button class="nav-link mb-2 mb-md-0 active" 
                                                    id="course-pills-tab-1" 
                                                    data-bs-toggle="pill" 
                                                    data-bs-target="#course-pills-1" 
                                                    type="button" 
                                                    role="tab" 
                                                    aria-controls="course-pills-1" 
                                                    aria-selected="true">
                                                1
                                            </button>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach items="${dsnctList}" var="list" varStatus="loop">
                                            <li class="nav-item me-2 me-sm-1" role="presentation">
                                                <button class="nav-link mb-2 mb-md-0 ${loop.first ? 'active' : ''}" 
                                                        id="course-pills-tab-${loop.index + 1}" 
                                                        data-bs-toggle="pill" 
                                                        data-bs-target="#course-pills-${loop.index + 1}" 
                                                        type="button" 
                                                        role="tab" 
                                                        aria-controls="course-pills-${loop.index + 1}" 
                                                        aria-selected="${loop.first ? 'true' : 'false'}">
                                                    ${loop.index + 1}
                                                </button>
                                                
                                                <input id="entIntroQstnNo" type="hidden" value="${list.entIntroQstnNo }"/>
                                            </li>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                                <!-- Tab items END -->
                            </ul>
                        </div>
                        <!-- Tabs END -->
                        <!-- Tab contents START -->
                        <div class="card-body p-4">
                            <div class="tab-content pt-2" id="course-pills-tabContent">
                                <!-- Card contents START -->
                                <c:choose>
                                    <c:when test="${empty dsnctList}">
                                        <div class="tab-pane fade show active" 
                                            id="course-pills-1" 
                                            role="tabpanel" 
                                            aria-labelledby="course-pills-tab-1">
                                            <!-- Card content START -->
                                            <h5 class="mb-3">제목</h5>
                                            <textarea name="problem" 
                                                    id="problem1" 
                                                    style="width: 100%; overflow: hidden; overflow-wrap: break-word; border: none; resize: none;" 
                                                    cols="auto" 
                                                    rows="3"  
                                                    placeholder="답변을 입력하세요"></textarea>
                                            <div style="text-align: right;">
<!--                                                 <input type="button" value="오류신고"></input> -->
                                            </div>
                                            <br/><hr/>
                                            <textarea style="width: 100%; height: 200px; resize: vertical; border: none;" 
                                                    placeholder="답변을 입력하세요"></textarea>
                                            <!-- Card content END -->
                                            <div style="display: flex; align-items: center;">
                                                <div style="width: 500px;">
                                                    0 / 1000 (글자 수, 공백 포함)
                                                </div>
                                                <div class="progress progress-percent-bg" style="flex-grow: 1; margin-left: 10px;">
                                                    <div class="progress-bar progress-bar-striped bg-info" 
                                                        role="progressbar" 
                                                        style="width: 50%" 
                                                        aria-valuenow="50" 
                                                        aria-valuemin="0" 
                                                        aria-valuemax="100">
                                                        <span class="progress-percent">80%</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach items="${dsnctList}" var="list" varStatus="loop">
                                            <div class="tab-pane fade ${loop.first ? 'show active' : ''}" 
                                                id="course-pills-${loop.index + 1}" 
                                                role="tabpanel" 
                                                aria-labelledby="course-pills-tab-${loop.index + 1}">
                                                <!-- Card content START -->
                                                <h5 class="mb-3" style="color: black; font-size: 18px; ">[${recruit.entNm}]</h5>
                                                <h5 class="mb-3" style="color: black; font-size: 16px; ">${recruit.recruitTtl}</h5>
                                                <textarea name="problem"
                                                        id="problem${loop.index + 1}" 
                                                        style="user-select: none; margin-top:10px; width: 100%; overflow: hidden; overflow-wrap: break-word; border: none; border-bottom:1px solid lightgray; resize: none; font-weight:600; font-size: 20px; background-color: white;" 
                                                        cols="auto" 
                                                        rows="auto"  
                                                        placeholder="${list.entIntroQstnCn}" 
                                                        disabled>${list.entIntroQstnCn}</textarea>
                                                        
                                                        
                                                        
                                                <div style="text-align: right;">
<!--                                                     <input type="button" value="오류신고"></input> -->
                                                </div>
                                                <input id="entIntroQstnDsnctSeq" type="hidden" value="${list.entIntroQstnDsnctSeq }"/>
                                                <br/>
                                                
                                                <textarea class="textBox" 
                                                        style="margin-bottom:20px; width: 100%; height: 300px; resize: none; border: 1px solid lightgray; background-color: white;" 
                                                        maxlength="1000" 
                                                        placeholder="답변을 입력하세요"></textarea>
                                                <!-- Card content END -->
                                                <div style="display: flex; align-items: center;">
                                                    <div class="textCount" style="width: 500px;"></div>
                                                    <div class="progress progress-percent-bg" style="flex-grow: 1;margin-left: 10px;">
                                                        <div class="progress-bar progress-bar-striped bg-info" 
                                                            role="progressbar" 
                                                            aria-valuemin="0" 
                                                            aria-valuemax="100">
                                                            <span class="progress-percent" style="margin-right: -10px"></span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                                <!-- Card contents END -->
                            </div>
                        </div>
                        <!-- Tab contents END -->
                    </div>
                </div>
                <!-- Main content END -->
<%--                 <sec:csrfInput/> --%>
<!--         		</form> -->
            </div><!-- Row END -->
        <form id="myPageForm" action="/myPage/member/recruitCheck.do" method="post">
        	<input type="hidden" name="accounId" value="${aId }">
        <sec:csrfInput/>
        </form>
        </div>
    </section>
</main>
</body>
<script>
$(function(){
// 	console.log("${aId}");
	var testBtn = $("#testBtn");
	testBtn.on("click", function(){
// 		console.log("!@#");
		var ans1 = "[업무를 효율적으로 만드는 IT 개발자]\n이전부터 개발자로서 주도적으로 업무를 수행하며 직무와 관련된 커리어를 쌓을 수 있고, 회사와 함께 성장해 나갈 수 있는 회사에서 일하기를 꿈꿔왔습니다. 우아한 형제들은 개발자들에 대한 투자를 아끼지 않으며 뛰어나신 개발 능력을 갖춘 개발자 분들이 많다고 들었습니다. 그뿐만 아니라 체계적인 신입 교육 제도를 갖추고 있어 빠르게 업무능력을 키우고 업무 관련 프로젝트를 진행할 수 있다고 생각했습니다. 이를 통해 우아한 형제들에서 일하게 된다면 주변의 뛰어난 선후배들과 함께 개발 능력에 대한 전문성을 빠르게 키울 수 있을 것이라 생각하여 지원하게 되었습니다. 또한, 개발자로서 주도적으로 프로젝트를 진행하며 업무 역량을 키우고 회사와 함께 성장하고 싶습니다.";
		var ans2 = "[목표는 크게 잡되 조급해하지 말자]\n살면서 여러 가지 목표가 있지만 커리어 상에서의 목표는 한 회사에서 임원의 위치까지 도달하는 것입니다. 학창 시절부터 달성하지 못한다 하더라도 목표는 최대한 높게 잡고 차근차근 지금 해야 할 일을 최선을 다해 하는 것이 삶의 가치관이었습니다. 고등학교 시절에는 3년 동안 하루도 빠짐없이 스터디 플래너를 작성하며 계획적인 공부습관을 기를 수 있었고, 이를 통해 큰 슬럼프를 겪지 않으면서 목표로 하던 대학교 진학에 성공했던 경험이 있습니다. 이러한 경험을 통해 큰 성취감과 자신감을 얻을 수 있었고, 지금까지 매사에 계획적인 삶을 사는 밑바탕이 되었습니다.";
		var tab1 = $(".tab-pane")[0];
		var tab2 = $(".tab-pane")[1];
		var textBox1 = $(tab1).find(".textBox");
		var textBox2 = $(tab2).find(".textBox");
		textBox1.val(ans1);
		textBox2.val(ans2);
	});
	
	var aId = "${aId}";
    var newIntroBtn = $("#newIntroBtn");
    var deleteIntroBtn = $("#deleteIntroBtn");

    newIntroBtn.on("click", function(){
        var tabList = $("#course-pills-tab");
        var tabCounter = tabList.children().length + 1; // 현재 탭 개수 + 1

        // 탭 아이콘 추가
        var newTab = $("<li class='nav-item me-2 me-sm-1' role='presentation'>" +
            "<button class='nav-link mb-2 mb-md-0' id='course-pills-tab-" + tabCounter + "' data-bs-toggle='pill' data-bs-target='#course-pills-" + tabCounter + "' type='button' role='tab' aria-controls='course-pills-" + tabCounter + "' aria-selected='false'>" + tabCounter + "</button>" +
            "</li>");
        tabList.append(newTab);

        // 탭에 해당하는 내용 추가
        var tabContent = $("#course-pills-tabContent");
        var newContent = $("<div class='tab-pane fade' id='course-pills-" + tabCounter + "' role='tabpanel' aria-labelledby='course-pills-tab-" + tabCounter + "'>" +
       	    "<h5 class='mb-3'>제목</h5>" +
       	    "<textarea name='problem' id='problem" + tabCounter + "' style='width: 100%; overflow: hidden; overflow-wrap: break-word; border: none; resize: none;' cols='auto' rows='5' placeholder='답변을 입력하세요'></textarea>" +
       	    "<div style='text-align: right;'>" +
//        	    "<input type='button' value='오류신고'>" +
       	    "</div>" +
       	    "<br/><hr/>" +
       	    "<textarea class='textBox' style='width: 100%; height: 150px; resize: none; border: none;' maxlength='1000' placeholder='답변을 입력하세요'></textarea>" +
       	    "<div style='display: flex; align-items: center;'>" +
       	    "<div class='textCount' style='width: 500px;'></div>" +
       	    "<div class='progress progress-percent-bg' style='flex-grow: 1;margin-left: 10px;'>" +
       	    "<div class='progress-bar progress-bar-striped bg-info' role='progressbar' style='width: 50%' aria-valuenow='50' aria-valuemin='0' aria-valuemax='100'><span class='progress-percent' style='margin-right: -10px'></span></div>" +
       	    "</div>" +
       	    "</div>" +
       	    "</div>");
       	tabContent.append(newContent);

        // 새로 추가된 탭 활성화
        newTab.find("button").tab('show');
        initContent();
    });
    
    deleteIntroBtn.on("click", function(){
        var activeTab = $("#course-pills-tab .nav-link.active"); // 현재 활성화된 탭을 찾습니다.
        var tabItem = activeTab.closest("li.nav-item"); // 현재 탭 아이템을 찾습니다.
        var tabId = activeTab.attr("id"); // 활성화된 탭의 ID를 가져옵니다.
        var tabNumber = tabId.substring(tabId.lastIndexOf("-") + 1); // "-" 뒤의 번호를 가져옵니다.
//         console.log("삭제할 탭 번호:", tabNumber);

        // 삭제할 탭과 해당 내용을 삭제합니다.
        $("#course-pills-" + tabNumber).remove(); // 탭 내용 삭제
        tabItem.remove(); // 탭 삭제

        // 삭제된 탭 다음 탭을 활성화합니다.
        var nextTabNumber = parseInt(tabNumber) + 1;
        if (nextTabNumber > 1 && nextTabNumber <= $("#course-pills-tab").children().length) {
            $("#course-pills-tab-" + nextTabNumber).tab("show");
        } else {
            var prevTabNumber = parseInt(tabNumber) - 1;
            if (prevTabNumber >= 1) {
                $("#course-pills-tab-" + prevTabNumber).tab("show");
            }
        }

        // 남은 탭의 번호를 다시 조정합니다.
        $("#course-pills-tab .nav-link").each(function(index){
            $(this).text(index + 1);
            var targetId = $(this).attr("data-bs-target");
            var newTargetId = targetId.replace(/[^-]+$/, index + 1);
            $(this).attr("id", "course-pills-tab-" + (index + 1));
            $(this).attr("data-bs-target", newTargetId);
            $(this).attr("aria-controls", newTargetId);
            $(targetId).attr("id", "course-pills-" + (index + 1));
            $(targetId).attr("aria-labelledby", "course-pills-tab-" + (index + 1));
        });
        initContent();
    });


    
    var insertAnswer = $("#insertAnswer");
    var saveBtn = $("#saveBtn");
    var settingBtn = $("#settingBtn");
    
    // 저장하기 버튼
    saveBtn.on("click", function(){
//         console.log("!!!!");
        
        // serializeAllTabs 함수를 호출하여 모든 탭의 textarea 값을 리스트로 가져옵니다.
        var dataList = serializeAllTabs();
// 		console.log(dataList);
// 		console.log("!!!!! " +dataList);
        
        // AJAX 요청을 보냅니다.
        $.ajax({
            type: "POST",
            url: "/recruit/insertAnswer.do", // 서버 URL
            data: JSON.stringify(dataList), // 리스트를 JSON 문자열로 변환하여 전송
            processData: false,
            beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
            },
            contentType: "application/json",
            success: function(response) {
                // 성공적으로 요청을 처리한 경우 실행할 코드
                console.log("요청이 성공적으로 처리되었습니다.", response);
                // 여기에 성공 메시지 표시 등 추가 작업을 할 수 있습니다.
				Swal.fire('저장 성공헀습니다.');
            },
            error: function(xhr, status, error) {
                // 요청을 처리하는 동안 오류가 발생한 경우 실행할 코드
                console.error("오류 발생:", error);
                // 여기에 오류 메시지 표시 등 추가 작업을 할 수 있습니다.
                Swal.fire('저장 실패했습니다.');
            }
        });
    });
    

    function serializeAllTabs() {
        var dataList = [];

        // 각 탭의 정보를 수집하여 폼 데이터를 생성합니다.
        document.querySelectorAll("#course-pills-tabContent .tab-pane").forEach(function(tabPane) {
            var formData = new FormData();
            var tabContentId = tabPane.id;
            var tabIndex = tabContentId.split("-")[2];
            var entIntroQstnDsnctSeq = tabPane.querySelector("#entIntroQstnDsnctSeq").value;
//             var entIntroQstnNo = document.getElementById("entIntroQstnNo").value;
            var entIntroQstnCn = tabPane.querySelector("textarea").getAttribute("placeholder");
            var textBoxValue = tabPane.querySelector(".textBox").value;
//             console.log("entIntroQstnDsnctNo : ", entIntroQstnDsnctSeq);
//             console.log("entIntroQstnCn : ", entIntroQstnCn);
//             console.log("textBoxValue : ", textBoxValue);
            
            // 필요한 값들을 FormData에 추가합니다.
            var data = {
            	accountId : aId,
// 	            tabIndex: tabIndex,
	            entIntroQstnDsnctNo: entIntroQstnDsnctSeq,
// 	            entIntroQstnSeq: entIntroQstnSeq,
	            entIntroQstnCn: entIntroQstnCn,
	            entIntroQstnAnsr: textBoxValue
        	};

            // FormData를 리스트에 추가합니다.
            dataList.push(data);
        });

        return dataList;
    }
    
    
    // 불러오기 버튼
    settingBtn.on("click", function(){
    	
    	var dataList = serializeset();
    	
    	$.ajax({
            type: "POST",
            url: "/recruit/settingAnsr.do", // 서버 URL
            data: JSON.stringify(dataList), // 리스트를 JSON 문자열로 변환하여 전송
            processData: false,
            beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
            },
            contentType: "application/json",
            success: function(response) {
                // 성공적으로 요청을 처리한 경우 실행할 코드
                console.log("요청이 성공적으로 처리되었습니다.", response);
                // 여기에 성공 메시지 표시 등 추가 작업을 할 수 있습니다.
// 				alert("불러오기 성공헀습니다."); 
                for (var i = 0; i < response.length; i++) {
                	
			        var entIntroQstnDsnctSeq = response[i].entIntroQstnDsnctNo;
			        var entIntroQstnCn = response[i].entIntroQstnCn;
			        var entIntroQstnAnsr = response[i].entIntroQstnAnsr;
			
			        $(".tab-pane").each(function() {
			            var tab = $(this); // 현재 탭
			            var entIntroQstnDsnctSeq = tab.find("input#entIntroQstnDsnctSeq").val(); // 현재 탭의 no 문자열로 가져와짐
			            var seq = parseInt(entIntroQstnDsnctSeq);

			            // response에서 해당하는 답변 찾기
			            for (var j = 0; j < response.length; j++) {
			                var responseItem = response[j]; // response의 각 항목
			                // 현재 탭의 문제와 답변이 일치하고 no가 같으면
			                if (responseItem.entIntroQstnCn === entIntroQstnCn && responseItem.entIntroQstnDsnctNo === seq) {
			                    // 현재 탭에서 .textBox 클래스를 가진 textarea의 값을 변경
			                    tab.find(".textBox").val(responseItem.entIntroQstnAnsr);
			                    break; // 찾았으므로 반복문 종료
			                }
			            }
			        });
			    }
                
                
            },
            error: function(xhr, status, error) {
                // 요청을 처리하는 동안 오류가 발생한 경우 실행할 코드
                console.error("오류 발생:", error);
                // 여기에 오류 메시지 표시 등 추가 작업을 할 수 있습니다.
                alert("불러오기 실패했습니다."); 
            }
        });
     

    });
    
    function serializeset() {   
        var dataList = [];
     	// 각 탭의 정보를 수집하여 폼 데이터를 생성합니다.
        document.querySelectorAll("#course-pills-tabContent .tab-pane").forEach(function(tabPane) {
            var formData = new FormData();
            var entIntroQstnDsnctSeq = tabPane.querySelector("#entIntroQstnDsnctSeq").value;
            var entIntroQstnCn = tabPane.querySelector("textarea").getAttribute("placeholder");
//             console.log("entIntroQstnDsnctNo : ", entIntroQstnDsnctSeq);
//             console.log("entIntroQstnCn : ", entIntroQstnCn);
//             console.log("textBoxValue : ", textBoxValue);
            
            // 필요한 값들을 FormData에 추가합니다.
            var data = {
            	accountId : aId,
	            entIntroQstnDsnctNo: entIntroQstnDsnctSeq,
	            entIntroQstnCn: entIntroQstnCn,
        	};

            // FormData를 리스트에 추가합니다.
            dataList.push(data);
        });

        return dataList;
        
     }  


//     const urlParams = new URLSearchParams(window.location.search);
//     const recruitNo = urlParams.get('recruitNo');
//     const pstnCmmncdNm = urlParams.get('pstnCmmncdNm');

//     console.log('Recruit No:', recruitNo);
//     console.log('Position Common Code Name:', pstnCmmncdNm);
    
    var submitBtn = $("#submitBtn");
    submitBtn.on("click", function(){
		
    	var dataList = serializeAllTabs();
    	
    	for (var i = 0; i < dataList.length; i++) {
            if (!dataList[i].entIntroQstnAnsr.trim()) {
            	Swal.fire('답변을 입력해주세요.');
                return;
            }
        }
    	
        // AJAX 요청을 보냅니다.
        $.ajax({
            type: "POST",
            url: "/recruit/submitAnswer.do", // 서버 URL
            data: JSON.stringify(dataList), // 리스트를 JSON 문자열로 변환하여 전송
            processData: false,
            beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
            },
            contentType: "application/json",
            success: function(response) {
                // 성공적으로 요청을 처리한 경우 실행할 코드
//                 console.log("요청이 성공적으로 처리되었습니다.", response);
                // 여기에 성공 메시지 표시 등 추가 작업을 할 수 있습니다.
// 				Swal.fire('제출 성공헀습니다.');
// 				location.href = "/main/recruitDetail.do?recruitNo=" + recruitNo + "&pstnCmmncdNm=" + pstnCmmncdNm; 
				Swal.fire({
		            title: '제출 성공했습니다.',
		            icon: 'success',
		            confirmButtonText: '확인',
		        }).then((result) => {
		            if (result.isConfirmed) {
		                // 확인 버튼을 클릭한 경우
		                // /myPage/member/recruitCheck.do
// 		                location.href = "/main/recruitDetail.do?recruitNo=" + recruitNo + "&pstnCmmncdNm=" + pstnCmmncdNm;
		                $("#myPageForm").submit();
		            }
		        });
				
            },
            error: function(xhr, status, error) {
                // 요청을 처리하는 동안 오류가 발생한 경우 실행할 코드
//                 console.error("오류 발생:", error);
                // 여기에 오류 메시지 표시 등 추가 작업을 할 수 있습니다.
                Swal.fire('제출 실패했습니다.');
            }
        });
        
    });
    
});

function initContent() {
    $('.textCount').text('0 / 1000 (글자 수, 공백 포함)'); // 텍스트 카운트 초기화
    $('.progress-bar').css('width', '0%'); // 프로그레스 바 초기화
}
$(document).ready(function() {
    // 페이지가 로드될 때 초기값 설정
//     $('#textCount').text('0 / 1000 (글자 수, 공백 포함)'); // 텍스트 카운트 초기화
//     $('.progress-bar').css('width', '0%'); // 프로그레스 바 초기화
    initContent();
    
    // 텍스트 입력 시 이벤트 처리
    $('.textBox').keyup(function (e) {
        let content = $(this).val();
//         console.log(content);

        // 글자수 세기
        if (content.length == 0 || content == '') {
            $('.textCount').text('0 / 1000 (글자 수, 공백 포함)');
        } else {
            $('.textCount').text(content.length + ' / 1000 (글자 수, 공백 포함)');
        }

        // 글자수 제한
        if (content.length >= 1000) {
            // 1000자부터는 타이핑이 되지 않도록
            $(this).val(content.substring(0, 1000));
            // 1000자 넘으면 알림창 대신 텍스트 색상을 빨간색으로 변경
            $('.textCount').css('color', 'red');
        } else {
            $('.textCount').css('color', ''); // 기본색상으로 변경
        }

        // 프로그레스 바 너비 설정
        // 전체 글자 수 1000을 기준으로 너비를 계산
        let progressBarWidth = (content.length / 1000) * 100;
        $('.progress-bar').css('width', progressBarWidth + '%');
        $('.progress-percent').text(Math.floor(progressBarWidth) + '%');
    });
});
</script>

