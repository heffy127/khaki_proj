<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1148d6f91cf7fd9a3c17408122e52f57"></script>

<style>
.wrap {
	position: absolute;
	left: 0;
	bottom: 40px;
	width: 288px;
	height: 132px;
	margin-left: -144px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	font-family: 'Do Hyeon', sans-serif;
	line-height: 1.5
}

.wrap* {
	padding: 0;
	margin: 0
}

.wrap.info {
	width: 286px;
	height: 120px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff
}

.wrap.info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888
}

.info.title {
	padding: 5px 0 0 10px;
	height: 30px;
	background: #eee;
	border-bottom: 1px solid #ddd;
	font-size: 18px;
	font-weight: bold
}

.info.close {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background:
		url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png')
}

.info.close:hover {
	cursor: pointer
}

.info.body {
	position: relative;
	overflow: hidden
}

.info.desc {
	position: relative;
	margin: 13px 0 0 90px;
	height: 75px
}

.desc.ellipsis {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap
}

.desc.jibun {
	font-size: 11px;
	color: #888;
	margin-top: -2px
}

.info.img {
	position: absolute;
	top: 6px;
	left: 5px;
	width: 73px;
	height: 71px;
	border: 1px solid #ddd;
	color: #888;
	overflow: hidden
}

.info:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 0;
	width: 22px;
	height: 12px;
	background:
		url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.info.link {
	color: #5085BB
}
</style>
<title>1등 카셰어링, khaki</title>
<%
String xsxs = (String)session.getAttribute("selectZoneNum");
%>
<input id="selectZoneNum" type ="hidden" value=<%=xsxs%>>
<input id="zoneNumber" type="hidden">
<!-- ajax  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 데이트피커 -->

<!-- 주소 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- Favicon -->
<link href="resources/assets/img/brand/favicon.png" rel="icon" type="image/png">
<!-- Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<!-- Icons -->
<link href="resources/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
<link href="resources/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
<!-- CSS Files -->
<link href="resources/assets/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />
<!-- 지도 api -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1148d6f91cf7fd9a3c17408122e52f57&libraries=services"></script>
<!-- 주소 api -->
<script>
	function sample5_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				var addr = data.address; // 최종 주소 변수

				// 주소 정보를 해당 필드에 넣는다.
				document.getElementById("sample5_address").value = addr;
				// 주소로 상세 정보를 검색
				geocoder.addressSearch(data.address, function(results, status) {
					// 정상적으로 검색이 완료됐으면
					if (status === daum.maps.services.Status.OK) {

						var result = results[0]; //첫번째 결과의 값을 활용

						// 해당 주소에 대한 좌표를 받아서
						var coords = new daum.maps.LatLng(result.y, result.x);
						// 지도를 보여준다.
						mapContainer.style.display = "block";
						map.relayout();
						// 지도 중심을 변경한다.
						map.setCenter(coords);
						// 마커를 결과값으로 받은 위치로 옮긴다.
						marker.setPosition(coords)
					}
				});
			}
		}).open();
	}
</script>
<!-- modal 닫기, 시간/차량/보험 정보 변수 -->
<script type="text/javascript">
	function carSelect(car) {
	}
	function timeSelect(time) {
	}
	function burum() { // 부름예약시 이동거리/비용 크롤링
		$('#burum1').modal("hide"); //닫기 
		var zone_loc = $().val();
		var number = parseInt($('#zoneNumber').val());
		var home_loc = zone_addr[number];
		$.ajax({
			type : "GET",
			url : "burumReservation.do",
			data : {
				'zone_loc' : zone_loc,
				'home_loc' : home_loc
			},
			error : function(error) {
				alert("오류발생" + error);
			},
			success : function(data) {
				
			}
		})
	}
	function burumClose1() {
		$('#burum1').modal("hide"); //닫기 
	}
	function burumClose2() {
		$('#burum2').modal("hide"); //닫기 
	}
	function modalClose() {
		$('#reservation').modal("hide"); //닫기 
	}
	function modalClose1() {
		var startTime = $('#startTime').val();
		var endTime = $('#endTime').val();
		$('#reservation1').modal("hide"); //닫기 
		$('#con1').val(startTime + endTime);
	}
	function modalClose2() {
		$('#reservation2').modal("hide"); //닫기 
	}
	function modalClose2_1(car) {
		$('#reservation2_1').modal("hide"); //닫기 
		$('#con2').val(car);
	}
	function modalClose2_2(car) {
		$('#reservation2_2').modal("hide"); //닫기 
		$('#con2').val(car);
	}
	function modalClose2_3(car) {
		$('#reservation2_3').modal("hide"); //닫기 
		$('#con2').val(car);
	}
	function modalClose3() {
		$('#reservation3').modal("hide"); //닫기 
	}
	function insSelect(grade) {
		$('#con3').val(grade);
	}
