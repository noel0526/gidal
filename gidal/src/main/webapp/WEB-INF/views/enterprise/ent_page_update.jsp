<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<style>
#fileUpload {

 border: 4px dashed #bcbcbc;
 height: 100px;
 width: 400px;
 text-align: center;
 margin: auto;

}
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);


           $("[name=enterprise_add1]").val(data.zonecode);
           $("[name=enterprise_add2]").val(fullRoadAddr);

           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
}

	function ruleCheck() {
		
		var phone = document.getElementById("phone").value;
	
		var expnum = /^(0[0-9]{1,2})-([0-9]{3,4})-([0-9]{4})$/;
	
		if(expnum.test(phone) == false) {
	
			//전화번호 형식이 숫자-숫자-숫자 형식이 아닐경우			
	
			alert("전화번호 형식이 올바르지 않습니다.");
	
			document.getElementById("phone").select();
	
			return false;
	
		} else {
			return true;
		}
	}

</script>




<script type="text/javascript">


    var pwdCheck = 0;


  //재입력 비밀번호 체크하여 가입버튼 비활성화 또는 맞지않음을 알림.
    function checkPwd() {
        var inputed = $('.pass').val();
        var reinputed = $('#repwd').val();
        console.log(inputed);
        console.log(reinputed);
        if(reinputed=="" && (inputed != reinputed || inputed == reinputed)){
            $(".signupbtn").prop("disabled", true);
            $(".signupbtn").css("background-color", "#aaaaaa");
            $("#repwd").css("background-color", "#FFCECE");
        }
        else if (inputed == reinputed) {
            $("#repwd").css("background-color", "#fcfadb");
            pwdCheck = 1;
            if(pwdCheck == 1) {
                $(".signupbtn").prop("disabled", false);
                $(".signupbtn").css("background-color", "#ff7777");
            }
        } else if (inputed != reinputed) {
            pwdCheck = 0;
            $(".signupbtn").prop("disabled", true);
            $(".signupbtn").css("background-color", "#aaaaaa");
            $("#repwd").css("background-color", "#FFCECE");

        }
    }


  function update() {
	  alert('정보수정이 완료되었습니다.');
  }


