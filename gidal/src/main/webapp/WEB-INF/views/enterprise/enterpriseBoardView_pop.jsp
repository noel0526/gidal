<%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import= "org.gidal.enterprise.domain.EnterpriseVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/enterprise/more.jsp"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기달</title>

<%@ include file="/WEB-INF/views/include/head.jsp"%>
<link href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Raleway:400,900,700,600,500,300,200,100,800);

section{
    padding:60px 0px;
    font-family: 'Raleway', sans-serif;
}

h2 {
    color: #4C4C4C;
    word-spacing: 5px;
    font-size: 30px;
    font-weight: 700;
    margin-bottom:30px;
    font-family: 'Raleway', sans-serif;
}

.ion-minus{
    padding:0px 10px;
}

.blog{
	/* background-color:#f6f6f6; */
}

.blog .card {
    background-color: #FFF;
    border: 1px solid #eceaea;
    margin: 20px 0px;
}

.blog .card-block {
    padding: 15px;
}

.btn.btn-default {
    background-color: #EB6864;
    color: #fff;
    border-radius: 0;
    border: none;
    padding: 13px 20px;
    font-size: 13px;
    font-weight: 600;
    margin-top: 10px;
}
</style>

</head>
<body>

	<%@ include file="/WEB-INF/views/include/nav.jsp"%>


