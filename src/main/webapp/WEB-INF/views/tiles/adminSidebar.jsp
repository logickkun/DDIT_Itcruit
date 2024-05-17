<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
 <!-- Sidebar START -->
        <nav class="navbar sidebar navbar-expand-xl navbar-dark" style="background-color: #f2f4f5; ">

            <!-- Navbar brand for xl START -->
            <div class="d-flex align-items-center">
                <a class="navbar-brand" href="/main/index">
                    <img class="navbar-brand-item" src="${pageContext.request.contextPath}/resources/assets/images/logo1(배경X).png"
                        style="width: 200px; height: auto;" alt="">
                </a>
            </div>
            <!-- Navbar brand for xl END -->

            <div class="offcanvas offcanvas-start flex-row custom-scrollbar h-100" data-bs-backdrop="true" tabindex="-1"
                id="offcanvasSidebar">
                <div class="offcanvas-body sidebar-content d-flex flex-column" style="background-color: #f2f4f5;">

                    <!-- Sidebar menu START -->
                    <ul class="navbar-nav flex-column" id="navbar-sidebar">

                        <!-- Menu item 1 -->
                        <li class="nav-item">
                            <a href="/myPage/admin/index" class="nav-link" style="color: black;">
                                <i class="bi bi-house fa-fw me-2"></i>HOME
                            </a>
                        </li>
						
						<!-- Menu item 9 -->
                        <li class="nav-item"> <a class="nav-link" href="/myPage/admin/analytics.do" style="color: black;"><i class="bi bi-bar-chart-line-fill"></i> &nbsp;애널리틱스</a></li>

                        <!-- menu item 2 -->
                        <li class="nav-item"> <a class="nav-link" href="/myPage/admin/accountManagement.do" style="color: black;"><i class="fas fa-user-tie fa-fw me-2"></i>계정관리</a></li>


                        <!-- Menu item 3 -->
                        <li class="nav-item">
                        	<a class="nav-link" href="/myPage/admin/recurit.do" style="color: black;"><i class="bi bi-calendar-fill"></i> &nbsp;전체채용관리</a>
<!--                             <a class="nav-link" data-bs-toggle="collapse" href="#collapseinstructors" role="button" -->
<!--                                 aria-expanded="false" aria-controls="collapseinstructors" style="color: black;"> -->
<!--                                 <i class="bi bi-calendar-fill"></i> &nbsp;채용공고관리 -->
<!--                             </a> -->
                            <!-- Submenu -->
<!--                             <ul class="nav collapse flex-column" id="collapseinstructors" -->
<!--                                 data-bs-parent="#navbar-sidebar"> -->
<!--                                 <li class="nav-item"> <a class="nav-link" href="/myPage/admin/recurit.do" style="color: black;">전체채용관리</a></li> -->
<!--                                 <li class="nav-item"> <a class="nav-link" href="#" style="color: black;">채용프로세스관리</a> -->
<!--                                 </li> -->
<!--                             </ul> -->
                        </li>

                        <!-- Menu item 4 -->
                        <li class="nav-item">
                        	<a class="nav-link" href="/myPage/admin/entInfoManagement" style="color: black;">
                        		<i class="bi bi-building-fill"></i> &nbsp;기업정보관리
                        	</a>
                        </li>

                        <!-- Menu item 5 -->
<!--                         <li class="nav-item"> <a class="nav-link" href="#" style="color: black;"><i class="far fa-comment-dots fa-fw me-2"></i>이력서관리</a></li> -->

                        <!-- Menu item 6 -->
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="collapse" href="#collapseauthentication" role="button"
                                aria-expanded="false" aria-controls="collapseauthentication" style="color: black;">
                                <i class="bi bi-list-task"></i> &nbsp;게시판관리
                            </a>
                            <!-- Submenu -->
                            <ul class="nav collapse flex-column ${show1}" id="collapseauthentication" 
                                data-bs-parent="#navbar-sidebar">
                                <li class="nav-item"> <a class="nav-link" href="/myPage/admin/freeBoard.do" style="color: black;">자유게시판</a></li>
                                <li class="nav-item"> <a class="nav-link" href="/myPage/admin/noticeList.do" style="color: black;">공지사항</a></li>
                                <li class="nav-item"> <a class="nav-link" href="/myPage/admin/faq.do" style="color: black;">FAQ</a></li>
                                <li class="nav-item"> <a class="nav-link" href="/myPage/admin/inquiryList.do" style="color: black;"> 문의게시판</a></li>
                            </ul>
                        </li>


                        <!-- Menu item 8 -->
<!--                         <li class="nav-item"> <a class="nav-link" href="#" style="color: black;"><i class="fas fa-user-cog fa-fw me-2"></i>인재관리</a></li> -->


                        

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

        <!-- Page content START -->
        <div class="page-content">

           </div>
