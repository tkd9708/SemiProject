<%@page import="data.dto.SpotlistDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.SpotlistDao"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<link href="font/SCDream5.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="image/favicon.ico">
<meta charset="UTF-8">
<title>멘도롱 소랑 :: 제주여행의모든것</title>

<style type="text/css">
body {
font-family: SCDream5;

}


   #areaTitle {
      margin-left: 20px;
      margin-bottom: 50px;
   }
   
   div.detail {
      cursor:pointer;
      float: left;
      width: 330px;
      height: 540px;
      text-align: center;
      margin-bottom: 80px;
      margin-right: 70px;
      /* box-shadow: 2px 2px 2px 2px #ddd; */
      border: 1px solid #eee;
   }
   
   div#spotList {
      overflow: hidden;/* 
      margin-left: 200px;    
      margin-right: 130px; 
      margin-top: 180px;*/
      margin-top: 180px;
      width: 100%;
      padding-left: 180px;
      padding-right: 130px;
   }
   
   div.footer {
       text-align: center;
   }
   

   /*슬라이드*/
   .wrap_center{
        width: 100%;
        height: 500px;
    }
    .container{
        margin: 0 auto;
        width: 100%;
        height: 500px;
        overflow: hidden;
        padding: 70px 0px 0px 0px;
    }
    .img_wrap{
        width: 100%;
        height: 500px;
        position: absolute;
        overflow: hidden;
    }

/* 롤링 이미지 UL */
    .rollimgs {
        list-style: none;
        padding: 0;
        margin: 0;
    }

	.rollimgs li{
    position: absolute;
    width: 100%;
    height: 600px;
    left: 600px;
}
.rollimgs li img{
    width: 100%;
    height: 100%;
}
.rollimgs li.currentroll{
    left: 0;
    transition: left .5s ease-in-out, right .5s ease-in-out;
}
.rollimgs li.prevroll{
    left: -100%;
    transition: left .5s ease-in-out, right .5s ease-in-out;
}
.rollimgs.reverse li.prevroll{
    transition: none;
}
.rollimgs li.nextroll{
    left: 100%;
    display: block;
    transition: none;
}
.rollimgs.reverse li.nextroll{
    transition: left .5s ease-in-out, right .5s ease-in-out;
}

#spotListSelect {
  width: 150px;
  padding: .8em .5em;
  font-family: inherit;
  background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  border: 1px solid #999;
  border-radius: 0px;
}

#spotListSelect::-ms-expand {
  /* for IE 11 */
  display: none;
}
</style>
<%
   request.setCharacterEncoding("utf-8");
   String area = request.getParameter("area");
   String select = request.getParameter("select");
   if(select == null){
      select ="평점";
   }
   SpotlistDao dao = new SpotlistDao();
   //List<SpotlistDto> list = dao.getList(area);
   
   // 총 갯수 구하기
   int totalCount = dao.getTotalCount(area);
   int perPage = 12; // 한페이지당 보여질 글의 갯수
   int perBlock = 5; // 한블럭당 출력할 페이지의 갯수
   int totalPage; // 총 페이지의 갯수
   int startPage; // 각 블럭당 시작 페이지 번호
   int endPage; // 각 블럭당 끝페이지 번호
   int start; // 각 블럭당 불러올 글의 시작번호
   int end; // 각 블럭당 글의 끝번호
   int currentPage; // 현재 보여질 페이지 번호
      
   // 현재 페이지 번호 구하기
   String pageNum = request.getParameter("pageNum");
   if(pageNum == null)
      currentPage = 1; // 페이지 번호가 없을경우 무조건 1페이지로 간다.
   else
      currentPage = Integer.parseInt(pageNum);
      
   // 총 페이지 구하기 
   // 나머지가 있을 경우에는 1페이지 더 추가 (예 : 총글수가 9이고 한페이지당 2개씩 볼 경우)
   totalPage = totalCount/perPage + (totalCount % perPage > 0 ? 1 : 0);
   
   // 시작페이지와 끝페이지 구하기
   // 예 : 한페이지당 3개만 볼 경우 현재 페이지가 2라면 startPage: 1, endPage: 3
   // 현재 페이지가 7이라면 startPage: 7, endPage: 9
   startPage = (currentPage - 1) / perBlock * perBlock + 1;
   endPage = startPage + perBlock - 1;
   // 마지막 블럭은 endPage를 totalPage로 해놔야 한다.
   if(endPage > totalPage)
      endPage = totalPage;
   
   // mysql은 첫 글이 0번이므로 +1 안해도됨 (오라클은 1번)
   start = (currentPage-1) * perPage;
      
   // 각 페이지에서 출력할 시작번호
   // 총 50개일경우 1페이지는 50, 2페이지는 40
   int no = totalCount-(currentPage - 1) * perPage;
   
   List<SpotlistDto> list = dao.getList(start, perPage, area, select);
