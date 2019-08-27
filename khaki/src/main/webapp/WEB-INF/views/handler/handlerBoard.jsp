<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--

=========================================================
* Argon Dashboard - v1.1.0
=========================================================

* Product Page: https://www.creative-tim.com/product/argon-dashboard
* Copyright 2019 Creative Tim (https://www.creative-tim.com)
* Licensed under MIT (https://github.com/creativetimofficial/argon-dashboard/blob/master/LICENSE.md)

* Coded by Creative Tim

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. -->
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>
    1등 카셰어링, khaki
  </title>
  <!-- Favicon -->
  <link href="resources/assets/img/brand/favicon.png" rel="icon" type="image/png">
  <!-- Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
  <!-- Icons -->
  <link href="resources/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
  <link href="resources/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="resources/assets/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script type="text/javascript">
  	$(function() {
  		var seoul = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구"
			,"마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
		var busan = ["강서구", "금정구", "기장군", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", 
				"서구", "수영구", "연제구", "영도구", "중구", "해운대구"];
		var daegu = ["중구", "동구", "서구", "남구", "북구", "수성구", "달서구", "달성군"];
		var incheon = ["중구", "동구", "미추홀구", "연수구", "남동구", "부평구", "계양구", "서구", "강화군", "옹진군"];
		var gwangju = ["동구", "서구", "남구", "북구", "광산구"];
		var daejeon = ["동구", "중구", "서구", "유성구", "대덕구"];
		var ulsan = ["중구", "남구", "동구", "북구", "울주군"];
		var sejong = ["반곡동", "소담동", "보람동", "대평동", "가람동", "한솔동", "나성동", "새롬동", "다정동", "어진동", "종촌동", "고운동",
			"아름동", "도담동", "조치원읍", "연기면", "연동면", "부강면", "금남면", "장군면", "연서면", "전의면", "전동면", "소정면"];
		var gyeonggi = ["수원시", "성남시", "의정부시", "안양시", "부천시", "광명시", "평택시", "동두천시", "안산시", "고양시", "과천시", "구리시", 
			"남양주시", "오산시", "시흥시", "군포시", "의왕시", "하남시", "용인시", "파주시", "이천시", "안성시", "김포시", "화성시", "광주시", "양주시", 
			"포천시", "여주시", "연천군", "가평군", "양평군"];
		var gangwon = ["춘천시", "원주시", "강릉시", "동해시", "태백시", "속초시", "삼척시", "홍천군", "횡성군", "영월군", "평창군", "정선군", "철원군", "화천군", "양구군", "인제군", "고성군", "양양군"];
		var chungbuk = ["청주시", "충주시", "제천시", "보은군", "옥천군", "영동군", "증평군", "진천군", "괴산군", "음성군", "단양군"];
		var chungnam = ["천안시", "공주시", "보령시", "아산시", "서산시", "논산시", "계룡시", "당진시", "금산군", "부여군", "서천군", "청양군", "홍성군", "예산군", "태안군"];
		var jeonbuk = ["전주시", "군산시", "익산시", "정읍시", "남원시", "김제시", "완주군", "진안군", "무주군", "장수군", "임실군", "순창군", "고창군", "부안군"];
		var jeonnam = ["목포시", "여수시", "순천시", "나주시", "광양시", "담양군", "곡성군", "구례군", "고흥군", "보성군", "화순군", "장흥군", "강진군", "해남군", "영암군", "무안군", "함평군", "영광군", "장성군", "완도군", "진도군", "신안군"];
		var gyeongbuk = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
		var gyeongnam = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
		var jeju = ["제주시", "서귀포시"];
		
		$("#region_1_n").change(function(){
			var result = "";
			$("#region_2_n").children().remove();
			var d = $("#region_1_n option:selected").val();
			switch(d) {
				case "서울특별시" :
					for(var i = 0; i < seoul.length; i++) {
						if(i == 0) {
							result += "<option value=\"\" selected=\"true\">- 지역 선택 -</option>";
						} else if (i >= 9){
							result += "<option value=\""+seoul[i]+"\">"+seoul[i]+"</option>";
						} else {
							result += "<option value=\""+seoul[i]+"\">"+seoul[i]+"</option>";
						}
					}
					$("#region_2_n").append(result);
					break;
				case "부산광역시" :
					for(var i = 0; i < busan.length; i++) {
						if(i == 0) {
							result += "<option value=\"\" selected=\"true\">- 지역 선택 -</option>";
						} else if (i >= 9){
							result += "<option value=\""+busan[i]+"\">"+busan[i]+"</option>";
						} else {
							result += "<option value=\""+busan[i]+"\">"+busan[i]+"</option>";
						}
					}
					$("#region_2_n").append(result);
					break;
				case "대구광역시" :
					for(var i = 0; i < daegu.length; i++) {
						if(i == 0) {
							result += "<option value=\"\" selected=\"true\">- 지역 선택 -</option>";
						} else if (i >= 9){
							result += "<option value=\""+daegu[i]+"\">"+daegu[i]+"</option>";
						} else {
							result += "<option value=\""+daegu[i]+"\">"+daegu[i]+"</option>";
						}
					}
					$("#region_2_n").append(result);
					break;
				case "인천광역시" :
					for(var i = 0; i < incheon.length; i++) {
						if(i == 0) {
							result += "<option value=\"\" selected=\"true\">- 지역 선택 -</option>";
						} else if (i >= 9){
							result += "<option value=\""+incheon[i]+"\">"+incheon[i]+"</option>";
						} else {
							result += "<option value=\""+incheon[i]+"\">"+incheon[i]+"</option>";
						}
					}
					$("#region_2_n").append(result);
					break;
				case "광주광역시" :
					for(var i = 0; i < gwangju.length; i++) {
						if(i == 0) {
							result += "<option value=\"\" selected=\"true\">- 지역 선택 -</option>";
						} else if (i >= 9){
							result += "<option value=\""+gwangju[i]+"\">"+gwangju[i]+"</option>";
						} else {
							result += "<option value=\""+gwangju[i]+"\">"+gwangju[i]+"</option>";
						}
					}
					$("#region_2_n").append(result);
					break;
				case "대전광역시" :
					for(var i = 0; i < daejeon.length; i++) {
						if(i == 0) {
							result += "<option value=\"\" selected=\"true\">- 지역 선택 -</option>";
						} else if (i >= 9){
							result += "<option value=\""+daejeon[i]+"\">"+daejeon[i]+"</option>";
						} else {
							result += "<option value=\""+daejeon[i]+"\">"+daejeon[i]+"</option>";
						}
					}
					$("#region_2_n").append(result);
					break;
				case "울산광역시" :
					for(var i = 0; i < ulsan.length; i++) {
						if(i == 0) {
							result += "<option value=\"\" selected=\"true\">- 지역 선택 -</option>";
						} else if (i >= 9){
							result += "<option value=\""+ulsan[i]+"\">"+ulsan[i]+"</option>";
						} else {
							result += "<option value=\""+ulsan[i]+"\">"+ulsan[i]+"</option>";
						}
					}
					$("#region_2_n").append(result);
					break;
				case "세종시" :
					for(var i = 0; i < sejong.length; i++) {
						if(i == 0) {
							result += "<option value=\"\" selected=\"true\">- 지역 선택 -</option>";
						} else if (i >= 9){
							result += "<option value=\""+sejong[i]+"\">"+sejong[i]+"</option>";
						} else {
							result += "<option value=\""+sejong[i]+"\">"+sejong[i]+"</option>";
						}
					}
					$("#region_2_n").append(result);
					break;
				case "경기도" :
					for(var i = 0; i < gyeonggi.length; i++) {
						if(i == 0) {
							result += "<option value=\"\" selected=\"true\">- 지역 선택 -</option>";
						} else if (i >= 9){
							result += "<option value=\""+gyeonggi[i]+"\">"+gyeonggi[i]+"</option>";
						} else {
							result += "<option value=\""+gyeonggi[i]+"\">"+gyeonggi[i]+"</option>";
						}
					}
					$("#region_2_n").append(result);
					break;
				case "강원도" :
					for(var i = 0; i < gangwon.length; i++) {
						if(i == 0) {
							result += "<option value=\"\" selected=\"true\">- 지역 선택 -</option>";
						} else if (i >= 9){
							result += "<option value=\""+gangwon[i]+"\">"+gangwon[i]+"</option>";
						} else {
							result += "<option value=\""+gangwon[i]+"\">"+gangwon[i]+"</option>";
						}
					}
					$("#region_2_n").append(result);
					break;
				case "충청북도" :
					for(var i = 0; i < chungbuk.length; i++) {
						if(i == 0) {
							result += "<option value=\"\" selected=\"true\">- 지역 선택 -</option>";
						} else if (i >= 9){
							result += "<option value=\""+chungbuk[i]+"\">"+chungbuk[i]+"</option>";
						} else {
							result += "<option value=\""+chungbuk[i]+"\">"+chungbuk[i]+"</option>";
						}
					}
					$("#region_2_n").append(result);
					break;
				case "충청남도" :
					for(var i = 0; i < chungnam.length; i++) {
						if(i == 0) {
							result += "<option value=\"\" selected=\"true\">- 지역 선택 -</option>";
						} else if (i >= 9){
							result += "<option value=\""+chungnam[i]+"\">"+chungnam[i]+"</option>";
						} else {
							result += "<option value=\""+chungnam[i]+"\">"+chungnam[i]+"</option>";
						}
					}
					$("#region_2_n").append(result);
					break;
				case "전라북도" :
					for(var i = 0; i < jeonbuk.length; i++) {
						if(i == 0) {
							result += "<option value=\"\" selected=\"true\">- 지역 선택 -</option>";
						} else if (i >= 9){
							result += "<option value=\""+jeonbuk[i]+"\">"+jeonbuk[i]+"</option>";
						} else {
							result += "<option value=\""+jeonbuk[i]+"\">"+jeonbuk[i]+"</option>";
						}
					}
					$("#region_2_n").append(result);
					break;
				case "전라남도" :
					for(var i = 0; i < jeonnam.length; i++) {
						if(i == 0) {
							result += "<option value=\"\" selected=\"true\">- 지역 선택 -</option>";
						} else if (i >= 9){
							result += "<option value=\""+jeonnam[i]+"\">"+jeonnam[i]+"</option>";
						} else {
							result += "<option value=\""+jeonnam[i]+"\">"+jeonnam[i]+"</option>";
						}
					}
					$("#region_2_n").append(result);
					break;
				case "경상북도" :
					for(var i = 0; i < gyeongbuk.length; i++) {
						if(i == 0) {
							result += "<option value=\"\" selected=\"true\">- 지역 선택 -</option>";
						} else if (i >= 9){
							result += "<option value=\""+gyeongbuk[i]+"\">"+gyeongbuk[i]+"</option>";
						} else {
							result += "<option value=\""+gyeongbuk[i]+"\">"+gyeongbuk[i]+"</option>";
						}
					}
					$("#region_2_n").append(result);
					break;
				case "경상남도" :
					for(var i = 0; i < gyeongnam.length; i++) {
						if(i == 0) {
							result += "<option value=\"\" selected=\"true\">- 지역 선택 -</option>";
						} else if (i >= 9){
							result += "<option value=\""+gyeongnam[i]+"\">"+gyeongnam[i]+"</option>";
						} else {
							result += "<option value=\""+gyeongnam[i]+"\">"+gyeongnam[i]+"</option>";
						}
					}
					$("#region_2_n").append(result);
					break;
				case "제주도" :
					for(var i = 0; i < jeju.length; i++) {
						if(i == 0) {
							result += "<option value=\"\" selected=\"true\">- 지역 선택 -</option>";
						} else if (i >= 9){
							result += "<option value=\""+jeju[i]+"\">"+jeju[i]+"</option>";
						} else {
							result += "<option value=\""+jeju[i]+"\">"+jeju[i]+"</option>";
						}
					}
					$("#region_2_n").append(result);
					break;
			}
			

			
		})
		$("#location1").hide();
		$("#location2").hide();
		
		var location_choice = ""; // 출발지점을 선택했는지 도착지점을 선택했는지 구분하기 위함
		// 지역선택 modal에서 출발지점 선택시
		$(".start_lo").click(function(){
			$(".s_r_lo").css("height", "50px");
			$(".start_lo").css("line-height", "50px");
			$(".return_lo").css("line-height", "50px");
			$("#region_1_n option:eq(0)").prop("selected", true); // 클릭하면 첫번째 값으로 초기화
			$("#region_2_n option:eq(0)").prop("selected", true); // 클릭하면 첫번째 값으로 초기화
			$("#location1").show();
			$("#location2").show();
			location_choice = "1";
		})
		// 지역선택 modal에서 도착지점 선택시
		$(".return_lo").click(function(){
			$(".s_r_lo").css("height", "50px");
			$(".start_lo").css("line-height", "50px");
			$(".return_lo").css("line-height", "50px");
			$("#region_1_n option:eq(0)").prop("selected", true); // 클릭하면 첫번째 값으로 초기화
			$("#region_2_n option:eq(0)").prop("selected", true); // 클릭하면 첫번째 값으로 초기화
			$("#location1").show();
			$("#location2").show();
			location_choice = "2";
		})
		
		$("#handlerDetailSearch").click(function(){
			switch(location_choice){
				case "1" :
					var startLocation = $("#region_1_n option:selected").val();
					var d2 = $("#region_2_n option:selected").val();
					startLocation += " " + d2;
					var queryData = "";
					$.ajax({
					      url:"handlerJquery.do",
					      success:function(data){
					    	  $(".hb_query_content").append(data);
					      },
					      error : function(xhr, status) {
				              alert(xhr + " : " + status);
				          }
					});
					
					$.ajax({
					      url:"handlerDetailSearch.do",
					      data : {
					    	  startLocation : startLocation
					      },
					      
					      success:function(data){
					    	  $(".hb_table_content").children().remove();
					    	  $(".handler_detail").children().remove();
					    	  $(".hb_table_content").append(data);
					      },
					      error : function(xhr, status) {
				              alert(xhr + " : " + status);
				          }
					});
					break;
				case "2" :
					var returnLocation = $("#region_1_n option:selected").val();
					var d2 = $("#region_2_n option:selected").val();
					returnLocation += " " + d2;
					
					var queryData = "";
					$.ajax({
					      url:"handlerJquery.do",
					      success:function(data){
					    	  $(".hb_query_content").append(data);
					      },
					      error : function(xhr, status) {
				              alert(xhr + " : " + status);
				          }
					});
					
					$.ajax({
					      url:"handlerDetailSearch2.do",
					      data : {
					    	  returnLocation : returnLocation
					      },
					      
					      success:function(data){
					    	  $(".hb_table_content").children().remove();
					    	  $(".handler_detail").children().remove();
					    	  $(".hb_table_content").append(data);
					      },
					      error : function(xhr, status) {
				                alert(xhr + " : " + status);
				          }
					});
					break;
			}
		})
		
		$(".hb_table_content_tr").click(function(){
			$(".handler_detail").children().remove();
			// 차량번호를 통해 예약된 차량의 이미지 db에서 ajax로 가져와야함
			var carNum = $(this).children(".hb_table_content_carNum").text(); // 차량번호
			var carModel = $(this).children(".hb_table_content_carModel").text(); // 차량종류
			var startLocation = $(this).children(".hb_table_content_startLocation").text(); // 출발장소(현재차량위치)
			var arrivalLocation = $(this).children(".hb_table_content_arrivalLocation").text(); // 도착장소(차량도착위치)
			var transportCompletionTime = $(this).children(".hb_table_content_transportCompletionTime").text(); // 운송완료시간
			var expectedPoint = $(this).children(".hb_table_content_expectedPoint").text(); // 예상적립포인트
			
			var h_detail_img = "<div class=\"h_detail_img\">"; // 이미지 div태그
			var h_detail_image = "<img class=\"h_detail_image\" src=\"https://img.hankyung.com/photo/201903/AA.19251102.1.jpg\"></img>"; // 차량번호로 db에 연결하여 가져온 차량의 이미지 태그(예시로 src에 임시 이미지 삽입함)
			var h_detail_carNum = "</div><div class=\"h_detail_carNum_title\">차량번호</div><div class=\"h_detail_carModel_title\">차종</div><div class=\"h_detail_carNum\">"; // 차량번호 div태그
			var h_detail_carModel = "</div><div class=\"h_detail_carModel\">"; // 차종 div태그
			var h_detail_startLocation = "</div><div class=\"h_detail_startLocation_title\">출발장소</div><div class=\"h_detail_startLocation\">"; // 출발장소(현재차량위치) div 태그
			var h_detail_arrivallocation = "</div><div class=\"h_detail_arrivallocation_title\">도착장소</div><div class=\"h_detail_arrivallocation\">"; // 도착장소(차량도착위치) div 태그
			var h_detail_transportCompletionTime = "</div><div class=\"h_detail_transportCompletionTime_title\">운송완료시간</div><div class=\"h_detail_transportCompletionTime\">"; // 운송 완료 시간 div 태그
			var h_detail_expectedPoint = "</div><div class=\"h_detail_expectedPoint_title\">예상적립포인트</div><div class=\"h_detail_expectedPoint\">";
			
			$(".handler_detail").append(h_detail_img + h_detail_image + h_detail_carNum + carNum + h_detail_carModel + carModel + h_detail_startLocation + startLocation + h_detail_arrivallocation + arrivalLocation + h_detail_transportCompletionTime + transportCompletionTime + h_detail_expectedPoint + expectedPoint + "</div>");
			/* $(".hb_table_content_tr").attr("data-toggle", "modal");
			$(".hb_table_content_tr").attr("data-target", "#exampleModal2"); */
		})
  	})
  </script>

</head>
<body class="">
  <nav class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white" id="sidenav-main">
    <div class="container-fluid">
      <!-- Toggler -->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <!-- Brand -->
      <a class="navbar-brand pt-0" href="home.do">
        <img src="resources/assets/img/brand/khaki_logo.png" class="navbar-brand-img" alt="...">
      </a>
      <!-- User -->
      <ul class="nav align-items-center d-md-none">
        <li class="nav-item dropdown">
          <a class="nav-link nav-link-icon" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="ni ni-bell-55"></i>
          </a>
          <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right" aria-labelledby="navbar-default_dropdown_1">
            <a class="dropdown-item" href="#">Action</a>
            <a class="dropdown-item" href="#">Another action</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">Something else here</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <div class="media align-items-center">
              <span class="avatar avatar-sm rounded-circle">
                <img alt="Image placeholder" src="resources/assets/img/theme/team-1-800x800.jpg">
              </span>
            </div>
          </a>
          <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
            <div class=" dropdown-header noti-title">
              <h6 class="text-overflow m-0">Welcome!</h6>
            </div>
            <a href="profile.do" class="dropdown-item">
              <i class="ni ni-single-02"></i>
              <span>My profile</span>
            </a>
            <a href="profile.do" class="dropdown-item">
              <i class="ni ni-settings-gear-65"></i>
              <span>Settings</span>
            </a>
            <a href="profile.do" class="dropdown-item">
              <i class="ni ni-calendar-grid-58"></i>
              <span>Activity</span>
            </a>
            <a href="profile.do" class="dropdown-item">
              <i class="ni ni-support-16"></i>
              <span>Support</span>
            </a>
            <div class="dropdown-divider"></div>
            <a href="#!" class="dropdown-item">
              <i class="ni ni-user-run"></i>
              <span>Logout</span>
            </a>
          </div>
        </li>
      </ul>
      <!-- Collapse -->
      <div class="collapse navbar-collapse" id="sidenav-collapse-main">
        <!-- Collapse header -->
        <div class="navbar-collapse-header d-md-none">
          <div class="row">
            <div class="col-6 collapse-brand">
              <a href="../index.html">
                <img src="resources/assets/img/brand/blue.png">
              </a>
            </div>
            <div class="col-6 collapse-close">
              <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle sidenav">
                <span></span>
                <span></span>
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
          <li class="nav-item ">
          	<a class=" nav-link" href="home.do"> 
          		<i class="ni ni-tv-2 text-black"></i> Home
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="map.do">
              <i class="ni ni-square-pin text-orange"></i> Map
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="board.do">
              <i class="ni ni-bullet-list-67 text-blue"></i> board
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="notice.do">
              <i class="ni ni-air-baloon text-red"></i> Notice
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="coupon.do">
              <i class="ni ni-collection text-green"></i> Coupon
            </a>
          </li>
         </ul>
        <!-- Divider -->
        <hr class="my-3">
        <!-- Heading -->
        <h6 class="navbar-heading text-muted">Documentation</h6>
        <!-- Navigation -->
        <ul class="navbar-nav mb-md-3">
          <li class="nav-item">
            <a class="nav-link" href="https://demos.creative-tim.com/argon-dashboard/docs/getting-started/overview.html">
              <i class="ni ni-spaceship"></i> Getting started
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="https://demos.creative-tim.com/argon-dashboard/docs/foundation/colors.html">
              <i class="ni ni-palette"></i> Foundation
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="https://demos.creative-tim.com/argon-dashboard/docs/components/alerts.html">
              <i class="ni ni-ui-04"></i> Components
            </a>
          </li>
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
          <li class="nav-item dropdown">
            <a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <div class="media align-items-center">
                <span class="avatar avatar-sm rounded-circle">
                  <img alt="Image placeholder" src="resources/assets/img/theme/team-4-800x800.jpg">
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
              <a href="profile.do" class="dropdown-item">
                <i class="ni ni-single-02"></i>
                <span>My profile</span>
              </a>
              <a href="profile.do" class="dropdown-item">
                <i class="ni ni-settings-gear-65"></i>
                <span>Settings</span>
              </a>
              <a href="profile.do" class="dropdown-item">
                <i class="ni ni-calendar-grid-58"></i>
                <span>Activity</span>
              </a>
              <a href="profile.do" class="dropdown-item">
                <i class="ni ni-support-16"></i>
                <span>Support</span>
              </a>
              <div class="dropdown-divider"></div>
              <a href="#!" class="dropdown-item">
                <i class="ni ni-user-run"></i>
                <span>Logout</span>
              </a>
            </div>
          </li>
        </ul>
      </div>
    </nav>
    <!-- End Navbar -->
    <!-- Header -->
    <div class="header bg-gradient-success pb-8 pt-5 pt-md-8">
      <div class="container-fluid">
        <div class="header-body">
          <!-- Card stats -->
          <div class="row">
            <div class="col-xl-3 col-lg-6">
              <div class="card card-stats mb-4 mb-xl-0">
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">Traffic</h5>
                      <span class="h2 font-weight-bold mb-0">350,897</span>
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-danger text-white rounded-circle shadow">
                        <i class="fas fa-chart-bar"></i>
                      </div>
                    </div>
                  </div>
                  <p class="mt-3 mb-0 text-muted text-sm">
                    <span class="text-success mr-2"><i class="fa fa-arrow-up"></i> 3.48%</span>
                    <span class="text-nowrap">Since last month</span>
                  </p>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-lg-6">
              <div class="card card-stats mb-4 mb-xl-0">
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">New users</h5>
                      <span class="h2 font-weight-bold mb-0">2,356</span>
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-warning text-white rounded-circle shadow">
                        <i class="fas fa-chart-pie"></i>
                      </div>
                    </div>
                  </div>
                  <p class="mt-3 mb-0 text-muted text-sm">
                    <span class="text-danger mr-2"><i class="fas fa-arrow-down"></i> 3.48%</span>
                    <span class="text-nowrap">Since last week</span>
                  </p>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-lg-6">
              <div class="card card-stats mb-4 mb-xl-0">
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">Sales</h5>
                      <span class="h2 font-weight-bold mb-0">924</span>
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-yellow text-white rounded-circle shadow">
                        <i class="fas fa-users"></i>
                      </div>
                    </div>
                  </div>
                  <p class="mt-3 mb-0 text-muted text-sm">
                    <span class="text-warning mr-2"><i class="fas fa-arrow-down"></i> 1.10%</span>
                    <span class="text-nowrap">Since yesterday</span>
                  </p>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-lg-6">
              <div class="card card-stats mb-4 mb-xl-0">
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">Performance</h5>
                      <span class="h2 font-weight-bold mb-0">49,65%</span>
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-info text-white rounded-circle shadow">
                        <i class="fas fa-percent"></i>
                      </div>
                    </div>
                  </div>
                  <p class="mt-3 mb-0 text-muted text-sm">
                    <span class="text-success mr-2"><i class="fas fa-arrow-up"></i> 12%</span>
                    <span class="text-nowrap">Since last month</span>
                  </p>
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
          <div class="card shadow border-0" style="padding: 40px;">
          	<div class="hb_title">
          		<label>Handler Board</label>
          	</div>
          	
          	 <!-- Button trigger modal -->
			<button type="button" class="btn btn-primary" id="btndddd" data-toggle="modal" data-target="#exampleModal" style="width: 20%; margin-top: 3%; margin-bottom: 3%;">
			  지역선택
			</button>
			
			<!-- 지역선택 Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">지역 선택</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			      	<div class="form-group">
						<div class="col-sm-3_jkh">
						<div id="association_out" style="width: 100%; height:auto;">
							<div class="s_r_lo">
								<label class="start_lo">출발지점</label>
								<label class="return_lo">도착지점</label>
							</div>
							<div class="cl_bo fl_left" id="location1" style="margin-right:20px; width: 100%;">
								<select name="region_1_n" id="region_1_n" required class="form-control input-sm">
									<option value="" selected>- 광역 지역 -</option>
				  					<option value="서울특별시" class="si_do">서울특별시</option>
				  					<option value="부산광역시" class="si_do">부산광역시</option>
				  					<option value="대구광역시" class="si_do">대구광역시</option>
				  					<option value="인천광역시" class="si_do">인천광역시</option>
				  					<option value="광주광역시" class="si_do">광주광역시</option>
				  					<option value="대전광역시" class="si_do">대전광역시</option>
				  					<option value="울산광역시" class="si_do">울산광역시</option>
				  					<option value="세종시" class="si_do">세종시</option>
				  					<option value="경기도" class="si_do">경기도</option>
				  					<option value="강원도" class="si_do">강원도</option>
				  					<option value="충청북도" class="si_do">충청북도</option>
				  					<option value="충청남도" class="si_do">충청남도</option>
				  					<option value="전라북도" class="si_do">전라북도</option>
				  					<option value="전라남도" class="si_do">전라남도</option>
				  					<option value="경상북도" class="si_do">경상북도</option>
				  					<option value="경상남도" class="si_do">경상남도</option>
				  					<option value="제주도" class="si_do">제주도</option>
				  				</select>
							</div>
							<div class="fl_left" id="location2">
								<select name="region_2_n" id="region_2_n" class="form-control input-sm">
									<option value="" selected>- 지역 선택 -</option>
				  				</select>
							</div>
						</div>
						</div>
						</div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			        <button type="button" class="btn btn-primary" id="handlerDetailSearch" data-dismiss="modal">Search</button>
			      </div>
			    </div>
			  </div>
			</div>
			<div class="hb_query_content"></div>
          	<div class="hb_table">
          		<table class="hb_table_head">
	          		<tr class="hb_table_head_tr">
	          			<td class="hb_table_head_num">
	          				번호
	          			</td>
	          			<td class="hb_table_head_startLocation">
	          				출발지점
	          			</td>
	          			<td class="hb_table_head_arrivalLocation">
	          				도착지점
	          			</td>
	          			<td class="hb_table_head_carNum">
	          				차량번호
	          			</td>
	          			<td class="hb_table_head_transportCompletionTime">
	          				운송완료시간
	          			</td>
	          			<td class="hb_table_head_requestingCustomer">
	          				신청자
	          			</td>
	          			<td class="hb_table_head_carModel">
	          				차종
	          			</td>
	          			<td class="hb_table_head_expectedPoint">
	          				예상적립포인트
	          			</td>
	          		</tr>
          		</table>
          		<table class="hb_table_content">
          			<c:forEach var="hdto" varStatus="status" items="${hlist}">
          			<tr class="hb_table_content_tr" data-toggle="modal" data-target="#exampleModal2">
	          			<td class="hb_table_content_num">${status.count}</td>
	          			<td class="hb_table_content_startLocation">${hdto.startLocation }</td>
	          			<td class="hb_table_content_arrivalLocation">${hdto.returnLocation }</td>
	          			<td class="hb_table_content_carNum">${hdto.carNum }</td>
	          			<td class="hb_table_content_transportCompletionTime">${hdto.customerUsageTime }</td>
	          			<td class="hb_table_content_requestingCustomer">${hdto.handler }</td>
	          			<td class="hb_table_content_carModel">${hdto.vehicleType }</td>
	          			<td class="hb_table_content_expectedPoint">${hdto.point }p</td>
          			</tr>
          			</c:forEach>
          		</table>
          	</div>
		  </div>
        </div>
      </div>
      
      
      
      
      
     		 <!-- 상세선택 Modal -->
			<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">핸들러 신청 내역 상세정보</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			      	<div class="form-group">
						<div class="col-sm-3_jkh">
							<div id="association_out" style="width: 100%; height:auto;">
								<div class="handler_detail">
									
								</div>
							</div>
						</div>
					</div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			        <button type="button" class="btn btn-primary" id="handlerDetailSearch" data-dismiss="modal">Search</button>
			      </div>
			    </div>
			  </div>
			</div>
      
      
      
      
      
      
      
      
      <!-- Footer -->
      <!-- Footer -->
      <footer class="footer">
        <div class="row align-items-center justify-content-xl-between">
          <div class="col-xl-6">
            <div class="copyright text-center text-xl-left text-muted">
              &copy; 2018 <a href="https://www.creative-tim.com" class="font-weight-bold ml-1" target="_blank">Creative Tim</a>
            </div>
          </div>
          <div class="col-xl-6">
            <ul class="nav nav-footer justify-content-center justify-content-xl-end">
              <li class="nav-item">
                <a href="https://www.creative-tim.com" class="nav-link" target="_blank">Creative Tim</a>
              </li>
              <li class="nav-item">
                <a href="https://www.creative-tim.com/presentation" class="nav-link" target="_blank">About Us</a>
              </li>
              <li class="nav-item">
                <a href="http://blog.creative-tim.com" class="nav-link" target="_blank">Blog</a>
              </li>
              <li class="nav-item">
                <a href="https://github.com/creativetimofficial/argon-dashboard/blob/master/LICENSE.md" class="nav-link" target="_blank">MIT License</a>
              </li>
            </ul>
          </div>
        </div>
      </footer>
    </div>
  </div>
  <!--   Core   -->
  <script src="resources/assets/js/plugins/jquery/dist/jquery.min.js"></script>
  <script src="resources/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <!--   Optional JS   -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!--   Argon JS   -->
  <script src="resources/assets/js/argon-dashboard.min.js?v=1.1.0"></script>
  <script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
  <script>
    window.TrackJS &&
      TrackJS.install({
        token: "ee6fab19c5a04ac1a32a645abde4613a",
        application: "argon-dashboard-free"
      });
  </script>
</body>

</html>