<%@page import="data.dto.WishlistDto"%>
<%@page import="data.dto.ShareBoardDto"%>
<%@page import="data.dao.ShareBoardDao"%>
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
<style type="text/css">
scroll-behavior: smooth;
 
#cl-dashboard {
   display: none;
}

li{
   list-style: none;

}



p.sharetitle{
   position: relative;
   top:100px;
   left: 200px;
   font-size: 24px;
   font-weight: 800;
    color: #1b1b1b;
    
   
}





.userarea{
   position: relative;
   top: 200px;
   left: 170px;
   font-size: 15px;
   font-weight: 800;
   

}

.userid{
   margin-left: 32px;
   margin-top: 100px;

}

.userstar{
   font-size: 18px;
   position: relative;
   bottom: 50px;
   left: 60px;
}


.usercontent{
   position:relative;
   bottom:150px;
   border-top: 1px solid black;
   width: 1350px;
   margin-left: 150px;

}

.likesarea{
   float: left;
   position: relative;
   left: 1280px;
   margin-top: 50px;

}

.contentarea{
   position: relative;
   left: 300px;
   top: 50px;

}

.imgarea{
   margin-top: 50px;
   margin-left: 50px;

}

.buttons{
   position: relative;
   bottom: 50px;
   right: 48px;
   

}
tr{
   text-align: center;
   
}

.contentaddr{
   position: relative;
   left: 100px;

}
.jejuimg{
   position:relative;
   bottom:100px;
   width: 250px;
   height: 200px;
   right: 20px;
   
}

.pagination{
   left:950px;
   position: relative;
   
   
}

.answer{
   position: relative;
   left: 250px;

}

.btn_like,.btn_heart{
   cursor: pointer;

}

 textarea{
   font-size: 14px;
    color: #535353;
    line-height: 22px;
    letter-spacing: -.5px;
    width: 35%;
    height: 98px;
    padding: 8px;
    resize: none;
    position: relative;
    left: 250px;
    

}

.answerclear{
   position: relative;
   left: 730px;
   bottom: 50px;

}

.answertext{
   border-top: 1px solid black;
   width: 1350px;
   margin-left: 150px;
   

}

.answerinput{
   position: relative;
   top:20px;
   
}

.replylist{
   border-top: 1px solid black;
   width: 1350px;
   margin-left: 150px;

}

.replyitem{
   position: relative;
   bottom: 80px;

}

.contenttext{
   position: relative;
   left: 600px;

}

div.modal-backdrop{
z-index:0;}
div.modal-content{
margin-top:200px;
z-index:1111;
}









/* .userimg,.jejuimg,.userarea,.sharearea,.sharewrap{
   display: block;
   width: 120px;
   height: 80px;
   border-radius: 50%;

} */















 

 



/*----------------------------------------------버튼 css--------------------------------------------------*/





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
  position: relative;
  top:50px;
  left: 1400px;
  line-height: 35px;
  
 }

  
  


.button:hover {
  background-color: #ffaa00;

  transform: translateY(-7px);
}

/* -------------------하트 css ---------------------------------------*/
.heart {
    cursor:pointer;
    margin: auto;
     top: 0; 
    right: 0;
    bottom: 0;
     left: 0; 
    background-color: #babbbc;
    height: 30px;
    width: 30px;
    transform: rotate(-45deg);
  }
  .heart:after {
    background-color: #babbbc;
    content: "";
    border-radius: 50%;
    position: absolute;
    width: 35px;
    height: 30px;
    top: 0;
    left: 15px;
  }
  .heart:before {
    background-color: #babbbc;
    content: "";
    border-radius: 50%;
    position: absolute;
    width: 30px;
    height: 35px;
    top: -20px;
    left: 0;
  }

  @keyframes beat {
    50% {
      transform: scale(1.6) rotate(-45deg);
    }
    100% {
      transform: scale(1) rotate(-45deg);
      }
    }
    .color
    {
      background-color: #ff2033;
      animation-name: beat;
      animation-duration: 1s;
      anianimation-play-state: running;
    }
    
    .color:before
    {
      background-color: #ff2033;
    }
    
    .color:after
    {
      background-color: #ff2033;
    }



/*----------------------------------------------테이블 css--------------------------------------------------*/





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
   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
   
%>

</style>
<%
String id=(String)session.getAttribute("myid");

String loginok=(String)session.getAttribute("loginok");