%>
  
<script type="text/javascript">

let banner = {
       rollId: null,
       interval: 2000,

	    //롤링 배너 초기화
	    rollInit: function (newinterval) {
	        if(parseInt(newinterval) > 0){
	            this.interval = newinterval;
	        }
	        //현재 배너
	        let firstitem = document.querySelector('.rollimgs li');
	        if(firstitem){
	            firstitem.classList.add('currentroll');
	        }
	        //다음 배너
	        let seconditem = document.querySelectorAll('.rollimgs li')[1];
	        if(seconditem){
	            seconditem.classList.add('nextroll');
	        }
	        //이전 배너
	        document.querySelector('.rollimgs li:last-child').classList.add('prevroll');
	        this.rollId = setInterval(this.rollNext, this.interval);//롤링 인터벌 호출
	    },
	    
	    //다음 배너 롤링
	    rollNext: function () {
	        if(document.querySelector('.prevroll')){
	            document.querySelector('.prevroll').classList.remove('prevroll');
	        }
	        if(document.querySelector('.currentroll')){
	            document.querySelector('.currentroll').classList.add('prevroll');
	            document.querySelector('.currentroll').classList.remove('currentroll');
	        }
	        if(document.querySelector('.nextroll')){
	            document.querySelector('.nextroll').classList.add('currentroll');
	            document.querySelector('.nextroll').classList.remove('nextroll');
	        }
	    //다음 이미지 있으면 다음 롤링 이미지로 선택, 없으면 첫번째 이미지를 롤링 이미지로 지정
	        if(document.querySelector('.currentroll').nextElementSibling){
	            document.querySelector('.currentroll').nextElementSibling.classList.add('nextroll');
	        }else{
	            document.querySelector('.rollimgs li').classList.add('nextroll');
	        }
	    }
	}

document.addEventListener('DOMContentLoaded', function(){
    banner.rollInit(4000); // 배너 롤링
});

	$(function(){
		
		$("#spotListSelect").val("<%=select%>").prop("selected", true);
		
		//사진클릭하면 디테일로 값보내기
		$(document).on("click","div.gotodetail",function(){
			var contentsid=$(this).attr("contentsid"); 
			location.href="index.jsp?main=spot/spotdetail.jsp?contentsid="+contentsid;
		});
		
		// 좋아요 클릭
		$(document).on("click", ".likesTD", function(){
			var contentsid=$(this).attr("contentsid"); 
			$.ajax({
				type: "post",
				url: "spot/spotupdateLikes.jsp",
				dataType: "html",
				data: {"contentsid" : contentsid, "pageNum" : <%=currentPage%>, "area" : "<%=area%>", "select":"<%=select%>", "search":"no"},
				success: function(data){
					location.reload();
				}
			});
		});
		
		$(".goToReview").click(function(){
			//alert("클릭");
			var contentsid=$(this).attr("contentsid");
			location.href="index.jsp?main=spot/spotdetail.jsp?contentsid=" + contentsid + "#spotReview";
		});
		
		$("#spotListSelect").change(function(){
			//alert($(this).val());
			location.href="index.jsp?main=spot/spotlist.jsp?area=" + "<%=area%>" + "&select=" + $(this).val() + "&pageNum=1";
		});
		
		
	}); //function 끝
