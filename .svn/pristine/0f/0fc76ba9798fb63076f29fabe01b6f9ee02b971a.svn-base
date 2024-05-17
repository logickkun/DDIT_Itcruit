<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<style>
.editBtn, .delBtn, .listBtn {
	color: black;
	background-color: #DCD8FC;
	border: none;
	width: 80px;
	height: 40px;
	border-radius: 5px;
	padding: 10px 5px 10px 5px;
}
</style>

<!-- Page main content START -->
<div class="page-content-wrapper border">
		<!-- Card START -->
	<div class="card border bg-transparent rounded-3">
		<!-- Card header START -->
		<div class="card-header bg-transparent border-bottom">
			<h5 class="mb-0" style="padding: 10px;">${boardVO.bbsTtl }</h5>
			<div class="count-date" style="padding-left: 30px;">
				<span style="font-weight: bold;">${boardVO.bbsWriter }</span> &nbsp; │ &nbsp; <i class="bi bi-eye"></i> ${boardVO.bbsInqCnt } &nbsp; │ &nbsp; <span><fmt:formatDate value="${boardVO.bbsRegDt }" pattern="yyyy-MM-dd" /></span>
			</div>

			<div class="edit-del-Btn" style="float: right; margin-top: -40px; ">
				<input type="button" class="editBtn" id="updateBtn" value="수정"> 
				<input type="button" class="delBtn" id="deleteBtn" value="삭제">
				<input type="button" class="listBtn" id="listBtn" value="목록">
			</div>
		</div>
		<!-- Card header END -->
	
		<div class="card-footer bg-white">
			<c:if test="${not empty boardVO.atchFileList }">
			
				<c:forEach items="${boardVO.atchFileList }" var="atchFile">
					<div class="mailbox-attachment-info" style="padding: 10px 30px 10px 30px;">
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
		
		<div class="content" style="height:auto; padding: 0px 30px;">${boardVO.bbsCn }</div>
		
		<form action="/myPage/admin/noticeDelete.do" id="editdelForm" method="post">
			<input type="hidden" name="bbsNo" value="${boardVO.bbsNo }"/>
			<sec:csrfInput/>
		</form>
					
	</div>
</div>

<script type="text/javascript">
	var listBtn = $("#listBtn");
	var updateBtn = $("#updateBtn");
	var deleteBtn = $("#deleteBtn");
	var editdelForm = $("#editdelForm");
	
	listBtn.on("click", function(){
		location.href = "/myPage/admin/noticeList.do";
	});
	
	updateBtn.on("click", function(){
		console.log("버튼이 클릭되었습니다.");
		editdelForm.attr("method", "get");
		editdelForm.attr("action", "/myPage/admin/noticeUpdate");
		editdelForm.submit();
	});
	
	deleteBtn.on("click", function(){
		if(confirm("정말로 삭제하시겠습니까?")){
			editdelForm.submit();
		}
	});
	
	
</script>