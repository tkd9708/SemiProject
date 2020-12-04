<%@page import="data.dto.SpotlistDto"%>
<%@page import="data.dto.WishlistDto"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dao.SpotlistDao"%>
<%@page import="data.dto.SpotReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.WishlistDao"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<style type="text/css">

div.myreview{
margin-left: 200px;
  margin-top: 150px;
  margin-right: 200px; 
}

div.page {
   /* margin: 0 auto;
   width: 200px; */
   margin-top: 100px;
   margin-bottom: 50px;
   text-align: center;
   
}
.styled-table {
    border-collapse: collapse;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
    
}

.styled-table th {
    background-color:  #ffa50b;
    color: white;
    text-align: center;
}

.styled-table th,.styled-table td {
    padding: 12px 15px;
    border-bottom: 1px dotted #ddd;
}

.styled-table td.active-row {
    font-weight: bold;
    color: black;
}


a { text-decoration:none; color: black}
a:hover { text-decoration:none }

</style>
<%
			String sessionId = (String)session.getAttribute("myid");
			MemberDao mdao = new MemberDao();
			String memNum = mdao.getMemNum(sessionId);
			WishlistDao wdao = new WishlistDao();
			SpotlistDao sddao = new SpotlistDao();
	
			int totalCount = wdao.getTotalCount(memNum);
			int perPage = 10; // 한페이지당 보여질 글의 갯수
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
		   
		   List<SpotReviewDto> srlist= wdao.getMyreviews(memNum, start, perPage);
		   //각 글에 보여질 번호구하기(총 100개라면 100부터 출력함)
		   int no=totalCount-((currentPage-1)*perPage);
		   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		   
			
%>
</head>
<body>
<%
String loginok = (String)session.getAttribute("loginok");

if(loginok!=null){

	%>	


	<div class="myreview">
	<h2 style="float: left;"><span class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;리뷰목록</h2><br><br>
		<br><br><br>
			<table class="myreview styled-table" >
				<thead>
					<tr class="active-row"">	
						<th style="font-weight:bold;text-align: center">관광지</th>
						<th style="font-weight:bold;text-align: center">리뷰</th>
						<th style="font-weight:bold;text-align: center">별점</th>
						<th style="font-weight:bold;text-align: center">작성자</th>
						<th style="font-weight:bold;text-align: center">작성일</th>
					</tr>
					</thead>
	
		<tbody>
		
			 <%
       		if(totalCount==0)
        	{%>

            	<tr align="center" height="50">
               		<td colspan="7"><b>등록된 글이 없습니다</b></td>
            	</tr>
       		<%}
			 for(SpotReviewDto srdto:srlist){
					 String contentsid = srdto.getContentsid();
					//System.out.println(contentsid);
					String title = wdao.getSpottitle(contentsid);
            		%>
            		<tr class="active-row">
            		
					<td style="text-align:center;width:250px">
						<a href ="index.jsp?main=spot/spotdetail.jsp?contentsid=<%=contentsid%>">
						<span class="title"><%=title%></span>
					</a>
				</td>
				<td style="text-align:left;width:600px">
					<a href ="index.jsp?main=spot/spotdetail.jsp?contentsid=<%=contentsid%>#spotReview">
					<span class="reviewcontent"><%=srdto.getContent() %></span>
					</a>
				</td>
				<td style="text-align:center">
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
				<td style="text-align:center">
					<span>
						<%=sessionId%>
					</span>
				</td>
				<td style="text-align:center">
					<span>
						<%=sdf.format(srdto.getWriteday())%>
					</span>
				</td>
			</tr>
	<%} %>
		</tbody>
		</table>
		 <!-- 페이징처리 -->
     	<div class="page">
    		<ul class="pagination">
    		<!-- 이전(첫블럭이 아니면 보이게하기) -->
   			<%
    		if(startPage>1)
    		{%>
      			<li><a href="index.jsp?main=notice/noticelist.jsp?pageNum=<%=startPage-1%>">◀</a></li> 
    		<%}
    
    		for(int i=startPage;i<=endPage;i++)
    		{%>
      			<li>
      				<a style="color:<%=currentPage==i?"orange":"green"%>"
      						href="index.jsp?main=mypage/myreview.jsp?pageNum=<%=i%>"><%=i%></a>
      			</li> 
    		<%}
    		
    		if(endPage<totalPage)
    		{%>
      			<li><a href="index.jsp?main=mypage/myreview.jsp?pageNum=<%=endPage+1%>">▶</a></li> 
    		<%}
    		%>    
    		</ul>   
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
</body>
</html>