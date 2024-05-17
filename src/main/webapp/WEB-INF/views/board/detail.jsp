<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<main>

	<!-- =======================Page content START -->
	<section class="pt-0">
		<div class="container">
			<div class="row">

				<!-- Left sidebar START -->
				<div class="col-xl-3" style="max-width: 300px;">

					<!-- Responsive offcanvas body START -->
					<div class="offcanvas-xl offcanvas-end" tabindex="-1" id="offcanvasSidebar">
						<!-- Offcanvas header -->
						<div class="offcanvas-header bg-light">
							<h5 class="offcanvas-title" id="offcanvasNavbarLabel">My profile</h5>
							<button type="button" class="btn-close" data-bs-dismiss="offcanvas" data-bs-target="#offcanvasSidebar" aria-label="Close"></button>
						</div>
						<!-- Offcanvas body -->
						<div class="offcanvas-body p-3 p-xl-0">
							<div class="borde rounded-3 pb-2 p-3 w-100" style="background-color: white; margin-left: 30px; margin-top: -15px;">
								<!-- Dashboard menu -->
								<div class="list-group list-group-dark list-group-borderless">
									<a href="/freeBoard/insert" class="write-post-Btn writeBtn" data-session="${SessionInfo}">
										<button type="button" ><i class="bi bi-pencil"></i> 글 작성하기</button>
									</a>
									<!-- 인기글 -->
									<div class="popular-list">
										<div class="popular-list-title">
											<i class="bi bi-fire"></i> 인기글
										</div>
										<div class="popular-list-list">
											<c:forEach items="${board}" var="brd">
									        <a href="/freeBoard/detail.do?bbsNo=${brd.bbsNo }">${brd.bbsTtl}</a>
									    	</c:forEach>
										</div>
									</div>
									<!-- 최근 본 글 -->
									<div class="popular-list lately">
										<div class="popular-list-title lately">
											<i class="bi bi-eye"></i> &nbsp; 최근 본 글
										</div>
										<div class="popular-list-list lately" id="recent-posts-detail">

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Responsive offcanvas body END -->
				</div>
				<!-- Left sidebar END -->

				<!-- Main content START -->
				<div class="col-xl-9">

					<!-- Card START -->
					<div class="card border bg-transparent rounded-3">
						<!-- Card header START -->
						<div class="card-header bg-transparent border-bottom">
							<h5 class="mb-0" style="padding: 10px;">${boardVO.bbsTtl }</h5>
							<div class="count-date">
								<span style="font-weight: bold;">${boardVO.bbsWriter }</span> &nbsp; │ &nbsp; <i class="bi bi-eye"></i> ${boardVO.bbsInqCnt } &nbsp; │ &nbsp; <span><fmt:formatDate value="${boardVO.bbsRegDt }" pattern="yyyy-MM-dd" /></span>
							</div>

 							<!-- 로그인 안했을 때 -->
							<c:if test="${empty SessionInfo }">
							<div></div>
							</c:if>

							<c:if test="${!empty SessionInfo }">
								<c:choose>
								<c:when test="${sessionScope.SessionInfo.accountId eq boardVO.accountId }">
										<!-- 수정 삭제 버튼 (자기가 쓴 글) -->
										<div class="edit-del-Btn">
											<input type="button" class="editBtn" id="updateBtn" value="수정"> 
											<input type="button" class="delBtn" id="deleteBtn" value="삭제">
										</div>
									</c:when>
									<c:otherwise>
										<!-- 다른사람 글 (신고 버튼) -->
										<div class="report-container">
											<a href="#" class="btn btn-secondary-soft mb-0" data-bs-toggle="modal" data-bs-target="#viewReview">신고</a>
										</div>
									</c:otherwise>
								</c:choose>
							</c:if>

						</div>
						
						<div class="content">
						${boardVO.bbsCn }
						</div>
						
						<div class="card-footer bg-white">
							<c:if test="${not empty boardVO.atchFileList }">
							
								<c:forEach items="${boardVO.atchFileList }" var="atchFile">
									<div class="mailbox-attachment-info">
										<a href="#" class="mailbox-attachment-name"> 
											<i class="fas fa-paperclip"></i> ${atchFile.fileName }
										</a> 
										<span class="mailbox-attachment-size clearfix mt-1"> 
											<span>${atchFile.fileFancysize }</span>
											<c:url value="/freeBoard/download.do?${_csrf.parameterName}=${_csrf.token}" var="downloadURL">
												<c:param name="fileNo" value="${atchFile.fileNo }"/>
												<c:param name="fileSrcNo" value="${atchFile.fileSrcNo }"/>
												<c:param name="orgnCmmncd" value="${atchFile.orgnCmmncd }"/>
											</c:url> 
											<a href="${downloadURL }"> 
												<span class="downloadIcon"> 
													<i class="fas fa-download"></i>
												</span>
											</a>
										</span>
									</div>
								</c:forEach>
							</c:if>
						</div>
						
						<hr>
						<div>
							<input type="button" class="listBtn" id="listBtn" value="목록">
						</div>
						
					<!-- 댓글 시작 -->
					<div>
							<form class="commentFrm" action="/board/comment/insert.do" method="post" id="commentInsertForm">
								<h5>댓글</h5>
								<input type="hidden" name="bbsNo" id="bbsNo" value="${boardVO.bbsNo}" /> 
								<input type="text" placeholder="댓글 내용을 입력해주세요." id="bssCmntCn" class="commentContent" name="bssCmntCn" required /> 
								<input type="submit" class="commentSubBtn" id="commentSubBtn"  data-session="${SessionInfo}"  value="등록" />
								<sec:csrfInput />
							</form>

							<c:choose>
							<c:when test="${empty bcvo }">
								<div>
								</div>
							</c:when>
							<c:otherwise>
								<form action="/board/comment/delete.do" id="editdelComment" method="post">
									<input type="hidden" name="bbsNo" id="bbsNo"/>
									<input type="hidden" name="bssCmntNo" id="bssCmntNo"/>
									<sec:csrfInput/>
								</form>
								<c:forEach items="${bcvo }" var="comment">
									<div class="commentList">
										<div class="commentListA">
											<div class="commentEditDelBtn">
											
											<!-- 로그인 안했을 때 -->
													<c:if test="${empty SessionInfo }">
														<div></div>
													</c:if>
													<c:if test="${!empty SessionInfo }">
														<c:choose>
															<c:when test="${sessionScope.SessionInfo.accountId eq boardVO.accountId }">
																<button class="commtentEditBtn" data-bbsno="${comment.bbsNo }" data-cmnno="${comment.bssCmntNo }">수정</button>
																<button class="commtentDelBtn" data-bbsno="${comment.bbsNo }" data-cmnno="${comment.bssCmntNo }">삭제</button>
															</c:when>
														</c:choose>
													</c:if>
												</div>
											<input type="hidden" name="bbsNo" value="${comment.bbsNo }"/>
											<input type="hidden" name="bssCmntNo" value="${comment.bssCmntNo }"/>
											<p style="font-size: 16px; font-weight: bolder;">${comment.bssCmntWriter }</p>
											<div class="commentContentA"> 
												${comment.bssCmntCn }
											</div>
											
											<span style="font-size: 13px;">${comment.bssCmntTm }</span> 
												<!-- 로그인 안했을 때 -->
												<c:if test="${empty SessionInfo }">
													<div></div>
												</c:if>
												<c:if test="${!empty SessionInfo }">
													<c:choose>
														<c:when test="${sessionScope.SessionInfo.accountId ne boardVO.accountId }">
															<a href="#" class="reportBtn" data-bs-toggle="modal" data-bs-target="#viewReviewCommet" data-bbsno="${comment.bbsNo }" data-cmnno="${comment.bssCmntNo }" style="color: black; background-color: white; font-size: 13px; padding-left: 0px;">│ 신고</a>
														</c:when>
													</c:choose>
												</c:if>
											</div>
										<hr>
									</div>
								</c:forEach>
								<sec:csrfInput/>
							</c:otherwise>
						</c:choose>
					</div>
					<!-- 댓글 끝 -->
						
					</div>
					
					<form action="/freeBoard/delete.do" id="editdelForm" method="post">
						<input type="hidden" name="bbsNo" value="${boardVO.bbsNo }"/>
						<sec:csrfInput/>
					</form>
							
					<br><br>
					
				</div>
				<!-- Main content END -->
			</div>
			<!-- Row END -->
		</div>
	</section>