<script type="text/javascript">

	function setCategory2(){
		form = document.filterSelect;


			if(document.filterSelect.local1.value == "서울"){
				form.local2.length = 1;
				form.local2.options[1] = new Option("종로구");
				form.local2.options[1].value = "종로구";
				form.local2.options[2] = new Option("중구");
				form.local2.options[2].value = "중구";
				form.local2.options[3] = new Option("용산구");
				form.local2.options[3].value = "용산구";
				form.local2.options[4] = new Option("성동구");
				form.local2.options[4].value = "성동구";
				form.local2.options[5] = new Option("광진구");
				form.local2.options[5].value = "광진구";
				form.local2.options[6] = new Option("동대문구");
				form.local2.options[6].value = "동대문구";
				form.local2.options[7] = new Option("중량구");
				form.local2.options[7].value = "중량";
				form.local2.options[8] = new Option("성북구");
				form.local2.options[8].value = "성북구";
				form.local2.options[9] = new Option("강북구");
				form.local2.options[9].value = "강북구";
				form.local2.options[10] = new Option("도봉구");
				form.local2.options[10].value = "도봉구";
				form.local2.options[11] = new Option("노원구");
				form.local2.options[11].value = "노원구";
				form.local2.options[12] = new Option("은평구");
				form.local2.options[12].value = "은평구";
				form.local2.options[13] = new Option("서대문구");
				form.local2.options[13].value = "서대문구";
				form.local2.options[14] = new Option("마포구");
				form.local2.options[14].value = "마포구";
				form.local2.options[15] = new Option("양천구");
				form.local2.options[15].value = "양천구";
				form.local2.options[16] = new Option("강서구");
				form.local2.options[16].value = "강서구";
				form.local2.options[17] = new Option("구로구");
				form.local2.options[17].value = "구로구";
				form.local2.options[18] = new Option("금천구");
				form.local2.options[18].value = "금천구";
				form.local2.options[19] = new Option("영등포구");
				form.local2.options[19].value = "영등포구";
				form.local2.options[20] = new Option("동작구");
				form.local2.options[20].value = "동작구";
				form.local2.options[21] = new Option("관악구");
				form.local2.options[21].value = "관악구";
				form.local2.options[22] = new Option("서초구");
				form.local2.options[22].value = "서초구";
				form.local2.options[23] = new Option("강남구");
				form.local2.options[23].value = "강남구";
				form.local2.options[24] = new Option("송파구");
				form.local2.options[24].value = "송파구";
				form.local2.options[25] = new Option("강동구");
				form.local2.options[25].value = "강동구";

			}
			if(document.filterSelect.local1.value == "부산"){
				form.local2.length = 1;
				form.local2.options[1] = new Option("중구");
				form.local2.options[1].value = "중구";
				form.local2.options[2] = new Option("서구");
				form.local2.options[2].value = "서구";
				form.local2.options[3] = new Option("동구");
				form.local2.options[3].value = "동구";
				form.local2.options[4] = new Option("영도구");
				form.local2.options[4].value = "영도구";
				form.local2.options[5] = new Option("부산진구");
				form.local2.options[5].value = "부산진구";
				form.local2.options[6] = new Option("동래구");
				form.local2.options[6].value = "동래구";
				form.local2.options[7] = new Option("남구");
				form.local2.options[7].value = "남구";
				form.local2.options[8] = new Option("북구");
				form.local2.options[8].value = "북구";
				form.local2.options[9] = new Option("강서구");
				form.local2.options[9].value = "강서구";
				form.local2.options[10] = new Option("해운대구");
				form.local2.options[10].value = "해운대구";
				form.local2.options[11] = new Option("사하구");
				form.local2.options[11].value = "사하구";
				form.local2.options[12] = new Option("금정구");
				form.local2.options[12].value = "금정구";
				form.local2.options[13] = new Option("연제구");
				form.local2.options[13].value = "연제구";
				form.local2.options[14] = new Option("수영구");
				form.local2.options[14].value = "수영구";
				form.local2.options[15] = new Option("사상구");
				form.local2.options[15].value = "사상구";


			}
			if(document.filterSelect.local1.value == "대구"){
				form.local2.length = 1;
				form.local2.options[1] = new Option("중구");
				form.local2.options[1].value = "중구";
				form.local2.options[2] = new Option("서구");
				form.local2.options[2].value = "서구";
				form.local2.options[3] = new Option("동구");
				form.local2.options[3].value = "동구";
				form.local2.options[4] = new Option("남구");
				form.local2.options[4].value = "남구";
				form.local2.options[5] = new Option("북구");
				form.local2.options[5].value = "북구";
				form.local2.options[6] = new Option("수성구");
				form.local2.options[6].value = "수성구";
				form.local2.options[7] = new Option("달서구");
				form.local2.options[7].value = "달서구";


			}
			if(document.filterSelect.local1.value == "인천"){
				form.local2.length = 1;
				form.local2.options[1] = new Option("중구");
				form.local2.options[1].value = "중구";
				form.local2.options[2] = new Option("동구");
				form.local2.options[2].value = "동구";
				form.local2.options[3] = new Option("미추홀구");
				form.local2.options[3].value = "미추홀구";
				form.local2.options[4] = new Option("연수구");
				form.local2.options[4].value = "연수구";
				form.local2.options[5] = new Option("남동구");
				form.local2.options[5].value = "남동구";
				form.local2.options[6] = new Option("부평구");
				form.local2.options[6].value = "부평구";
				form.local2.options[7] = new Option("계양구");
				form.local2.options[7].value = "계양구";
				form.local2.options[8] = new Option("서구");
				form.local2.options[8].value = "서구";


			}
			if(document.filterSelect.local1.value == "광주"){
				form.local2.length = 1;
				form.local2.options[1] = new Option("동구");
				form.local2.options[1].value = "동구";
				form.local2.options[2] = new Option("서구");
				form.local2.options[2].value = "서구";
				form.local2.options[3] = new Option("남구");
				form.local2.options[3].value = "남구";
				form.local2.options[4] = new Option("북구");
				form.local2.options[4].value = "북구";
				form.local2.options[5] = new Option("광산구");
				form.local2.options[5].value = "광산구";



			}
			if(document.filterSelect.local1.value == "대전"){
				form.local2.length = 1;
				form.local2.options[1] = new Option("동구");
				form.local2.options[1].value = "동구";
				form.local2.options[2] = new Option("중구");
				form.local2.options[2].value = "중구";
				form.local2.options[3] = new Option("서구");
				form.local2.options[3].value = "서구";
				form.local2.options[4] = new Option("유성구");
				form.local2.options[4].value = "유성구";
				form.local2.options[5] = new Option("대덕구");
				form.local2.options[5].value = "대덕구";



			}
			if(document.filterSelect.local1.value == "울산"){
				form.local2.length = 1;
				form.local2.options[1] = new Option("중구");
				form.local2.options[1].value = "중구";
				form.local2.options[2] = new Option("남구");
				form.local2.options[2].value = "남구";
				form.local2.options[3] = new Option("동구");
				form.local2.options[3].value = "동구";
				form.local2.options[4] = new Option("북구");
				form.local2.options[4].value = "북구";


			}
			if(document.filterSelect.local1.value == "세종"){


			}
			if(document.filterSelect.local1.value == "경기"){
				form.local2.length = 1;
				form.local2.options[1] = new Option("광명시");
				form.local2.options[1].value = "광명시";
				form.local2.options[2] = new Option("평택시");
				form.local2.options[2].value = "평택시";
				form.local2.options[3] = new Option("오산시");
				form.local2.options[3].value = "오산시";
				form.local2.options[4] = new Option("시흥시");
				form.local2.options[4].value = "시흥시";
				form.local2.options[5] = new Option("군포시");
				form.local2.options[5].value = "군포시";
				form.local2.options[6] = new Option("의왕시");
				form.local2.options[6].value = "의왕시";
				form.local2.options[7] = new Option("하남시");
				form.local2.options[7].value = "하남시";
				form.local2.options[8] = new Option("이천시");
				form.local2.options[8].value = "이천시";
				form.local2.options[9] = new Option("안성시");
				form.local2.options[9].value = "안성시";
				form.local2.options[10] = new Option("김포시");
				form.local2.options[10].value = "김포시";
				form.local2.options[11] = new Option("화성시");
				form.local2.options[11].value = "화성시";
				form.local2.options[12] = new Option("광주시");
				form.local2.options[12].value = "광주시";
				form.local2.options[13] = new Option("여주시");
				form.local2.options[13].value = "여주시";
				form.local2.options[14] = new Option("부천시");
				form.local2.options[14].value = "부천시";
				form.local2.options[15] = new Option("수원시 장안구");
				form.local2.options[15].value = "수원시 장안구";
				form.local2.options[16] = new Option("수원시 권선구");
				form.local2.options[16].value = "수원시 권선구";
				form.local2.options[17] = new Option("수원시 팔달구");
				form.local2.options[17].value = "수원시 팔달구";
				form.local2.options[18] = new Option("수원시 영통구");
				form.local2.options[18].value = "수원시 영통구";
				form.local2.options[19] = new Option("성남시 수정구");
				form.local2.options[19].value = "성남시 수정구";
				form.local2.options[20] = new Option("성남시 중원구");
				form.local2.options[20].value = "성남시 중원구";
				form.local2.options[21] = new Option("성남시 분당구");
				form.local2.options[21].value = "성남시 분당구";
				form.local2.options[22] = new Option("안양시 만안구");
				form.local2.options[22].value = "안양시 만안구";
				form.local2.options[23] = new Option("안양시 동안구");
				form.local2.options[23].value = "안양시 동안구";
				form.local2.options[24] = new Option("안산시 상록구");
				form.local2.options[24].value = "안산시 상록구";
				form.local2.options[25] = new Option("안산시 단원구");
				form.local2.options[25].value = "안산시 단원구";
				form.local2.options[26] = new Option("용인시 처인구");
				form.local2.options[26].value = "용인시 처인구";
				form.local2.options[27] = new Option("용인시 기흥구");
				form.local2.options[27].value = "용인시 기흥구";
				form.local2.options[28] = new Option("용인시 수지구");
				form.local2.options[28].value = "용인시 수지구";
				form.local2.options[29] = new Option("고양시 덕양구");
				form.local2.options[29].value = "고양시 덕양구";
				form.local2.options[30] = new Option("고양시 일산동구");
				form.local2.options[30].value = "고양시 일산동구";
				form.local2.options[31] = new Option("고양이 일산서구");
				form.local2.options[31].value = "고양시 일산서구";
				form.local2.options[32] = new Option("의정부시");
				form.local2.options[32].value = "의정부시";
				form.local2.options[33] = new Option("동두천시");
				form.local2.options[33].value = "동두천시";
				form.local2.options[34] = new Option("구리시");
				form.local2.options[34].value = "구리시";
				form.local2.options[35] = new Option("남양주시");
				form.local2.options[35].value = "남양주시";
				form.local2.options[36] = new Option("파주시");
				form.local2.options[36].value = "파주시";
				form.local2.options[37] = new Option("양주시");
				form.local2.options[37].value = "양주시";
				form.local2.options[38] = new Option("포천시");
				form.local2.options[38].value = "포천시";


			}
			if(document.filterSelect.local1.value == "강원"){
				form.local2.length = 1;
				form.local2.options[1] = new Option("춘천시");
				form.local2.options[1].value = "춘천시";
				form.local2.options[2] = new Option("원주시");
				form.local2.options[2].value = "원주시";
				form.local2.options[3] = new Option("강릉시");
				form.local2.options[3].value = "강릉시";
				form.local2.options[4] = new Option("동해시");
				form.local2.options[4].value = "동해시";
				form.local2.options[5] = new Option("태백시");
				form.local2.options[5].value = "태백시";
				form.local2.options[6] = new Option("속초시");
				form.local2.options[6].value = "속초시";
				form.local2.options[7] = new Option("삼척시");
				form.local2.options[7].value = "삼척시";

			}
			if(document.filterSelect.local1.value == "충청"){
				form.local2.length = 1;
				form.local2.options[1] = new Option("청주시 상당구");
				form.local2.options[1].value = "청주시 상당구";
				form.local2.options[2] = new Option("청주시 서원구");
				form.local2.options[2].value = "청주시 서원구";
				form.local2.options[3] = new Option("청주시 흥덕구");
				form.local2.options[3].value = "청구시 흥덕구";
				form.local2.options[4] = new Option("청주시 청원구");
				form.local2.options[4].value = "청주시 청원구";
				form.local2.options[5] = new Option("천안시 동남구");
				form.local2.options[5].value = "천안시 동남구";
				form.local2.options[6] = new Option("천안시 서북구");
				form.local2.options[6].value = "천안시 서북구";
				form.local2.options[7] = new Option("공주시");
				form.local2.options[7].value = "공주시";
				form.local2.options[8] = new Option("보령시");
				form.local2.options[8].value = "보령시";
				form.local2.options[9] = new Option("아산시");
				form.local2.options[9].value = "아산시";
				form.local2.options[10] = new Option("서산시");
				form.local2.options[10].value = "서산시";
				form.local2.options[11] = new Option("논산시");
				form.local2.options[11].value = "논산시";
				form.local2.options[12] = new Option("계룡시");
				form.local2.options[12].value = "계룡시";
				form.local2.options[13] = new Option("당진시");
				form.local2.options[13].value = "당진시";


			}
			if(document.filterSelect.local1.value == "전라"){
				form.local2.length = 1;
				form.local2.options[1] = new Option("전주시 완산구");
				form.local2.options[1].value = "전주시 완산구";
				form.local2.options[2] = new Option("전주시 덕진구");
				form.local2.options[2].value = "전주시 덕진구";
				form.local2.options[3] = new Option("군산시");
				form.local2.options[3].value = "군산시";
				form.local2.options[4] = new Option("익산시");
				form.local2.options[4].value = "익산시";
				form.local2.options[5] = new Option("정읍시");
				form.local2.options[5].value = "정읍시";
				form.local2.options[6] = new Option("남원시");
				form.local2.options[6].value = "남원시";
				form.local2.options[7] = new Option("김제시");
				form.local2.options[7].value = "김제시";
				form.local2.options[8] = new Option("목포시");
				form.local2.options[8].value = "목포시";
				form.local2.options[9] = new Option("여수시");
				form.local2.options[9].value = "여수시";
				form.local2.options[10] = new Option("순천시");
				form.local2.options[10].value = "순천시";
				form.local2.options[11] = new Option("나주시");
				form.local2.options[11].value = "나주시";
				form.local2.options[12] = new Option("광양시");
				form.local2.options[12].value = "광양시";



			}

			if(document.filterSelect.local1.value == "경상"){
				form.local2.length = 1;
				form.local2.options[1] = new Option("포항시 남구");
				form.local2.options[1].value = "포항시 남구";
				form.local2.options[2] = new Option("포항시 북구");
				form.local2.options[2].value = "포항시 북구";
				form.local2.options[3] = new Option("경주시");
				form.local2.options[3].value = "경주시";
				form.local2.options[4] = new Option("김천시");
				form.local2.options[4].value = "김천시";
				form.local2.options[5] = new Option("안동시");
				form.local2.options[5].value = "안동시";
				form.local2.options[6] = new Option("구미시");
				form.local2.options[6].value = "구미시";
				form.local2.options[7] = new Option("영주시");
				form.local2.options[7].value = "영주시";
				form.local2.options[8] = new Option("영천시");
				form.local2.options[8].value = "영천시";
				form.local2.options[9] = new Option("상주시");
				form.local2.options[9].value = "상주시";
				form.local2.options[10] = new Option("문경시");
				form.local2.options[10].value = "문경시";
				form.local2.options[11] = new Option("경산시");
				form.local2.options[11].value = "경산시";
				form.local2.options[12] = new Option("창원시 의창구");
				form.local2.options[12].value = "창원시 의창구";
				form.local2.options[13] = new Option("창원시 성산구");
				form.local2.options[13].value = "창원시 성산구";
				form.local2.options[14] = new Option("창원시 마산합포구");
				form.local2.options[14].value = "창원시 마산합포구";
				form.local2.options[15] = new Option("창원시 마산회원구");
				form.local2.options[15].value = "창원시 마산회원구";
				form.local2.options[16] = new Option("창원시 진해구");
				form.local2.options[16].value = "창원시 진해구";
				form.local2.options[17] = new Option("진주시");
				form.local2.options[17].value = "진주시";
				form.local2.options[18] = new Option("통영시");
				form.local2.options[18].value = "통영시";
				form.local2.options[19] = new Option("사천시");
				form.local2.options[19].value = "사천시";
				form.local2.options[20] = new Option("김해시");
				form.local2.options[20].value = "김해시";
				form.local2.options[21] = new Option("밀양시");
				form.local2.options[21].value = "밀양시";
				form.local2.options[22] = new Option("거제시");
				form.local2.options[22].value = "거제시";
				form.local2.options[23] = new Option("양산시");
				form.local2.options[23].value = "양산시";

			}

			if(document.filterSelect.local1.value == "제주도"){
				form.local2.length = 1;

			}

	}