</script>
<!-- 조건 입력 후 ajax  -->
<script type="text/javascript">
	var selectZoneNum1 = $('#selectZoneNum').val();
	var selectZoneNum2 = selectZoneNum1.split(",");
	var selectZoneNum = [];
	for (var i = 0; i < selectZoneNum2.length-1; i++) {
		selectZoneNum[i] = parseInt(selectZoneNum2[i]);
	}
	
	function searchCar() { //reservation table에서 선택한 차량에 해당하는 건을 모두 가져옴
		$('#reservation3').modal("hide"); //닫기 
		var buy_carModel = $('#con2').val();
		var buy_endTime = $('#endTime').val()
		var buy_startTime = $('#startTime').val()
		var searchSum = null;
		var searchEnd = null;
		var searchStart = null;
		var temp = [];
		var temp2 = [];
		var carNums = [];
		var zones="";
	
		$.ajax({
			type : "GET",
			url : "searchCar.do",
			data : {
				'buy_carModel' : buy_carModel
			},
			error : function(error) {
				alert("오류발생" + error);
			},
			success : function(data) {

				//--------------startTime ajax
				$.ajax({
					type : "GET",
					url : "searchStartTime.do",
					data : {
						'buy_startTime' : buy_startTime,
						'buy_carModel' : buy_carModel
					},
					error : function(error) {
						alert("오류발생" + error);
					},
					success : function(data) {
						searchStart = parseInt(data.trim());
						//--------------endTime ajax
						$.ajax({
							type : "GET",
							url : "searchEndTime.do",
							data : {
								'buy_endTime' : buy_endTime,
								'buy_carModel' : buy_carModel
							},
							error : function(error) {
								alert("End오류발생" + error);
							},
							success : function(data) {
								searchEnd = parseInt(data.trim());
								//해당하는 차량 예약정보를 모두 가져왔으니 시작시간과 도착시간을 계산하여 예약가능여부 결정
								// DB도착시간 < 입력한 시작시간 , DB시작시간 > 입력한 도착시간 
								// 각 조건으로 나온 데이터 개수의 합이 해당 차량에 대한 모든 데이터 개수와 동일할 경우 예약가능

								if (searchSum = searchEnd + searchStart) {
									alert("예약가능");

									$.ajax({
										type : "GET",
										url : "selectCar.do",
										data : {
											'buy_carModel' : buy_carModel,
										},
										error : function(error) {
											alert("오류발생" + error);
										},
										success : function(data) {
											temp = (data.trim()).split("★");
											for (var i = 0; i < temp.length-1; i++) {
												temp2 = temp[i].split(",");
												carNums[i] = temp2[0];
												zones = zones + temp2[1] + ",";
											}
											alert("mapReset 실행 : " + zones);
											location.href="mapReset.do?selectZoneNum=" + zones;
											// 조건에 부합하는 차량갯수, 존 번호 추출해냄
										}
									})
								} else {
									alert("해당시간 " + buy_carModel + "차종 예약불가");
									
								}
							}
						})
					}
				})
			}
		})
	}
</script>
<!-- 조건에 맞는 차량번호, 존번호 ajax -->
<script type="text/javascript">
function carListInfo(i) { //존 번호로 해당 존 차량들을 모두 가져옴
	// 존에 아무것도 없을 떄 오류남
	$("#carList").empty(); //기존에 있던 내용 지움
	$.ajax({
		type : "GET",
		url : "carListInfo.do",
		data : {
			'zoneNum' : i
		},
		error : function(error) {
			alert("오류발생" + error);
		},
		success : function(data) {
			var xx = data.trim();
			var x1 = (xx).split("★"); // 해당 존에 있는 차량 갯수보다 1개 많은 배열로 생성됨
			var x2 = [];
			var carNum = [];
			var carName = [];
			var carImage = [];
			
			for (var i = 0; i < x1.length-1; i++) { // x1 배열갯수 -1 하여 for문
				x2 = x1[i].split(",");
				$("#carList").append(
						'<tr><td width="30%"><img alt="" src="'+x2[2]+'" width="80%"></td>'
						+'<td width="30%"><strong>'+x2[0]+'</strong></td>'
						+'<td width="30%">'+x2[1]+'% </td>'
						+'<td width="30%"><button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#reservation">선택</button></td></tr>'
				);
			}
		}
	})
}
</script>
<!-- 부름예약시 거리 및 비용계산 -->
<script type="text/javascript">
function burum() {
	var zone_addr = ['연신내역','연신내역','연신내역','연신내역','연신내역','갈현e편한세상1단지아파트','갈현e편한세상1단지아파트','갈현e편한세상1단지아파트','갈현e편한세상1단지아파트','갈현e편한세상1단지아파트'];
	
}
</script>

<div class="d-flex align-items-center">
	<img alt="" src="" width="10"> <span class="mr-2">100%</span>
	<div>
		<div class="progress">
			<div class="progress-bar bg-success" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%;"></div>
		</div>
	</div>
