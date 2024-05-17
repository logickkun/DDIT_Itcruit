<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<style>
.postForm{
    padding: 30px;
}

.postForm-title{
	width: 100%;
    border: none;
	font-size: 30px;
}

.content{
	width: 100%;
	height: 400px;
}

input[type="text"], textarea {
    outline: none; /* 클릭 시 테두리 제거 */
    border: 1px solid white; /* 기본적인 테두리 설정 */
    padding: 8px;
    margin-bottom: 10px;
}

input[type="text"]:focus, textarea:focus {
    border-color: #ffffff; /* 클릭 시 테두리 색상 변경 */
}

.submitBtn{
    border: none;
	padding: 10px 20px 10px 20px;
    border-radius: 10px;
	float: right;
}
.submitBtn:hover{
	background-color: lightgray;
}

.cancelBtn{
 	border: none;
	padding: 10px 20px 10px 20px;
    border-radius: 10px;
	float: right;
	margin-right: 10px;
}
</style>

<!-- Page main content START -->
<c:set value="등록" var="name"/>
	<c:if test="${status eq 'u' }">
		<c:set value="수정" var="name"/>
	</c:if>
<div class="page-content-wrapper border">
	<div class="col-12" >
		<h3 class="mb-4">공지사항 ${name }</h3>
		<div style="border: 1px solid gray; border-radius: 5px;">
		<form class="postForm" id="noticeForm" method="post" action="/myPage/enterprise/noticeInsert.do" enctype="multipart/form-data">
			<c:if test="${status eq 'u' }">
				<input type="hidden" name="bbsNo" value="${boardVO.bbsNo }"/>
			</c:if>
		<input type="text" class="postForm-title" id="title" name="bbsTtl" value="${boardVO.bbsTtl }" placeholder="제목을 입력해주세요" required><hr>
		<textarea class="content" id="content" name="bbsCn" required>${boardVO.bbsCn }</textarea><br>
		
		<div class="form-group" >
			<div class="custom-file" style="border: 1px solid lightgray; padding: 5px;">
				<input type="file" class="custom-file-input" id="boFile" name="boFile" multiple="multiple"> 
					<label class="custom-file-label" for="customFile">파일을 선택해주세요</label>
			</div>
		</div>
		<br> 
		
		<c:if test="${status eq 'u' }">
			<c:if test="${not empty boardVO.atchFileList }">
				<div class="card-footer bg-white">
					<ul class="mailbox-attachments d-flex align-items-stretch clearfix">
						<c:forEach items="${boardVO.atchFileList }" var="atchFile">
							<li>
								<div class="mailbox-attachment-info">
									<a href="#" class="mailbox-attachment-name">
										<i class="fas fa-paperclip"></i> ${atchFile.fileName }
									</a> 
									<span class="mailbox-attachment-size clearfix mt-1"> 
										<span>${atchFile.fileFancysize }</span> 
										<span class="btn btn-default btn-sm float-right attachmentFileDel"
											id="span_${atchFile.fileNo }">
											<i class="fas fa-times"></i>
										</span>
									</span>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</c:if>
		</c:if>

		<div>
		<button class="cancelBtn btn btn-danger" type="button">취소</button>
		<button class="submitBtn" type="submit" style="margin-right: 20px; background-color: #DCD8FC;" >${name }</button>
		</div>
		<br>
			<sec:csrfInput/>
		</form>
		
		</div>
	</div>
</div>
<!-- Page content END -->

<script type="text/javascript">
$(function(){
	//CKEDITOR
	CKEDITOR.replace("content", {
		filebrowserUploadUrl: '/imageUpload.do?${_csrf.parameterName}=${_csrf.token}',
		height: "400px"
	});
	
	var insertForm = $("#noticeForm");
	var cancelBtn = $(".cancelBtn");
	var submitBtn = $(".submitBtn");
	
	cancelBtn.on("click", function(){
		location.href = "/myPage/admin/noticeList.do"; 
	});
	
	submitBtn.on("click", function(){
		var title = $("#title").val();
		var content = CKEDITOR.instances.content.getData();
		
		if(title == null || title == ""){
			alert("제목을 입력해주세요!");
			$("#title").focus();
			return false;
		}
		
		if(content == null || content == ""){
			alert("내용을 입력해주세요!");
			$("#content").focus();
			return false;
		}
		
		if($(this).text() == "수정"){
			insertForm.attr("action", "/myPage/enterprise/noticeUpdate.do")
		}
		
       var message = {
               type: '관심기업공고등록', //카테고리
               rcvrId: id, // 받는사람
               sndrId: entNm, //보내는 사람
               recruitTtl : recruitTtl,
               alramtime : new Date().toISOString()
       };		
	    
       wsAlarmServer.send(JSON.stringify(message));
	
		
		insertForm.submit();
	});
	
	$(".attachmentFileDel").on("click", function(){
		var id = $(this).prop("id");
		var idx = id.indexOf("_");
		var fileNo = id.substring(idx + 1);
		var ptrn = "<input type='hidden' name='delBoardNo' value='%V'/>";
		insertForm.append(ptrn.replace("%V", fileNo));
		$(this).parents("li:first").hide();
	});
});	
</script>
