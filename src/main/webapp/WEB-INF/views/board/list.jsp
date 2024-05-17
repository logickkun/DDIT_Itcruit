<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<main>

<section class="pt-0">
	<div class="container">
		<div class="row">

			<!-- Left sidebar START -->
			<div class="col-xl-3" style="max-width: 300px;">

				<!-- Responsive offcanvas body START -->
				<div class="offcanvas-xl offcanvas-end" tabindex="-1" id="offcanvasSidebar">
					<!-- Offcanvas header -->
					<div class="offcanvas-header bg-light">
						<h5 class="offcanvas-title" id="offcanvasNavbarLabel">My profile</h5>
						<button  type="button" class="btn-close" data-bs-dismiss="offcanvas" data-bs-target="#offcanvasSidebar" aria-label="Close"></button>
					</div>
					<!-- Offcanvas body -->
					<div class="offcanvas-body p-3 p-xl-0">
						<div class="borde rounded-3 pb-2 p-3 w-100" style="background-color: white; margin-left: 30px; margin-top: -15px;">
							<!-- Dashboard menu -->
							<div class="list-group list-group-dark list-group-borderless">
								<a href="/freeBoard/insert" class="write-post-Btn writeBtn" data-session="${SessionInfo}">
									<button type="button" ><i class="bi bi-pencil"></i> 글 작성하기</button>
								</a>
								<!-- 인기글 -->
								<div class="popular-list">
									<div class="popular-list-title">
										<i class="bi bi-fire"></i> 인기글
									</div>
									
									<div class="popular-list-list">
									    <c:forEach items="${board}" var="boardVO">
									        <a href="/freeBoard/detail.do?bbsNo=${boardVO.bbsNo }">${boardVO.bbsTtl}</a>
									    </c:forEach>
									</div>

								</div>
								<!-- 최근 본 글 -->
								<div class="popular-list lately">
									<div class="popular-list-title lately">
										<i class="bi bi-eye"></i> 최근 본 글
									</div>
									<div class="popular-list-list lately" id="recent-posts">

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Responsive offcanvas body END -->
			</div>
			<!-- Left sidebar END -->

			<!-- Main content START -->
			<div class="col-xl-9">

				<!-- Card START -->
				<div class="card border bg-transparent rounded-3">
					<!-- Card header START -->
					<div class="card-header bg-transparent border-bottom">
						<h3 class="mb-0" style="padding: 10px;">자유게시판</h3>
					</div>
					<!-- Card header END -->

					<!-- Card body START -->
					
					<div class="card-body" style="margin-bottom: 10px">
						<!-- Order list table START -->
						<div class="table-responsive border-0">
							<!-- Table START -->
							<table class="table align-middle p-4 mb-0 table-hover" >
								<!-- Table head -->
								<thead style="background-color: #DCD8FC; color: black;">
									<tr>
										<th scope="col" class="border-0 rounded-start title-header">제목</th>
										<th scope="col" class="border-0 center-header">작성자</th>
										<th scope="col" class="border-0 center-header">작성일</th>
										<th scope="col" class="border-0 rounded-end center-header">조회</th>
									</tr>
								</thead>

								<!-- Table body START -->
								<tbody>
									<c:set value="${pagingVO.dataList }" var="freeBoardList"/>
									<c:choose>
										<c:when test="${empty freeBoardList }">
											<tr>
												<td colspan="5">조회하신 게시글이 존재하지 않습니다.</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach items="${freeBoardList }" var="board">
												<tr>
													<td class="title-cell"><a href="/freeBoard/detail.do?bbsNo=${board.bbsNo }" data-bbsno="${board.bbsNo }" style="color: black;">${board.bbsTtl }</a></td> 
													<td class="center-cell">${board.bbsWriter}</td>
													<td class="center-cell"><fmt:formatDate value="${board.bbsRegDt }" pattern="yyyy-MM-dd"/></td>
													<td class="center-cell">${board.bbsInqCnt }</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
								<!-- Table body END -->
							</table>
							<!-- Table END -->
							<div class="card-footer clearfix" id="pagingArea">
								${pagingVO.pagingHTML }
							</div>
						</div>
						<!-- Order list table END -->
						
						

						<!-- Pagination START -->
						<!-- Pagination END -->

						<form class="input-group input-group-sm" method="post" id="searchForm" style="max-width: 300px; margin-top: -60px; float: right;">
							<input type="hidden" name="page" id="page"/>
							<select class="form-control" name="searchType" style="border-radius: 5px; height: 40px; width: 55px; padding-right:0px; padding-left:5px;">
								<option value="title" <c:if test="${searchType eq 'title' }">selected</c:if>>제목</option>
								<option value="writer" <c:if test="${searchType eq 'writer' }">selected</c:if>>작성자</option>
							</select>
							<div style="padding: 3px;"></div>
							<div class="input-group-prepend">
								<input type="text" name="searchWord" value="${searchWord }" class="form-control" placeholder="검색" style=" max-width: 200px; border: 1px solid #ced4da; border-right: none; border-top-right-radius: 0; border-bottom-right-radius: 0;">
							</div>
							<div class="input-group-append">
								<button type="submit" class="searchBtn">
									<i class="fas fa-search"></i>
								</button>
							</div>
							<sec:csrfInput/>
						</form>
					</div>
					<!-- Card body START -->
				</div>
					<!--Card END  -->
			</div>
			<!-- Main content END -->
		</div><!-- Row END -->
	</div>
