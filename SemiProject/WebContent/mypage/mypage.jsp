<%@page import="data.dto.SpotReviewDto"%>
<%@page import="data.dto.SpotlistDto"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="java.util.List"%>
<%@page import="data.dto.WishlistDto"%>
<%@page import="data.dao.WishlistDao"%>
<%@page import="data.dao.SpotlistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

div.mypage_main{
margin-top: 200px;
}
span.date{
	border-radius: 30px;
    border: 5px solid white;
    background-color: white;
}
span.today{
background-color:#FAAC58; 
border: 5px solid #FAAC58;
}
td{
width: 100px;
background-color:  white;
}
td.nodate{
height: 100px;
vertical-align: top;
border-bottom: 1px solid gray;
/*border: 1px solid gray;*/
}
td.date{
height: 150px;
vertical-align: top;
/*border: 1px solid gray;*/
border-bottom: 1px solid gray;
cursor:pointer;
padding-top: 10px;
padding-left: 10px;

}
td.date:hover{
font-style: italic;
font-weight: bold;
}
td.dateTitle{
text-align:center;
height:30px;
background-color: #FAAC58;
text-align:center ;
color:#424242;
font-size:13pt;
border-top: 1px solid gray;
}
div.calendar{
margin-left: 150px;
margin-right: 150px;
}
div.btnScheduleAdd{
float:right;
}
span.btnScheduleAdd{
margin-bottom: -50px;
 cursor:pointer;
 color:#FAAC58;
 font-size: 30pt
}
span.btnDel{
cursor:pointer;
}
div.modal-backdrop{
z-index:0;}
div.modal-content{
margin-top:200px;
z-index:1111;

}

/*드롭다운메뉴*/
.dropdown {
  position: relative;
  display: inline-block;
}
.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 300px;
  overflow: auto;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}
.show {display: block;}

}
/*드롭다운메뉴*/
.dropdown {
  position: relative;
  display: inline-block;
}
.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 300px;
  overflow: auto;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}
.show {display: block;}

</style>

	<!-- 부트스트랩 모달 스크립트 -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <script type="text/javascript">
 var today = new Date();//오늘 날짜//내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
 var date = new Date(); //today의 Date를 세어주는 역할
 function prevCalendar() {//이전 달
 	        // 이전 달을 today에 값을 저장하고
 	        //getMonth()는 현재 달을 받아 오므로 이전달을 출력하려면 -1을 해줘야함
 	         today = new Date(today.getFullYear(), today.getMonth()- 1,today.getDate());
 	         drawCalendar(); //달력 cell 만들어 출력 
 	   }
 	 
 function nextCalendar() {//다음 달
 	           today = new Date( today.getFullYear(), today.getMonth() + 1, today.getDate());
 	            drawCalendar();//달력 cell 만들어 출력
 	}
