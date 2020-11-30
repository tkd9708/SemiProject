<%@page import="data.dto.NoticeDto"%>
<%@page import="data.dao.NoticeDao"%>
<%@page import="java.util.List"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Vector"%>
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
#cl-dashboard {
	display: none;
}

div.container{
	position: absolute;
	left: 230px;
 }

input.button {
	position: absolute;
	left: 700px;
}

b {
	position: absolute;
	left: 50px;
}

div.page {
	position: absolute;
	top: 700px;
	left: 200px;
}

h2{
    position: absolute;
	
	left: 200px;
}

th{
text-align: center;
}

/*버튼 css*/

html, body {
  height: 100%;
}

.wrap {
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
}

.button {
  width: 99px;
  height: 35px;
  font-family: 'Roboto', sans-serif;
  font-size: 13px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 500;
  color: #000;
  background-color: #ffc34d;
  border: none;
  border-radius: 45px;
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
  
 }
 
 div.point{
  position: relative;
  top: -30px;
  right: -830px;
 }
  


.button:hover {
  background-color: #ffaa00;

  transform: translateY(-7px);
}


</style>
</head>
<body>
	<%
	NoticeDao db=new NoticeDao();
	//페이징 처리에 필요한 변수들	
	int totalCount=db.getTotalCount(); //총 글의 갯수
	int perPage=5; //한페이지당 보여지는 글의 갯수
	int perBlock=5; //한블럭당 보여지는 페이지번호의 수
	int currentPage;//현재페이지,만약 널값이면 1로 줌
	int totalPage; //총 페이지의 갯수
	int startNum;//한페이지당 보여지는 시작번호
	int endNum;//한페이지당 보여지는 끝번호
	int startPage; //한 블럭당 보여지는 시작페이지번호
	int endPage; //한 블럭당 보여지는 끝페이지번호
	int no; //게시글에 붙일 시작번호
	
	//현재 페이지
	if(request.getParameter("pageNum")!=null)
		currentPage=Integer.parseInt(request.getParameter("pageNum"));
	else
		currentPage=1;
	//총 페이지수
	totalPage=(totalCount/perPage)+(totalCount%perPage>0?1:0);
	//각 페이지에 보여질 시작번호와 끝번호 구하기
	startNum=(currentPage-1)*perPage+1;
	endNum=startNum+perPage-1;
	//예를 들어 모두 45개의 글이 있을경우
	  //마지막 페이지는 endnum 이 45 가 되야함
	  if(endNum>totalCount)
	endNum=totalCount;
	
	//각 블럭에 보여질 시작 페이지번호와 끝 페이지 번호 구하기
	startPage= (currentPage-1)/perBlock*perBlock+1;
	endPage=startPage+perBlock-1;
	//예를 들어 총 34페이지일경우
	//마지막 블럭은 30-34 만 보여야함
	if(endPage>totalPage)
	   endPage=totalPage;
	
	List<NoticeDto> list=db.getList(startNum,endNum);
	//각 글에 보여질 번호구하기(총 100개라면 100부터 출력함)
	no=totalCount-((currentPage-1)*perPage);
%>
	<h2>공지사항</h2><br><br><br><br>
	
	<input type="button" value="게시물등록"
		class="button"
		style="width: 100px; margin-left: 200px; color: white;"
		onclick="location.href='index.jsp?main=notice/noticeform.jsp'">

	<br>
	<br>
	<%
 	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
 %>
	<div class="container">
		<div style="margin-left: -50px;">
			<table class="table table-hover" style="width: 800px;">
			<thead>
				<tr class="active" >
					<th width="80">번호</th>
					<th width="400">제 목</th>
					<th width="80">작성자</th>
					<th width="80">조회수</th>
					<th width="80">작성일</th>
				</tr>
			<thead>
				
				
				<%
 		if(totalCount==0)
 	 	{%>

				<tr align="center" height="50">
					<td colspan="7"><b>등록된 글이 없습니다</b></td>
				</tr>

	    <%}
 	 	 		for(NoticeDto dto:list)
 	 	 	 	{%>
 	 	 	
				<tbody>
				<tr class="warning">
					<td align="center"><%=no-- %></td>
					<td><a style="color: black;"
						href="index.jsp?main=notice/noticecontent.jsp?num=<%=dto.getNum()%>&pageNum=<%=currentPage%>&key=list">
							<%=dto.getSubject()%></a></td>
					<td align="center"><%=dto.getId()%></td>
					<td align="center"><%=dto.getReadcount()%></td>
					<td align="center"><%=sdf.format(dto.getWriteday())%></td>
				</tr>
				</tbody>
				<%}
                %>

			</table>
			
		<!--  <b>총 <span style="color: #ff9900;"><%=totalCount%></span> 개의 글이있습니다</b>  -->
		</div>
	</div>
	


    <!-- 페이징처리 -->
     <div style="width: 700px;" class=page >
	 <ul class="pagination">
	 <!-- 이전(첫블럭이 아니면 보이게하기) -->
	<%
	 if(startPage>1)
	 {%>
		<li>
		<a href="index.jsp?main=notice/noticelist.jsp?pageNum=<%=startPage-1%>">
		◀</a></li> 
	 <%}
	 %>	  
	 
	 <%
	 for(int i=startPage;i<=endPage;i++)
	 {%>
		<li>
		<a 
		style="color:<%=currentPage==i?"orange":"green"%>"
		href="index.jsp?main=notice/noticelist.jsp?pageNum=<%=i%>"><%=i%></a>
		</li> 
	 <%}
	 %>	
	 <!-- 다음 (마지막 블럭이 아니면보이기):클릭시 현재페이지는
	 다음블럭의 startPage 로 가려면 어떻게 주어야할까요 -->
	 <%
	 if(endPage<totalPage)
	 {%>
		<li>
		<a href="index.jsp?main=notice/noticelist.jsp?pageNum=<%=endPage+1%>">
		▶</a></li> 
	 <%}
	 %>	 
	 </ul>	
	</div>
</body>
</html>