</script>



		<div style="max-width: 1000px; margin-right: auto; margin-left: auto;">
		<div class="jumbotron">


             <div class="row" style="margin-left: auto; margin-right: auto;">
                 <div class="col-lg-12 col-lg-offset-3 text-center" >
                    <h2><span class="ion-minus"></span>총 ${list_cnt}개의 식당이 등록되어 있습니다.<span class="ion-minus"></span></h2>
						<p>원하는 식당을 선택하여 웨이팅하거나 예약할 수 있습니다.</p>
                 </div>
            </div>
		<table style = "margin-top : 30px; margin-left: auto; margin-bottom:20px; margin-right: auto;">
	<form action = "/search/filter" name = "filterSelect" method="get">


			<tr>

				<td>

				      		<select class="form-control" name = "local1" onchange="setCategory2()">
				        		<option value = "">-- 지역 --</option>
				        		<option value = "서울">서울특별시</option>
				        		<option value = "부산">부산광역시</option>
				        		<option value = "대구">대구광역시</option>
				        		<option value = "인천">인천광역시</option>
				        		<option value = "광주">광주광역시</option>
				        		<option value = "대전">대전광역시</option>
				        		<option value = "울산">울산광역시</option>
				        		<option value = "세종">세종특별자치시</option>
				        		<option value = "경기">경기도</option>
				        		<option value = "강원">강원도</option>
				        		<option value = "충청">충청북도</option>
				        		<option value = "전라">전라북도</option>
				        		<option value = "경상">경상북도</option>
				        		<option value = "제주">제주도</option>

			     	 		</select>

				</td>

			<td>

				<select class="form-control" name = "local2" onchange = "settext(this.options[this.selectedIndex].value)">
			    	<option value="">-- 구 --</option>

				</select>


			</td>

	<td>
		<select class = "form-control" name = "food">
		    <option value="">-- 음식 --</option>
		    <option value="양식">양식</option>
		    <option value="한식">한식</option>
		    <option value="중식">중식</option>
		    <option value="일식">일식</option>
		    <option value="아시아식">아시아식</option>
		    <option value="컨템퍼러리">컨템퍼러리</option>
		    <option value="뷔페">뷔페</option>
		    <option value="구이">구이</option>
		    <option value="술집">술집</option>
		    <option value="카페/베이커리">카페/베이커리</option>

		</select>


	</td>

	<td>
		<button class="btn btn-secondary my-2 my-sm-0" type="submit">검색</button>
	</td>
	</form>
