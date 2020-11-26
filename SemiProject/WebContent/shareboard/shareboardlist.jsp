

<%@page import="data.dto.ShareBoardDto"%>
<%@page import="data.dao.ShareBoardDao"%>
<%@page import="java.util.List"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<style type="text/css">
	#cl-dashboard{display: none;}
	
	div.shareboardlist{
	   position: absolute;
	   left: 250px;
	   font-family: "Jue";
	   text-align: senter;
	}
	
	input.button{
	   position: absolute;
	   left: 700px;
	
	}
	
	b{
	   position: absolute;
	   left: 200px;
	}
	

</style>
</head>
<body>
<%
    ShareBoardDao db=new ShareBoardDao();
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
	
	List<ShareBoardDto> list=db.getList(startNum,endNum);
	//각 글에 보여질 번호구하기(총 100개라면 100부터 출력함)
	no=totalCount-((currentPage-1)*perPage);
%>
 <b>총 <span style="color: #ff9900;"><%=totalCount%></span>
 개의 글이 있습니다</b>
 <input type="button" value="게시물등록"
 class="button btn btn-warning btn-xs" 
  style="width: 100px;margin-left: 200px;" 
 onclick="location.href='index.jsp?main=shareboard/shareboardform.jsp'">  
 
 <br><br>
 <%
 	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
 %>
 <div class="shareboardlist">
 <div style="margin-left: -50px;">
 	<table class="table table-bordered" style="width: 800px;">
 		<tr bgcolor="#ffc266">
 		 	<th width="80">번호</th>
 		 	<th width="400">제 목</th>
 		 	<th width="80">ID</th>
 		 	<th width="80">좋아요</th>
 	 	 	<th width="80">찜하기</th>
 		 	<th width="80">작성일</th>
 		 	<th width="80">조회수</th> 		 	
 		</tr>
 	<%
 	if(totalCount==0)
 	{%>
 	    <tr align="center" height="50">
 	        <td colspan="7" align="center">
 	           <b>등록된 글이 없습니다</b>
 	        </td>
 	    </tr>
 		
 	<%}
 	%>
 	
 	
 	<%for(ShareBoardDto dto:list)
 	{%>
		<tr>
			<td align="center"><%=no-- %></td>
			<td>
				<a style="color: black;" 
				href="index.jsp?main=shareboard/shareboardcontent.jsp?num=<%=dto.getNum()%>&pageNum=<%=currentPage%>&key=list">
				<%=dto.getSubject()%></a>
			</td>	
			<td align="center"><%=dto.getId()%></td>
			<td align="center"><%=dto.getReadcount()%></td>
			<td align="center">
				<%=sdf.format(dto.getWriteday())%>
			</td>
		</tr>			
 	<%}
 %>

    </table>
</div> 
</div>   
    <!-- 페이징처리 -->
     <div style="width: 700px;" class="text-center">
	 <ul class="pagination">
	 <!-- 이전(첫블럭이 아니면 보이게하기) -->
	<%
	 if(startPage>1)
	 {%>
		<li>
		<a href="index.jsp?main=shareboard/shareboardlist.jsp?pageNum=<%=startPage-1%>">
		◀</a></li> 
	 <%}
	 %>	  
	 
	 <%
	 for(int i=startPage;i<=endPage;i++)
	 {%>
		<li>
		<a 
		style="color:<%=currentPage==i?"red":"black"%>"
		href="index.jsp?main=shareboard/shareboardlist.jsp?pageNum=<%=i%>"><%=i%></a>
		</li> 
	 <%}
	 %>	
	 <!-- 다음 (마지막 블럭이 아니면보이기):클릭시 현재페이지는
	 다음블럭의 startPage 로 가려면 어떻게 주어야할까요 -->
	 <%
	 if(endPage<totalPage)
	 {%>
		<li>
		<a href="index.jsp?main=shareboard/shareboardlist.jsp?pageNum=<%=endPage+1%>">
		▶</a></li> 
	 <%}
	 %>	 
	 </ul>	
	</div>
</body>
</html>






