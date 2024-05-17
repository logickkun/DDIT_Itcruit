	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Sidebar START -->
<nav class="navbar sidebar navbar-expand-xl navbar-dark" style="background-color: #f2f4f5;">

	<!-- Navbar brand for xl START -->
	<div class="d-flex align-items-center">
		<a class="navbar-brand" href="/main/index">
			<img class="navbar-brand-item" src="${pageContext.request.contextPath}/resources/assets/images/logo1(배경X).png" 
				style="width: 200px; height: auto;" alt="">
        </a>
	</div>
	<!-- Navbar brand for xl END -->
	
	<div class="offcanvas offcanvas-start flex-row custom-scrollbar h-100" data-bs-backdrop="true" tabindex="-1" id="offcanvasSidebar">
		<div class="offcanvas-body sidebar-content d-flex flex-column" style="background-color: #f2f4f5;">

			<!-- Sidebar menu START -->
			<ul class="navbar-nav flex-column" id="navbar-sidebar">
								
				<!-- Title -->
<!-- 				<li class="nav-item ms-2 my-2">Pages</li> -->

				<!-- menu item 1 -->
				<li class="nav-item">
					<a class="nav-link" href="/myPage/member/" style="color: black;">
						<i class="bi bi-calendar-event"></i> &nbsp;내 스케줄 & 공고
					</a>
				</li>
				
				<!-- menu item 2 -->
				<li class="nav-item">
					<a class="nav-link" href="/myPage/member/resumeManage" style="color: black;">
						<i class="bi bi-clipboard"></i> &nbsp;이력서 관리
					</a>
				</li>
				
<!-- 				<li class="nav-item"> -->
<!-- 					<a class="nav-link" data-bs-toggle="collapse" href="#collapsepage" role="button" aria-expanded="false" aria-controls="collapsepage"  -->
<!-- 						style="color: black;"> -->
<!-- 						<i class="bi bi-basket fa-fw me-2"></i>이력서 관리 -->
<!-- 					</a> -->
<!-- 					Submenu -->
<!-- 					<ul class="nav collapse flex-column" id="collapsepage" data-bs-parent="#navbar-sidebar"> -->
<!-- 						<li class="nav-item"> <a class="nav-link" href="admin-course-list.html">All Courses</a></li> -->
<!-- 						<li class="nav-item"> <a class="nav-link" href="admin-course-category.html">Course Category</a></li> -->
<!-- 						<li class="nav-item"> <a class="nav-link" href="admin-course-detail.html">Course Detail</a></li> -->
<!-- 					</ul> -->
<!-- 				</li> -->

				<!-- menu item 3 -->
				<li class="nav-item">
					<a class="nav-link" href="/myPage/member/likeEntList" style="color: black;">
						<i class="bi bi-building-check"></i> &nbsp;관심기업
					</a>
				</li>

				<!-- menu item 5 -->
<!-- 				<li class="nav-item"> -->
<!-- 					<a class="nav-link" data-bs-toggle="collapse" href="#collapseinstructors" role="button" aria-expanded="false" aria-controls="collapseinstructors" -->
<!-- 						style="color: black;"> -->
<!-- 						<i class="fas fa-user-tie fa-fw me-2"></i>채용과정 확인 -->
<!-- 					</a> -->
<!-- 					Submenu -->
<!-- 					<ul class="nav collapse flex-column" id="collapseinstructors" data-bs-parent="#navbar-sidebar"> -->
<!-- 						<li class="nav-item"> <a class="nav-link" href="admin-instructor-list.html">Instructors</a></li> -->
<!-- 						<li class="nav-item"> <a class="nav-link" href="admin-instructor-detail.html">Instructor Detail</a></li> -->
<!-- 						<li class="nav-item">  -->
<!-- 							<a class="nav-link" href="admin-instructor-request.html">Instructor requests -->
<!-- 								<span class="badge text-bg-success rounded-circle ms-2">2</span> -->
<!-- 							</a> -->
<!-- 						</li> -->
<!-- 					</ul> -->
<!-- 				</li> -->
	
				<!-- menu item 4 -->
				<li class="nav-item">
					<a class="nav-link" href="/myPage/member/recruitCheck.do" style="color: black;">
						<i class="fas fa-search fa-fw me-2"></i>지원 공고 확인
					</a>
				</li>


				<!-- menu item 5 -->
				<li class="nav-item">
					<a class="nav-link" href="/myPage/member/talentCheck.do" style="color: black;">
						<i class="fas fa-user-tie fa-fw me-2"></i>인재 제안 확인
					</a>
				</li>

				<!-- menu item 6 -->
				<li class="nav-item">
					<a class="nav-link" href="/myPage/member/inquiryList.do" style="color: black;">
						<i class="bi bi-chat-left-dots"></i> &nbsp;문의목록
					</a>
				</li>

				<!-- menu item 7 -->
				<li class="nav-item">
					<a class="nav-link" href="/myPage/member/passwordCheck.do" style="color: black;">
						<i class="fas fa-user-cog fa-fw me-2"></i>정보수정
					</a>
				</li>
				
				
<!-- 				<li class="nav-item"> -->
<!-- 					<a class="nav-link" data-bs-toggle="collapse" href="#collapseauthentication" role="button" aria-expanded="false" aria-controls="collapseauthentication" -->
<!-- 						style="color: black;"> -->
<!-- 						<i class="bi bi-lock fa-fw me-2"></i>인재제안 확인 -->
<!-- 					</a> -->
<!-- 					Submenu -->
<!-- 					<ul class="nav collapse flex-column" id="collapseauthentication" data-bs-parent="#navbar-sidebar"> -->
<!-- 						<li class="nav-item"> <a class="nav-link" href="sign-up.html">Sign Up</a></li> -->
<!-- 						<li class="nav-item"> <a class="nav-link" href="sign-in.html">Sign In</a></li> -->
<!-- 						<li class="nav-item"> <a class="nav-link" href="forgot-password.html">Forgot Password</a></li> -->
<!-- 						<li class="nav-item"> <a class="nav-link" href="admin-error-404.html">Error 404</a></li> -->
<!-- 					</ul> -->
<!-- 				</li> -->
			</ul>
			<!-- Sidebar menu end -->
		</div>
	</div>
</nav>
<!-- Sidebar END -->