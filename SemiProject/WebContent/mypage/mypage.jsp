<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="data.dto.MemberDto"%>
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
margin-top: 100px;
margin-bottom: 200px;
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
padding-right: 10px;
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
cursor: pointer;
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
 background-color:#FAAC58;
 font-size: 12pt;
 padding: 10px;
} 
span.btnDel{
cursor:pointer;
}
div.modal-backdrop{
z-index:0;
} 

div.modal-content{
margin-top:200px;
z-index:1111;
}
div.btnSchedulelist{
float: left;
}
span.btnSchedulelist{
cursor: pointer;
width: 20pt;
}
a { text-decoration:none; color: black}
a:hover { text-decoration:none }
div#myInfo{
   padding: 20px 130px 20px 130px;
   height:"100%";
}
div#myInfo>table{
   width: 100%; 
   border-spacing: 20px;
   border-collapse: inherit;
}


/*모달 스크롤*/
.listmodalcontent{
overflow-y: initial !important
}
.listmodalbody{
height: 300px;
overflow-y: auto;
}
.hide{
display:none;
}


/*년월선택*/

.hide{
display:none;
}



</style>

   <!-- 부트스트랩 모달 스크립트 -->
<%String memId = (String)session.getAttribute("myid");
WishlistDao dao = new WishlistDao();
List<WishlistDto>list = dao.getList(memId);

 String syear =(String)session.getAttribute("year");
 String smonth = (String)session.getAttribute("month");
 %>
   

 <script type="text/javascript">
   
today = new Date(); //오늘 날짜//내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
 var date = new Date(); //today의 Date를 세어주는 역할
 var content = "";
 var wishday = "";
 var title = "";
 var subject = "";
 var aroundId ="";
 var spotId="";
 var shareNum="";
 var y = "";
 var m = "";
 var d = "";


function drawCalendar(){ //달력 그리는 함수
   
      y = today.getFullYear(); //년
      m = today.getMonth(); //월
      d = today.getDate(); //일

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
          ym.innerHTML = y+"년&nbsp;"+(m+1)+"월"; 
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
                  
                  if(dNum==date.getDate()&&m==date.getMonth()){
                     tdClass="today";
                  }else{
                     tdClass="";
                  }
                  
                  dNum=dNum+"";
                  dMon=m+1+"";
               if(dNum.length==1){
                  dNum = "0"+dNum;
               }
               if(dMon.length==1){
                  dMon="0"+dMon;
               }
            
                  calendar +="<td style='width:12%' class='date"+" "+tdClass+"' year='"+y+"'month='"+dMon+"'day='"+dNum+"'>"
                  +"<span class='date"+" "+tdClass+"' day="+dNum+">"+dNum+"</span>"
                  +"<div id='"+y+dMon+dNum+"' style='margin-top:10px;margin-bottom:5px'></div>"
                  +"</td>"
                  
                  dNum++;
                  
                  
               }
            }
            calendar +="</tr>";
            
         }
         
         $("#calendarBody").html(calendar);
         
      
}

function prevCalendar() {
      //이전 달
    // 이전 달을 today에 값을 저장하고
    //getMonth()는 현재 달을 받아 오므로 이전달을 출력하려면 -1을 해줘야함
  today = new Date(today.getFullYear(), today.getMonth()- 1,today.getDate());
    /*    if(m==1){
          y = y-1;
          m=12;
       }else{
          m = m-1;
       }
       calPage = y+m; */
      
drawCalendar(); //달력 cell 만들어 출력 
}

