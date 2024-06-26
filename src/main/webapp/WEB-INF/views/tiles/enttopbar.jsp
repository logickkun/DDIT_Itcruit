<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> 
<style>
		.arrow_box {
		    display: none;
		    position: absolute;
		    width: 153px;
		    padding: 8px;
		    left: -55px;
		    bottom: -64px;
		    border-radius: 8px;
		    background: #333;
		    color: #fff;
		    font-size: 14px;
		    opacity: 0;  /* 초기 투명도 설정 */
		    transition: opacity 0.5s ease; /* 투명도 변화를 위한 전환 효과 */
		}
		
		.arrow_box:after {
		    position: absolute;
		    bottom: 100%;
		    left: 50%;
		    width: 0;
		    height: 0;
		    margin-left: -10px;
		    border: solid transparent;
		    border-color: rgba(51, 51, 51, 0);
		    border-bottom-color: #333;
		    border-width: 10px;
		    pointer-events: none;
		    content: ' ';
		}
	</style>
<%-- <script src="${pageContext.request.contextPath}/resources/websocket.js"></script> --%>
<!-- <script type="text/javascript"> -->
<!-- // 	 	wsConnect(); -->
<!-- </script> -->
			<nav class="navbar top-bar navbar-light border-bottom py-0 py-xl-3">
				<div class="container-fluid p-0">
					<div class="d-flex align-items-center w-100">
						<!-- Logo START -->
						<div class="d-flex align-items-center d-xl-none">
 							
							<a class="navbar-brand" href="/main/index">
								<img class="light-mode-item navbar-brand-item h-30px"
									src="${pageContext.request.contextPath }/resources/assets/images/taplogo1(배경X).png" alt="">
								<img class="dark-mode-item navbar-brand-item h-30px"
									src="${pageContext.request.contextPath}/resources/assets/images/logo-mobile-light.svg" alt="">
							</a>
						</div>
						<!-- Logo END -->

						<!-- Toggler for sidebar START -->
						<div class="navbar-expand-xl sidebar-offcanvas-menu">
							<button class="navbar-toggler me-auto" type="button" data-bs-toggle="offcanvas"
								data-bs-target="#offcanvasSidebar" aria-controls="offcanvasSidebar"
								aria-expanded="false" aria-label="Toggle navigation" data-bs-auto-close="outside">
								<i class="bi bi-text-right fa-fw h2 lh-0 mb-0 rtl-flip" data-bs-target="#offcanvasMenu">
								</i>
							</button>
						</div>
						<!-- Toggler for sidebar END -->

						<!-- Top bar left -->
						<div class="navbar-expand-lg ms-auto ms-xl-0">

							<!-- Toggler for menubar START -->
							<button class="navbar-toggler ms-auto" type="button" data-bs-toggle="collapse"
								data-bs-target="#navbarTopContent" aria-controls="navbarTopContent"
								aria-expanded="false" aria-label="Toggle navigation">
								<span class="navbar-toggler-animation">
									<span></span>
									<span></span>
									<span></span>
								</span>
							</button>
							<!-- Toggler for menubar END -->
							
							<!-- Topbar menu END -->
						</div>
						<!-- Top bar left END -->

						<!-- Top bar right START -->
						<div class="ms-xl-auto">
							<ul class="navbar-nav flex-row align-items-center">
							
								<!-- 알림웹소켓 -->
								
								<li class="nav-item ms-0 ms-md-3 dropdown" >
			                        <!-- Notification button -->
			                        <a class="btn btn-light btn-round mb-0" href="#" role="button" data-bs-toggle="dropdown"
			                            aria-expanded="false" data-bs-auto-close="outside" id="alarmBtn">
			                            <i class="bi bi-bell fa-fw"></i>
			                        </a>
			                        <!-- Notification dote -->
			                        <div id="notis-badge">
			                        
			                        	
			                        </div>
										 <p class="arrow_box">알림이 도착했습니다.</p>                        
			
			                        <!-- Notification dropdown menu START -->
			                        <div
			                            class="dropdown-menu dropdown-animation dropdown-menu-end dropdown-menu-size-md p-0 shadow-lg border-0">
			                            <div class="card bg-transparent">
			                            
			                            	<div id="alarm-header">
			                            	
			                            	</div>
			                                
			                                <div class="card-body p-0">
			                                 <ul class="list-group list-unstyled list-group-flush"  id="alarm-container">
										
			                                 </ul>
			                                </div>
			                                
			                            </div>
			                            
			                        </div>
			                        <!-- Notification dropdown menu END -->
			                    </li>		
								
								
								<!-- Notification dropdown END -->

								<!-- Profile dropdown START -->
								<li class="nav-item ms-2 ms-md-3 dropdown">
									<!-- Avatar -->
									<a class="avatar avatar-sm p-0" href="#" id="profileDropdown" role="button"
										data-bs-auto-close="outside" data-bs-display="static" data-bs-toggle="dropdown"
										aria-expanded="false">
										<img class="avatar-img rounded-circle" src="${pageContext.request.contextPath}/resources/assets/images/avatar/01.jpg"
											alt="avatar">
									</a>

									<!-- Profile dropdown START -->
									<ul class="dropdown-menu dropdown-animation dropdown-menu-end shadow pt-3"
										aria-labelledby="profileDropdown">
										<!-- Profile info -->
										<li class="px-3">
											<div class="d-flex align-items-center">
												<!-- Avatar -->
												<div class="avatar me-3 mb-3">
													<img class="avatar-img rounded-circle shadow"
														src="${pageContext.request.contextPath}/resources/assets/images/avatar/01.jpg" alt="avatar">
												</div>
												<div>
													<a class="h6 mt-2 mt-sm-0" href="#">${sessionScope.SessionInfo.accountNm }</a>
													<p class="small m-0">${sessionScope.SessionInfo.accountMail }</p>
												</div>
											</div>
										</li>
										<li>
											<hr class="dropdown-divider">
										</li>
										<!-- Links -->
