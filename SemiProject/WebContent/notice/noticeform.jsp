<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
   div.noticeform{
      margin: 0 auto;
      width: 1000px;
      margin-top: 100px;
      

  
      
        
   }
   
   div.h2point{
      margin: 0 auto;
      width: 200px;
      margin-top: 100px;
      margin-left: 800px;
    
   
   }
   
   th,td{
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
  width: 100px;
  height: 40px;
  font-family: 'Roboto', sans-serif;
  font-size: 13px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 400;
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

div.btn{
   position: absolute;
   left: 300px;
}

/*--------------------------테이블 css--------------------------------------*/
.styled-table {
    border-collapse: collapse;
    margin: 25px 0;
    font-size: 0.9em;
    font-family: sans-serif;
    min-width: 300px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
    
}

.styled-table th {
    background-color:  #ffad33;
    color: white;
    text-align: left;
}

.styled-table th,
.styled-table td {
    padding: 12px 15px;
}

.styled-table  th {
    border-bottom: 1px solid white;
}

.styled-table  th:nth-of-type(even) {
    background-color:  #ffad33;
}

.styled-table td:last-of-type {
    border-bottom: 1px solid #ffad33;
}

.styled-table td.active-row {
    font-weight: bold;
    color: black;
}
   
   
 


</style>
<script src="<%=request.getContextPath()%>/noticesmarteditor/js/HuskyEZCreator.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=request.getContextPath()%>/noticesmarteditor/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" type="text/javascript" charset="utf-8"></script></head>


<body>

<div class="h2point">
<h2>공지사항 작성</h2>
</div>

<div class="noticeform">
<fieldset style="width: 800px;">
   <form action="notice/noticeaction.jsp"
     method="post" enctype="multipart/form-data"
      name="f">
    <table class="styled-table">
       <tr >
          <th style="text-align: center;">작성자</th>
          <td>
             <input type="text" class="form-control"
               style="width: 200px;" required="required"
               name="id" placeholder="작성자">                  
          </td>
       </tr >
       <tr >
          <th style="text-align: center;">제 목</th>
          <td>
             <input type="text" class="form-control"
               style="width: 300px;" required="required"
               name="subject" placeholder="제목">                  
          </td>
       </tr>
       
       <tr >
          <th style="text-align: center; vertical-align: middle;">내용</th>
          <td>
            <textarea class="form-control"              
              style="width:100%; height:300px; display:none;"
              name="content" id="content"></textarea>
           </td>
       </tr>
       <tr>
          <td colspan="2" align="center">
             <button type="button" 
              class="button"
               style="width: 100px;color: white;"
               onclick="submitContents(this)">등록</button>
               
             <button type="button" 
              class="button"
               style="width: 100px;color: white;"
               onclick="location.href='index.jsp?main=notice/noticelist.jsp'">목록</button> 
          </td>             
       </tr>
     </table>     
    </form>
  </fieldset>

</div>


<script type="text/javascript">
var oEditors = [];

nhn.husky.EZCreator.createInIFrame({

    oAppRef: oEditors,

    elPlaceHolder: "content",

    sSkinURI: "<%=request.getContextPath()%>/noticesmarteditor/SmartEditor2Skin.html",

    fCreator: "createSEditor2"

}); 

//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.

function submitContents(elClickedObj) {

    // 에디터의 내용이 textarea에 적용된다.

    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [ ]);

 

    // 에디터의 내용에 대한 값 검증은 이곳에서

    // document.getElementById("textAreaContent").value를 이용해서 처리한다.
    try {
        elClickedObj.form.submit();
    } catch(e) { 

    }

}

// textArea에 이미지 첨부

function pasteHTML(filepath){
    var sHTML = '<img src="<%=request.getContextPath()%>/save/'+filepath+'">';
    oEditors.getById["content"].exec("PASTE_HTML", [sHTML]); 

}
</script>
</body>
</html>