</div>
</head>
<nav class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white" id="sidenav-main">
	<div class="container-fluid">
		<!-- Toggler -->
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<!-- Brand -->
		<a class="navbar-brand pt-0" href="home.do"> <img src="resources/assets/img/brand/khaki2.png" class="navbar-brand-img" alt="...">
		</a>
		<!-- User -->
		<ul class="nav align-items-center d-md-none">
			<li class="nav-item dropdown"><a class="nav-link nav-link-icon" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="ni ni-bell-55"></i>
			</a>
				<div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right" aria-labelledby="navbar-default_dropdown_1">
					<a class="dropdown-item" href="#">Action</a> <a class="dropdown-item" href="#">Another action</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Something else here</a>
				</div></li>
			<li class="nav-item dropdown"><a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<div class="media align-items-center">
						<span class="avatar avatar-sm rounded-circle"> <img alt="Image placeholder" src="resources/assets/img/theme/team-1-800x800.jpg">
						</span>
					</div>
			</a>
				<div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
					<div class=" dropdown-header noti-title">
						<h6 class="text-overflow m-0">Welcome!</h6>
					</div>
					<a href="profile.do" class="dropdown-item"> <i class="ni ni-single-02"></i> <span>My profile</span>
					</a> <a href="profile.do" class="dropdown-item"> <i class="ni ni-settings-gear-65"></i> <span>Settings</span>
					</a> <a href="profile.do" class="dropdown-item"> <i class="ni ni-calendar-grid-58"></i> <span>Activity</span>
					</a> <a href="profile.do" class="dropdown-item"> <i class="ni ni-support-16"></i> <span>Support</span>
					</a>
					<div class="dropdown-divider"></div>
					<a href="#!" class="dropdown-item"> <i class="ni ni-user-run"></i> <span>Logout</span>
					</a>
				</div></li>
		</ul>
		<!-- Collapse -->
		<div class="collapse navbar-collapse" id="sidenav-collapse-main">
			<!-- Collapse header -->
			<div class="navbar-collapse-header d-md-none">
				<div class="row">
					<div class="col-6 collapse-brand">
						<a href="../index.html"> <img src="resources/assets/img/brand/blue.png">
						</a>
					</div>
					<div class="col-6 collapse-close">
						<button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle sidenav">
							<span></span> <span></span>
						</button>
					</div>
				</div>
			</div>
			<!-- Form -->
			<form class="mt-4 mb-3 d-md-none">
				<div class="input-group input-group-rounded input-group-merge">
					<input type="search" class="form-control form-control-rounded form-control-prepended" placeholder="Search" aria-label="Search">
					<div class="input-group-prepend">
						<div class="input-group-text">
							<span class="fa fa-search"></span>
						</div>
					</div>
				</div>
			</form>
			<!-- 왼쪽 공통 메뉴 -->
			<ul class="navbar-nav">
				<li class="nav-item "><a class=" nav-link" href="home.do"> <i class="ni ni-tv-2 text-black"></i> Home
				</a></li>
				<li class="nav-item"><a class="nav-link active" href="map.do"> <i class="ni ni-square-pin text-orange"></i> Map
				</a></li>
				<li class="nav-item"><a class="nav-link" href="board.do"> <i class="ni ni-bullet-list-67 text-blue"></i> board
				</a></li>
				<li class="nav-item"><a class="nav-link " href="notice.do"> <i class="ni ni-air-baloon text-red"></i> Notice
				</a></li>
				<li class="nav-item"><a class="nav-link " href="coupon.do"> <i class="ni ni-collection text-green"></i> Coupon
				</a></li>
			</ul>
			<!-- Divider -->
			<hr class="my-3">
			<!-- Heading -->
			<h6 class="navbar-heading text-muted">Documentation</h6>
			<!-- Navigation -->
			<ul class="navbar-nav mb-md-3">
				<li class="nav-item"><a class="nav-link" href="https://demos.creative-tim.com/argon-dashboard/docs/getting-started/overview.html"> <i class="ni ni-spaceship"></i> Getting started
				</a></li>
				<li class="nav-item"><a class="nav-link" href="https://demos.creative-tim.com/argon-dashboard/docs/foundation/colors.html"> <i class="ni ni-palette"></i> Foundation
				</a></li>
				<li class="nav-item"><a class="nav-link" href="https://demos.creative-tim.com/argon-dashboard/docs/components/alerts.html"> <i class="ni ni-ui-04"></i> Components
				</a></li>
			</ul>
		</div>
	</div>
