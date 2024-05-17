<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>




<!-- **************** MAIN CONTENT START **************** -->
<main>
<!-- =======================
Page Banner START -->
<section class="bg-light py-5">
	<div class="container">
		<div class="row g-4 g-md-5 position-relative">
			<!-- SVG decoration -->
			<figure class="position-absolute top-0 start-0 d-none d-sm-block">	
				<svg width="22px" height="22px" viewBox="0 0 22 22">
					<polygon class="fill-purple" points="22,8.3 13.7,8.3 13.7,0 8.3,0 8.3,8.3 0,8.3 0,13.7 8.3,13.7 8.3,22 13.7,22 13.7,13.7 22,13.7 "></polygon>
				</svg>
			</figure>

			<!-- Title and Search -->
			<div class="col-lg-10 mx-auto text-center position-relative">
				<!-- SVG decoration -->
				<figure class="position-absolute top-50 end-0 translate-middle-y">
					<svg width="27px" height="27px">
						<path class="fill-orange" d="M13.122,5.946 L17.679,-0.001 L17.404,7.528 L24.661,5.946 L19.683,11.533 L26.244,15.056 L18.891,16.089 L21.686,23.068 L15.400,19.062 L13.122,26.232 L10.843,19.062 L4.557,23.068 L7.352,16.089 L-0.000,15.056 L6.561,11.533 L1.582,5.946 L8.839,7.528 L8.565,-0.001 L13.122,5.946 Z"></path>
					</svg>
				</figure>
				<!-- Title -->
				<h1 class="display-6">Hello, how can we help?</h1>
				<!-- Search bar -->
				<div class="col-lg-8 mx-auto text-center mt-4">
					<form class="bg-body shadow rounded p-2">
						<div class="input-group">
							<input class="form-control border-0 me-1" type="text" placeholder="Ask a question...">
							<button type="button" class="btn btn-blue mb-0 rounded"><i class="bi bi-search"></i></button>
						</div>
					</form>
				</div>
			</div>

			<!-- Category START -->
      <div class="col-12">
				<div class="row g-4 text-center">
				  <!-- <p class="mb-0">Choose a category to quickly find the help you need</p> -->
					<!-- Category item -->
					<div class="col-sm-6 col-md-4">
						<div class="card card-body card-border-hover p-0" style="border: 3px solid slategray;">
							<a href="/notice/form" class="p-3">
								<h2><i class="bi bi-megaphone"></i></h2>
								<h6 class="mb-0">공지사항</h6>
							</a>
						</div>
					</div>

					<!-- Category item -->
					<div class="col-sm-6 col-md-4">
						<div class="card card-body card-border-hover p-0">
							<a href="/faq/faq.do" class="p-3">
								<h2><i class="fas fa-hands-helping transition-base"></i></h2>
								<h6 class="mb-0">FAQ</h6>
							</a>
						</div>
					</div>

					<!-- Category item -->
					<div class="col-sm-6 col-md-4">
						<div class="card card-body card-border-hover p-0">
							<a href="/inquiry/form" class="p-3">
								<h2><i class="bi bi-chat-square-text"></i></h2>
								<h6 class="mb-0">문의게시판</h6>
							</a>
						</div>
					</div>

					<!-- Category item -->
					<!-- <div class="col-sm-6 col-md-3">
						<div class="card card-body card-border-hover p-0">
							<a href="#" class="p-3">
								<h2><i class="fas fa-flag transition-base"></i></h2>
								<h6 class="mb-0">Getting started</h6>
							</a>
						</div>
					</div>-->
				</div> <!-- Row END -->
      </div>
			<!-- Category END -->
		</div>
	</div>
</section>
<!-- =======================Page Banner END -->

<!-- =======================Page content START -->
<section class="pt-5 pb-0 pb-lg-5">
	<div class="container">
	
		<!-- Main content START -->
		<div class="col-12">
			<!-- Title -->
			<div class="card border bg-transparent rounded-3">
				<!-- Card header START -->
				<div class="card-header bg-transparent border-bottom">
					<h3 class="mb-0" style="padding: 10px;">${boardVO.bbsTtl }</h3>
					<div class="count-date" style="padding-left: 30px;">
						<span><fmt:formatDate value="${boardVO.bbsRegDt}" pattern="yyyy-MM-dd" /></span>  &nbsp; │ &nbsp; <i class="bi bi-eye"></i> ${boardVO.bbsInqCnt }
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
				
				<div class="content" style="padding: 0px 30px; height: auto;">${boardVO.bbsCn }</div>
				
			</div>
		</div> 
		<!-- Main content END -->
		
	</div>
</section>
<!-- =======================Page content END -->

</main>
<!-- **************** MAIN CONTENT END **************** -->