function drawCalendar(){ //달력 그리는 함수
			var y = today.getFullYear(); //년
			var m = today.getMonth(); //월
			var d = today.getDate(); //일
			//현재 년,월의 첫번째 일
			var firstDate = new Date(y,m,1);
			//일
			var firstDay = firstDate.getDay();
			//1-12월까지의 요일
			var last = [31,28,31,30,31,30,31,31,30,31,30,31];
			//윤년계산
			if(y%4 && y%100 !=0 || y%400==0){
				febuarylast = last[1] = 29;
			}
			
			//현재 월의 마지막 일
			var lastDate = last[m];
			
			//달력에 필요한 행의 갯수
			var row = Math.ceil((firstDay+lastDate)/7);
			var calendar ="";
			
			//달력의 일의 초기값
			var dNum = 1;
			
			//년월 띄우기
			 tbCalendarYM.innerHTML = y+"년"+m+"월"; 
			//행만들기
			for(var i=1;i<=row;i++){
				calendar += "<tr>";
				
				//열만들기
				for(var j=1;j<=7;j++){
					//1일 이전 마지막 이후 빈칸
					if(i==1&&j<=firstDay || dNum>lastDate){
						calendar += "<td class='nodate'>&nbsp;</td>";
					}else{
						var tdClass ="";
						if(dNum==d&&m==date.getMonth()){
							tdClass="today";
						}else{
							tdClass="";
						}
						
						/* //일정 어떻게 넣쥥
						var memId = $("#memId").val();
						var xmlyear = 0
						var xmlmonth =0
						var xmlday = 0
						var content = 0; */
						//dNum 일의 자리 앞에 0넣기
						dNum=dNum+"";
					if(dNum.length==1){
						dNum = "0"+dNum;
					}
				
						calendar +="<td class='date"+" "+tdClass+"' year='"+y+"'month='"+(m+1)+"'day='"+dNum+"'>"
						+"<span class='date"+" "+tdClass+"' day="+dNum+">"+dNum+"</span>"
						+"<div id='"+y+(m+1)+dNum+"'></div>"
						+"</td>"
						
						dNum++;
						
						
					}
				}
				calendar +="</tr>";
				
			}
			
			$("#calendarBody").html(calendar);
}
//String sessionId = (String)session.getAttribute("myid"); 
//xml받아서 출력하기
function getData(){
	var memId = $("#memId").val();
	$.ajax({
		url: "mypage/getwishtoxml.jsp",  
		type:"get",
		dataType:"xml",
		data:{"memId":memId},
		success:function(data){
			$(data).find("wish").each(function(){

				var content =$(this).find("content").text();
				
				var wishday = $(this).find("wishday").text();
				var spotId = $(this).find("spotId").text(); /////이거추가~~~~~~~~~~~~~~~~~`	
				var wday = wishday.replaceAll("-", "");
				var split = wishday.split("-");
					var xmlyear = split[0];
					var xmlmonth = split[1];
					var xmlday = split[2];
					var aroundId =$(this).find("aroundId").text();
					if(spotId!="0"){
						
						//System.out.println("spotlist");
						$.ajax({
							url: "mypage/getspottitle.jsp",  
							type:"get",
							dataType:"xml",
							data:{"spotId":spotId},
							success:function(data){
								$(data).find("spot").each(function(){
									var title =$(this).find("title").text();
									$("#"+wday).append("🚩"+title+"<br>");
								});
							}
							});
					}
					
					else 
					{
						if(aroundId!="0"){
							var sp = content.split(",");
							var category = sp[0];
							if(category == "음식점"){
								 $("#"+wday).append("🍔"+aroundId+"<br>");
							} 
							else if(category =="숙박")
								{
								$("#"+wday).append("🏡"+aroundId+"<br>");
								}
							else if(category =="카페"){
								$("#"+wday).append("☕"+aroundId+"<br>");
							}
						}
						else $("#"+wday).append("✔"+content+"<br>");
						
					}
				
					
			});
		}
		
	})
}
function getDetail(){
	var memId = $("#memId").val();
	
	$.ajax({
		url: "mypage/getwishtoxml.jsp",  
		type:"get",
		dataType:"xml",
		data:{"memId":memId},
		success:function(data){
			$(data).find("wish").each(function(){
		
				var content =$(this).find("content").text();
			
				var wishday = $(this).find("wishday").text();
				var aroundId =$(this).find("aroundId").text();
				var wday = wishday.replaceAll("-", "");
				var split = wishday.split("-");
				var num =$(this).find("num").text();
					var xmlyear = split[0];
					var xmlmonth = split[1];
					var xmlday = split[2];
					var spotId = $(this).find("spotId").text();
					if(detailcontent=="") detailcontent="<div style='font-size:16pt; margin-left:20px;'>저장된 일정이 없습니다.</div>";	
					if(content=="0"){
						
						$.ajax({
							url: "mypage/getspottitle.jsp",  
							type:"get",
							dataType:"xml",
							data:{"spotId":spotId},
							success:function(data){
								$(data).find("spot").each(function(){
									var title =$(this).find("title").text();
									
									$("#"+wday+".detail").append("<div style='font-size:13pt; margin-left:20px;'>🚩&nbsp;"+title+"<span num='"+num+"'style='float:right; margin-right:20px; color: tomato' class='btnDel glyphicon glyphicon-minus-sign'></span></div></br>");
									
								});
							}
							});
					}
					else {
						
					var detailcontent="";
						
							if(aroundId!="0"){
								var sp = content.split(",");
								var category = sp[0];
								if(category == "음식점"){
									 detailcontent="🍔 &nbsp;"+aroundId;
								} 
								else if(category =="숙박")
									{
									 detailcontent="🏡 &nbsp;"+aroundId;
									}
								else if(category =="카페"){;
									 detailcontent="☕ &nbsp;"+aroundId;
								}
							}
							else detailcontent="✔"+content;
							
							var print ="<div style='font-size:13pt; margin-left:20px;' >"+detailcontent+"<span num='"+num+"'style='float:right; margin-right:20px; color: tomato' class='btnDel glyphicon glyphicon-minus-sign'></span></div></br>";
							$("#"+wday+".detail").append(print);
						
						
						
					}
			});
		}
		
	})
}