</section>
<!-- =======================Page content END -->

</main>

<script type="text/javascript">

$(function(){
	
	var searchForm = $("#searchForm");
	var pagingArea = $("#pagingArea");
	
	
	
	pagingArea.on("click", "a", function(event){
		event.preventDefault();
		var pageNo = $(this).data("page");
		searchForm.find("#page").val(pageNo);
		searchForm.submit();
	});
});


$(document).on("click", ".writeBtn", function(e) {
    e.preventDefault();
    var $this = $(this);
    var session = $this.data("session");

    if (session == null || session == "") {
        Swal.fire({
            title: "로그인 후 이용 가능합니다",
            text: "로그인 페이지로 이동 하시겠습니까?",
            icon: "info",
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '확인',
            cancelButtonText: '취소',
            reverseButtons: false
        }).then((result) => {
            if (result.value) {
                location.href = "/main/loginForm.do";
            }
        });
    } else {
    	  var url = $this.attr("href");
          window.location.href = url;
    }
});


document.addEventListener('DOMContentLoaded', function() {
    const userId = "${sessionScope.SessionInfo.accountId}";
    const isLoggedIn = userId ? true : false;

    // 게시글 클릭 이벤트 리스너 추가
    document.querySelectorAll('.title-cell a').forEach(function(link) {
        link.addEventListener('click', function() {
            const postTitle = this.textContent.trim();
            const bbsNo = this.getAttribute('data-bbsno');
            saveRecentPost(userId, postTitle, bbsNo, isLoggedIn);
        });
    });

    displayRecentPosts(isLoggedIn, 'recent-posts');
});

function saveRecentPost(userId, title, bbsNo, isLoggedIn) {
    const storage = isLoggedIn ? localStorage : sessionStorage;
    const storageKey = isLoggedIn ? 'recentPosts-' + userId : 'recentPosts-guest';
    let userPosts = JSON.parse(storage.getItem(storageKey)) || [];
    userPosts = userPosts.filter(post => post.bbsNo !== bbsNo);
    userPosts.unshift({ title, bbsNo });
    userPosts = userPosts.slice(0, 5);
    storage.setItem(storageKey, JSON.stringify(userPosts));
}