</main>

<!-- Popup modal for reviwe START -->
	<div class="modal fade" id="viewReview" tabindex="-1" aria-labelledby="viewReviewLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<!-- Modal header -->
				<div class="modal-header bg-purple">
					<h5 class="modal-title text-white" id="viewReviewLabel">신고</h5>
					<button type="button" class="btn btn-sm btn-light mb-0" data-bs-dismiss="modal" aria-label="Close">
						<i class="bi bi-x-lg"></i>
					</button>
				</div>
				<!-- Modal body -->
				<form class="insertForm" id="insertForm" method="post" action="/freeBoard/reportInsert.do">
					<input type="hidden" name="bbsNo" id="bbsNo" value="${boardVO.bbsNo }">
					<input type="hidden" name="bbsReportId" id="bbsReportId" value="${boardReportVO.bbsReportId }">
					<input type="hidden" name="bbsWriter" id="bbsWriter" value="${boardVO.bbsWriter }">
					<div class="modal-body">
						<select class="form-select" id="reportReason" name="bbsReportCmmncd">
							<option value="상습적인 욕설 또는 혐오 발언">상습적인 욕설 또는 혐오 발언</option>
							<option value="광고 또는 스팸 게시물">광고 또는 스팸 게시물</option>
							<option value="저작권 침해">저작권 침해</option>
							<option value="폭력적인 또는 위협적인 내용">폭력적인 또는 위협적인 내용</option>
							<option value="음란성 또는 부적절한 콘텐츠">음란성 또는 부적절한 콘텐츠</option>
							<option value="개인 정보 노출">개인 정보 노출</option>
							<option value="기타 위반 사항">기타 위반 사항</option>
						</select>
					</div>
					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="submit" id="reportSubmit" class="btn btn-danger-soft my-0" data-bs-dismiss="modal">신고 등록</button>
					</div>
				<sec:csrfInput />
				</form>
			</div>
		</div>
	</div>
	<!-- Popup modal for reviwe END -->
	
