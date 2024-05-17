<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!-- =======================Footer START -->
<footer class="pt-5">
	<div class="container">
		<!-- Row START -->
		<div class="row g-4">

			<!-- Widget 1 START -->
			<div class="col-lg-3">
				<!-- logo -->
				<a class="me-0" href="/main/index">
					<img class="light-mode-item h-60px" src="${pageContext.request.contextPath }/resources/assets/images/logo1(배경X).png" alt="logo">
				</a>
				<p class="my-3"><br></p>
				<!-- Social media icon -->
<!-- 				<ul class="list-inline mb-0 mt-3" style="text-align: center;"> -->
<!-- 					<li class="list-inline-item"> <a class="btn btn-white btn-sm shadow px-2 text-facebook" href="#"><i class="fab fa-fw fa-facebook-f"></i></a> </li> -->
<!-- 					<li class="list-inline-item"> <a class="btn btn-white btn-sm shadow px-2 text-instagram" href="#"><i class="fab fa-fw fa-instagram"></i></a> </li> -->
<!-- 					<li class="list-inline-item"> <a class="btn btn-white btn-sm shadow px-2 text-twitter" href="#"><i class="fab fa-fw fa-twitter"></i></a> </li> -->
<!-- 					<li class="list-inline-item"> <a class="btn btn-white btn-sm shadow px-2 text-linkedin" href="#"><i class="fab fa-fw fa-linkedin-in"></i></a> </li> -->
<!-- 				</ul> -->
			</div>
			<!-- Widget 1 END -->

			<!-- Widget 2 START -->
			<div class="col-lg-6">
				<div class="row g-4">
					<!-- Link block -->
					<div class="col-6 col-md-4">
						<h5 class="mb-2 mb-md-4">회사소개</h5>
						<ul class="nav flex-column">
							<li class="nav-item"><a class="nav-link" href="/service/company" style="color: gray; text-decoration: none;" onmouseover="this.style.color='#3399FF';" onmouseout="this.style.color='gray';">회사소개</a></li>
<!-- 							<li class="nav-item"><a class="nav-link" href="#">브랜드 스토리</a></li> -->
							<li class="nav-item"><a class="nav-link" href="/service/provisionGG" style="color: gray; text-decoration: none;" onmouseover="this.style.color='#3399FF';" onmouseout="this.style.color='gray';">이용약관</a></li>
							<li class="nav-item"><a class="nav-link" href="/service/privacyPolicy" style="color: gray; text-decoration: none;" onmouseover="this.style.color='#3399FF';" onmouseout="this.style.color='gray';">개인정보처리방침</a></li>
						</ul>
					</div>
									
					<!-- Link block -->
					<div class="col-6 col-md-4">
						<h5 class="mb-2 mb-md-4">고객센터</h5>
						<ul class="nav flex-column">
							<li class="nav-item"><a class="nav-link" href="/notice/notice.do" style="color: gray; text-decoration: none;" onmouseover="this.style.color='#3399FF';" onmouseout="this.style.color='gray';">공지사항</a></li>
							<li class="nav-item"><a class="nav-link" href="/faq/faq.do" style="color: gray; text-decoration: none;" onmouseover="this.style.color='#3399FF';" onmouseout="this.style.color='gray';">FAQ</a></li>
							<li class="nav-item"><a class="nav-link" href="/inquiry/form" style="color: gray; text-decoration: none;" onmouseover="this.style.color='#3399FF';" onmouseout="this.style.color='gray';">문의게시판</a></li>
							<li class="nav-item"><a class="nav-link" href="#" style="color: gray; text-decoration: none;" onmouseover="this.style.color='#3399FF';" onmouseout="this.style.color='gray';">사이트맵</a></li>
						</ul>
					</div>

					<!-- Link block -->
					<div class="col-6 col-md-4">
						<h5 class="mb-2 mb-md-4">제휴 및 광고</h5>
						<ul class="nav flex-column" style="margin-left: 25px;">
							<li class="nav-item"><a class="nav-link" href="#" style="color: gray; text-decoration: none;" onmouseover="this.style.color='#3399FF';" onmouseout="this.style.color='gray';">제휴 문의</a></li>
							<li class="nav-item"><a class="nav-link" href="#" style="color: gray; text-decoration: none;" onmouseover="this.style.color='#3399FF';" onmouseout="this.style.color='gray';">광고 문의</a></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- Widget 2 END -->

			<!-- Widget 3 START -->
			<div class="col-lg-3">
				<h5 class="mb-2 mb-md-4">커뮤니티</h5>
				<!-- Time -->
				<p class="mb-2">
					대표번호:<span class="h6 fw-light ms-2">042-403-1234</span>
					<span class="d-block small">(평일 09:00 ~ 18:00 토요일 09:00 ~ 18:00)</span>
				</p>

				<p class="mb-0">Email:<span class="h6 fw-light ms-2">ITcruit@gmail.com</span></p>

				<div class="row g-2 mt-2">
					<!-- Google play store button -->
