<%@page import="data.dto.ShareBoardDto"%>
<%@page import="data.dao.ShareBoardDao"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>

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
div.smain h2{
      margin-left: 880px;
      margin-top: 150px;
       
}


div.shareboard{
      display: flex;
      max-width: 1000px;
      height: 330px;
      margin: auto;
      margin-top: 50px;
      border-top: 5px solid #ffc266;
      border-bottom: 2px solid #ffc266;
      
}

div.image_star{
     flex-basis: 400px;
  
     height: 100%;

     
     
}

div.content_addr{
     flex-basis: 400px;
     flex-wrap : wrap;
     padding-left: 25px;
     padding-top: 25px;
     height: 100%;
     font-size: 14px;
     color: grey;
}

div.subject{
     padding-bottom: 10px;


}

div.addr{
     padding-bottom: 10px

}


div.id_writeday{
    display: inline-block;
    padding-top: 120px;
    

}


div.userimg img{
    width: 350px;
    margin-left: 25px;
    padding-top: 10px;
    height: 250px;
    
    
}

div.userstar{
    margin-top: 15px;
    margin-left: 25px;
    font-size: 20px;
} 


div.likes_heart{
    
     display: flex;
     flex: 1;
     flex-direction: column;
     padding-right: 20px;
     height: 100%;

     float: right;


}

div.likes{
    margin-top: 20px;
    margin-left: 100px;
    font-size: 20px;
    
  

}

div.heart{
    margin-top: 80px;
    
    margin-left: 100px;


}

/*-------------------댓글창-------------------*/

div.sreview_rere{
 
   margin-top: 10px;
   margin-left: 460px;
   margin-bottom: 20px;
   padding-bottom: 20px;
   border-bottom: 1px solid #ffc266;
   max-width: 1000px;
 

}


div.sreview_list{
 
   margin-top: 20px;
   margin-left: 460px;
   margin-bottom: 20px;
   padding-bottom: 20px;
   border-bottom: 1px solid #ffc266;
   max-width: 1000px;
 

}




div.sreview{
 
   margin-top: 20px;
   margin-left: 460px;
   margin-bottom: 20px;
   padding-bottom: 40px;
   border-bottom: 1px solid #ffc266;
   max-width: 1000px;
 

}

   
 div.sreview_id  {
     padding-bottom: 10px;
 }
 
 
div.sreview_memo{
    
    display: block;
    padding-bottom: 10px;

 
}







input.form-control{
 
    display: block;
    padding-bottom: 10px;
  
}


div.page{
   margin-left: 880px;
}

span.memo_plus{
    float: right;
    cursor: pointer;
}