<!-- Popup modal for reviwe START -->
	<div class="modal fade" id="viewReviewCommet" tabindex="-1" aria-labelledby="viewReviewLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<!-- Modal header -->
				<div class="modal-header bg-purple">
					<h5 class="modal-title text-white" id="viewReviewLabel">신고</h5>
					<button type="button" class="btn btn-sm btn-light mb-0" data-bs-dismiss="modal" aria-label="Close">
						<i class="bi bi-x-lg"></i>
					</button>
				</div>
				<!-- Modal body -->
				<form class="reportCommentinsert" id="reportCommentinsert" method="post" action="/freeBoard/reportCommentInsert.do">
					<input type="hidden" name="bbsNo" id="bbsNo" value="${boardVO.bbsNo }">
					<input type="hidden" name="bbsReportId" id="bbsReportId" value="${boardReportVO.bbsReportId }">
					<input type="hidden" name="bbsWriter" id="bbsWriter" value="${boardVO.bbsWriter }">
					<input type="hidden" name="bssCmntNo" id=bssCmntNo value="${boardReportVO.bssCmntNo }">
					<div class="modal-body">
						<select class="form-select" id="reportReason" name="bbsReportCmmncd">
							<option value="상습적인 욕설 또는 혐오 발언">상습적인 욕설 또는 혐오 발언</option>
							<option value="광고 또는 스팸 게시물">광고 또는 스팸 게시물</option>
							<option value="저작권 침해">저작권 침해</option>
							<option value="폭력적인 또는 위협적인 내용">폭력적인 또는 위협적인 내용</option>
							<option value="음란성 또는 부적절한 콘텐츠">음란성 또는 부적절한 콘텐츠</option>
							<option value="개인 정보 노출">개인 정보 노출</option>
							<option value="기타 위반 사항">기타 위반 사항</option>
						</select>
					</div>
					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="submit" id="reportCSubmit" class="btn btn-danger-soft my-0" data-bs-dismiss="modal">신고 등록</button>
					</div>
				<sec:csrfInput />
				</form>
			</div>
		</div>
	</div>
	<!-- Popup modal for reviwe END -->

