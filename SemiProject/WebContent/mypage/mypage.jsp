<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
td{
width: 100px;
}
td.nodate{
height: 100px;
vertical-align: top;
border: 1px solid gray;
}
td.date{
height: 150px;
vertical-align: top;
border: 1px solid gray;
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
background-color: orange;
}
td.today{
height: 100px;
vertical-align: top;
border: 3px solid tomato;
cursor:pointer;
padding-top: 10px;
padding-left: 10px;
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
 color:tomato;
 font-size: 30pt
}
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
			 tbCalendarYM.innerHTML = y + "년 " +(m+1) + "월"; 

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
						
						//일정 어떻게 넣쥥
						var mem_id = $("#mem_id").val();
						var xmlyear = 0
						var xmlmonth =0
						var xmlday = 0
						var content = 0;
					
						calendar +="<td class='date"+" "+tdClass+"' year='"+y+"'month='"+(m+1)+"'day='"+dNum+"'>"
						+"<span class='date'day="+dNum+">"+dNum+"</span>"
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
	var mem_id = $("#mem_id").val();
	$.ajax({
		url: "getwishtoxml.jsp",  //@@@@@프로젝트때는 경로바꿔야함
		type:"get",
		dataType:"xml",
		data:{"mem_id":mem_id},
		success:function(data){
			$(data).find("wish").each(function(){

				var content =$(this).find("content").text()+"<br>";
				
				var wishday = $(this).find("wishday").text();
			
				var wday = wishday.replaceAll("-", "");
				var split = wishday.split("-");
				
					var xmlyear = split[0];
					var xmlmonth = split[1];
					var xmlday = split[2];
					
					$("#"+wday).append(content);
					
					
			});
		}
		
	})
}

function getDetail(){
	var mem_id = $("#mem_id").val();
	
	$.ajax({
		url: "getwishtoxml.jsp",  //@@@@@프로젝트때는 경로바꿔야함
		type:"get",
		dataType:"xml",
		data:{"mem_id":mem_id},
		success:function(data){
			$(data).find("wish").each(function(){
				$("#"+wday+".detail").text("");
				var content =$(this).find("content").text()+"<br>";
				
				var wishday = $(this).find("wishday").text();
			
				var wday = wishday.replaceAll("-", "");
				var split = wishday.split("-");
				
					var xmlyear = split[0];
					var xmlmonth = split[1];
					var xmlday = split[2];
					
				
					$("#"+wday+".detail").append(content);
					
					
			});
		}
		
	})
}


//모달에 추가하기

</script>

</head>
<body>

<h1>마이페이지</h1>
<div class="calendar">
<!-- 일정추가버튼 -->
<div class="btnScheduleAdd"><span class="btnScheduleAdd glyphicon glyphicon-plus-sign"></span></div>

<!--일정 리스트버튼-->
<div class="btnSchedulelist"><a class="glyphicon glyphicon-th-list" role="button" aria-expanded="false"></a>
	<div id="slist" class="tab-content">
	일정리스트
	</div>	
</div>

<table id="calendar" align="center"style="border-color:gray; width: 100%; height:100%;">
    <caption style="text-align:left"><b>나의 일정</b></caption>
    <thead>
    <tr><!-- label은 마우스로 클릭을 편하게 해줌 -->
        <td>
        	<label onclick="prevCalendar()" style=" cursor:pointer;float:right" class="	glyphicon glyphicon-menu-left"></label>	
        </td>	
        <td align="center" id="tbCalendarYM" colspan="5">
        	<b style="font-size: 20px">yyyy년 m월</b>
        </td>
        <td>	
        	<label onclick="nextCalendar()" style=" cursor:pointer" class="glyphicon glyphicon-menu-right" ></label>
        </td>
    </tr>
    <tr>
        <td class="dateTitle" style="text-align:center"><font color ="#FE2E2E">일</td>
        <td class="dateTitle" style="text-align:center">월</td>
        <td class="dateTitle" style="text-align:center">화</td>
        <td class="dateTitle" style="text-align:center">수</td>
        <td class="dateTitle" style="text-align:center">목</td>
        <td class="dateTitle" style="text-align:center">금</td>
        <td class="dateTitle" style="text-align:center"><font color ="#045FB4">토</td>
    </tr> 
    </thead>
    <tbody id="calendarBody">
    </tbody>
</table>
<hr>
<button type="button" class="btn btn-danger btn-sm"><b>회원탈퇴</b></button>  
<button type="button" class="btn btn-info btn-sm"><b>회원정보수정</b></button>

</div>
<!-- 상세일정모달 -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content" style="height:800px;width:600px">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 id="schedule_title" style="text-align: center" >
			yyyy년m월 dd일	
			</h4>
        </div>
        <div class="modal-body">
          <div class="detail"><span class="	glyphicon glyphicon-minus-sign"></span> </div>
          
       </div>
      </div>
    </div>
  </div>
  
  <!-- 일정추가 모달 -->
 <div class="modal fade" id="addModal" role="dialog">
    <div class="addmodal-dialog modal-lg">
      <div class="addmodal-content" style="height:400px;width:600px">
        <div class="addmodal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 id="addmodal_title" style="text-align: center" >
		 	<b>일정추가</b>
			</h4>
        </div>
        <div class="addmodal-body">
        	<div class="addSchedule" align="center" >
        		<form action ="scheduleAdd.jsp" method="post" class="form-inline" >
        			<table class="table table-condensed">
        			<!-- @@@@@@@@@@@@@@@@@@@@input value 세션 아이디로 수정하기@@@@@@@@@@@@@@@@@@@@@@ -->
        				<input type="hidden" name="mem_id" id="mem_id" value="test">
        				<tr>
        					<td align="center" style="font-size: 13pt">내용</td>
        					<td align="center"><input type="text" name="content" style="width:300px;"></td>
        				</tr>
        				<tr>
        					<td align="center" style="font-size: 13pt">날짜</td>
        					<td align="center"><input name="wishday" type="date" ></td>
        				</tr>
        				<tr>
        					<td colspan="2" align="center"><button type="submit" class="btn_scheduleAdd btn btn-info btn-lg">일정추가</button>
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
	$(document).on("click","#tbCalendarYM",function(){
		
		
	})
	
	$(document).on("click","td.date",function(){
		$("#myModal").modal();
		var modal_day=$(this).attr("day");
		var modal_month=$(this).attr("month");
		var modal_year = $(this).attr("year");
		$("div.modal-body div.detail").attr("id",modal_year+modal_month+modal_day);
		getDetail();
		schedule_title.innerHTML =modal_year + "년 " +modal_month + "월 "+modal_day+"일"; 
	})
	$(document).on("click","div.btnScheduleAdd",function(){
		$("#addModal").modal();
		$("input[name=content]").val("");
		
	})
</script>
</body>
</html>