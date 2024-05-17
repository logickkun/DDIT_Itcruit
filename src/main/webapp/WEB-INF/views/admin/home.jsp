<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="shortcut icon" href="resources/files/images/umbrella.ico">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>

<main>
	<!-- Page main content START -->
	<div class="page-content-wrapper border">

		<!-- Title -->
		<div class="row">
			<div class="col-12 mb-3">
				<h1 class="h3 mb-2 mb-sm-0">관리자님 환영합니다!</h1>
			</div>
		</div>

		<!-- Counter boxes START -->
		<div class="row g-4 mb-4">
			<!-- Counter item -->
			<div class="col-md-6 col-xxl-3">
				<div class="card card-body bg-warning bg-opacity-15 p-4 h-100">
					<div class="d-flex justify-content-between align-items-center">
						<!-- Digit -->
						<div>
							<h2 class="purecounter mb-0 fw-bold" data-purecounter-start="0" data-purecounter-end="1600"
								data-purecounter-delay="200">${aVO }</h2>
							<span class="mb-0 h6 fw-light">일반회원수</span>
						</div>
						<!-- Icon -->
						<div class="icon-lg rounded-circle bg-warning text-white mb-0"><i class="fas fa-tv fa-fw"></i>
						</div>
					</div>
				</div>
			</div>

			<!-- Counter item -->
			<div class="col-md-6 col-xxl-3">
				<div class="card card-body bg-purple bg-opacity-10 p-4 h-100">
					<div class="d-flex justify-content-between align-items-center">
						<!-- Digit -->
						<div>
							<h2 class="purecounter mb-0 fw-bold" data-purecounter-start="0" data-purecounter-end="1600"
								data-purecounter-delay="200">${eVO }</h2>
							<span class="mb-0 h6 fw-light">기업회원수</span>
						</div>
						<!-- Icon -->
						<div class="icon-lg rounded-circle bg-purple text-white mb-0"><i
								class="fas fa-user-tie fa-fw"></i></div>
					</div>
				</div>
			</div>

			<!-- Counter item -->
			<div class="col-md-6 col-xxl-3">
				<div class="card card-body bg-primary bg-opacity-10 p-4 h-100">
					<div class="d-flex justify-content-between align-items-center">
						<!-- Digit -->
						<div>
							<h2 class="purecounter mb-0 fw-bold" data-purecounter-start="0" data-purecounter-end="1235"
								data-purecounter-delay="200">${monthNum }</h2>
							<span class="mb-0 h6 fw-light">이번 달 신규회원수</span>
						</div>
						<!-- Icon -->
						<div class="icon-lg rounded-circle bg-primary text-white mb-0"><i
								class="fas fa-user-graduate fa-fw"></i></div>
					</div>
				</div>
			</div>

			<!-- Counter item -->
			<div class="col-md-6 col-xxl-3">
				<div class="card card-body bg-success bg-opacity-10 p-4 h-100">
					<div class="d-flex justify-content-between align-items-center">
						<!-- Digit -->
						<div>
							<div class="d-flex">
								<h2 class="purecounter mb-0 fw-bold" data-purecounter-start="0"
									data-purecounter-end="845" data-purecounter-delay="200">${aVO+eVO }</h2>
								<span class="mb-0 h2 ms-1"></span>
							</div>
							<span class="mb-0 h6 fw-light">총회원수</span>
						</div>
						<!-- Icon -->
						<div class="icon-lg rounded-circle bg-success text-white mb-0"><i
								class="bi bi-stopwatch-fill fa-fw"></i></div>
					</div>
				</div>
			</div>
		</div>
		<!-- Counter boxes END -->
		<br>
		<!-- Chart and Ticket START -->
		<div class="row g-4 mb-4">
			<h5 id="line-chart-title">이번달 매출</h5>
			<canvas id="bar-chart" width="800" height="450"></canvas>
		</div>

	</div>
	<!-- Top listed Cards END -->

	</div>
	<!-- Page main content END -->
	</div>
	<!-- Page content END -->
</main>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>


<script>
$(document).ready(function() {
    getGraph();
});

function getGraph() {
    var timeList = [];
    var posList = [];
    var processedData = {};

    $.ajax({
        url: "/myPage/admin/mainChart",
        type: "GET",
        dataType: "json",
        success: function(data) {
            data.sort(function(a, b) {
                return new Date(a.recruitEnrollYmd) - new Date(b.recruitEnrollYmd);
            });

            data.forEach(function(item) {
                var date = item.recruitEnrollYmd.substring(0, 10); 
                var cost = item.stlmAmt;

                if (processedData.hasOwnProperty(date)) {
                    processedData[date] += cost;
                } else {
                    processedData[date] = cost;
                }
            });

            for (var date in processedData) {
                timeList.push(date);
                posList.push(processedData[date]);
            }

            new Chart(document.getElementById("bar-chart"), {
                type: 'bar',
                data: {
                    labels: timeList, // X축 
                    datasets: [{
                        data: posList, // 값
                        label: "금액",
                        backgroundColor: "#8D7FFC",
                        fill: false
                    }]
                },
                options: {
                    scales: {
                        xAxes: [{
                            ticks: {
                                beginAtZero: true 
                            }
                        }],
                        yAxes: [{
                            ticks: {
                                beginAtZero: true 
                            }
                        }]
                    },
                    title: {
                        text: "일별 비용"
                    }
                }
            });
        },
        error: function() {
            console.log("실패");
        }
    });
}

</script>

