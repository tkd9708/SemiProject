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
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<style type="text/css">
scroll-behavior: smooth;
 
#cl-dashboard {
   display: none;
}


div.container{
   position: absolute;
   top:  250px;
   left: 230px;
   
 }

input.button {
   position: absolute;
   left: 700px;
}

b {
   position: absolute;
   left: 50px;
   
   text-align: center;
}


div.page {
   position: absolute;
   top: 1250px;
   left: 200px;
}

h2{
    position: absolute;
    top: 150px;
    left: 200px;
}

 
 div.point{
     position: absolute;
     top: 180px;
     left: 550px;
    
 }
 


th{
text-align: center;
}

/*----------------------------------------------버튼 css--------------------------------------------------*/

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
  width: 140px;
  height: 55px;
  font-family: 'Roboto', sans-serif;
  font-size: 18px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 600;
  color: #000;
  background-color: #ffc34d;
  border: none;
  border-radius: 45px;
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
  
 }

  
  


.button:hover {
  background-color: #ffaa00;

  transform: translateY(-7px);
}



/*----------------------------------------------테이블 css--------------------------------------------------*/

.styled-table {
    border-collapse: collapse;
    margin: 25px 0;
    font-size: 0.9em;
    font-family: sans-serif;
    min-width: 300px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
    
}

.styled-table thead tr {
    background-color:  #ffad33;
    color: white;
    text-align: left;
    border-radius: 5%;
    
}

.styled-table th,
.styled-table td {
    padding: 12px 15px;
   
}

.styled-table tbody tr {
    border-bottom: 1px solid #ffad33;
}

.styled-table tbody tr:nth-of-type(even) {
    background-color:  #ffad33;
}

.styled-table tbody tr:last-of-type {
    border-bottom: 2px solid #ffad33;
}

.styled-table tbody tr.active-row {
    font-weight: bold;
    color: black;
}




</style>
</head>
<%
   ShareBoardDao db=new ShareBoardDao();
   //페이징 처리에 필요한 변수들   
   int totalCount=db.getTotalCount(); //총 글의 갯수
   int perPage=3; //한페이지당 보여지는 글의 갯수
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
<body>
   
   <div class="position" >
      <h2 >맛집 공유 게시판</h2><br><br><br><br>
   
   <div class="point">
   <input type="button" value="맛집공유" style="color: white;"
      class="button" onclick="location.href='index.jsp?main=shareboard/shareboardform.jsp'">
    </div>
   <br>
   <br>
   <%
    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
 %>
   <div class="container">
     <div style="margin-left: -50px;">
       <table class="styled-table" >
         <thead>
            <tr class="warning" >
               <th width="50">ID</th>
               <th width="180">PHOTO</th>
               <th width="120">추천 맛집</th>
               <th width="150">리뷰</th>
               <th width="70">별점</th>
               <th width="70">좋아요</th>
               <th width="70">찜하기</th>
               <th width="100">작성일</th>
            </tr>
         <thead>
            
            
            <%
       if(totalCount==0)
        {%>

            <tr align="center" height="400">
               <td colspan="8"><b>공유된 맛집이 없습니다</b></td>
            </tr>

       <%}
              
        %>


            <%
               for(ShareBoardDto dto:list)
                {%>
            
            <tbody>
            <tr class="active-row">
               <td style="vertical-align: middle;"
                  href="index.jsp?main=shareboard/shareboardcontent.jsp?num=<%=dto.getNum()%>&pageNum=<%=currentPage%>&key=list">
                     <%=dto.getId()%></td>
               <td style="text-align: center;">
                <%
				if(!dto.getPhoto().equals("no"))
				{%>
				<img src="shareboardsave/<%=dto.getPhoto() %>"
					style="width: 320px; height: 230px;"
					hspace="20" align="bottom">
				<%}
				%>
				<br><br><%=dto.getAddr()%></td>
               <td style="vertical-align: middle;"><%=dto.getSubject()%></td>
               <td style="vertical-align: middle;"><%=dto.getContent()%></td>
               <td style="text-align: center; line-height: 200px;">
               <span style="color: #F0CD58; font-size: 18px;">
               <%
              for(int i=1; i<=5; i++){
                 if(i<=Integer.parseInt(dto.getStar())){
                    %>★<%
                 }
                 else {
                    %>☆<%
                 }
                 }
               %>
               </span>
               </td>
               <td style="text-align: center; line-height: 200px;"><%=dto.getLikes()%></td>
               <td style="text-align: center; line-height: 200px;">♥</td>
               <td style="text-align: center; line-height: 200px;"><%=sdf.format(dto.getWriteday())%></td>
            </tr>
            </tbody>
            <%}
                %>

         </table>
         
  
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
      <a href="index.jsp?main=shareboard/shareboardlist.jsp?pageNum=<%=startPage-1%>">
      ◀</a></li> 
    <%}
    %>     
    
    <%
    for(int i=startPage;i<=endPage;i++)
    {%>
      <li>
      <a 
      style="color:<%=currentPage==i?"orange":"green"%>"
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
   </div>
</body>

</html>