</script>
<%@ include file = "/WEB-INF/views/include/enter_page_nav.jsp" %>
</head>
<body>


	<div style="max-width: 1000px; margin-right: auto; margin-left: auto;">
		<div class="jumbotron">
				<h1>상세정보 수정</h1>

			<hr class="my-4">
	<div class="form-group" style = "max-width : 400px; margin : auto;">
				<form name = "form" action = "update" method = "post" enctype="multipart/form-data" onsubmit="return ruleCheck();" onsubmit="return update();">



					<p>
						<input type = "hidden" name = "enterprise_code" value="${list.enterprise_code}">

						<label class="col-form-label" for="inputDefault">패스워드</label>
                        <input type="password" class="form-control pass" name="enterprise_password" placeholder="Password" oninput="checkPwd()">

						<label class="col-form-label" for="inputDefault">패스워드확인</label>
                        <input type="password" class="form-control pass" name="enterprise_passwordCheck" placeholder="Confirm Password" id="repwd" oninput="checkPwd()">


					</p>

					<hr class="my-4">

					 <p>
						<label class="col-form-label" for="inputDefault">매장명</label>
						<input type="text" class="form-control" name = "enterprise_businessName" value = "${list.enterprise_businessName}">

						<label class="col-form-label" for="inputDefault">매장 전화번호 (-포함)</label>
						<input type="text" class="form-control" name = "enterprise_phone" value = "${list.enterprise_phone}" id = "phone">



						<label class="col-form-label" for="inputDefault">매장 주소</label>
						<div class="form-group">
						<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="enterprise_add1" id="add1" type="text"  value = "${list.enterprise_add1}" readonly="readonly" >
						    <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>
						</div>
						<div class="form-group">
						    <input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="enterprise_add2" id="add2"  value = "${list.enterprise_add2}" type="text" readonly="readonly" />
						</div>
						<div class="form-group">
						    <input class="form-control" placeholder="상세주소" name="enterprise_add3"  value = "${list.enterprise_add3}" id="add3" type="text"  />
						</div>



						<label class="col-form-label" for="inputDefault">영업시작시간</label>
						<select class="custom-select" name = "enterprise_operatingOpenTime" >
							<option value = "00:00" <c:if test = "${list.enterprise_operatingOpenTime eq '00:00'}" > selected = "selected" </c:if>>00:00</option>
							<option value = "00:30" <c:if test = "${list.enterprise_operatingOpenTime eq '00:30'}" > selected = "selected" </c:if>>00:30</option>
							<option value = "01:00" <c:if test = "${list.enterprise_operatingOpenTime eq '01:00'}" > selected = "selected" </c:if>>01:00</option>
							<option value = "01:30" <c:if test = "${list.enterprise_operatingOpenTime eq '01:30'}" > selected = "selected" </c:if>>01:30</option>
							<option value = "02:00" <c:if test = "${list.enterprise_operatingOpenTime eq '02:00'}" > selected = "selected" </c:if>>02:00</option>
							<option value = "02:30" <c:if test = "${list.enterprise_operatingOpenTime eq '02:30'}" > selected = "selected" </c:if>>02:30</option>
							<option value = "03:00" <c:if test = "${list.enterprise_operatingOpenTime eq '03:00'}" > selected = "selected" </c:if>>03:00</option>
							<option value = "03:30" <c:if test = "${list.enterprise_operatingOpenTime eq '03:30'}" > selected = "selected" </c:if>>03:30</option>
							<option value = "04:00" <c:if test = "${list.enterprise_operatingOpenTime eq '04:00'}" > selected = "selected" </c:if>>04:00</option>
							<option value = "04:30" <c:if test = "${list.enterprise_operatingOpenTime eq '04:30'}" > selected = "selected" </c:if>>04:30</option>
							<option value = "05:00" <c:if test = "${list.enterprise_operatingOpenTime eq '05:00'}" > selected = "selected" </c:if>>05:00</option>
							<option value = "05:30" <c:if test = "${list.enterprise_operatingOpenTime eq '05:30'}" > selected = "selected" </c:if>>05:30</option>
							<option value = "06:00" <c:if test = "${list.enterprise_operatingOpenTime eq '06:00'}" > selected = "selected" </c:if>>06:00</option>
							<option value = "06:30" <c:if test = "${list.enterprise_operatingOpenTime eq '06:30'}" > selected = "selected" </c:if>>06:30</option>
							<option value = "07:00" <c:if test = "${list.enterprise_operatingOpenTime eq '07:00'}" > selected = "selected" </c:if>>07:00</option>
							<option value = "07:30" <c:if test = "${list.enterprise_operatingOpenTime eq '07:30'}" > selected = "selected" </c:if>>07:30</option>
							<option value = "08:00" <c:if test = "${list.enterprise_operatingOpenTime eq '08:00'}" > selected = "selected" </c:if>>08:00</option>
							<option value = "08:30" <c:if test = "${list.enterprise_operatingOpenTime eq '08:30'}" > selected = "selected" </c:if>>08:30</option>
							<option value = "09:00" <c:if test = "${list.enterprise_operatingOpenTime eq '09:00'}" > selected = "selected" </c:if>>09:00</option>
							<option value = "09:30" <c:if test = "${list.enterprise_operatingOpenTime eq '09:30'}" > selected = "selected" </c:if>>09:30</option>
							<option value = "10:00" <c:if test = "${list.enterprise_operatingOpenTime eq '10:00'}" > selected = "selected" </c:if>>10:00</option>
							<option value = "10:30" <c:if test = "${list.enterprise_operatingOpenTime eq '10:30'}" > selected = "selected" </c:if>>10:30</option>
							<option value = "11:00" <c:if test = "${list.enterprise_operatingOpenTime eq '11:00'}" > selected = "selected" </c:if>>11:00</option>
							<option value = "11:30" <c:if test = "${list.enterprise_operatingOpenTime eq '11:30'}" > selected = "selected" </c:if>>11:30</option>
							<option value = "12:00" <c:if test = "${list.enterprise_operatingOpenTime eq '12:00'}" > selected = "selected" </c:if>>12:00</option>
							<option value = "12:30" <c:if test = "${list.enterprise_operatingOpenTime eq '12:30'}" > selected = "selected" </c:if>>12:30</option>
							<option value = "13:00" <c:if test = "${list.enterprise_operatingOpenTime eq '13:00'}" > selected = "selected" </c:if>>13:00</option>
							<option value = "13:30" <c:if test = "${list.enterprise_operatingOpenTime eq '13:30'}" > selected = "selected" </c:if>>13:30</option>
							<option value = "14:00" <c:if test = "${list.enterprise_operatingOpenTime eq '14:00'}" > selected = "selected" </c:if>>14:00</option>
							<option value = "14:30" <c:if test = "${list.enterprise_operatingOpenTime eq '14:30'}" > selected = "selected" </c:if>>14:30</option>
							<option value = "15:00" <c:if test = "${list.enterprise_operatingOpenTime eq '15:00'}" > selected = "selected" </c:if>>15:00</option>
							<option value = "15:30" <c:if test = "${list.enterprise_operatingOpenTime eq '15:30'}" > selected = "selected" </c:if>>15:30</option>
							<option value = "16:00" <c:if test = "${list.enterprise_operatingOpenTime eq '16:00'}" > selected = "selected" </c:if>>16:00</option>
							<option value = "16:30" <c:if test = "${list.enterprise_operatingOpenTime eq '16:30'}" > selected = "selected" </c:if>>16:30</option>
							<option value = "17:00" <c:if test = "${list.enterprise_operatingOpenTime eq '17:00'}" > selected = "selected" </c:if>>17:00</option>
							<option value = "17:30" <c:if test = "${list.enterprise_operatingOpenTime eq '17:30'}" > selected = "selected" </c:if>>17:30</option>
							<option value = "18:00" <c:if test = "${list.enterprise_operatingOpenTime eq '18:00'}" > selected = "selected" </c:if>>18:00</option>
							<option value = "18:30" <c:if test = "${list.enterprise_operatingOpenTime eq '18:30'}" > selected = "selected" </c:if>>18:30</option>
							<option value = "19:00" <c:if test = "${list.enterprise_operatingOpenTime eq '19:00'}" > selected = "selected" </c:if>>19:00</option>
							<option value = "19:30" <c:if test = "${list.enterprise_operatingOpenTime eq '19:30'}" > selected = "selected" </c:if>>19:30</option>
							<option value = "20:00" <c:if test = "${list.enterprise_operatingOpenTime eq '20:00'}" > selected = "selected" </c:if>>20:00</option>
							<option value = "20:30" <c:if test = "${list.enterprise_operatingOpenTime eq '20:30'}" > selected = "selected" </c:if>>20:30</option>
							<option value = "21:00" <c:if test = "${list.enterprise_operatingOpenTime eq '21:00'}" > selected = "selected" </c:if>>21:00</option>
							<option value = "21:30" <c:if test = "${list.enterprise_operatingOpenTime eq '21:30'}" > selected = "selected" </c:if>>21:30</option>
							<option value = "22:00" <c:if test = "${list.enterprise_operatingOpenTime eq '22:00'}" > selected = "selected" </c:if>>22:00</option>
							<option value = "22:30" <c:if test = "${list.enterprise_operatingOpenTime eq '22:30'}" > selected = "selected" </c:if>>22:30</option>
							<option value = "23:00" <c:if test = "${list.enterprise_operatingOpenTime eq '23:00'}" > selected = "selected" </c:if>>23:00</option>
							<option value = "23:30" <c:if test = "${list.enterprise_operatingOpenTime eq '23:30'}" > selected = "selected" </c:if>>23:30</option>
							<option value = "24:00" <c:if test = "${list.enterprise_operatingOpenTime eq '24:00'}" > selected = "selected" </c:if>>24:00</option>
						</select>


						<label class="col-form-label" for="inputDefault" >영업종료시간</label>
						<select class="custom-select"  name = "enterprise_operatingCloseTime">
							<option value = "00:00" <c:if test = "${list.enterprise_operatingCloseTime eq '00:00'}" > selected = "selected" </c:if>>00:00</option>
							<option value = "00:30" <c:if test = "${list.enterprise_operatingCloseTime eq '00:30'}" > selected = "selected" </c:if>>00:30</option>
							<option value = "01:00" <c:if test = "${list.enterprise_operatingCloseTime eq '01:00'}" > selected = "selected" </c:if>>01:00</option>
							<option value = "01:30" <c:if test = "${list.enterprise_operatingCloseTime eq '01:30'}" > selected = "selected" </c:if>>01:30</option>
							<option value = "02:00" <c:if test = "${list.enterprise_operatingCloseTime eq '02:00'}" > selected = "selected" </c:if>>02:00</option>
							<option value = "02:30" <c:if test = "${list.enterprise_operatingCloseTime eq '02:30'}" > selected = "selected" </c:if>>02:30</option>
							<option value = "03:00" <c:if test = "${list.enterprise_operatingCloseTime eq '03:00'}" > selected = "selected" </c:if>>03:00</option>
							<option value = "03:30" <c:if test = "${list.enterprise_operatingCloseTime eq '03:30'}" > selected = "selected" </c:if>>03:30</option>
							<option value = "04:00" <c:if test = "${list.enterprise_operatingCloseTime eq '04:00'}" > selected = "selected" </c:if>>04:00</option>
							<option value = "04:30" <c:if test = "${list.enterprise_operatingCloseTime eq '04:30'}" > selected = "selected" </c:if>>04:30</option>
							<option value = "05:00" <c:if test = "${list.enterprise_operatingCloseTime eq '05:00'}" > selected = "selected" </c:if>>05:00</option>
							<option value = "05:30" <c:if test = "${list.enterprise_operatingCloseTime eq '05:30'}" > selected = "selected" </c:if>>05:30</option>
							<option value = "06:00" <c:if test = "${list.enterprise_operatingCloseTime eq '06:00'}" > selected = "selected" </c:if>>06:00</option>
							<option value = "06:30" <c:if test = "${list.enterprise_operatingCloseTime eq '06:30'}" > selected = "selected" </c:if>>06:30</option>
							<option value = "07:00" <c:if test = "${list.enterprise_operatingCloseTime eq '07:00'}" > selected = "selected" </c:if>>07:00</option>
							<option value = "07:30" <c:if test = "${list.enterprise_operatingCloseTime eq '07:30'}" > selected = "selected" </c:if>>07:30</option>
							<option value = "08:00" <c:if test = "${list.enterprise_operatingCloseTime eq '08:00'}" > selected = "selected" </c:if>>08:00</option>
							<option value = "08:30" <c:if test = "${list.enterprise_operatingCloseTime eq '08:30'}" > selected = "selected" </c:if>>08:30</option>
							<option value = "09:00" <c:if test = "${list.enterprise_operatingCloseTime eq '09:00'}" > selected = "selected" </c:if>>09:00</option>
							<option value = "09:30" <c:if test = "${list.enterprise_operatingCloseTime eq '09:30'}" > selected = "selected" </c:if>>09:30</option>
							<option value = "10:00" <c:if test = "${list.enterprise_operatingCloseTime eq '10:00'}" > selected = "selected" </c:if>>10:00</option>
							<option value = "10:30" <c:if test = "${list.enterprise_operatingCloseTime eq '10:30'}" > selected = "selected" </c:if>>10:30</option>
							<option value = "11:00" <c:if test = "${list.enterprise_operatingCloseTime eq '11:00'}" > selected = "selected" </c:if>>11:00</option>
							<option value = "11:30" <c:if test = "${list.enterprise_operatingCloseTime eq '11:30'}" > selected = "selected" </c:if>>11:30</option>
							<option value = "12:00" <c:if test = "${list.enterprise_operatingCloseTime eq '12:00'}" > selected = "selected" </c:if>>12:00</option>
							<option value = "12:30" <c:if test = "${list.enterprise_operatingCloseTime eq '12:30'}" > selected = "selected" </c:if>>12:30</option>
							<option value = "13:00" <c:if test = "${list.enterprise_operatingCloseTime eq '13:00'}" > selected = "selected" </c:if>>13:00</option>
							<option value = "13:30" <c:if test = "${list.enterprise_operatingCloseTime eq '13:30'}" > selected = "selected" </c:if>>13:30</option>
							<option value = "14:00" <c:if test = "${list.enterprise_operatingCloseTime eq '14:00'}" > selected = "selected" </c:if>>14:00</option>
							<option value = "14:30" <c:if test = "${list.enterprise_operatingCloseTime eq '14:30'}" > selected = "selected" </c:if>>14:30</option>
							<option value = "15:00" <c:if test = "${list.enterprise_operatingCloseTime eq '15:00'}" > selected = "selected" </c:if>>15:00</option>
							<option value = "15:30" <c:if test = "${list.enterprise_operatingCloseTime eq '15:30'}" > selected = "selected" </c:if>>15:30</option>
							<option value = "16:00" <c:if test = "${list.enterprise_operatingCloseTime eq '16:00'}" > selected = "selected" </c:if>>16:00</option>
							<option value = "16:30" <c:if test = "${list.enterprise_operatingCloseTime eq '16:30'}" > selected = "selected" </c:if>>16:30</option>
							<option value = "17:00" <c:if test = "${list.enterprise_operatingCloseTime eq '17:00'}" > selected = "selected" </c:if>>17:00</option>
							<option value = "17:30" <c:if test = "${list.enterprise_operatingCloseTime eq '17:30'}" > selected = "selected" </c:if>>17:30</option>
							<option value = "18:00" <c:if test = "${list.enterprise_operatingCloseTime eq '18:00'}" > selected = "selected" </c:if>>18:00</option>
							<option value = "18:30" <c:if test = "${list.enterprise_operatingCloseTime eq '18:30'}" > selected = "selected" </c:if>>18:30</option>
							<option value = "19:00" <c:if test = "${list.enterprise_operatingCloseTime eq '19:00'}" > selected = "selected" </c:if>>19:00</option>
							<option value = "19:30" <c:if test = "${list.enterprise_operatingCloseTime eq '19:30'}" > selected = "selected" </c:if>>19:30</option>
							<option value = "20:00" <c:if test = "${list.enterprise_operatingCloseTime eq '20:00'}" > selected = "selected" </c:if>>20:00</option>
							<option value = "20:30" <c:if test = "${list.enterprise_operatingCloseTime eq '20:30'}" > selected = "selected" </c:if>>20:30</option>
							<option value = "21:00" <c:if test = "${list.enterprise_operatingCloseTime eq '21:00'}" > selected = "selected" </c:if>>21:00</option>
							<option value = "21:30" <c:if test = "${list.enterprise_operatingCloseTime eq '21:30'}" > selected = "selected" </c:if>>21:30</option>
							<option value = "22:00" <c:if test = "${list.enterprise_operatingCloseTime eq '22:00'}" > selected = "selected" </c:if>>22:00</option>
							<option value = "22:30" <c:if test = "${list.enterprise_operatingCloseTime eq '22:30'}" > selected = "selected" </c:if>>22:30</option>
							<option value = "23:00" <c:if test = "${list.enterprise_operatingCloseTime eq '23:00'}" > selected = "selected" </c:if>>23:00</option>
							<option value = "23:30" <c:if test = "${list.enterprise_operatingCloseTime eq '23:30'}" > selected = "selected" </c:if>>23:30</option>
							<option value = "24:00" <c:if test = "${list.enterprise_operatingCloseTime eq '24:00'}" > selected = "selected" </c:if>>24:00</option>
						</select>


						<script>

						function itemSum(frm)
						{
						   var sum = "";
						   var count = frm.chkbox.length;

						   for(var i=0; i < count; i++ ){
						       if( frm.chkbox[i].checked == true ){
							    sum += frm.chkbox[i].value + ",";
						       }
						   }
						   frm.enterprise_closed.value = sum;
						}

						</script>



				 		<label class="col-form-label" for="inputDefault">영업일 체크</label>
						<div class="form-group">
							<input type = "checkbox" name = "chkbox" onClick="itemSum(this.form);" value = '1'>월요일
						 	<input type = "checkbox" name = "chkbox" onClick="itemSum(this.form);" value = '2'>화요일
							<input type = "checkbox" name = "chkbox" onClick="itemSum(this.form);" value = '3'>수요일
							<input type = "checkbox" name = "chkbox" onClick="itemSum(this.form);" value = '4'>목요일
							<input type = "checkbox" name = "chkbox" onClick="itemSum(this.form);" value = '5'>금요일
							<input type = "checkbox" name = "chkbox" onClick="itemSum(this.form);" value = '6'>토요일
							<input type = "checkbox" name = "chkbox" onClick="itemSum(this.form);" value = '0'>일요일
							<input type = "hidden" name = "enterprise_closed">

						</div>

						<label class="col-form-label" for="sectors_select">업종</label>
						<select class="custom-select" name = "enterprise_sectors" id="sectors_select" >

							<option value = "0" <c:if test = "${list.enterprise_sectors eq '0'}" > selected = "selected" </c:if>>선택해주세요</option>
							<option value = "default" <c:if test = "${list.enterprise_sectors eq 'default'}" > selected = "selected" </c:if>>음식전체</option>
							<option value = "한식" <c:if test = "${list.enterprise_sectors eq '한식'}" > selected = "selected" </c:if>>한식</option>
							<option value = "양식" <c:if test = "${list.enterprise_sectors eq '양식'}" > selected = "selected" </c:if>>양식</option>
							<option value = "중식" <c:if test = "${list.enterprise_sectors eq '중식'}" > selected = "selected" </c:if>>중식</option>
							<option value = "일식" <c:if test = "${list.enterprise_sectors eq '일식'}" > selected = "selected" </c:if>>일식</option>
							<option value = "아시아식" <c:if test = "${list.enterprise_sectors eq '아시아식'}" > selected = "selected" </c:if>>아시아식</option>
							<option value = "컨템퍼러리" <c:if test = "${list.enterprise_sectors eq '컨템퍼러리'}" > selected = "selected" </c:if>>컨템퍼러리</option>
							<option value = "뷔페" <c:if test = "${list.enterprise_sectors eq '뷔페'}" > selected = "selected" </c:if>>뷔페</option>
							<option value = "구이" <c:if test = "${list.enterprise_sectors eq '구이'}" > selected = "selected" </c:if>>구이</option>
							<option value = "술집" <c:if test = "${list.enterprise_sectors eq '술집'}" > selected = "selected" </c:if>>술집</option>
							<option value = "카페/베이커리" <c:if test = "${list.enterprise_sectors eq '카페/베이커리'}" > selected = "selected" </c:if>>카페/베이커리</option>
						</select>

						 <label class="col-form-label" for="inputDefault">서비스</label>
						<select class="custom-select" name = "enterprise_service" id="exampleSelect1">
							<option value = "0" <c:if test = "${list.enterprise_service eq '0'}" > selected = "selected" </c:if>>선택해주세요</option>
							<option value = "1" <c:if test = "${list.enterprise_service eq '1'}" > selected = "selected" </c:if>>웨이팅 서비스</option>
							<option value = "2" <c:if test = "${list.enterprise_service eq '2'}" > selected = "selected" </c:if>>예약 서비스</option>
							<option value = "3" <c:if test = "${list.enterprise_service eq '3'}" > selected = "selected" </c:if>>웨이팅 + 예약 서비스</option>
						</select>


