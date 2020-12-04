<%@page import="com.sun.org.apache.xerces.internal.util.HTTPInputSource"%>
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
.modal-backdrop{height:100%; }
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
border: 1px solid gray;
}
td.date{
height: 150px;
vertical-align: top;
border: 1px solid gray;
/*border-bottom: 1px solid gray;*/
cursor:pointer;
padding-top: 10px;
padding-left: 10px;
}
td.date:last-of-type span.date, td.dateTitle:last-of-type {
color: #4d55e9; 
}
td.date:first-of-type span.date, td.dateTitle:first-of-type{
color: #e63d38; 
}
#calendarBody tr:last-of-type {
border-bottom:5px solid gray;
}
#tbCalendarYM {
font-size: 36px;
}
h2 {
font-size: 45px;
}
td.date:hover{
font-style: italic;
font-weight: bold;
}
td.dateTitle{
text-align:center;
height:30px;
/*background-color: #FAAC58;*/
text-align:center ;
color:#424242;
font-size:13pt;
border-bottom: 5px solid gray;
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
div.btnSchedulelist{
float: left;
}
}
span.btnSchedulelist{
cursor: pointer;
}
a { text-decoration:none; color: black}
a:hover { text-decoration:none }
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
<%String memId = (String)session.getAttribute("myid");
WishlistDao dao = new WishlistDao();
List<WishlistDto>list = dao.getList(memId);
%>


 <script type="text/javascript">
 var today = new Date(); //오늘 날짜//내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
 var date = new Date(); //today의 Date를 세어주는 역할
 var content = "";
 var wishday = "";
 var title = "";
 var subject = "";
 var aroundId ="";
 var spotId="";
 var shareNum="";
 
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
			 tbCalendarYM.innerHTML = y+"년&nbsp;"+(m+1)+"월"; 
  
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
function getData(){
	<%
		for(WishlistDto dto : list){
	%>
		content = "<%=dto.getContent()%>";
		wishday = "<%=dto.getWishday()%>";
		title = "<%=dto.getTitle()%>";
		subject = "<%=dto.getSubject()%>";
		aroundId ="<%=dto.getAroundId()%>";
		var wday = wishday.replaceAll("-", "");
		var split = wishday.split("-");
		var xmlyear = split[0];
		var xmlmonth = split[1];
		var xmlday = split[2];
		
		if(title!="0"){$("#"+wday).append("🚩"+title+"<br>");}
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
		if(subject!="0"){
			$("#"+wday).append("🤞"+subject+"<br>");
		}
		if(subject=="0"&&title=="0"&&aroundId=="0") $("#"+wday).append("✔"+content+"<br>");
		
		
<%}%>
}
function getList(){
	
	var s="";
	var wishday="";
	var prewishday="0";
	var w="";
	$("#listModal").modal();
	<%
	for(WishlistDto dto : list){
	%>
	var content = "<%=dto.getContent()%>";
	wishday = "<%=dto.getWishday()%>";
	w = wishday;
	var title = "<%=dto.getTitle()%>";
	var subject = "<%=dto.getSubject()%>";
	var aroundId ="<%=dto.getAroundId()%>";
	if(prewishday!="0"){
		if(prewishday == w){
			w="";
		}
	}
	
	if(title!="0"){
		s +="<span style='float: left; font-weight: bold;'class='wishday'>"+w+"</span><span style='float: right'>"+title+"</span><br>";
		prewishday=wishday;
		//alert(pre);
	}
	else if(subject!="0"){
		s +="<span style='float: left; font-weight: bold;'class='wishday'>"+w+"</span><span style='float: right'>"+subject+"</span><br>";
		prewishday=wishday;
		//alert(pre);
	}
	else if(aroundId!="0"){
		var split = aroundId.split(",");
		var around = split[0];
		s +="<span style='float: left; font-weight: bold;'class='wishday'>"+w+"</span><span style='float: right'>"+around+"</span><br>";
		prewishday=wishday;
		//alert(pre);
	}
	else {
		s +="<span style='float: left; font-weight: bold;' class='wishday'>"+w+"</span><span style='float: right'>"+content+"</span><br>";
		prewishday=wishday;
		//alert(pre);
	}
	
	
	
	<%}%>
	$("#myslist").html(s);
	
	
}
function getDetail(){
	
	
	<%
	for(WishlistDto dto : list){
%>
	content = "<%=dto.getContent()%>";
	wishday = "<%=dto.getWishday()%>";
	title = "<%=dto.getTitle()%>";
	subject = "<%=dto.getSubject()%>";
	aroundId ="<%=dto.getAroundId()%>";
	spotId="<%=dto.getSpotId()%>";
	var num ="<%=dto.getNum()%>";
	var wday = wishday.replaceAll("-", "");
	var split = wishday.split("-");
	var xmlyear = split[0];
	var xmlmonth = split[1];
	var xmlday = split[2];
	var detailcontent="";
	if(title!="0"){
		$("#"+wday+".detail").append("<div style='font-size:13pt; margin-left:20px;'>🚩&nbsp;<a href='index.jsp?main=spot/spotdetail.jsp?contentsid="+spotId+"'>"+title+"</a>"+
				"<span num='"+num+"'style='float:right; margin-right:20px; color: tomato' class='btnDel glyphicon glyphicon-minus-sign'></span></div></br>");
				
		
	}
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
		else if(category =="카페"){
			 detailcontent="☕ &nbsp;"+aroundId;
		}
		var print ="<div style='font-size:13pt; margin-left:20px;' >"+detailcontent+"<span num='"+num+"'style='float:right; margin-right:20px; color: tomato' class='btnDel glyphicon glyphicon-minus-sign'></span></div></br>";
		$("#"+wday+".detail").append(print);
	}
	if(subject!="0"){
		$("#"+wday+".detail").append("<div style='font-size:13pt; margin-left:20px;'>🤞&nbsp;<a href='index.jsp?main=shareboard/shareboardlist.jsp?num="+shareNum+"'>"+subject+"</a>"+
				"<span num='"+num+"'style='float:right; margin-right:20px; color: tomato' class='btnDel glyphicon glyphicon-minus-sign'></span></div></br>");
	
	}
	if(subject=="0"&&title=="0"&&aroundId=="0") {
		detailcontent="✔"+content;
		var print ="<div style='font-size:13pt; margin-left:20px;' >"+detailcontent+"<span num='"+num+"'style='float:right; margin-right:20px; color: tomato' class='btnDel glyphicon glyphicon-minus-sign'></span></div></br>";
		$("#"+wday+".detail").append(print);
	}
	
<%}%>
}
</script>