</tr>


</table>

<!--  <div id="contents">
  <div id="js-load" class="lists"> -->



			<div class="col-sm-12">
				<div class="page-header text-muted" style="float: right;">
					<ul class="nav">
						<li><a href="popular">· <b>인기순&nbsp;</b></a></li>
						<li><a href="view">· 최신순</a></li>
					</ul>
				</div>
			</div>

<div class="blog">
      <div class="container">

           <div class="row" style="clear: both;">
<c:forEach items = "${popular}" var = "EnterpriseVO">

				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12" data-aos="fade-right">
					 <div class="card text-center">
                        <a href = "/enterprise/enterprise_details?enterprise_code=${EnterpriseVO.enterprise_code}"><img class="card-img-top" src="<spring:url value ='/image/${EnterpriseVO.enterprise_mainImg}'/>" alt="" height="200px;" width="100%"></a>
                        <div class="card-block">
                            <p class="card-text"><small class="text-muted" style="float: left"><b>[${EnterpriseVO.enterprise_sectors}]</b></small>
                            <small class="text-muted" style="float: right"><b>별점 ${EnterpriseVO.review_scope}점</b></small>
                            </p>
                            <h5 class="card-title" style = "clear: both;">${EnterpriseVO.enterprise_businessName}</h5>
                            <p class="card-text"><small class="text-muted"><c:out value='${fn:substring(EnterpriseVO.enterprise_add2,0, 15)}' /></small></p>
                             <button class="btn btn-default" <c:if test = "${EnterpriseVO.enterprise_service == '1'}"> disabled = 'disabled' </c:if> onclick="window.open('/reserve/reserve?enterprise_code=${EnterpriseVO.enterprise_code}','','width=750,height=550,left=100,top=100,location=no,status=no,scrollbars=no');">예약하기</button>
                             <button class="btn btn-default" <c:if test = "${EnterpriseVO.enterprise_service == '2'}"> disabled = 'disabled' </c:if> onclick="window.open('/waiting/waiting?enterprise_code=${EnterpriseVO.enterprise_code}','','width=750,height=550,location=no,status=no,scrollbars=no');">웨이팅하기</button>
                        </div>
                     </div>
                </div>
			</c:forEach>
               </div>

</div>


</div>

</body>
</html>

