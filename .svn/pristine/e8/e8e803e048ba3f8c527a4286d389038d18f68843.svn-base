<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!-- Sidebar START -->
<style>

.logo-container img {
    width: 85%;             /* 이미지의 너비를 조정 */
    height: 150px;          /* 이미지의 높이를 조정 */
    object-fit: contain;    /* 이미지의 비율을 유지하며 컨테이너에 맞춤 */
    display: block;         /* 블록 레벨 요소로 처리 */
    margin: 0 auto;         /* 중앙 정렬 */
    padding: 10px;          /* 내부 여백 추가 */
/*     border: 1px solid #ccc; /* 심플한 회색 테두리 */ */
    border-radius: 8px;     /* 모서리를 둥글게 처리 */
/*     box-shadow: 0 4px 6px rgba(0,0,0,0.1); /* 약간의 그림자 효과 */ */
/*     background: #fff;       /* 배경색 설정 (필요에 따라 조정 가능) */ */
}
</style>
<nav class="navbar sidebar navbar-expand-xl navbar-dark" style="background-color: #f2f4f5;">

	<!-- Navbar brand for xl START -->
<!-- 	<div class="d-flex align-items-center" style="background-color: #DCD8FC;"> -->
		<div class="logo-container">
		<a class="" href="/main/index">
			<img class="navbar-brand-item" src="/main/logodisplay?entNo=${sessionScope.SessionInfo.entNo }" 
			alt="logo" style="width:250px; height: 100px">
		</a>
		</div>
<!-- 	</div> -->
	<!-- Navbar brand for xl END -->
	
	<div class="offcanvas offcanvas-start flex-row custom-scrollbar h-100" data-bs-backdrop="true" tabindex="-1" id="offcanvasSidebar" >
		<div class="offcanvas-body sidebar-content d-flex flex-column" style="background-color: #f2f4f5;">

			<!-- Sidebar menu START -->
			<ul class="navbar-nav flex-column" id="navbar-sidebar">
				
				<li class="nav-item"> <a class="nav-link" href="entInfo" style="color: black;"><i class="bi bi-house fa-fw me-2"></i>HOME</a></li>
				
				<li class="nav-item">
					<a class="nav-link" data-bs-toggle="collapse" href="#collapsepage" role="button" aria-expanded="${not empty tOrf1 ? 'true' : 'false'}" aria-controls="collapsepage" style="color: black;">
						<i class="bi bi-clipboard-check fa-clipboard-list fa-fw me-2"></i>채용 공고
					</a>
					<!-- Submenu -->
					<ul class="nav collapse flex-column ${show1}" id="collapsepage" data-bs-parent="#navbar-sidebar">
						<li class="nav-item"> <a class="nav-link ${active1}" href="recruitRegisterForm" style="color: black;">채용 공고 등록</a></li>
						<li class="nav-item"> <a class="nav-link ${active2}" href="recruitProcessQuestion" style="color: black;">채용 공고 관리</a></li>
					</ul>
				</li>
				
				
				<!-- Menu item 4 -->
				<li class="nav-item">
					<a class="nav-link" data-bs-toggle="collapse" href="#collapseinstructors" role="button" aria-expanded="${not empty tOrf2 ? 'true' : 'false'}" aria-controls="collapseinstructors" style="color: black;">
						<i class="bi bi-people-fill fa-fw me-2"></i>지원자
					</a>
					<!-- Submenu -->
					<ul class="nav collapse flex-column ${show2}" id="collapseinstructors" data-bs-parent="#navbar-sidebar">
						<li class="nav-item"> <a class="nav-link ${active3}" href="recruitContectList" style="color: black;">지원자 목록</a></li>
						<li class="nav-item"> <a class="nav-link ${active4}" href="recruitStatistics" style="color: black;">지원자 통계</a></li>
					</ul>
				</li>
				<!-- Menu item 3 -->
				<li class="nav-item"> <a class="nav-link ${active5}" href="talentFind" style="color: black;"><i class="bi bi-search fa-fw me-2"></i>인재 찾기</a></li>
				
				<!-- Menu item 6 -->
<%-- 				<li class="nav-item"> <a class="nav-link ${active6}" href="entRating"><i class="bi bi-clipboard-data fa-fw me-2"></i>기업평가 관리</a></li> --%>

				<!-- Menu item 7 -->
				<li class="nav-item"> <a class="nav-link ${active7}" href="entAccountApplication" style="color: black;"><i class="bi bi-person-plus-fill fa-fw me-2"></i>계정 관리</a></li>
				
				<!-- Menu item 7 -->
<%-- 				<li class="nav-item"> <a class="nav-link ${active8}" href="entInquiryDetails" style="color: black;"><i class="bi bi-send fa-fw me-2"></i>나의 문의 내역</a></li> --%>

				<!-- Menu item 9 -->
				<li class="nav-item"> <a class="nav-link ${active9}" href="entBoard" style="color: black;"><i class="bi bi-chat-right-text fa-fw me-2"></i>기업게시판 관리</a></li>
				
<!-- 				Menu item 9 -->
<%-- 				<li class="nav-item"> <a class="nav-link ${active10}" href="entInfo"><i class="bi bi-info-square fa-fw me-2"></i>기업정보</a></li> --%>

			</ul>
			<!-- Sidebar menu end -->

			<!-- Sidebar footer START -->
			<div class="px-3 mt-auto pt-3">
				<div class="d-flex align-items-center justify-content-between text-primary-hover">
						<a class="h5 mb-0 text-body" href="/main/index" data-bs-toggle="tooltip" data-bs-placement="top" title="Home">
							<i class="bi bi-globe"></i>
						</a>
						<form id="logoutForm" action="/logout" method="post" class="dropdown-item dropdown-footer" style="text-align: right;" >
						    <a href="#" class="h5 mb-0 text-body" onclick="document.getElementById('logoutForm').submit(); return false;" data-bs-toggle="tooltip" data-bs-placement="top" title="Sign out">
						        <i class="bi bi-power"></i>
						    </a>
						    <sec:csrfInput/>
						</form>
				</div>
			</div>
			<!-- Sidebar footer END -->

				</div>
			</div>
</nav>
<!-- Sidebar END -->