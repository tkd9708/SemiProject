<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4c4f7d76ea9cd2ea4ae56f99456e4cc4&libraries=services"></script>
<title>Insert title here</title>
<style>
	span.searchaddr{
	cursor: pointer;
	}
	div.addmain{
	margin-top: 150px;
	margin-bottom: 200px;	
	}
	
</style>
<script type="text/javascript">
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
       
            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            /* if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            } */
     

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
       
            document.getElementById("addr").value = roadAddr;
          
            

        }
    }).open();
}

function getxy(){
	var addr = $("#addr").val();
	//alert(addr);
	var geocoder = new kakao.maps.services.Geocoder();
	var lat ="";
	var lon ="";
	geocoder.addressSearch(addr,function(result,status){
		 // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	     		 lat = result[0].y;
	     		 lon = result[0].x;
	     		   $("input[name=latitude]").val(lat);
	     		   $("input[name=longitude]").val(lon);
	     		   //위도는 y latitude  경도는 x longitude 
	     	}
	  
	     });
	
	}

</script>
</head>
<body>
<div class="addmain">
	<h1 style="font-weight: 900;text-align:center"><b>관광지 추가</b></h1>
	<br><br>
	<form action="spot/addspotaction.jsp" method="post" enctype="multipart/form-data">
	<table class="table tabld-bordered" style="width:600px; margin-left: auto; margin-right: auto;">
	<tr>
		<td width="50px">contentsid</td>
		<td>
			<input type="text" name="contentsid" required="required">
		</td>
	</tr>
	<tr>
		<td >이름</td>
		<td>
			<input type="text" name="title" required="required">
		</td>
	</tr>
	<tr>
		<td colspan="2" >
		<div style="display:inline-flex">
		<span>행정시</span>
				&nbsp;&nbsp;
			<select name="label1" required="required" style="width:150px">
				<option value="none" disabled="disabled" selected="selected">선택</option>
				<option value="제주시">제주시</option>
				<option value="서귀포시">서귀포시</option>
				<option value="섬 속의 섬">섬속의섬</option>
			</select>
		</div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<div style="display:inline-flex">
		<span>지역명</span>
				&nbsp;&nbsp;
			<select name="label2" required="required" style="width:150px">
				<option value="none" disabled="disabled" selected="selected">선택</option>
				<option value="제주">제주시</option>
				<option value="한경">한경면</option>	
				<option value="한림">한림읍</option>	
				<option value="애월">애월읍</option>	
				<option value="구좌">구좌읍</option>	
				<option value="서귀포">서귀포시</option>	
				<option value="안덕">안덕면</option>	
				<option value="남원">남원읍</option>	
				<option value="표선">표선면</option>	
				<option value="성산">성산읍</option>	
				<option value="우도">우도</option>		
			</select>
			</div>
		</td>
	</tr>
	<tr >
		<td  style="vertical-align: middle">주소</td>
		<td>
		<div style="display:flex">
			<input type="text" name="addr" id="addr" required="required" placeholder="주소" style="width:250px">
			&nbsp;<span class="searchaddr glyphicon glyphicon-search" onclick="sample4_execDaumPostcode()" style="font-size: 15pt;vertical-align: middle"></span>	
		</div>
		<input type="text" name="detailaddr" id="detailaddr" placeholder="상세주소"  style="width:250px">
		</td>
		<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
		<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
	</div>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" id="btnxy" onclick="getxy()">위도경도검색</button>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<div style="display:inline-flex">
				<span>위도</span>	
				&nbsp;&nbsp;&nbsp;
				<input type="text" name="latitude" required="required">
			</div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<div style="display:inline-flex">
				<span>경도</span>	
				&nbsp;&nbsp;&nbsp;
				<input type="text" name="longitude" required="required">
			</div>
		</td>
	</tr>
	<tr>
		<td >사진</td>
		<td>
			<input type="file" name="img">
		</td>
	</tr>
	<tr>
		<td >썸네일</td>
		<td>
			<input type="file" name="thumbnail">
		</td>
	</tr>
	<tr>
		<td >태그</td>
		<td>
			<input type="text" name="tag">
		</td>
	</tr>
	<tr>
		<td >소개</td>
		<td>
			<textarea name="introduction" cols="40" rows="8"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" style="text-align: center">
		<input type="submit" value="등록" id="add" class="btn btn-danger">
		<input type="button" value="목록" class="btn btn-info" onclick="location.href='index.jsp?main=shareboard/shareboardlist.jsp'">
		</td>
	</tr>
	</table>
	</form>
</div>
</body>
</html>