<script type="text/javascript">
            $(document).ready(function(){
                var objDragAndDrop = $(".dragAndDropDiv");

                $(document).on("dragenter",".dragAndDropDiv",function(e){
                    e.stopPropagation();
                    e.preventDefault();
                    $(this).css('border', '2px solid #0B85A1');
                });
                $(document).on("dragover",".dragAndDropDiv",function(e){
                    e.stopPropagation();
                    e.preventDefault();
                });
                $(document).on("drop",".dragAndDropDiv",function(e){

                    $(this).css('border', '2px dotted #0B85A1');
                    e.preventDefault();
                    var files = e.originalEvent.dataTransfer.files;

                    handleFileUpload(files,objDragAndDrop);
                });

                $(document).on('dragenter', function (e){
                    e.stopPropagation();
                    e.preventDefault();
                });
                $(document).on('dragover', function (e){
                  e.stopPropagation();
                  e.preventDefault();
                  objDragAndDrop.css('border', '2px dotted #0B85A1');
                });
                $(document).on('drop', function (e){
                    e.stopPropagation();
                    e.preventDefault();
                });

                function handleFileUpload(files,obj)
                {
                   for (var i = 0; i < files.length; i++)
                   {
                        var fd = new FormData();
                        fd.append('file', files[i]);

                        var status = new createStatusbar(obj); //Using this we can set progress.
                        status.setFileNameSize(files[i].name,files[i].size);
                        sendFileToServer(fd,status);

                   }
                }

                var rowCount=0;
                function createStatusbar(obj){

                    rowCount++;
                    var row="odd";
                    if(rowCount %2 ==0) row ="even";
                    this.statusbar = $("<div class='statusbar "+row+"'></div>");
                    this.filename = $("<div class='filename'></div>").appendTo(this.statusbar);
                    this.size = $("<div class='filesize'></div>").appendTo(this.statusbar);
                    this.progressBar = $("<div class='progressBar'><div></div></div>").appendTo(this.statusbar);
                    this.abort = $("<div class='abort'>중지</div>").appendTo(this.statusbar);

                    obj.after(this.statusbar);

                    this.setFileNameSize = function(name,size){
                        var sizeStr="";
                        var sizeKB = size/1024;
                        if(parseInt(sizeKB) > 1024){
                            var sizeMB = sizeKB/1024;
                            sizeStr = sizeMB.toFixed(2)+" MB";
                        }else{
                            sizeStr = sizeKB.toFixed(2)+" KB";
                        }

                        this.filename.html(name);
                        this.size.html(sizeStr);
                    }

                    this.setProgress = function(progress){
                        var progressBarWidth =progress*this.progressBar.width()/ 100;
                        this.progressBar.find('div').animate({ width: progressBarWidth }, 10).html(progress + "% ");
                        if(parseInt(progress) >= 100)
                        {
                            this.abort.hide();
                        }
                    }

                    this.setAbort = function(jqxhr){
                        var sb = this.statusbar;
                        this.abort.click(function()
                        {
                            jqxhr.abort();
                            sb.hide();
                        });
                    }
                }

                function sendFileToServer(formData,status)
                {
                    var uploadURL = "img"; //Upload URL
                    var extraData ={}; //Extra Data.
                    var jqXHR=$.ajax({
                            xhr: function() {
                            var xhrobj = $.ajaxSettings.xhr();
                            if (xhrobj.upload) {
                                    xhrobj.upload.addEventListener('progress', function(event) {
                                        var percent = 0;
                                        var position = event.loaded || event.position;
                                        var total = event.total;
                                        if (event.lengthComputable) {
                                            percent = Math.ceil(position / total * 100);
                                        }
                                        //Set progress
                                        status.setProgress(percent);
                                    }, false);
                                }
                            return xhrobj;
                        },
                        url: uploadURL,
                        type: "POST",
                        contentType:false,
                        processData: false,
                        cache: false,
                        data: formData,
                        success: function(data){
                            status.setProgress(100);

                            //$("#status1").append("File upload Done<br>");
                        }
                    });

                    status.setAbort(jqXHR);
                }

            });
</script>


						 <label class="col-form-label" for="inputDefault">대표이미지 첨부</label>
						 	<div id="fileUpload" class="dragAndDropDiv"><h5 style="margin-top: 40px;">추가할 사진을 드래그해주세요.</h5></div>
						</p>
					<p>
						<button type="submit" class="form-control btn btn-primary signupbtn"  disabled="disabled">정보수정</button>
					</p>
				</form>
</div>
</div>
</div>

</body>

</html>