<!-- ======================= Page content END -->

<script type="text/javascript">
$(function(){
	var editdelForm = $("#editdelForm");
	var updateBtn = $("#updateBtn");
	var deleteBtn = $("#deleteBtn");
	var commentSubBtn = $("#commentSubBtn");
	var editdelComment = $("#editdelComment");
	var commtentDelBtn = $(".commtentDelBtn");
	var reportBtn = $(".reportBtn");
	var reportCommentinsert = $("#reportCommentinsert");
	var listBtn = $("#listBtn");
	var reportSubmit = $("#reportSubmit");
	var reportCSubmit = $("#reportCSubmit");
	

	$("#insertForm").submit(function(event) {
	    event.preventDefault(); // 폼 제출의 기본 동작을 중지

	    Swal.fire({
	        title: '신고되었습니다.',
	        icon: 'info',
	        showCancelButton: false, // 취소 버튼 보이지 않도록 설정
	        confirmButtonText: '확인',
	        reverseButtons: false
	    }).then((result) => {
	        if (result.isConfirmed) {
	            this.submit(); 
	        }
	    });
	});
	
	
	$("#reportCommentinsert").submit(function(event) {
	    event.preventDefault(); // 폼 제출의 기본 동작을 중지

	    Swal.fire({
	        title: '신고되었습니다.',
	        icon: 'info',
	        showCancelButton: false, // 취소 버튼 보이지 않도록 설정
	        confirmButtonText: '확인',
	        reverseButtons: false
	    }).then((result) => {
	        if (result.isConfirmed) {
	            this.submit(); 
	        }
	    });
	});

	
	listBtn.on("click", function(){
		location.href="/freeBoard/list.do";
	})
	
	updateBtn.on("click", function(){
		console.log("버튼이 클릭되었습니다.");
		editdelForm.attr("method", "get");
		editdelForm.attr("action", "/freeBoard/update");
		editdelForm.submit();
	});
	
	deleteBtn.on("click", function(){
		if(confirm("정말로 삭제하시겠습니까?")){
			editdelForm.submit();
		}
	});
	
	commtentDelBtn.on("click", function(){
// 		var bssCmntNo = $(this).siblings("input[name='bssCmntNo']").val();
// 	    alert(bssCmntNo);
		var bbsnNo = $(this).data("bbsno");
		var cmnNo = $(this).data("cmnno");
		if(confirm("정말로 삭제하시겠습니까?")){
			editdelComment.find("#bbsNo").val(bbsnNo);
			editdelComment.find("#bssCmntNo").val(cmnNo);
			editdelComment.submit(); // 폼 제출
		}
	});
	
	$(document).on("click", ".commtentEditBtn", function() {
	    if ($(".commentEditInput").length > 0) {
	        // 이미 수정 중인 경우 다른 작업을 막음
	        alert("수정 중인 댓글이 있습니다. 수정을 완료하십시오.");
	        return;
	    }

	    var commentContainer = $(this).closest('.commentListA');
	    var commentContent = commentContainer.find('.commentContentA');
	    var commentText = commentContent.text().trim(); // 기존 댓글 내용 가져오기

	    var bbsNo = $(this).data("bbsno");
	    var cmnNo = $(this).data("cmnno");
	    
	  
	    // 댓글 내용을 수정할 수 있는 입력 필드로 변경
	    var commentInputField = $('<input type="text" name="bssCmntCn" class="commentEditInput" value="' + commentText + '">');
	    commentContent.html(commentInputField);

	    // 수정 완료 버튼 추가
// 	    var updateButton = $('<button class="updateCommentBtn" data-bbsno= bbsNo data-cmnno=cmnNo>완료</button>');
	    var updateButton = $('<button class="updateCommentBtn" data-bbsno="' + bbsNo + '" data-cmnno="' + cmnNo + '">완료</button>');

	    commentContainer.append(updateButton);
	});

	$(document).on("click", ".updateCommentBtn", function() {
	    var bbsNo = $(this).data("bbsno");
	    var cmnNo = $(this).data("cmnno");
	    var updatedCommentContent = $(this).closest('.commentListA').find('.commentEditInput').val().trim();

	    $.ajax({
	        url: "/board/comment/update.do",
	        type: "POST",
	        data: {
	            bbsNo: bbsNo,
	            bssCmntNo: cmnNo,
	            bssCmntCn: updatedCommentContent
	        },
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader('X-CSRF-TOKEN', $('meta[name="_csrf"]').attr('content'));
	        },
	        success: function(response) {
	            // 성공적으로 요청이 처리된 경우 처리할 내용
	            console.log(response);
	            window.location.href = "/freeBoard/detail.do?bbsNo=${boardCommentVO.bbsNo}"; // 대상 페이지로 이동
	        },
	        error: function(xhr, status, error) {
	            // 요청이 실패한 경우 처리할 내용
	            console.error(xhr.responseText);
	        }
	    });
	});
	
	reportBtn.on("click", function(){
		var bbsnNo = $(this).data("bbsno");
		var cmnNo = $(this).data("cmnno");
			reportCommentinsert.find("#bbsNo").val(bbsnNo);
			reportCommentinsert.find("#bssCmntNo").val(cmnNo);
	});
});