%>
<script type="text/javascript">
//별 증가
$(function(){
   $(".answertext").hide();
   $(".replylist").hide();
   
   //좋아요 증가
   $(document).on("click",".btn_like",function(){
         var num=$(this).attr("num");
         //alert(likes);
         $.ajax({
            type:"get",
            dataType:"html",
            url:"shareboard/shareboardlikes.jsp",
            data:{"num":num},
            success:function(data){
               location.reload();
            }
         });
      });
   $(document).on("click",".btn_in",function(){
        if($(".answertext").is(":visible")){
           $(".answertext").slideUp();
        }else{
           $(".answertext").slideDown();
        }
        
  }); 
      
    
      
     $(document).on("click",".btn_out",function(){
        if($(".replylist").is(":visible")){
           $(".replylist").slideUp();
        }else{
           $(".replylist").slideDown();
        }
        
   }); 
     //댓글 추가
     $(document).on("click",".btn_submit",function(){
        var num=$(this).attr("num");
      var id=$(this).attr("id");          
       var content=$("#content").val();
          alert(content);
         $.ajax({
          type:"get",
          dataType:"html",
          url:"shareboard/insertshareboardanswer.jsp",
          data:{"num":num,"id":id,"content":content},
          success:function(data){
             $("#content").val("");
          }
       });  
       
     });
     
     $(document).on("click",".btn_update",function(){
        var writeday=$(this).attr("writeday");
        var content=$(this).attr("content");
        var photo=$(this).attr("photo");
        var star=$(this).attr("star");
        //alert(별);
        $("#shareupdate").modal();
        var s="";
        s+="<input type='date'>"
        s+="<input type='text'>"
        s+="<input type='file'>"
        s+="<input type='text'>"
        
        $("#Infoupdate").html(s);
        
         
     });
   
   
/*    $(document).on("click",".btn_in",function(){
         var num=$(this).attr("num");
         //alert(num);
         if($(".answertext").attr("num")==num){
            $(".answertext").slideUp();
         }else{
            $(".answertext").slideDown();
            
            
         }
      }); */
   

  
   
   $("div.heart").click(function(){
      //alert("ggg");
     var num= $(this).attr("num");
     var subject=$(this).attr("subject");
     var addr=$(this).attr("addr");
         $(".heart").addClass('color');
         $("#sharemodal").modal();
         
         var s = "";
         
         s +="<h2 id='modalnum' num='"+num+"'>"+num+"</h2>";
         s+="<h2>"+subject+"</h2>";
         s+="<h2>"+addr+"</h2>";
         
         
         $("#Info").html(s);
         
         
      });
   
   
   $(document).on("click","#aoCal",function(){
      if(<%=loginok.equals("success")%>){
         var num=$("#modalnum").attr("num");
         $.ajax({
           type:"post",
           dataType:"html",
           url:"shareboard/insertshareboard.jsp",
           data:{"num":num,"wishday":$("#wishday").val(),"myid":"<%=id%>"},
           success:function(data){
              $("#sharemodal").modal("hide");
           }
           
         });
      }else{
         alert("로그인이 필요합니다");
      }
      
   });
   
   
   
   

   
    
 

       
    
   
}); //function close

</script>
</head>

