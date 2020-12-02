<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
   div.noticeform{
      position: absolute;
      left: 250px;
        
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
   
   
 


</style>
<script src="<%=request.getContextPath()%>/noticesmarteditor/js/HuskyEZCreator.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=request.getContextPath()%>/noticesmarteditor/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" type="text/javascript" charset="utf-8"></script></head>
<body>
<div class="noticeform">
<fieldset style="width: 800px;">
   <legend>공지사항 작성</legend>
   <form action="notice/noticeaction.jsp"
     method="post" enctype="multipart/form-data"
      name="f">
    <table class="table table-bordered">
       <tr >
          <th width="100" bgcolor="#ffc34d">작성자</th>
          <td>
             <input type="text" class="form-control"
               style="width: 120px;" required="required"
               name="id" placeholder="작정자">                  
          </td>
       </tr >
       <tr >
          <th width="100" bgcolor="#ffc34d">제 목</th>
          <td>
             <input type="text" class="form-control"
               style="width: 300px;" required="required"
               name="subject" placeholder="제목">                  
          </td>
       </tr>
       
       <tr >
          <th width="100" bgcolor="#ffc34d" align="center">내용</th>
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