<!-- 										<li><a class="dropdown-item" href="#"><i -->
<!-- 													class="bi bi-person fa-fw me-2"></i>마이페이지</a></li> -->
										<li>
			                            	<form id="logoutForm" action="/logout" method="post" class="dropdown-item dropdown-footer bg-danger-soft-hover">
											    <a id="logoutBtn" href="#" class="bg-danger-soft-hover" onclick="document.getElementById('logoutForm').submit(); return false;">
											        <i class="bi bi-power fa-fw me-2"></i>로그아웃
											    </a>
											    <sec:csrfInput/>
											</form>
										</li>
										<li>
											<hr class="dropdown-divider">
										</li>

										
									</ul>
									<!-- Profile dropdown END -->
								</li>
								<!-- Profile dropdown END -->
							</ul>
						</div>
						<!-- Top bar right END -->
					</div>
				</div>
			</nav>
			
<script type="text/javascript">
$(function(){
		
	var alarmBtn = $("#alarmBtn");
	
	alarmBtn.on("click", function(){
		var alarmHeader = document.getElementById("alarm-header");
		var alarmContainer = document.getElementById("alarm-container");
		var accountId = "${sessionScope.SessionInfo.accountId}";
		
		$.ajax({
			
			url : "/myPage/enterprise/getAlarmListById",
			type : "get",
			data : {accountId : accountId},
	      	beforeSend: function(xhr) {
                 xhr.setRequestHeader(header, token);
            },
			success : function (res) {
				
				alarmHeader.innerHTML = "";
				alarmContainer.innerHTML = "";
				
				//알림이 없을 때.
				if(res.length == 0){
					
					alarmHeader.innerHTML +=
            		'<div  class="card-header bg-transparent border-bottom py-4 d-flex justify-content-between align-items-center">'+
        			'<h6 class="m-0 ">새로운 알림이 없습니다.</h6>'+
        			'</div>';
        			
				} else {
					
					alarmHeader.innerHTML +=
						
                    '<div class="card-header bg-transparent border-bottom py-4 d-flex justify-content-between align-items-center">'+
                    '<h6 class="m-0">새로운 알람 <span class="badge bg-danger bg-opacity-10 text-danger ms-2">'+(res.length)+' 개</span></h6>'+
                    '<a class="small" href="#" id="alarmAllClearBtn"">모두 지우기</a>'+
                  	'</div>';
					
                  	var alarmContainerHTML = "";
                  	
// 					$.each(res, function(idx, list){
						
// 						var date = new Date(list.alarmTime);
// 						var year = date.getFullYear();
// 						var month = ("0" + (date.getMonth() + 1)).slice(-2);
// 						var day = ("0" + date.getDate()).slice(-2);
// 						var formatData = year + '-' + month + '-' + day;
						
						
// 						if(list.alarmCtgry == "채용결과"){
							
// 							alarmContainerHTML +=
								
// 	                   		'<li>'+
// 							'<a href="/myPage/member/recruitCheck.do?alarmNo='+ (list.alarmNo) +'" class="list-group-item-action border-0 border-bottom d-flex p-3">'+
// 									'<div>'+
// 									'<h6 class="mb-1">'+(list.alarmCn)+'</h6>'+
// 									'<p class="small text-body m-0">'+(list.alarmTtl)+'</p>'+
// 									'<u class="small">'+(list.alarmSndr)+'</u>'+
// 									'<div class="text-body">'+(formatData)+'</div>'+
// 									'</div>'+
// 							'</a>'+
// 							'</li>';
							
// 						}else if(list.alarmCtgry == "인재제안"){
							
// 							alarmContainerHTML +=
								
// 	                   		'<li>'+
// 							'<a href="/myPage/member/talentCheck.do?alarmNo='+ (list.alarmNo) +'" class="list-group-item-action border-0 border-bottom d-flex p-3">'+
// 									'<div>'+
// 									'<h6 class="mb-1">'+(list.alarmCn)+'</h6>'+
// 									'<u class="small">'+(list.alarmSndr)+'</u>'+
// 									'<div class="text-body">'+(formatData)+'</div>'+
// 									'</div>'+
// 							'</a>'+
// 							'</li>';
							
// 						}
						
						
// 					});
					
// 					alarmContainer.innerHTML = alarmContainerHTML;
				}
			}
		})
	});
});


</script>