function nextCalendar() {//다음 달
today = new Date( today.getFullYear(), today.getMonth() + 1, today.getDate());
      /*     if(m==12){
               today = new Date(y+1,1,today.getDate());
         }   
         else
         {
            today = new Date(y,m+1,today.getDate());
         }
      */
        drawCalendar();//달력 cell 만들어 출력
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
function gotoselect(){ //선택한 년월로 이동
    var select = $('input[name=inputym]').val();
   
    if (select == ""){
       alert("날짜를 선택해주세요");
    }else{
      var split = select.split("-");
      var selectY=split[0];
      var selectM=split[1];
      today = new Date(selectY,selectM-1);
      drawCalendar();
      getData();
    }
}

function getList(){
   
   var s ="<div >";
   var wishday="";
   var prewishday="0";
   var w="";
   $("#listModal").modal();
   <%
   for(WishlistDto dto : list){
   %>
   
   var content = "<%=dto.getContent()%>";
   wishday = "<span style='color: #F0CD58' class='glyphicon glyphicon-ok'></span>&nbsp;<%=dto.getWishday()%>";
   w = wishday;
   var title = "<%=dto.getTitle()%>";
   var subject = "<%=dto.getSubject()%>";
   var aroundId ="<%=dto.getAroundId()%>";
   if(prewishday!="0"){
      if(prewishday == w){
         w="";
      }else{
         s+="</div>";
         s+="<div class='line' style='margin-top:15px;'>";
      }
   }
   if(title!="0"){
      s +="<span style='float: left; font-weight: bold;'class='wishday'>"+w+"</span><span style='float: right'>"+title+"</span><br>";
      prewishday=wishday;
      //alert(pre);
   }
   else if(subject!="0"){
      s +="<span style='float: left; font-weight: bold; 'class='wishday'>"+w+"</span><span style='float: right'>"+subject+"</span><br>";
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
   s+="</div>";
   $("#myslist").html(s);
   
   
}
function getDetail(){
   
   
  <%
   for(WishlistDto dto : list){
      if(list.isEmpty()){
         return;
      }
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
MemberDao mdao = new MemberDao();
MemberDto mdto = mdao.getData(memId);
String memNum = mdao.getMemNum(memId);
WishlistDao wdao = new WishlistDao();
List<SpotReviewDto> srlist = wdao.getRecentreviews(memNum);
SpotlistDao sddao = new SpotlistDao();
if(loginok!=null){
   %>   
<div style="width: 100%; height: 400px; background-color: #f7f7f7; margin-top: 150px;">
   <div id="myInfo">
      <h1 style="font-weight: 900;"><b>내 정보 관리</b></h1>
         <table>
            <tr bgcolor="#fff" height="250px">
               <td style="padding-left: 50px; padding-right: 50px; line-height: 30px; width:40%;">
               <button type="button" style="border: none; border-radius: 10px; float: right;" onclick="location.href='index.jsp?main=member/updateform.jsp?num=<%=memNum%>'">회원정보 수정</button>
                  <span class="glyphicon glyphicon-leaf"></span>&nbsp;&nbsp;<b>I D &nbsp;:&nbsp;&nbsp; </b><%=mdto.getId() %><br>
                  <span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;<b>이름 &nbsp;:&nbsp;&nbsp; </b><%=mdto.getName() %><br>
                  <span class="glyphicon glyphicon-phone"></span>&nbsp;&nbsp;<b>H P &nbsp;:&nbsp;&nbsp; </b><%=mdto.getHp() %><br>
                  <span class="glyphicon glyphicon-envelope"></span>&nbsp;&nbsp;<b>Email &nbsp;:&nbsp;&nbsp; </b><%=mdto.getEmail() %><br>
                  <span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;<b>주소 &nbsp;:&nbsp;&nbsp; </b><%=mdto.getAddress() %><br>
                  <p style="margin-left:80px;">(<%=mdto.getAddrdetail() %>)</p>
               </td>
               <td style="width:20%; text-align: center;">
                  <b>찜한 명소 갯수</b>
                  <br><br>
                  <h1 style="font-weight: 900"><%=wdao.getWishTotalCount(memId, "spot") %></h1>
                  
               </td>
               <td style="width:20%; text-align: center;">
                  <b>찜한 명소 주변 갯수</b>
                  <br><br>
                  <h1 style="font-weight: 900"><%=wdao.getWishTotalCount(memId, "around") %></h1>
               </td>
               <td style="width:20%; text-align: center;">
                  <b>추가 일정 갯수</b>
                  <br><br>
                  <h1 style="font-weight: 900"><%=wdao.getWishTotalCount(memId, "my") %></h1>
               </td>
            </tr>
         </table>
   </div>
   
</div>
<br><br>
<div class="mypage_main">

   <div class="calendar">
   <!-- 일정추가버튼 -->


   <h1 style="font-weight: 900;"><b>나의 일정</b></h1>
   <br>
   <!-- <button type="button" class="btn btn-warning btnScheduleAdd">일정추가하기</button> -->
   <div class="btnScheduleAdd"><span class="btnScheduleAdd">일정추가하기</span></div>
   <br><br><br>
   
   <table id="calendar" align="center"style="border-color:gray; width: 100%; height:100%; margin-bottom: 200px;">
       <caption style="text-align:left">       
        
   </caption>
       <thead>
       <tr >
          <td>
             <!--일정 리스트버튼-->
            <div class="btnSchedulelist">
               <div class="slist" style="display: inline-block;">
                  <span class="btnSchedulelist glyphicon glyphicon-th-list" style="font-size: 25pt;" ></span>
               </div>
               
            </div>
          
          </td>
       
       
       <!-- label은 마우스로 클릭을 편하게 해줌 -->
           <td style="background-color:white;color:black">
              <label onclick="prevCalendar()" style=" font-size: 20pt;cursor:pointer;float:right" class="   glyphicon glyphicon-menu-left"></label>   
           </td>   
           <td align="center" id="tbCalendarYM" colspan="3" style="background-color: white;color:black;font-weight:bold">
              <div id="ym">
              <b>yyyy m</b>
              </div>
              <div class="dropdown-content hide" style="font-size: 10pt">
                 <input type="month" name ="inputym">
                 <button type="button" class="btn_select" onclick="gotoselect()">이동</button>
              </div>
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
<br>
   <!-- 나의 리뷰 -->
   
   <div class="myreview">
      <h1 style="font-weight: 900;"><b>나의 리뷰</b></h1>
        <br><br>
         <table class="myreview table table-condensed" style="width:100%;" >
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

   
   <%-- <button type="button" class="btn btn-danger btn-sm"><b>회원탈퇴</b></button>  
   <button type="button" class="btn btn-info btn-sm"  onclick="location.href='index.jsp?main=member/updateform.jsp?num=<%=memNum%>'"><b>회원정보수정</b></button>
 --%>
</div>
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
<div class="modal fade" id="listModal" role="dialog" data-backdrop="false">
    <div class="modal-dialog modal-lg" style="margin-right:35%; margin-left:35%;">
      <div class="modal-content listmodalcontent" style="width:450px">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 style="text-align: center" >
            <b>일정 목록</b>   
         </h4>
        </div>
        <div class="modal-body listmodalbody" style="padding: 30px;">
          <div id="myslist" style='overflow-y:auto'></div>
          
       </div>
      </div>
    </div>
  </div>

   <!-- 상세일정모달 -->
<div class="modal fade" id="myModal" role="dialog" data-backdrop="false">
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
             저장된 일정이 없습니다.
          </div>
       </div>
      </div>
    </div>
  </div>
  
  <!-- 일정추가 모달 -->
 <div class="modal fade" id="addModal" role="dialog" data-backdrop="false">
    <div class="modal-dialog modal-lg" style="margin-right:35%; margin-left:35%;" >
      <div class="modal-content" style="height:250px;width:600px">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 id="addmodal_title" style="text-align: center" >
          <b>일정추가</b>
         </h4>
        </div>
        <div class="modal-body">
           <div class="addSchedule" align="center" data-backdrop="false">
            <form action ="mypage/scheduleAdd.jsp" method="post" class="form-inline" >
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
                       <td colspan="2" align="center" style="background-color: white;border: 0px;"><button type="submit" onclick="afterAdd()" class="btn_scheduleAdd btn btn-warning">일정추가</button>
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
   //$("div.dropdown-content").addclass()
   //getdata();
   
   getData();
   $(document).on("click","span.btnSchedulelist",function(e){
      getList();      
   })
   
   $(document).on("click","#ym",function(){
    //alert($(this).text());
   $("div.dropdown-content").toggleClass("hide");
    
   })
   
   //날짜 셀 클릭 시 모달
   $(document).on("click","td.date",function(){
      $("#myModal").modal();
      var modal_day=$(this).attr("day");
      var modal_month=$(this).attr("month");
      var modal_year = $(this).attr("year");
      var dayid = modal_year+modal_month+modal_day;
      $("div.modal-body div.detail").empty();
      $("div.modal-body div.detail").attr("id",modal_year+modal_month+modal_day);
      if($("#"+dayid).text()==""){
        // $(".modal-body").empty();
           $(".modal-body div.detail").text("저장된 일정이 없습니다");
           //alert(dayid);
      }else{
         getDetail();
      }
      schedule_title.innerHTML =modal_year + "년 " +modal_month + "월 "+modal_day+"일";
      
   })
   
   //일정 추가
   $(document).on("click","div.btnScheduleAdd",function(){
      $("#addModal").modal();
      $("input[name=content]").val("");
      
   })
   
   /* $(document).on("click","#ym",function(){
    //alert($(this).text());
   $("div.dropdown-content").toggleClass("hide");
    
   });*/
   
   $(document).on("click","span.btnDel",function(){
      var ans = confirm("일정을 삭제하시겠습니까?");
      if(ans){
         var num = $(this).attr("num");
         var wishday = $("#schedule_title").text();
         wishday = wishday.replace("년","");
         wishday = wishday.replace("월","");
         wishday = wishday.replace("일","");
         wishday = wishday.replaceAll(" ","");
       
         $.ajax({
            url: "mypage/deleteContent.jsp",  //@@@@@프로젝트때는경로바꿔야함
            type:"get",
            dataType:"html",
            data:{"num":num,"wishday":wishday},
            success:function(data){
              location.reload();
            // window.history.back();
            drawCalendar();
            getData();
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