$(document).on("click", ".writeBtn", function(e) {
    e.preventDefault();
    var $this = $(this);
    var session = $this.data("session");
    
    if (session == null || session == "") {
        Swal.fire({
            title: "로그인 후 이용 가능합니다",
            text: "로그인 페이지로 이동 하시겠습니까?",
            icon: "info",
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '확인',
            cancelButtonText: '취소',
            reverseButtons: false
        }).then((result) => {
            if (result.value) {
                location.href = "/main/loginForm.do";
            }
        });
    } else {
    	  var url = $this.attr("href");
          window.location.href = url;
    }
});

$(document).on("click", ".commentSubBtn", function(e) {
    e.preventDefault();
    var $this = $(this);
    var session = $this.data("session");
    var commentInsertForm = $("#commentInsertForm");

    if (session == null || session == "") {
        Swal.fire({
            title: "로그인 후 이용 가능합니다",
            text: "로그인 페이지로 이동 하시겠습니까?",
            icon: "info",
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '확인',
            cancelButtonText: '취소',
            reverseButtons: false
        }).then((result) => {
            if (result.value) {
                location.href = "/main/loginForm.do";
            }
        });
    } else {
    	commentInsertForm.submit();
    }
});



document.addEventListener('DOMContentLoaded', function() {
    const userId = "${sessionScope.SessionInfo.accountId}";
    const isLoggedIn = userId ? true : false;

    displayRecentPosts(isLoggedIn, 'recent-posts-detail');
});

function displayRecentPosts(isLoggedIn, elementId) {
    const userId = "${sessionScope.SessionInfo.accountId}" || 'guest';
    const storage = isLoggedIn ? localStorage : sessionStorage;
    const storageKey = isLoggedIn ? 'recentPosts-' + userId : 'recentPosts-guest';
    const userPosts = JSON.parse(storage.getItem(storageKey)) || [];
    const container = document.getElementById(elementId);
    container.innerHTML = '';

    userPosts.forEach(post => {
        const truncatedTitle = post.title.length > 10 ? post.title.substring(0, 10) + '...' : post.title;
        const link = document.createElement('a');
        link.href = "/freeBoard/detail.do?bbsNo=" + post.bbsNo;
        link.textContent = truncatedTitle;
        container.appendChild(link);
    });
}
</script>