function getsmalllist(){
	var s="";
	<%
	String memId = (String)session.getAttribute("myid");
	WishlistDao dao = new WishlistDao();
	List<WishlistDto>list = dao.getList(memId);
	for(WishlistDto dto : list){
	%>
	
	var content = "<%=dto.getContent()%>";
	var wishday = "<%=dto.getWishday()%>";
	var title = "<%=dto.getTitle()%>";
	var subject = "<%=dto.getSubject()%>";
	var aroundId ="<%=dto.getAroundId()%>";
	if(title!="0"){
		s +="<span style='float: left;'>"+wishday+"</span><span style='float: right'>"+title+"</span><br>";
	}
	else if(subject!="0"){
		s +="<span style='float: left;'>"+wishday+"</span><span style='float: right'>"+subject+"</span><br>";
	}
	else if(aroundId!="0"){
		var split = aroundId.split(",");
		var around = split[0];
		s +="<span style='float: left;'>"+wishday+"</span><span style='float: right'>"+around+"</span><br>";
		}
	else {
		s +="<span style='float: left;'>"+wishday+"</span><span style='float: right'>"+content+"</span><br>";
	}
	
	
	<%}%>
	$("#myslist").html(s);
}


function detailList(){
	document.getElementById("myslist").classList.toggle("show");
}

//모달에 추가하기

</script>

</head>
<body>
<%
String sessionId = (String)session.getAttribute("myid");

%>


<div class="mypage_main">
<h1>마이페이지</h1>
	<div class="calendar">
	<!-- 일정추가버튼 -->
	<div class="btnScheduleAdd"><span class="btnScheduleAdd glyphicon glyphicon-plus"></span></div>


	<h2 style="font-weight:bold">나의 리뷰</h2>
	<table id="calendar" align="center"style="border-color:gray; width: 100%; height:100%;">
	    <caption style="text-align:left">       
	     <!--일정 리스트버튼-->
			<div class="btnSchedulelist">
				<b style="float:left;">나의 일정</b>
				&nbsp;&nbsp;
				<div class="slist" style="display: inline-block;">
				<a class=" dropbtn btnSchedulelist glyphicon glyphicon-th-list" role="button" aria-expanded="false" onclick="detailList()" style="text-decoration: none; color:#424242; font-size: 16pt;" ></a>
				  <div id="myslist" class="dropdown-content" style="width: 300px; padding:10px; background-color:#F6E9DC; border:3px solid ">
					<!-- <a href="#home">Home</a><br>
			    	<a href="#about">About</a><br>
			    	<a href="#contact">Contact</a> -->
				  </div>
				</div>
				
			</div>
	</caption>
	    <thead>
	    <tr ><!-- label은 마우스로 클릭을 편하게 해줌 -->
	        <td style="background-color:white;color:black">
	        	<label onclick="prevCalendar()" style=" font-size: 20pt;cursor:pointer;float:right" class="	glyphicon glyphicon-menu-left"></label>	
	        </td>	
	        <td align="center" id="tbCalendarYM" colspan="5" style="background-color: white;color:black;font-weight:bold">
	        	<b>yyyy m</b>
	        </td>
	        <td style="background-color:white;color:black">	
	        	<label onclick="nextCalendar()" style="font-size: 20pt; cursor:pointer" class="glyphicon glyphicon-menu-right" ></label>
	        	
	        </td>
	    </tr>
	    <tr>
	        <td class="dateTitle" ><b>일</b></td>
	        <td class="dateTitle" ><b>월</b></td>
	        <td class="dateTitle" ><b>화</b></td>
	        <td class="dateTitle" ><b>수</b></td>
	        <td class="dateTitle" ><b>목</b></td>
	        <td class="dateTitle" ><b>금</b></td>
	        <td class="dateTitle"><b>토</b></td>
	    </tr> 
	    </thead>
	    <tbody id="calendarBody">
	    </tbody>
	</table>
<br><br><br>
	<!-- 나의 리뷰 -->
	<div class="myreview">
		<h2 style="font-weight:bold">나의 리뷰</h2>
		<br><br>
		<span style="float:right"><a href ="index.jsp?main=mypage/myreview.jsp" >전체보기</a></span>
	
		<%
			MemberDao mdao = new MemberDao();
			String memNum = mdao.getMemNum(sessionId);
			WishlistDao wdao = new WishlistDao();
			List<SpotReviewDto> srlist = wdao.getRecentreviews(memNum);
			SpotlistDao sddao = new SpotlistDao();
			%>
			<table class="myreview table table-condensed" >
					<tr>	
						<th>관광지</th>
						<th>리뷰</th>
						<th>별점</th>
					</tr>
		<%
		for(SpotReviewDto srdto: srlist){
			String contentsid = srdto.getContentsid();
			//System.out.println(contentsid);
			String title = wdao.getSpottitle(contentsid);
			
		%>	
			<tr>
				<td style="text-align:left">
					<a href ="index.jsp?main=spot/spotdetail.jsp?contentsid=<%=contentsid%>">
					<span class="title"><%=title%></span>
					</a>
				</td>
				<td>
					<a href ="index.jsp?main=spot/spotdetail.jsp?contentsid=<%=contentsid %>#spotReview">
					<span class="reviewcontent"><%=srdto.getContent() %></span>
					</a>
				</td>
				<td>
					<span class="reviewstar" style="color: #F0CD58">
					<% for(int i=1; i<=5; i++){
                                if(i<=srdto.getStar()){
                                   %>★<%
                                }
                                else {
                                   %>☆<%
                                }
                             }
				%>
				</span>
				</td>
			</tr>
	<%} %>
	
		</table>
	</div>
	<hr>
	<button type="button" class="btn btn-danger btn-sm"><b>회원탈퇴</b></button>  
	<button type="button" class="btn btn-info btn-sm"><b>회원정보수정</b></button>