function displayRecentPosts(isLoggedIn, elementId) {
    const userId = "${sessionScope.SessionInfo.accountId}" || 'guest';
    const storage = isLoggedIn ? localStorage : sessionStorage;
    const storageKey = isLoggedIn ? 'recentPosts-' + userId : 'recentPosts-guest';
    const userPosts = JSON.parse(storage.getItem(storageKey)) || [];
    const container = document.getElementById(elementId);
    container.innerHTML = '';

    userPosts.forEach(post => {
        const truncatedTitle = post.title.length > 10 ? post.title.substring(0, 10) + '...' : post.title;
        const link = document.createElement('a');
        link.href = "/freeBoard/detail.do?bbsNo=" + post.bbsNo;
        link.textContent = truncatedTitle;
        container.appendChild(link);
    });
}
</script>

<style>
.write-post-Btn button {
    width: 205px; /* 버튼의 너비를 150px로 설정 */
    height: 70px;
    position: relative; /* 요소를 상대적으로 위치시킵니다. */
    left: 9px; /* 왼쪽으로 20px 이동 */
    font-size: 20px;
    font-weight: bold;
    border-radius: 10px; /* 둥근 테두리 설정 */
    background-color: #DCD8FC;
    border: none; 
}

.popular-list {
    background-color: white;
    padding: 20px 10px 20px 10px; 
    border-radius: 10px; 
    border: 3px solid #DCD8FC;
    color: black;
    margin: 10px;
    padding-right: 150px;
}

.popular-list-title {
    width: 200px;
    color: black;
    font-size: 20px;
    font-weight: bold;
    padding-bottom: 10px;
}

.popular-list-list a {
	color: black;
    width: 300px;
    display: block; 
    margin-bottom: 5px; 
    font-size: 15px;
    padding-left: 20px;
    text-decoration: underline;
}

.conArea{
    color: black;
    padding-left: 30px
}

.post-title{
    padding-bottom: 20px;
    font-size: 30px; 
    color: #000;
}

.post-title a{
    color: #000;      
}

.post-de{
    font-size: 12px; 
}

/* 목록 */
.title-header {
  text-align: center;
}

.center-header {
  text-align: center;
}

.title-cell {
  width: 500px;
}

.center-cell {
  text-align: center;
}

/* 목록 검색 버튼 */
.searchBtn{
  background-color: #DCD8FC;
  color: #666;
  border-radius: 5px;
  border: none;
  width: 40px; 
  height: 40px; 
  border-top-left-radius: 0; 
  border-bottom-left-radius: 0
}

/* 목록 페이징 버튼 */

.pagination-primary-soft .page-link {
  font-size: 12px; /* 페이지네이션 링크의 폰트 크기 조절 */
  padding: 8px 10px; /* 페이지네이션 버튼의 패딩을 조절하여 크기 조절 */
  color: black; /* 페이지네이션 링크 텍스트 색상 */
  background-color: #DCD8FC; /* 페이지네이션 배경 색상 */
  border-color: #DCD8FC; /* 페이지네이션 테두리 색상 */
}

.pagination-primary-soft .page-item.active .page-link {
  color: black;
  background-color: #baabfc; /* 활성화된 페이지네이션 배경 색상 */
  border-color: #DCD8FC; /* 활성화된 페이지네이션 테두리 색상 */
}

.pagination-primary-soft .page-item.disabled .page-link {
  color: black; /* 비활성화된 페이지네이션 링크 텍스트 색상 */
  pointer-events: none; /* 비활성화된 페이지네이션 클릭 이벤트 방지 */
}

.pagination-primary-soft .page-item.disabled .page-link:hover {
  background-color: #fdfdfd; /* 비활성화된 페이지네이션 호버 배경 색상 */
  border-color: #ffffff; /* 비활성화된 페이지네이션 호버 테두리 색상 */
}

.pagination-primary-soft .page-item:hover .page-link {
  background-color: #DCD8FC; /* 호버시 배경색 없애기 */
  border-color: #DCD8FC; /* 호버시 테두리 색상 */
}


</style>