<style>
.write-post-Btn button {
    width: 205px; /* 버튼의 너비를 150px로 설정 */
    height: 70px;
    position: relative; /* 요소를 상대적으로 위치시킵니다. */
    left: 9px; /* 왼쪽으로 20px 이동 */
    font-size: 20px;
    font-weight: bold;
    border-radius: 10px; /* 둥근 테두리 설정 */
    background-color: #DCD8FC;
    border: none; 
}

.popular-list {
    background-color: white;
    padding: 20px 10px 20px 10px; 
    border-radius: 10px; 
    border: 3px solid #DCD8FC;
    color: black;
    margin: 10px;
    padding-right: 150px;
}

.popular-list-title {
    width: 200px;
    color: black;
    font-size: 20px;
    font-weight: bold;
    padding-bottom: 10px;
}

.popular-list-list a {
	color: black;
    width: 300px;
    display: block; 
    margin-bottom: 5px; 
    font-size: 15px;
    padding-left: 20px;
    text-decoration: underline;
}

.conArea {
	color: black;
	padding-left: 30px
}

.post-title {
	padding-bottom: 20px;
	font-size: 30px;
	color: #000;
}

.post-title a {
	color: #000;
}

.post-de {
	font-size: 12px;
}

/* 상세보기 css */

.mailbox-attachment-name,
.mailbox-attachment-size {
    text-decoration: underline;
}

.fa-download {
    color: gray;
    font-size: 20px; /* 아이콘의 크기를 원하는 픽셀로 조정합니다 */
    margin: 12px;
}

.mailbox-attachment-name {
    padding-left: 20px;
}

.count-date {
	padding-left: 30px;
}

.edit-del-Btn {
	text-align: right;
	margin-top: -30px;
}

.editBtn, .delBtn {
	color: black;
	background-color: #DCD8FC;
	border: none;
	width: 80px;
	height: 40px;
	border-radius: 5px;
	padding: 10px 5px 10px 5px;
}

/* 신고 */
.report-container {
	display: flex;
	flex-direction: column;
	align-items: flex-end;
	margin-top: -30px;
	padding-right: 10px;
}

.report-button {
	border: 1px solid rgb(194, 194, 194);
	padding: 5px 15px 5px 15px;
	background-color: white;
}

.content {
	padding: 50px;
}

/* 댓글 */
.commentFrm{
  width: 100%;
  margin: 30px 90px 50px;
}

.commentContent{
  font-size: 15px;
  width: 600px;
  height: 40px;
  border: 1px solid lightgray;
}

.commentSubBtn{
  border: 1px solid lightgray;
  padding: 8px 13px 8px 13px;
}

.commentList{
  /* border: 1px solid lightgray; */
  margin: 10px 200px 50px 160px;
}

.commentContentA{
  padding: 0px 0px 20px 20px;

}

.declarationBtn{
  border: none;
  background-color: white;
  color: gray;
  margin-bottom: 20px;
  font-size: 13px;
}

.commentEditDelBtn{
  float: right;
}

.commtentEditBtn,
.commtentDelBtn{
  border: none;
  padding: 3px 7px 3px 7px;
  background-color: white;
  color: gray;
}

.commentEditContainer {
    display: flex;
    align-items: center;
}

.commentEditForm {
    flex: 1;
    margin-right: 10px;
}

.commentEditButton {
    flex-shrink: 0; /* 버튼이 필요한 공간 이상으로 크기를 줄이지 않도록 함 */
}

.commentEditInput {
    width: 550px; 
}

.updateCommentBtn{
	float: right;
	border: none;
}


  .listBtn{
	float: right;
	color: black;
	background-color: #DCD8FC;
	border: none;
	width: 80px;
	height: 40px;
	border-radius: 5px;
	padding: 10px 5px 10px 5px;
	margin-right: 15px;
}





</style>