</script>
</head>
<body>

    <!-- 슬라이드용 -->
    <div class="wrap_center">
      <div class="container">
         <div class="img_wrap">
             <ul class="rollimgs">
                  <li><img src="image/slide01.jpg"></img></li>
                  <li><img src="image/slide02.jpg"></img></li>
                  <li><img src="image/slide03.jpg"></img></li>
                </ul>
             </div>
           </div>
       </div>
    </div>
    <!-- 슬라이드 끝 -->
   <div id="spotList">
      <br><br>
      <b style="font-size: 30pt;"><%=area %>의 명소 </b>
      <select id="spotListSelect" style="float: right; margin-right: 70px;">
         <option value="평점" selected="selected">평점순</option>
         <option value="좋아요">좋아요순</option>
         <option value="제목">제목순</option>
      </select>
      <br><br><br>
      <%
        for (SpotlistDto dto : list){
			String title = URLDecoder.decode(dto.getTitle(), "utf-8");
        	%>
        	<div class="detail">
        	<div class ="gotodetail" contentsid="<%=dto.getContentsid()%>">

        		   <%
              if(dto.getThumbnail() == null){
              %>
                 <img style="width: 330px; height: 250px;" src="image/imgX.png"><br>
              <%
              }
              else {
                    if(dto.getThumbnail().substring(0, 4).equals("http")){
                    %>
                      <img style="width: 330px; height: 250px;" src = "<%=dto.getThumbnail()%>"><br>
                    <%   
                    }
                 else {%>

                 <img style="width:330px;height:250px;" src="addspotsave/<%=dto.getThumbnail()%>"><br>
                 <%
                 }
              }
              %>
        		<div style="width: 330px; margin-top: 20px;">
        			<b style="font-size: 13pt;"><%=title %></b>
        		</div>
        		<br>
        		<div style="color: #F0CD58; font-size: 18px;">
        			<%
        			for(int i=1; i<=5; i++){
        				if(i<=dto.getStar()){
        					%>★<%
        				}
        				else {
        					%>☆<%
        				}
        			}
        			%>
        		</div>
        		<br>
        		<div style="color: #aaa;">
					<%=dto.getLabel1() %> > <%=dto.getLabel2() %>
				</div>
        		<div style="margin-top: 20px; color:#ff7f00; height: 30px;">
        		<b>
        		<%
        		String[] tags = dto.getTag().split(",");
        		for(int i=0; i<tags.length; i++){
        			if(i == 12){
        				break;
        			}
        			%>
        			#<%=tags[i] %>&nbsp;&nbsp;
        			<%	
        			if((i+1)%4 == 0){
        				%><br><%
        			}
        			
        		}
        		%>
        		</b>
        		</div>
        		</div><!-- gotodetail 끝 -->
        		<br><br>
        		<table class="table table-bordered" style="table-layout: fixed; border: 1px solid #eee; width: 100%;">
        			<tr height="70px;">
        				<td style="vertical-align: middle;" class="likesTD" contentsid="<%=dto.getContentsid()%>">
        					<span class="glyphicon glyphicon-thumbs-up"></span><br>
        					<%=dto.getLikes() %>
        				</td>
        				<td style="vertical-align: middle;" class="goToReview" contentsid="<%=dto.getContentsid()%>">
        					<span class="glyphicon glyphicon-edit" style="font-size: 10pt;"></span>&nbsp;<b>리뷰</b>
        				</td>
        			</tr>
        		</table>
        	</div> 
        	<%
        }
        %>
        	
	</div> <!-- spotList 끝 -->
	<div class="footer">
		<ul class="pagination">
		<%
			if(startPage > 1){
				%>
				<li><a style="color:green;" href="index.jsp?main=spot/spotlist.jsp?area=<%=area %>&pageNum=<%=startPage - 1%>&select=<%=select%>">◀</a></li>
				<%
			}	
		
			for(int i=startPage; i<=endPage; i++){
				// 이동할 페이지 추가
				String url = "index.jsp?main=spot/spotlist.jsp?area=" + area + "&pageNum=" + i + "&select=" + select;
				
				%>
				<li><a style="color:<%=currentPage==i?"orange":"green"%>" href="<%=url%>"><%=i %></a></li>
				<%
				
			}
		
			// 다음 버튼
			if(endPage < totalPage){
				%>
				<li><a style="color:green;" href="index.jsp?main=spot/spotlist.jsp?area=<%=area %>&pageNum=<%=endPage + 1%>&select=<%=select%>">▶</a></li>
				<%
			}
			%>
			</ul>
	</div>
</body>
</html>