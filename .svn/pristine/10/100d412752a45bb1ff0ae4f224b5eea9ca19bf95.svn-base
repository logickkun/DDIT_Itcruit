<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<style>
     .form-label {
         color: #6c757d; /* Bootstrap's gray */
         font-weight: bold;
     }
     .detail-content {
         font-size: 1.1em; /* Larger text */
         font-weight: 500; /* Semi-bold text */
         color: #212529; /* Bootstrap's almost black */
         padding-bottom: 0.5rem;
         border-bottom: 1px solid #dee2e6; /* Light gray border */
		font-weight: bold;
     }
     .mb-3 {
         margin-bottom: 1rem!important; /* Consistent spacing */
     }
 </style>


<div class="page-content-wrapper border">

<form class="row g-3" id="recruitRegiForm" action="/myPage/enterprise/recruitInsertProcess" method="post" enctype="multipart/form-data">
<div class="container mt-3">
		<div class="d-flex justify-content-between">
			<h4 class="mb-2">채용 상세</h4>
			<button type="button" class="input-group-text mt-2" id="checkImage" style="height: 20%;">공고 파일 보기</button>
		</div>
		<hr>
        <div class="row">
            <div class="col-md-6">
                <div class="mb-3">
                    <label class="form-label"><strong>공고 제목</strong></label>
                    <p class="detail-content">${recruitVO[0].recruitTtl}</p>
                </div>
                <div class="mb-3">
                    <label class="form-label"><strong>고용 형태</strong></label>
                    <p class="detail-content">
	                    <c:forEach items="${hireMap}" var="hireType">
	                    ${fn:substringAfter(hireType, "=")}
	                    </c:forEach>
                    </p>
                </div>
                <div class="mb-3">
                    <label class="form-label"><strong>접수 기간</strong>(24시간기준)</label>
                    <p class="detail-content">
                   <span>
					    ${fn:substringBefore(fn:substringBefore(recruitVO[0].recruitStrtDt, "T"), "-")}년 
					    ${fn:substring(fn:substringBefore(recruitVO[0].recruitStrtDt, "T"), 5, 7)}월 
					    ${fn:substring(fn:substringBefore(recruitVO[0].recruitStrtDt, "T"), 8, 10)}일
					</span>
					<span>${fn:substringBefore(fn:substringAfter(recruitVO[0].recruitStrtDt, "T"), ":")}시</span>
					<i class="bi bi-dash-lg"></i>
					<span>
					    ${fn:substringBefore(fn:substringBefore(recruitVO[0].recruitEndDt, "T"), "-")}년 
					    ${fn:substring(fn:substringBefore(recruitVO[0].recruitEndDt, "T"), 5, 7)}월 
					    ${fn:substring(fn:substringBefore(recruitVO[0].recruitEndDt, "T"), 8, 10)}일
					</span>
					<span>${fn:substringBefore(fn:substringAfter(recruitVO[0].recruitEndDt, "T"), ":")}시</span>

                    </p>
                </div>
                <div class="mb-3">
                    <label class="form-label"><strong>연봉</strong></label>
                    <p class="detail-content">${recruitVO[0].recruitPay}</p>
                </div>
                <div class="mb-3">
                    <label class="form-label"><strong>채용 URL</strong></label>
                    <p class="detail-content">${recruitVO[0].entUrl}</p>
                </div>
                <div class="mb-3">
                    <label class="form-label"><strong>우대 언어</strong></label>
                    <p class="detail-content">
                    <c:forEach items="${preferMap}" var="prefer">
                    ${fn:substringAfter(prefer, "=")},
                    </c:forEach>
                    </p>
                </div>
            </div>
            <div class="col-md-6">
                <div class="mb-3">
                    <label class="form-label"><strong>근무지 주소</strong></label>
                    <p class="detail-content">${recruitVO[0].cmmncdGrpCd} ${recruitVO[0].cmmncdNm1}</p>
                </div>
                <div class="mb-3">
                    <label class="form-label"><strong>모집인원</strong></label>
                    <p class="detail-content">${recruitVO[0].recruitCnt}명</p>
                </div>
                <div class="mb-3">
                    <label class="form-label"><strong>지원 자격</strong></label>
                    <p class="detail-content">${recruitVO[0].recruitCareerCodeNm}</p>
                </div>
                <div class="mb-3">
                    <label class="form-label"><strong>수시 채용 여부</strong></label>
                    <p class="detail-content">
                   	<c:if test="${recruitVO[0].recruitYn eq 'Y'}">
						동의
					</c:if>
					<c:if test="${recruitVO[0].recruitYn ne 'Y'}">
						비동의
					</c:if>
                    </p>
                </div>
                <div class="mb-3">
                    <label class="form-label"><strong>모집 분야</strong></label>
                    <p class="detail-content">${recruitVO[0].pstnCmmncdNm}</p>
                </div>
                <div class="mb-3">
                    <label class="form-label"><strong>필수 언어</strong></label>
                    <p class="detail-content">
                    <c:forEach items="${esntlMap}" var="enstl">
                    	${fn:substringAfter(enstl, "=")},
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>


