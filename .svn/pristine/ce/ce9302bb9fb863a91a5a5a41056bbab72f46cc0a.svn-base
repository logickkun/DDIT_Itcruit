<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<body>

<!-- **************** MAIN CONTENT START **************** -->
<style>
.postForm{
    padding: 50px;
}

.postForm-title{
    border: none;
	font-size: 30px;
	width: 100%
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
    color: white;
    background-color: #6F5CF3;
    border: none;
    padding: 10px 20px 10px 20px;
    border-radius: 10px;
	margin-top: 20px;
	float: right;
}
.cancelBtn{
	color: white;
    background-color: #6F5CF3;
    border: none;
    padding: 10px 20px 10px 20px;
    border-radius: 10px;
	margin-top: 20px;
	margin-right: 10px;
	float: right;
}
</style>

<main>

<!-- =======================Page content START -->
<br>
<section class="pt-0">
	
	<div class="container">
		<div class="row">
			<!-- Main content START -->
			<div class="col-sm">
				<div class="card bg-transparent border rounded-3">
					<form class="postForm" id="postForm" method="post" action="/board/ent/insert.do?entNo=${entNo }" enctype="multipart/form-data">
						<input type="hidden" name="entNo" value="${entNo  }"/>
						<c:if test="${status eq 'update' }">
							<input type="hidden" name="entNo" value="${entNo  }"/>
							<input type="hidden" name="bbsNo" value="${boardVO.bbsNo  }"/>
						</c:if>	
						<input type="text" class="postForm-title" id="title" name="bbsTtl" value="${boardVO.bbsTtl }" placeholder="제목을 입력해주세요" required><hr>
						<textarea class="content" id="content" name="bbsCn" required>${boardVO.bbsCn }</textarea><br>

						<div class="form-group" >
							<div class="custom-file" style="border: 1px solid lightgray; padding: 5px;">
								<input type="file" class="custom-file-input" id="boFile" name="boFile" multiple="multiple"> 
									<label class="custom-file-label" for="customFile">파일을 선택해주세요</label>
							</div>
						</div>
						
						<c:if test="${status eq 'update' }">
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
						
						<c:set value="등록" var="Btn"/>
						 <c:if test="${status eq 'update' }">
						 	<c:set value="수정" var="Btn"/>
						 </c:if>
						<button class="submitBtn" id="submitBtn" type="submit">${Btn }</button>
						<button class="cancelBtn" id="cancelBtn" type="button">취소</button>
						 <sec:csrfInput/>
					</form>
					</div>
					<!-- Card body START -->
				</div>
			</div>
			<!-- Main content END -->
		</div> <!-- Row END -->
	</div>	
</section>
<!-- =======================Page content END -->


<script>
	$(function () {
		CKEDITOR.replace('content', {
			filebrowserUploadUrl: '/imageUpload.do?${_csrf.parameterName}=${_csrf.token}',
			height: "350px"
		});
	});
	
	var postForm = $("#postForm");
	var cancelBtn = $("#cancelBtn");
	var submitBtn = $("#submitBtn");
	
	cancelBtn.on("click", function(){
		location.href = "/board/ent/list.do?entNo=${entNo}"; 
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
		
		//val() xx >> text();
		// val() input타입일때
		if($(this).text() == "수정"){
// 			alert($(this).text());
			postForm.attr("action", "/board/ent/update.do?entNo=${entNo }");
			postForm.submit();
		}
		postForm.submit();
	});
	
	$(".attachmentFileDel").on("click", function(){
		var id = $(this).prop("id");
		var idx = id.indexOf("_");
		var fileNo = id.substring(idx + 1);
		var ptrn = "<input type='hidden' name='delBoardNo' value='%V'/>";
		postForm.append(ptrn.replace("%V", fileNo));
		$(this).parents("li:first").hide();
	});
</script>