/* -------------------하트 css ---------------------------------------*/
.heart {
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
    
    
/*----------------------------------------------버튼 css--------------------------------------------------*/

div.review_enter_btn{
    float: right;
}

/*댓글(),댓글쓰기 버튼 css*/
div.review_btn{
   margin-bottom: 22px;
   
   margin-left: 40px;

 

}

/*수정 삭제 버튼 */

div.update_del_btn{
    margin-left: 60px;
    padding-top: 50px;
    padding-bottom: 20px;

}

/*맛집공유 버튼 css*/
 div.point{
  margin-left: 1300px;
  padding-top: 50px;
     
     
    
 }


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
 
 .button1 {
  width: 66px;
  height: 25px;
  font-family: 'Roboto', sans-serif;
  font-size: 5px;
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
  text-align: center;
  
 }
 
  .button2 {
  width: 66px;
  height: 25px;
  font-family: 'Roboto', sans-serif;
  font-size: 5px;
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
  text-align: center;
  
 }

  
  


.button:hover {
  background-color: #ffaa00;

  transform: translateY(-7px);
}

.button1:hover {
  background-color: #ffaa00;

  transform: translateY(-7px);
}

.button2:hover {
  background-color: #ffaa00;

  transform: translateY(-7px);
}









   /*--------------------별점 css--------------------------------*/
 div.stars{
  float: left;

  

 
 }
 
 

.stars{
    display: flex;
    flex-wrap: wrap;

    flex-direction: row-reverse;
    justify-content: center;

}

.stars__star-icon{
    stroke:#EFCE4A;
    stroke-width: 2px;
    fill: transparent;
    transition: .1s all;
}

.stars__star{
    width: 15px;
    height: 15px;
    position: relative;
    cursor: pointer;
    margin: 5px;
}

.stars__checkbox{
    position: absolute;
    top: -9999px;
    opacity: 0;
    width: 0;
    height: 0;
}

.stars__star:hover > .stars__star-icon{
    fill: #EFCE4A;
}

.stars__star:hover ~ .stars__star > .stars__star-icon {
    fill: #EFCE4A;
}

.stars__checkbox:checked + .stars__star > .stars__star-icon {
    fill: #EFCE4A;
}

.stars__checkbox:checked ~ .stars__star > .stars__star-icon {
    fill: #EFCE4A;
}


/*modal 창 열림 css*/

div.modal-backdrop{
z-index:0;}
div.modal-content{
margin-top:200px;
z-index:1111;
}

    
    
</style>
<%
String id=(String)session.getAttribute("myid");

String loginok=(String)session.getAttribute("loginok");


   ShareBoardDao db=new ShareBoardDao();
//페이징 처리에 필요한 변수들   
int totalCount = db.getTotalCount();
	int perPage = 10; // 한페이지당 보여질 글의 갯수
	int perBlock = 5; // 한블럭당 출력할 페이지의 갯수
	int totalPage; // 총 페이지의 갯수
	int startPage; // 각 블럭당 시작 페이지 번호
	int endPage; // 각 블럭당 끝페이지 번호
	int start; // 각 블럭당 불러올 글의 시작번호
	int end; // 각 블럭당 글의 끝번호
	int currentPage; // 현재 보여질 페이지 번호
	
//현재 페이지 번호 구하기
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

List<ShareBoardDto> list=db.getList(start, perPage);
//각 글에 보여질 번호구하기(총 100개라면 100부터 출력함)
int no=totalCount-((currentPage-1)*perPage);
   
   no=totalCount-((currentPage-1)*perPage);
   
   
   
   
%>
<script type="text/javascript">

$(function(){
	
   //리뷰 별점
   $(".stars__checkbox").on("click", function(){
        var idx = $(this).index()/2;
        switch (idx) {
        case 0:
           idx="5";
           break;
        case 1:
           idx="4";
           break;
        case 2:
           idx="3";
           break;
        case 3:
           idx="2";
           break;
        case 4:
           idx="1";
           break;
        default:
           break;
        }
        //alert(idx);
        $("#sharestar").val(idx);   
     });
      
	 
	 
	 //좋아요 증가
     $(document).on("click",".likes",function(){
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
  

     


    
    
    //하트 버튼 클릭시 스케줄 모달
    
    $("div.heart").click(function(){
      //alert("ggg");
    
     var num= $(this).attr("num");
     var subject=$(this).attr("subject");
     var addr=$(this).attr("addr");
         $(this).addClass('color');
         $("#sharemodal").modal();
         
         var s = "";
         
         s+="<h2 id='modalnum' num='"+num+"'>"+num+"</h2>";
         s+="<h2>"+subject+"</h2>";
         s+="<h2>"+addr+"</h2>";
         
         
         $("#Info").html(s);
         
         
      });
    
   //하트 버튼 클릭 스케줄 모달
    $(document).on("click","#aoCal",function(){
        if(<%=loginok!=null%>){
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


    
    
    
    //댓글 버튼
    $(".sreview").hide();
    $(".sreview_list").hide();
    $(".sreview_rere").hide();

    
    $(".button1").click(function(){
    	//alert($(this).parent().parent().parent().next().html());

    	$(this).parent().parent().parent().next().toggle();
    	
      });
    
    $(".button2").click(function(){
    	//alert($(this).parent().parent().parent().next().html());

    	$(this).parent().parent().parent().next().next().toggle();
    	
      });
    
    $(".memo_plus").click(function(){
    	//alert($(this).parent().parent().parent().next().html());

    	$(this).parent().parent().next().toggle();
    	
      });
      
    
   /*  $(".button2").click(function(){
    	//alert($(this).parent().parent().parent().next().find(".sreview").html());
    
    	$(this).parent().parent().parent().next().find(".sreview_list").toggle();
    	
      });
     */
     
     
     
    //댓글 추가
    $(document).on("click",".btn_submit",function(){
        var num=$(this).attr("num");
        var id=$(this).attr("id1");          
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
     
     
     
     //게시글 수정(modal)
     $(document).on("click",".btn_update",function(){
        var writeday=$(this).attr("writeday");
        var content=$(this).attr("content");
        var photo=$(this).attr("photo");
        var star=$(this).attr("star");
        //alert(별);
        $("#shareupdate").modal();
        var s="";
        s="추천맛집:&nbsp;<input type='text'><br><br>"
        s+="맛집주소:&nbsp;<input type='text'><br><br>"
        s+="이미지:&nbsp;<input type='file'><br>"
        s+="내용:&nbsp;<input type='text' style='width:100px;height:200px;'>"
   		

 
        
        
        
        $("#Infoupdate").html(s);
        
         
     });
    
	$(".button2").click(function(){
		var regroup = $(this).attr("regroup");
		//alert(regroup);
		$.ajax({
			type: "get",
			url: "shareboard/shareboardxml.jsp",
			dataType: "xml",
			data: {"regroup":regroup},
			success: function(data){
				var s ="";
				$(data).find("dto").each(function(i, element) {
					s+="<div>ID:"+$(this).find("id").text();
					s += "<br>" + $(this).find("content").text();
					s += "<br><b style='float: right; color:gray;'>" + $(this).find("writeday").text();
					s += "<span style='float: right;'>+</span>"
					
					
					s += "</b></div><br><hr>";
				});
				$(".sreview_list").html(s);
			}
		});
	});

   
    


    


    
}); //function close

</script>


</head>

<body>


  <!--게시판 제목 -->
    <div class="smain">
       <h2 >맛집 공유 게시판</h2>
    </div>
  <!-- 제목 close-->  
 
 
   <!-- 맛집 공유 버튼  -->
   <div class="point">
      <input type="button" value="맛집공유" style="color: white;"class="button" 
      onclick="location.href='index.jsp?main=shareboard/shareboardform.jsp'">
   </div>
   <!-- 맛집 공유 버튼 close -->
 

<!-- 전체 div -->
<div class="main">
    
    <%
    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh-mm");
   
    for(ShareBoardDto dto : list){
	%>   


	   	
	<!-- shardboard 부분 -->
  	<div class="shareboard">
                 
        
        
        <!-- 이미지+stat 묶음 div -->
        <div class="image_star">
              
              <!-- 이미지부분 -->
              <div class="userimg">
                  <div>
                  <%
                  if(!dto.getPhoto().equals("no"))
                  {%>
                  <img src="shareboardsave/<%=dto.getPhoto() %>">
                  <%}
                  %>
                 </div>
             </div><!-- 이미지부분 close -->
                     
                       
             <!-- 별 -->
             <div class="userstar">
                  <div class="starcount">맛집점수:
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
                  </div>
            </div>
            <!-- 별 close-->
       </div>
       <!-- 이미지+stat 묶음 div close -->      
    
            
            
         
                     
                     
                   
      <!-- 주소 내용  -->
      <div class="content_addr">
                       
           <div class="subject_addr_content">
            <div class="subject"><%=dto.getSubject()%></div>
            <br>
            <div class="addr">주소:<%=dto.getAddr()%></div>
            <br>
            <div class="contnet"><%=dto.getContent()%></div>
           </div>
        
            
          <div class="id_writeday">
            <div class="userid">ID:<%=dto.getId()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;작성일:&nbsp;<%=sdf.format(dto.getWriteday())%></div>
            <%-- <div class="userwriteday"><%=sdf.format(dto.getWriteday())%></div> --%>
          </div>
              
      </div>
      <!-- 주소 내용 close -->
                     
                     
                 
                 
    
     <!-- 좋아요 찜하기(하트) 댓글버튼,게시글 수정 삭제 -->
    <div class="likes_heart">
                  
         <!-- 좋아요 -->
         <div class="likes">
            <span class="likes glyphicon glyphicon-thumbs-up"  num="<%=dto.getNum()%>">
            </span><%=dto.getLikes()%>
         </div>
         <!-- 좋아요 close -->
                  
         <!-- 찜하기(하트) -->    
         <div class="heart" num="<%=dto.getNum() %>" subject="<%=dto.getSubject() %>"
                                 addr="<%=dto.getAddr() %>"></div>
         <!-- 찜하기(하트) close -->       
         
          <!--게시글 수정 삭제 버튼-->
         <div class="update_del_btn">
             <button type="button" class="btn_update btn btn-info" style="color: white;"
             writeday="<%=sdf.format(dto.getWriteday()) %>"
             content="<%=dto.getContent()%>"  photo="<%=dto.getPhoto()%>"
             star="<%=dto.getStar()%>">수정</button>
             <button type="button" class="btn_delete btn btn-success" style="color: white;">삭제</button>
         </div>
         <!-- 게시글 수정 삭제 버튼 close -->
                
         
         
         
         <!-- 댓글버튼-->
         <div class="review_btn">
             <button type="button" class="button2" style="color: white;" regroup="<%=dto.getRegroup()%>">댓글(0)</button>
             <button type="button" class="button1" style="color: white;">댓글쓰기</button>
         </div>
         <!-- 댓글버튼 close -->
	   	          
	</div>
    <!-- 좋아요 찜하기(하트) 댓글버튼,게시글 수정 삭제 close--> 
	   	
  </div>
  <!-- shareboard close -->

 	    





     <!-- 댓글 입력창-->
     <div class="sreview" >
 	       
 	    <div class="sreview_id">ID:&nbsp;<%=id%> &nbsp;&nbsp;</div>
 	     
 	     
 	    <div class="sreview_memo"> 
 	       <input class="form-control" placeholder="리뷰를 입력하세요" style="width: 800px" id="content" >
 	          <div class="review_enter_btn">
                 <button type="button" class="btn_submit btn btn-warning"
                 num="<%=dto.getNum() %>" id="<%=dto.getId() %>" subject="<%=dto.getSubject() %>"
                 addr="<%=dto.getAddr() %>" photo="<%=dto.getPhoto() %>" likes="<%=dto.getLikes() %>" 
                 star="<%=dto.getStar() %> " content="<%=dto.getContent()%>" id1="<%=id%>">등록</button>
              </div>
 	     </div> 
 	    
 	    
 	    <div class="stars"> 
 	    <input class="stars__checkbox" type="radio" id="first-star" name="star">
        <label class="stars__star" for="first-star">
            <svg class="stars__star-icon" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                viewBox="0 0 53.867 53.867" style="enable-background:new 0 0 53.867 53.867;" xml:space="preserve">
                <polygon points="26.934,1.318 35.256,18.182 53.867,20.887 40.4,34.013 43.579,52.549 26.934,43.798 
                    10.288,52.549 13.467,34.013 0,20.887 18.611,18.182 "/>
            </svg>
        </label>
        <input class="stars__checkbox" type="radio" id="second-star" name="star">
        <label class="stars__star" for="second-star">
            <svg class="stars__star-icon" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                viewBox="0 0 53.867 53.867" style="enable-background:new 0 0 53.867 53.867;" xml:space="preserve">
                <polygon points="26.934,1.318 35.256,18.182 53.867,20.887 40.4,34.013 43.579,52.549 26.934,43.798 
                    10.288,52.549 13.467,34.013 0,20.887 18.611,18.182 "/>
            </svg>
        </label>
        <input class="stars__checkbox" type="radio" id="third-star" name="star">
        <label class="stars__star" for="third-star">
            <svg class="stars__star-icon" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                viewBox="0 0 53.867 53.867" style="enable-background:new 0 0 53.867 53.867;" xml:space="preserve">
                <polygon points="26.934,1.318 35.256,18.182 53.867,20.887 40.4,34.013 43.579,52.549 26.934,43.798 
                    10.288,52.549 13.467,34.013 0,20.887 18.611,18.182 "/>
            </svg>
        </label>
        <input class="stars__checkbox" type="radio" id="fourth-star" name="star">
        <label class="stars__star" for="fourth-star">
            <svg class="stars__star-icon" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                viewBox="0 0 53.867 53.867" style="enable-background:new 0 0 53.867 53.867;" xml:space="preserve">
                <polygon points="26.934,1.318 35.256,18.182 53.867,20.887 40.4,34.013 43.579,52.549 26.934,43.798 
                    10.288,52.549 13.467,34.013 0,20.887 18.611,18.182 "/>
            </svg>
        </label>
        <input class="stars__checkbox" type="radio" id="fifth-star" name="star">
        <label class="stars__star" for="fifth-star">
            <svg class="stars__star-icon" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                viewBox="0 0 53.867 53.867" style="enable-background:new 0 0 53.867 53.867;" xml:space="preserve">
                <polygon points="26.934,1.318 35.256,18.182 53.867,20.887 40.4,34.013 43.579,52.549 26.934,43.798 
                    10.288,52.549 13.467,34.013 0,20.887 18.611,18.182 "/>
            </svg>
        </label>
        평점:&nbsp;
       </div>
 	    
 	 </div>
   <!-- 댓글 입력창 close-->
     
      <!-- 댓글목록-->
     <div class="sreview_list">
 	     <div >
 	     
 	     <%-- <%
 	     for(ShareBoardDto sdto : list){
 	    	 %>
 	         ID:&nbsp;<%=sdto.getId()%>
 	         <br>
 	         <%=sdto.getStar()%>
 	         <br>
 	         <%=sdto.getContent()%> 
 	       <span class="memo_plus glyphicon glyphicon-plus" ></span>
 	    	 
 	    	 <%
 	     }
 	     %>
 	        --%>
 	     
 	     </div>
     </div>
     
     <!-- 댓글창 close-->
     
     <!-- 댓글 댓글 입력창-->
     <div class="sreview_rere">
     
        <div><img src="image/review.png" style="width: 30px;height: 30px;"></div>
 	     
 	     
 	    <div class="sreview_memo"> <input class="form-control" placeholder="댓글을 입력하세요" style="width: 800px"> </div> 
 	   
     </div>
     <!-- 댓글 댓글 입력창 close--> 



  <%
	   
	   
   }
    
    
 %>
 <!-- 하트 클릭->스케줄 일정 추가 modal -->
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
  
    <!-- 게시판 원글 수정 -->
  <div class="modal fade" id="shareupdate" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style="width: 400px;">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">공유맛집추천 수정</h4>
        </div>
        <div class="modal-body">
           <div style="margin-left: 10px; margin-right: 10px;">
              <div id="Infoupdate"></div>
              <br>
              
                
                
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
<!-- 페이징처리 close-->

</div>
<!-- 전체 div close -->


</body>

</html>