<!-- Divider -->
<!-- <hr class="my-5"> -->

<!-- Education -->
	<div class="col-12 text-sm-end">
		<button class="btn btn-primary mb-0" type="button" id="listBtn">목록</button>
		<button class="btn btn-warning mb-0" type="button" id="editBtn">수정</button>
		<button class="btn btn-danger mb-0" type="button" id="delBtn">삭제</button>
	</div>
</form>
</div>
	<div class="modal fade" id="checkImageModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
			<h5 class="modal-title" id="modalLabel">이미지 미리보기</h5>
			</div>
				<div class="modal-body">
				<img id="previewImage" src="" alt="Image preview" class="img-fluid">
				</div>
			<div class="modal-footer">
			<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	
	document.addEventListener("DOMContentLoaded", function(){
		
		var recruitNo = "${recruitVO[0].recruitNo}";
		var pstnCmmncdNm = "${recruitVO[0].pstnCmmncdNm}";
		
		var delBtn = document.getElementById("delBtn");
		var editBtn = document.getElementById("editBtn");
		var listBtn = document.getElementById("listBtn");
		
		
		editBtn.addEventListener("click", function(){
			
			location.href = "/myPage/enterprise/recruitEdit?recruitNo=" + recruitNo +"&pstnCmmncdNm=" + pstnCmmncdNm;
											
		});
		
		delBtn.addEventListener("click", function(){
			
			
			Swal.fire({
                title: '삭제하시겠습니까?',
                icon: 'warning',
                confirmButtonText: '확인'
        	}).then((result) => {
        	
				location.href = "/myPage/enterprise/recruitDel?recruitNo=" + recruitNo +"&pstnCmmncdNm=" + pstnCmmncdNm;

			});
			
			
		})
		
		listBtn.addEventListener("click", function(){
			
			location.href = "/myPage/enterprise/recruitProcessQuestion";
			
		});
		
		var checkImageBtn = document.getElementById("checkImage");
		var modal = new bootstrap.Modal(document.getElementById('checkImageModal'));
		var getRecruitNo = "${recruitVO[0].recruitNo}" +"_"+ "${recruitVO[0].pstnCmmncdNm}";
//			console.log(getRecruitNo);

		checkImageBtn.addEventListener("click", function(){
			
			var xhr = new XMLHttpRequest();
			
			xhr.open("get", "/myPage/enterprise/getRecruitImage?recruitNo="+getRecruitNo, true);
			
			xhr.responseType = "blob";
			xhr.onload = function(e) {
				
				if(this.status == 200){
					
					var blob = this.response;
					
					var reader = new FileReader();
					
					reader.onload = function(e) {
						
						var previewImage = document.getElementById("previewImage");
						previewImage.src = e.target.result;
						modal.show();

					}
					
					reader.readAsDataURL(blob);
					
				}
				
			};
			
			xhr.send();

		});
		
	});
</script>