</nav>
<div class="main-content">
	<!-- Navbar -->
	<nav class="navbar navbar-top navbar-expand-md navbar-dark" id="navbar-main">
		<div class="container-fluid">
			<!-- Brand -->
			<a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="../index.html">Map</a>
			<!-- Form -->
			<form class="navbar-search navbar-search-dark form-inline mr-3 d-none d-md-flex ml-lg-auto">
				<div class="form-group mb-0">
					<div class="input-group input-group-alternative">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-search"></i></span>
						</div>
						<input class="form-control" placeholder="Search" type="text">
					</div>
				</div>
			</form>
			<!-- User -->
			<ul class="navbar-nav align-items-center d-none d-md-flex">
				<li class="nav-item dropdown"><a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<div class="media align-items-center">
							<span class="avatar avatar-sm rounded-circle"> <img alt="Image placeholder" src="resources/assets/img/theme/team-4-800x800.jpg">
							</span>
							<div class="media-body ml-2 d-none d-lg-block">
								<span class="mb-0 text-sm  font-weight-bold">Jessica Jones</span>
							</div>
						</div>
				</a>
					<div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
						<div class=" dropdown-header noti-title">
							<h6 class="text-overflow m-0">Welcome!</h6>
						</div>
						<a href="profile.do" class="dropdown-item"> <i class="ni ni-single-02"></i> <span>My profile</span>
						</a> <a href="profile.do" class="dropdown-item"> <i class="ni ni-settings-gear-65"></i> <span>Settings</span>
						</a> <a href="profile.do" class="dropdown-item"> <i class="ni ni-calendar-grid-58"></i> <span>Activity</span>
						</a> <a href="profile.do" class="dropdown-item"> <i class="ni ni-support-16"></i> <span>Support</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#!" class="dropdown-item"> <i class="ni ni-user-run"></i> <span>Logout</span>
						</a>
					</div></li>
			</ul>
		</div>
	</nav>
	<!-- End Navbar -->
	<!-- Header -->
	<div class="header bg-gradient-default pb-8 pt-5 pt-md-8">
		<div class="container-fluid">
			<div class="header-body">
				<!-- Card stats -->
				<div class="row" style="height: 180px">

					<div class="col-xl-3 col-lg-6" style="height: 100%;">
						<div class="card card-stats mb-4 mb-xl-0" style="height: 100%;">
							<div class="card-body" style="height: 100%">
								<div class="row" style="height: 100%">
									<div class="col">
										<label style="font-size: 20px; font-weight: bold;">최소 30분<br> 10분 단위로 예약가능
										</label>
									</div>
									<div>
										<button type="button" class="btn btn-outline-primary" style="height: 30%">자세히</button>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xl-3 col-lg-6" style="height: 100%">
						<div class="card card-stats mb-4 mb-xl-0" style="height: 100%">
							<div class="card-body" style="height: 100%">
								<div class="row" style="height: 100%">
									<div class="col">
										<label style="font-size: 20px; font-weight: bold;">세단, SUV, 소형차 등 <br> 다양한 차종
										</label>
									</div>
									<div>
										<button type="button" class="btn btn-outline-primary" style="height: 30%">자세히</button>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xl-3 col-lg-6" style="height: 100%">
						<div class="card card-stats mb-4 mb-xl-0" style="height: 100%">
							<div class="card-body" style="height: 100%">
								<div class="row" style="height: 100%">
									<div class="col">
										<label style="font-size: 20px; font-weight: bold;">필요할 땐 집 앞으로 !<br>부름서비스
										</label>
									</div>
									<div>
										<button type="button" class="btn btn-outline-primary" style="height: 30%">자세히</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-lg-6" style="height: 100%">
						<div class="card card-stats mb-4 mb-xl-0" style="height: 100%">
							<div class="card-body" style="height: 100%">
								<div class="row" style="height: 100%">
									<!-- Button trigger modal -->
									<button type="button" class="btn btn-outline-default" style="font-weight: bold; font-size: 20px" data-toggle="modal" data-target="#reservation1">차량검색</button>
									<button type="button" class="btn btn-outline-default" style="font-weight: bold; font-size: 20px" onclick="location='searchCar.do'">테스트버튼</button>
									<!-------------------------------------------------->
									<!-- 예약시간 선택 -->
									<div class="modal fade" id="reservation1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
										<div class="modal-dialog modal-dialog-centered" role="document">
											<div class="modal-content">
												<div class="modal-header">

													<h5 class="modal-title" id="exampleModalLabel">예약시간</h5>
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<table>
														<tr>
															<td>
																시작시간 : <input class="form-control" type="text" id="startTime" placeholder="ex) 1907081930" />
															</td>
														</tr>
														<tr>
															<td>
																반납시간 : <input class="form-control" type="text" id="endTime" placeholder="ex) 1907081930" />
															</td>
														</tr>
													</table>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#reservation2" onclick="modalClose1()">다음</button>
												</div>
											</div>
										</div>
									</div>
									<!-------------------------------------------------->
									<!-- 차종 선택 (소형/세단/SUV) -->
									<div class="modal fade" id="reservation2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
										<div class="modal-dialog modal-dialog-centered" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">차종선택</h5>
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<button type="button" class="btn btn-outline-default" style="width: 30%; height: 100px" data-toggle="modal" data-target="#reservation2_1" onclick="modalClose2()">소형</button>
													<button type="button" class="btn btn-outline-default" style="width: 30%; height: 100px" data-toggle="modal" data-target="#reservation2_2" onclick="modalClose2()">세단</button>
													<button type="button" class="btn btn-outline-default" style="width: 30%; height: 100px" data-toggle="modal" data-target="#reservation2_3" onclick="modalClose2()">SUV</button>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#reservation1" onclick="modalClose2()">이전</button>
												</div>
											</div>
										</div>
									</div>
									<!-------------------------------------------------->
									<!-- 소형차 중 선택 -->
									<div class="modal fade" id="reservation2_1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
										<div class="modal-dialog modal-dialog-centered" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<div>
														<table>
															<tr>
																<td style="width: 30%">
																	<img alt="" src="http://rentacarshop.com/data/file/car_k/236995330_noFWsxVk_bacc1f2dee0e8c1ff188bdf8bc974bdd39fe8961.png" width="100%">
																</td>
																<td>
																	<button type="button" class="btn btn-outline-default" data-toggle="modal" data-target="#reservation3" onclick="modalClose2_1('SPARK')">SPARK</button>
																</td>
															</tr>
															<tr>
																<td style="width: 30%">
																	<img alt="" src="http://rentacarshop.com/data/file/car_k/236995330_noFWsxVk_bacc1f2dee0e8c1ff188bdf8bc974bdd39fe8961.png" width="100%">
																</td>
																<td>
																	<button type="button" class="btn btn-outline-default" data-toggle="modal" data-target="#reservation3" onclick="modalClose2_1('SPARK')">SPARK</button>
																</td>
															</tr>
															<tr>
																<td style="width: 30%">
																	<img alt="" src="http://rentacarshop.com/data/file/car_k/236995330_noFWsxVk_bacc1f2dee0e8c1ff188bdf8bc974bdd39fe8961.png" width="100%">
																</td>
																<td>
																	<button type="button" class="btn btn-outline-default" data-toggle="modal" data-target="#reservation3" onclick="modalClose2_1('SPARK')">SPARK</button>
																</td>
															</tr>
															<tr>
																<td style="width: 30%">
																	<img alt="" src="http://rentacarshop.com/data/file/car_k/236995330_noFWsxVk_bacc1f2dee0e8c1ff188bdf8bc974bdd39fe8961.png" width="100%">
																</td>
																<td>
																	<button type="button" class="btn btn-outline-default" data-toggle="modal" data-target="#reservation3" onclick="modalClose2_1('SPARK')">SPARK</button>
																</td>
															</tr>
														</table>
													</div>
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body"></div>
												<div class="modal-footer">
													<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#reservation2" onclick="modalClose2_1()">이전</button>
												</div>
											</div>
										</div>
									</div>
									<!-- 세단 중 선택 -->
									<div class="modal fade" id="reservation2_2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
										<div class="modal-dialog modal-dialog-centered" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<div>
														<table>
															<tr>
																<td style="width: 30%">
																	<img alt="" src="http://sincha114.com/files/attach/images/469/897/581/afc8781970559604bf94d3516f2de63a.png" width="100%">
																</td>
																<td>
																	<button type="button" class="btn btn-outline-default" data-toggle="modal" data-target="#reservation3" onclick="modalClose2_2('AVANTE')">AVANTE</button>
																</td>
															</tr>
															<tr>
																<td style="width: 30%">
																	<img alt="" src="http://sincha114.com/files/attach/images/469/897/581/afc8781970559604bf94d3516f2de63a.png" width="100%">
																</td>
																<td>
																	<button type="button" class="btn btn-outline-default" data-toggle="modal" data-target="#reservation3" onclick="modalClose2_2('AVANTE')">AVANTE</button>
																</td>
															</tr>
															<tr>
																<td style="width: 30%">
																	<img alt="" src="http://sincha114.com/files/attach/images/469/897/581/afc8781970559604bf94d3516f2de63a.png" width="100%">
																</td>
																<td>
																	<button type="button" class="btn btn-outline-default" data-toggle="modal" data-target="#reservation3" onclick="modalClose2_2('AVANTE')">AVANTE</button>
																</td>
															</tr>
															<tr>
																<td style="width: 30%">
																	<img alt="" src="http://sincha114.com/files/attach/images/469/897/581/afc8781970559604bf94d3516f2de63a.png" width="100%">
																</td>
																<td>
																	<button type="button" class="btn btn-outline-default" data-toggle="modal" data-target="#reservation3" onclick="modalClose2_2('AVANTE')">AVANTE</button>
																</td>
															</tr>
															<tr>
																<td style="width: 30%">
																	<img alt="" src="http://sincha114.com/files/attach/images/469/897/581/afc8781970559604bf94d3516f2de63a.png" width="100%">
																</td>
																<td>
																	<button type="button" class="btn btn-outline-default" data-toggle="modal" data-target="#reservation3" onclick="modalClose2_2('AVANTE')">AVANTE</button>
																</td>
															</tr>
														</table>
													</div>
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body"></div>
												<div class="modal-footer">
													<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#reservation2" onclick="modalClose2_2()">이전</button>
												</div>
											</div>
										</div>
									</div>
									<!-- SUV 중 선택 -->
									<div class="modal fade" id="reservation2_3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
										<div class="modal-dialog modal-dialog-centered" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<div>
														<table>
															<tr>
																<td style="width: 30%">
																	<img alt="" src="resources/assets/img/car/avante.png" width="100%">
																</td>
																<td>
																	<button type="button" class="btn btn-outline-default" data-toggle="modal" data-target="#reservation3" onclick="modalClose2_3('KONA')">KONA</button>
																</td>
															</tr>
															<tr>
																<td style="width: 30%">
																	<img alt="" src="http://file.carisyou.com/upload/2018/11/30/FILE_201811301136252880.png" width="100%">
																</td>
																<td>
																	<button type="button" class="btn btn-outline-default" data-toggle="modal" data-target="#reservation3" onclick="modalClose2_3('PALISADE')">PALISADE</button>
																</td>
															</tr>
															<tr>
																<td style="width: 30%">
																	<img alt="" src="http://file.carisyou.com/upload/2018/11/30/FILE_201811301136252880.png" width="100%">
																</td>
																<td>
																	<button type="button" class="btn btn-outline-default" data-toggle="modal" data-target="#reservation3" onclick="modalClose2_3('PALISADE')">PALISADE</button>
																</td>
															</tr>
															<tr>
																<td style="width: 30%">
																	<img alt="" src="http://file.carisyou.com/upload/2018/11/30/FILE_201811301136252880.png" width="100%">
																</td>
																<td>
																	<button type="button" class="btn btn-outline-default" data-toggle="modal" data-target="#reservation3" onclick="modalClose2_3('PALISADE')">PALISADE</button>
																</td>
															</tr>
															<tr>
																<td style="width: 30%">
																	<img alt="" src="http://file.carisyou.com/upload/2018/11/30/FILE_201811301136252880.png" width="100%">
																</td>
																<td>
																	<button type="button" class="btn btn-outline-default" data-toggle="modal" data-target="#reservation3" onclick="modalClose2_3('PALISADE')">PALISADE</button>
																</td>
															</tr>
															<tr>
																<td style="width: 30%">
																	<img alt="" src="http://file.carisyou.com/upload/2018/11/30/FILE_201811301136252880.png" width="100%">
																</td>
																<td>
																	<button type="button" class="btn btn-outline-default" data-toggle="modal" data-target="#reservation3" onclick="modalClose2_3('PALISADE')">PALISADE</button>
																</td>
															</tr>
														</table>
													</div>
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body"></div>
												<div class="modal-footer">
													<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#reservation2" onclick="modalClose2_3()">이전</button>
												</div>
											</div>
										</div>
									</div>
									<!-- 선택 최종화면 -->
									<div class="modal fade" id="reservation3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
										<div class="modal-dialog modal-dialog-centered" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>

												</div>
												<div class="modal-body">
													<input id="con1"> <input id="con2">
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#reservation2" onclick="modalClose3()">이전</button>
													<button type="button" class="btn btn-primary" onclick="searchCar()">가능한 차량검색</button>
												</div>
											</div>
										</div>
									</div>
									<!-- 일반/부름 선택창-->
									<div class="modal fade" id="reservation" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-dialog-centered" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">예약시작!</h5>
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<button type="button" class="btn btn-outline-default" style="width: 200px; height: 200px" data-toggle="modal" data-target="#insurance" onclick="modalClose()">일반예약</button>
													<button type="button" class="btn btn-outline-default" style="width: 200px; height: 200px" data-toggle="modal" data-target="#burum1" onclick="modalClose()">부름예약</button>
												</div>
											</div>
										</div>
									</div>
									<!-- 부름예약1 -->
									<div class="modal fade" id="burum1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-dialog-centered" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">부름 장소 설정</h5>
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<div class="alert alert-secondary" role="alert">
														<h2>주의사항!</h2>
														<h4>* 불법 주차구역으로 부과되는 과태료는 고객부담입니다.</h4>
														<h4>* 부름은 출발 4시간 이전까지만 예약 가능합니다.</h4>
													</div>
													<input type="text" id="sample5_address" class="form-control is-valid" placeholder="ex) 서울시 은평구 불광동 445-17" width="40%"> <br> <input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색" class="btn btn-outline-primary"><br>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#reservation" onclick="burumClose1()">이전</button>
													<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#burum2" onclick="burum()">다음</button>
												</div>
											</div>
										</div>
									</div>
									<!-- 부름예약2 -->
									<div class="modal fade" id="burum2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-dialog-centered" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">부름 장소 설정</h5>
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<div class="alert alert-secondary" role="alert">
														<h2>안내사항</h2>
														<h4>
															부름 지점에 도착하면 문자가 전송됩니다. <i class="ni ni-send"></i>
														</h4>
														<h4>부름 추가요금은 ***원 입니다.</h4>
														<i class="send"></i>
													</div>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#insurance" onclick="burumClose2()">다음</button>
												</div>
											</div>
										</div>
									</div>
									<!-- 보험설정 -->
									<div class="modal fade" id="insurance" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-dialog-centered" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">보험설정</h5>
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<div class="alert alert-secondary" role="alert">
														<div class="custom-control custom-control-alternative custom-checkbox mb-3">
															<div class="nav-wrapper">
																<ul class="nav nav-pills nav-fill flex-column flex-md-row" id="tabs-icons-text" role="tablist">
																	<li class="nav-item"><a class="nav-link mb-sm-3 mb-md-0 active" id="tabs-icons-text-1-tab" data-toggle="tab" href="#tabs-icons-text-1" role="tab" aria-controls="tabs-icons-text-1" aria-selected="true" onclick="insSelect('스페셜')">스페셜</a></li>
																	<li class="nav-item"><a class="nav-link mb-sm-3 mb-md-0" id="tabs-icons-text-2-tab" data-toggle="tab" href="#tabs-icons-text-2" role="tab" aria-controls="tabs-icons-text-2" aria-selected="false" onclick="insSelect('스텐다드')">스텐다드</a></li>
																	<li class="nav-item"><a class="nav-link mb-sm-3 mb-md-0" id="tabs-icons-text-3-tab" data-toggle="tab" href="#tabs-icons-text-3" role="tab" aria-controls="tabs-icons-text-3" aria-selected="false" onclick="insSelect('라이트')">라이트</a></li>
																</ul>
															</div>
															<div class="card shadow">
																<div class="card-body">
																	<div class="tab-content" id="myTabContent">
																		<div class="tab-pane fade show active" id="tabs-icons-text-1" role="tabpanel" aria-labelledby="tabs-icons-text-1-tab">
																			<p class="description">자기부담금 최대 5만원</p>
																			<p class="description">AXA 운전자보험 포함</p>
																		</div>
																		<div class="tab-pane fade" id="tabs-icons-text-2" role="tabpanel" aria-labelledby="tabs-icons-text-2-tab">
																			<p class="description">자기부담금 최대 30만원</p>
																		</div>
																		<div class="tab-pane fade" id="tabs-icons-text-3" role="tabpanel" aria-labelledby="tabs-icons-text-3-tab">
																			<p class="description">자기부담금 최대 70만원</p>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#final">결제하기</button>
												</div>
											</div>
										</div>
									</div>
									<!-- final > 보여주기용도 -->
									<div class="modal fade" id="final" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-dialog-centered" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<!-------------------------------------->

												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
												</div>
											</div>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid mt--7">
		<div class="row">
			<div class="col">
				<div class="card shadow border-0">
					<div style="float: left;">

						<div id="map" style="width: 70%; height: 700px; float: left; border-radius: 10px;"></div>
						<!--지도 DIV-->

						<div class="card shadow" style="width: 30%; height: 700px; float: left; border-radius: 10px;">
							<div class="card-header bg-transparent" style="width: 100%; height: 100%">
								<div id="carListInfo1" style="width: 100%;"></div>
								<div class="row align-items-center" style="width: 100%">
									<div style="width: 100%;">
										<table class="table align-items-center table-flush" style="width: 100%;">
											<thead class="thead-light">
												<tr>
													<td>차종</td>
													<td>주행거리</td>
													<td>연료량</td>
													<td>예약</td>
												</tr>
											</thead>
										</table>
										<!------------------------------------------------------------->
										<div style="width: 100%; height: 630px; overflow: scroll;">
										<div class="alert alert-secondary" role="alert"><table id="carList">
										
										</table></div>
				

											<!---------------------------------------------------------------------------->
										</div>
									</div>
								</div>

							</div>
							<div class="card-body">
								<!-- Chart -->
								<div class="chart">
									<canvas id="chart-orders" class="chart-canvas"></canvas>
								</div>
							</div>
						</div>
					</div>


					<script>
						var selectZoneNum = [0,1,2,3,4,5,6,7,8,9];
						var MARKER_WIDTH = 33, // 기본, 클릭 마커의 너비
						MARKER_HEIGHT = 36, // 기본, 클릭 마커의 높이
						OFFSET_X = 12, // 기본, 클릭 마커의 기준 X좌표
						OFFSET_Y = MARKER_HEIGHT, // 기본, 클릭 마커의 기준 Y좌표
						OVER_MARKER_WIDTH = 40, // 오버 마커의 너비
						OVER_MARKER_HEIGHT = 42, // 오버 마커의 높이
						OVER_OFFSET_X = 13, // 오버 마커의 기준 X좌표
						OVER_OFFSET_Y = OVER_MARKER_HEIGHT, // 오버 마커의 기준 Y좌표
						SPRITE_MARKER_URL = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markers_sprites2.png', // 스프라이트 마커 이미지 URL
						SPRITE_WIDTH = 126, // 스프라이트 이미지 너비
						SPRITE_HEIGHT = 146, // 스프라이트 이미지 높이
						SPRITE_GAP = 10; // 스프라이트 이미지에서 마커간 간격

						var markerSize = new kakao.maps.Size(MARKER_WIDTH,
								MARKER_HEIGHT), // 기본, 클릭 마커의 크기
						markerOffset = new kakao.maps.Point(OFFSET_X, OFFSET_Y), // 기본, 클릭 마커의 기준좌표
						overMarkerSize = new kakao.maps.Size(OVER_MARKER_WIDTH,
								OVER_MARKER_HEIGHT), // 오버 마커의 크기
						overMarkerOffset = new kakao.maps.Point(OVER_OFFSET_X,
								OVER_OFFSET_Y), // 오버 마커의 기준 좌표
						spriteImageSize = new kakao.maps.Size(SPRITE_WIDTH,
								SPRITE_HEIGHT); // 스프라이트 이미지의 크기
						//----------------------------------------------------------------------------------------------------------------------
						var positionsAll = [ // 마커의 위치
						new kakao.maps.LatLng(37.61094, 126.92267),
								new kakao.maps.LatLng(37.61361, 126.93490),
								new kakao.maps.LatLng(37.62247, 126.92701),
								new kakao.maps.LatLng(37.61071, 126.91606),
								new kakao.maps.LatLng(36.91071, 126.89606),
								new kakao.maps.LatLng(37.61071, 126.90606),
								new kakao.maps.LatLng(37.41071, 126.70606),
								new kakao.maps.LatLng(37.20071, 126.89606),
								new kakao.maps.LatLng(37.35071, 126.77606),
								new kakao.maps.LatLng(33.45022, 126.57384), ], selectedMarker = null;// 클릭한 마커를 담을 변수
						//----------------------------------------------------------------------------------------------------------------------
						var positions = [];
						selectZoneNum.forEach(function(item) {
							positions.push(positionsAll[item]);
						});

						//----------------------------------------------------------------------------------------------------------------------

						var mapContainer = document.getElementById('map'), // 지도를 표시할 div
						mapOption = {
							center : new kakao.maps.LatLng(37.619156535986576,
									126.9213114357428), // 지도의 중심좌표 > 회원정보에 입력된 주소를 좌표로 변환하여 입력됨
							level : 6
						// 지도의 확대 레벨
						};

						var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

						// 지도 위에 마커를 표시합니다
						for (var i = 0, len = positions.length; i < len; i++) {
							var gapX = (MARKER_WIDTH + SPRITE_GAP), // 스프라이트 이미지에서 마커로 사용할 이미지 X좌표 간격 값
							originY = 0, // 스프라이트 이미지에서 기본, 클릭 마커로 사용할 Y좌표 값
							overOriginY = 0, // 스프라이트 이미지에서 오버 마커로 사용할 Y좌표 값
							normalOrigin = new kakao.maps.Point(0, originY), // 스프라이트 이미지에서 기본 마커로 사용할 영역의 좌상단 좌표
							clickOrigin = new kakao.maps.Point(gapX, originY), // 스프라이트 이미지에서 마우스오버 마커로 사용할 영역의 좌상단 좌표
							overOrigin = new kakao.maps.Point(gapX * 2,
									overOriginY); // 스프라이트 이미지에서 클릭 마커로 사용할 영역의 좌상단 좌표

							// 마커를 생성하고 지도위에 표시합니다
							addMarker(positions[i], normalOrigin, overOrigin,
									clickOrigin);
						}

						// 마커를 생성하고 지도 위에 표시하고, 마커에 mouseover, mouseout, click 이벤트를 등록하는 함수입니다
						function addMarker(position, normalOrigin, overOrigin,
								clickOrigin) {

							// 기본 마커이미지, 오버 마커이미지, 클릭 마커이미지를 생성합니다
							var normalImage = createMarkerImage(markerSize,
									markerOffset, normalOrigin), overImage = createMarkerImage(
									overMarkerSize, overMarkerOffset,
									overOrigin), clickImage = createMarkerImage(
									markerSize, markerOffset, clickOrigin);

							// 마커를 생성하고 이미지는 기본 마커 이미지를 사용합니다
							var marker = new kakao.maps.Marker({
								map : map,
								position : position,
								image : normalImage,
							});

							// 마커 객체에 마커아이디와 마커의 기본 이미지를 추가합니다
							marker.normalImage = normalImage;

							// 마커에 mouseover 이벤트를 등록합니다
							kakao.maps.event.addListener(marker, 'mouseover',
									function() {

										// 클릭된 마커가 없고, mouseover된 마커가 클릭된 마커가 아니면
										// 마커의 이미지를 오버 이미지로 변경합니다
										if (!selectedMarker
												|| selectedMarker !== marker) {
											marker.setImage(overImage);
										}
									});

							// 마커에 mouseout 이벤트를 등록합니다
							kakao.maps.event.addListener(marker, 'mouseout',function() {

										// 클릭된 마커가 없고, mouseout된 마커가 클릭된 마커가 아니면
										// 마커의 이미지를 기본 이미지로 변경합니다
										if (!selectedMarker
												|| selectedMarker !== marker) {
											marker.setImage(normalImage);
										}
									});

							// 마커에 click 이벤트를 등록합니다
							kakao.maps.event.addListener(marker,'click',function() {

												// 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면
												// 마커의 이미지를 클릭 이미지로 변경합니다
												if (!selectedMarker
														|| selectedMarker !== marker) {

													// 클릭된 마커 객체가 null이 아니면
													// 클릭된 마커의 이미지를 기본 이미지로 변경하고
													!!selectedMarker
															&& selectedMarker
																	.setImage(selectedMarker.normalImage);

													// 현재 클릭된 마커의 이미지는 클릭 이미지로 변경합니다
													marker.setImage(clickImage);
												}

												// 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
												selectedMarker = marker;
												var selected = (JSON
														.stringify(selectedMarker
																.getPosition()))
														.split(",");
												selected[0] = Number(selected[0]
														.substring(
																6,
																selected[0].length));
												selected[1] = Number(selected[1]
														.substring(
																5,
																selected[1].length - 1));
												// 선택된 좌표의 경도,위도값을 숫자로 받아옴

												selected[0] = selected[0]
														.toFixed(12);
												selected[1] = selected[1]
														.toFixed(12);
												// 맨 뒤 이상한 소숫점 없애기위해 13번째 자리에서 반올림

												var markers = [];

												for (var i = 0; i < positions.length; i++) {
													markers = (JSON
															.stringify(positions[i]))
															.split(",");
													markers[0] = Number(markers[0]
															.substring(
																	6,
																	markers[0].length));
													markers[1] = Number(markers[1]
															.substring(
																	5,
																	markers[1].length - 1));

													if (markers[0] == selected[0]
															&& markers[1] == selected[1]) { // 선택된 좌표와 입력되어있던 좌표가 같을 경우
														selectNum = i;
														$('#zoneNumber').val(i);
														carListInfo(i); // 몇번째 마커인지 번호와 함께 전송
													}
												} //for문종료 : 마커를 클릭하면 몇번째 마커인지 표시
											});
						}

						// MakrerImage 객체를 생성하여 반환하는 함수입니다
						function createMarkerImage(markerSize, offset,spriteOrigin) {
							var markerImage = new kakao.maps.MarkerImage(
									SPRITE_MARKER_URL, // 스프라이트 마커 이미지 URL
									markerSize, // 마커의 크기
									{
										offset : offset, // 마커 이미지에서의 기준 좌표
										spriteOrigin : spriteOrigin, // 스트라이프 이미지 중 사용할 영역의 좌상단 좌표
										spriteSize : spriteImageSize
									// 스프라이트 이미지의 크기
									});

							return markerImage;
						}
					</script>
				</div>
			</div>
		</div>
		<!-- Footer -->
		<!-- Footer -->
		<footer class="footer">
			<div id="selectCarList" class="row align-items-center justify-content-xl-between">
				<div class="col-xl-6">
					<div class="copyright text-center text-xl-left text-muted">
						&copy; 2018 <a href="https://www.creative-tim.com" class="font-weight-bold ml-1" target="_blank">Creative Tim</a>
					</div>
				</div>
				<div class="col-xl-6">
					<ul class="nav nav-footer justify-content-center justify-content-xl-end">
						<li class="nav-item"><a href="https://www.creative-tim.com" class="nav-link" target="_blank">Creative Tim</a></li>
						<li class="nav-item"><a href="https://www.creative-tim.com/presentation" class="nav-link" target="_blank">About Us</a></li>
						<li class="nav-item"><a href="http://blog.creative-tim.com" class="nav-link" target="_blank">Blog</a></li>
						<li class="nav-item"><a href="https://github.com/creativetimofficial/argon-dashboard/blob/master/LICENSE.md" class="nav-link" target="_blank">MIT License</a></li>
					</ul>
				</div>
			</div>
		</footer>
	</div>
</div>
<!--   Core   -->
<script src="resources/assets/js/plugins/jquery/dist/jquery.min.js"></script>
<script src="resources/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<!--   Argon JS   -->
<script src="resources/assets/js/argon-dashboard.min.js?v=1.1.0"></script>
<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
<script>
	window.TrackJS && TrackJS.install({
		token : "ee6fab19c5a04ac1a32a645abde4613a",
		application : "argon-dashboard-free"
	});
</script>
</body>

</html>