<!-- 					<div class="col-6 col-sm-4 col-md-3 col-lg-6"> -->
<%-- 						<a href="#"> <img src="${pageContext.request.contextPath}/resources/assets/images/client/google-play.svg" alt=""> </a> --%>
<!-- 					</div> -->
					<!-- App store button -->
<!-- 					<div class="col-6 col-sm-4 col-md-3 col-lg-6"> -->
<%-- 						<a href="#"> <img src="${pageContext.request.contextPath}/resources/assets/images/client/app-store.svg" alt="app-store"> </a> --%>
<!-- 					</div> -->
				</div> <!-- Row END -->
			</div> 
			<!-- Widget 3 END -->
		</div><!-- Row END -->

		<!-- Divider -->
		<hr class="mt-4 mb-0">

		<!-- Bottom footer -->
		<div class="py-3">
			<div class="container px-0">
				<div class="d-lg-flex justify-content-between align-items-center py-3 text-center text-md-left">
					<!-- copyright text -->
					<div class="text-body text-primary-hover"> Copyrights ©2024 ITcruit. Build by <a href="" target="_blank" class="text-body">DDIT 403 Team1</a></div>
					<!-- copyright links-->
					<div class="justify-content-center mt-3 mt-lg-0">
						<ul class="nav list-inline justify-content-center mb-0">
							<li class="list-inline-item">
								<!-- Language selector -->
								<div class="dropup mt-0 text-center text-sm-end">
									<a class="dropdown-toggle nav-link" href="#" role="button" id="languageSwitcher" data-bs-toggle="dropdown" aria-expanded="false" style="color: gray; text-decoration: none;" onmouseover="this.style.color='#3399FF';" onmouseout="this.style.color='gray';">
										<i class="fas fa-globe me-2"></i>Language
									</a>
									<ul class="dropdown-menu min-w-auto" aria-labelledby="languageSwitcher">
										<li><a class="dropdown-item me-4" href="#" style="color: gray; text-decoration: none;" onmouseover="this.style.color='#3399FF';" onmouseout="this.style.color='gray';"><img class="fa-fw me-2" src="${pageContext.request.contextPath}/resources/assets/images/flags/uk.svg" alt="">English</a></li>
										<li><a class="dropdown-item me-4" href="#" style="color: gray; text-decoration: none;" onmouseover="this.style.color='#3399FF';" onmouseout="this.style.color='gray';"><img class="fa-fw me-2" src="${pageContext.request.contextPath}/resources/assets/images/flags/gr.svg" alt="">German </a></li>
										<li><a class="dropdown-item me-4" href="#" style="color: gray; text-decoration: none;" onmouseover="this.style.color='#3399FF';" onmouseout="this.style.color='gray';"><img class="fa-fw me-2" src="${pageContext.request.contextPath}/resources/assets/images/flags/sp.svg" alt="">French</a></li>
									</ul>
								</div>
							</li>
							<li class="list-inline-item"><a class="nav-link" href="#" style="color: gray; text-decoration: none;" onmouseover="this.style.color='#3399FF';" onmouseout="this.style.color='gray';">Terms of use</a></li>
							<li class="list-inline-item"><a class="nav-link pe-0" href="#" style="color: gray; text-decoration: none;" onmouseover="this.style.color='#3399FF';" onmouseout="this.style.color='gray';">Privacy policy</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>
<!-- ======================= Footer END -->