<body>
   
  
   
   
 
            
         
   
  
   <div class="position" >
      <p class="sharetitle">맛집 공유 게시판</p>
   <input type="button" value="맛집공유" style="color: white;"
      class="button" onclick="location.href='index.jsp?main=shareboard/shareboardform.jsp'">
      <%
         for(ShareBoardDto dto:list){%>
         
      <div class="sharewrap">
         <ul class="sharelist">
         <%
         for(int i=1;i<=dto.getRelevel();i++){%>
         &nbsp;&nbsp;&nbsp;
      <%}
   
   %>
   <!-- 답글일경우 답글 이미지 출력 -->
   <%
   if(dto.getRelevel()>0){%>
      <img src="image/re.png">
   <%}
   
   //원글이 없을 경우
   boolean flag=db.isGroupStep(dto.getRegroup());
   if(dto.getRestep()>0){
      if(!flag)//원글이 없는경우
      {%>
         <span style="color:red;">[원글이 없는 답글]</span>
      <%}
   }
         
         
         
         %>
            <li id="contentitem0" class="shareitem">
               
               <div class="sharearea">
                  <div class="userarea">
                     <div class="userimg">
                     <%
                     if(!dto.getPhoto().equals("no")){%>
                        <img src="shareboardsave/<%=dto.getPhoto() %>"
                           style="width: 320px; height: 230px;"
                           >
                      <%}
                     %>
                     </div>
                     <div class="userstar">
                        <p class="starcount"> <span style="color: #F0CD58; font-size: 18px;">
                                 
                              </span></p>
                     
                     </div>
                  </div>      
                  <div class="usercontent">
                     <div class="likesarea">
                        <table class="buttons" style="height: 300px;"> 
                           <tbody>
                              <tr>
                                 <td style="vertical-align: middle"><p class="btn_like glyphicon glyphicon-thumbs-up" num=<%=dto.getNum() %>><%=dto.getLikes() %></p>
                                 
                              </tr>
                              <tr>
                                 <td style="vertical-align: middle"><div class="heart" num="<%=dto.getNum() %>" subject="<%=dto.getSubject() %>"
                                 addr="<%=dto.getAddr() %>"></div>
                                      </td>
                              </tr>
                              <tr>
                                 <td style="vertical-align: middle"><button type="button" class="btn_out type_1">댓글(0)</button>
                                 <button type="button" class="btn_in type_1" num="<%=dto.getNum() %>">댓글쓰기</button></td>
                                  
                                 
                              </tr>
                              <tr>
                                 <td  style="vertical-align: middle"><button type="button" class="btn_update btn btn-info" writeday="<%=sdf.format(dto.getWriteday()) %>"
                                 content="<%=dto.getContent()%>"  photo="<%=dto.getPhoto()%>"
                                 star="<%=dto.getStar()%>"> 수정</button>   
                                 <button type="button" class="btn_delete btn btn-success">삭제</button></td>         
                           
                           </tbody>
                        
                        </table>
                        
                     </div>
                     <div class="contentarea">
                        <span class="contentsubject">
                  <%=dto.getSubject() %></span>
                        <span class="contenttext"><%=dto.getContent() %></span>
                        <span class="contentaddr">주소:<%=dto.getAddr() %></span>
                        <span class="userid"><%=dto.getId() %></span>
                        <span class="userwriteday"><%=sdf.format(dto.getWriteday())%></span>
                     
                     </div>
                        
                  
               </div>
            </div>
            <!-- <input type="text" style="width: 200px;height: 50px;" class="answer"> -->
            <ul class="answertext" num="<%=dto.getNum() %>">
               <li class="answertextitem">
                  <div class="answerinput">
                     <div class="answerreg">
                        <textarea maxlength="1000" title="댓글입력" id="content"></textarea>
                     </div>
                     <div class="answerbuttons">
                        <div class="answerclear">
                           <button type="button" class="btn_submit btn btn-danger" num="<%=dto.getNum() %>" id="<%=dto.getId() %>" subject=<%=dto.getSubject() %>
                           addr=<%=dto.getAddr() %> photo=<%=dto.getPhoto() %> likes=<%=dto.getLikes() %> star="<%=dto.getStar() %>">등록</button>
                           <button type="button" class="btn_cancel btn btn-default" >취소</button>
                        
                        </div>
                     
                     
                     </div>
                  
                  
                  </div>
               
               
               </li>
            
            </ul>
            <ul class="replylist">
               <li class="replyitem">
                  <div class="contentarea">
                     <p class="userid"><%=dto.getId() %></p>
                     <p class="userwriteday"><%=sdf.format(dto.getWriteday())%></p>
                  </div>
                  <div class="contenttext">
                     <div class="contentoutput">
                        <p class="text">dfdfdf</p>
                     
                     </div>
                  
                  
                  </div>
                  
               
               
               </li>
            
            
            </ul>
            
         </li>
      </ul>
      <%} %> 
    </div>
  </div>

  
<!-- around 일정 추가 modal -->
   <div class="modal fade" id="sharemodal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style="width: 400px;">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">일정 추가</h4>
        </div>
        <div class="modal-body">
           <div style="margin-left: 10px; margin-right: 10px;">
              <div id="Info"></div>
              <br>
              
                <span class="glyphicon glyphicon-calendar" style="color: #aaa"></span>&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="date" id="wishday">
           </div>
        </div>
        <div class="modal-footer">
           <button type="button" class="btn btn-warning" id="aoCal">추가</button>
             <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
  <!-- 원글 수정 -->
  <div class="modal fade" id="shareupdate" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style="width: 400px;">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">글 수정하기</h4>
        </div>
        <div class="modal-body">
           <div style="margin-left: 10px; margin-right: 10px;">
              <div id="Infoupdate"></div>
              <br>
              
                <span class="glyphicon glyphicon-calendar" style="color: #aaa"></span>&nbsp;&nbsp;&nbsp;&nbsp;
                
           </div>
        </div>
        <div class="modal-footer">
           <button type="button" class="btn btn-warning" id="aoCal">추가</button>
             <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
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
   
</body>

</html>