</head>
<body>
<%
String loginok = (String)session.getAttribute("loginok");
if(loginok!=null){
	%>	


<div class="mypage_main">

	<div class="calendar">
	<!-- 일정추가버튼 -->
	<div class="btnScheduleAdd"><span class="btnScheduleAdd glyphicon glyphicon-plus"></span></div>


	<h2 style="font-weight:bold">나의 일정</h2>
	<br>
	<br>
	
	<table id="calendar" align="center"style="border-color:gray; width: 100%; height:100%;">
	    <caption style="text-align:left">       
	     
	</caption>
	    <thead>
	    <tr >
	    	<td>
	    		<!--일정 리스트버튼-->
				<div class="btnSchedulelist">
					<div class="slist" style="display: inline-block;">
						<span class="btnSchedulelist glyphicon glyphicon-th-list" style="font-size: 16pt;" ></span>
					</div>
					
				</div>
	    	
	    	</td>
	    
	    
	    <!-- label은 마우스로 클릭을 편하게 해줌 -->
	        <td style="background-color:white;color:black">
	        	<label onclick="prevCalendar()" style=" font-size: 20pt;cursor:pointer;float:right" class="	glyphicon glyphicon-menu-left"></label>	
	        </td>	
	        <td align="center" id="tbCalendarYM" colspan="3" style="background-color: white;color:black;font-weight:bold">
	        	<b>yyyy m</b>
	        </td>
	        <td style="background-color:white;color:black;"colspan="2">	
	        	<label onclick="nextCalendar()" style="font-size: 20pt; cursor:pointer" class="glyphicon glyphicon-menu-right" ></label>
	        	
	        </td>
	    </tr>
	    <tr>
	        <td class="dateTitle" ><b>일&nbsp;SUN</b></td>
	        <td class="dateTitle" ><b>월&nbsp;MON</b></td>
	        <td class="dateTitle" ><b>화&nbsp;TUE</b></td>
	        <td class="dateTitle" ><b>수&nbsp;WED</b></td>
	        <td class="dateTitle" ><b>목&nbsp;THU</b></td>
	        <td class="dateTitle" ><b>금&nbsp;FRI</b></td>
	        <td class="dateTitle"><b>토&nbsp;SAT</b></td>
	    </tr> 
	    </thead>
	    <tbody id="calendarBody">
	    </tbody>
	</table>
<br><br><br>
	<!-- 나의 리뷰 -->
	<div class="myreview">
		<h2 style="font-weight:bold">나의 리뷰</h2>
		
	
		<%
			MemberDao mdao = new MemberDao();
			String memNum = mdao.getMemNum(memId);
			WishlistDao wdao = new WishlistDao();
			List<SpotReviewDto> srlist = wdao.getRecentreviews(memNum);
			SpotlistDao sddao = new SpotlistDao();
			%>
			<table class="myreview table table-condensed" style="width:90%;margin:auto" >
			<caption><span style="float:right"><a href ="index.jsp?main=mypage/myreview.jsp" >전체보기</a></span></caption>
					<tr>	
						<th style="font-size:15pt;text-align:center;">관광지</th>
						
						<th style="font-size:15pt;text-align:center;">리뷰</th>
						<th style="font-size:15pt;text-align:center;">별점</th>
					</tr>
		<%
		for(SpotReviewDto srdto: srlist){
			String contentsid = srdto.getContentsid();
			//System.out.println(contentsid);
			String title = wdao.getSpottitle(contentsid);
			
		%>	
			<tr>
				<td style="text-align:center; padding-left:20px; ">
					<a href ="index.jsp?main=spot/spotdetail.jsp?contentsid=<%=contentsid%>">
					<span class="title"><%=title%></span>
					</a>
				</td>
				
				
				<td style="text-align:left; padding-left:20px; ">
					<a href ="index.jsp?main=spot/spotdetail.jsp?contentsid=<%=contentsid %>#spotReview">
					<span class="reviewcontent"><%=srdto.getContent() %></span>
					</a>
				</td>
				<td style="text-align:center; padding-left:20px; ">
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
	<button type="button" class="btn btn-danger btn-sm" onclick="location.href='index.jsp?main=member/deletepassform.jsp?id=<%=memId%>'"><b>회원탈퇴</b></button>  
	<button type="button" class="btn btn-info btn-sm" onclick="location.href='index.jsp?main=member/updateform.jsp?num=<%=memNum%>'"><b>회원정보수정</b></button>

</div>

	
<%
} else {
%>
<script>
location.href = "index.jsp";
</script>
<%
} %>
<!-- 일정 목록 모달 -->
<div class="modal fade" id="listModal" role="dialog">
    <div class="modal-dialog modal-lg" style="margin-right:35%; margin-left:35%;">
      <div class="modal-content" style="width:350px">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 style="text-align: center" >
				<b>일정 목록</b>	
			</h4>
        </div>
        <div class="modal-body" style="padding: 30px;">
          <div id="myslist"></div>
          
       </div>
      </div>
    </div>
  </div>

	<!-- 상세일정모달 -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg" style="margin-right:35%; margin-left:35%;">
      <div class="modal-content" style="width:500px">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 id="schedule_title" style="text-align: center" >
			<b>yyyy년m월 dd일</b>	
			</h4>
        </div>
        <div class="modal-body">
          <div class="detail">
          </div>
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
        				<input type="hidden" name="memId" id="memId" value="<%=memId%>">
        				<tr>
        					<td align="center" style="font-size: 13pt; background-color: white; border: 0px;border-top:0px">날짜</td>
        					<td align="center" style="background-color: white;border: 0px;"><input name="wishday" type="date" style="width:300px" ></td>
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
	
	//getdata();
	getData();
	$(document).on("click","span.btnSchedulelist",function(e){
		getList();		
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