</div>

	<!-- 상세일정모달 -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg" style="margin-right:35%; margin-left:35%;">
      <div class="modal-content" style="width:500px">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 id="schedule_title" style="text-align: center" >
			yyyy년m월 dd일	
			</h4>
        </div>
        <div class="modal-body">
          <div class="detail"></div>
          
       </div>
      </div>
    </div>
  </div>
  
  <!-- 일정추가 모달 -->
 <div class="modal fade" id="addModal" role="dialog">
    <div class="modal-dialog modal-lg" style="margin-right:35%; margin-left:35%;">
      <div class="modal-content" style="height:250px;width:600px">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 id="addmodal_title" style="text-align: center" >
		 	<b>일정추가</b>
			</h4>
        </div>
        <div class="modal-body">
        	<div class="addSchedule" align="center" >
        		<form action ="mypage/scheduleAdd.jsp" method="post" class="form-inline" > <!-- 경로수정 -->
        			<table class="modal_table table table-condensed">
        			
        			<!-- @@@@@@@@@@@@@@@@@@@@input value 세션 아이디로 수정하기@@@@@@@@@@@@@@@@@@@@@@ -->
        				<input type="hidden" name="memId" id="memId" value="<%=sessionId%>">
        				<tr>
        					<td align="center" style="font-size: 13pt; background-color: white; border: 0px;border-top:0px">날짜</td>
        					<td align="center" style="background-color: white;border: 0px;"><input name="wishday" type="date" ></td>
        				</tr>
        				<tr>
        					<td align="center" style="font-size: 13pt; background-color: white;border: 0px;">내용</td>
        					<td align="center" style="background-color: white;border: 0px;"><input type="text" name="content" style="width:300px;"></td>
        				</tr>
        				
        				<tr>
        					<td colspan="2" align="center" style="background-color: white;border: 0px;"><button type="submit" class="btn_scheduleAdd btn btn-warning">일정추가</button>
        					</td>
        				</tr>
        			</table>
        		</form>
        	</div>
      </div>
    </div>
  </div>
<br><br>


<script type="text/javascript">

drawCalendar();
	getData();
	
	$(document).on("click","div.btnSchedulelist",function(e){
		 //getlist();
		getsmalllist();
		 if(!e.target.matches('.dropbtn')){
			var dropdowns = document.getElementsByClassName("dropdown-content");
			var i;
			for(i=0;i<dropdowns.length;i++){
				var openDropdown = dropdowns[i];
				if(openDropdown.classList.contains('show')){
					openDropdown.classList.remove('show');
				}
			}
		}
		
	})
	
	$(document).on("click","td.date",function(){
		$("#myModal").modal();
		var modal_day=$(this).attr("day");
		var modal_month=$(this).attr("month");
		var modal_year = $(this).attr("year");
		$("div.modal-body div.detail").empty();
		$("div.modal-body div.detail").attr("id",modal_year+modal_month+modal_day);
		getDetail();
		schedule_title.innerHTML =modal_year + "년 " +modal_month + "월 "+modal_day+"일"; 
	})
	$(document).on("click","div.btnScheduleAdd",function(){
		$("#addModal").modal();
		$("input[name=content]").val("");
		
	})
	
	
	$(document).on("click","span.btnDel",function(){
		var ans = confirm("일정을 삭제하시겠습니까?");
		if(ans){
			var num = $(this).attr("num");
			$.ajax({
				url: "mypage/deleteContent.jsp",  //@@@@@프로젝트때는경로바꿔야함
				type:"get",
				dataType:"html",
				data:{"num":num},
				success:function(data){
					location.reload();
				}
			})
		}
		else{
		window.history.back();	
		}
	})
	$(document).on("click","label",function(){
		getData();
	})

	
</script>
</div>
</body>
</html>