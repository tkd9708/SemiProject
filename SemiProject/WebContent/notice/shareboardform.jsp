<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
   div.shareboardform{
      position: absolute;
      left: 250px;
        
   }
 


</style>
<script src="<%=request.getContextPath()%>/shareboardsmarteditor/js/HuskyEZCreator.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=request.getContextPath()%>/shareboardsmarteditor/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" type="text/javascript" charset="utf-8"></script></head>
<body>
<div class="shareboardform">
<fieldset style="width: 800px;">
   <legend>공유게시판 글쓰기</legend>
   <form action="shareboard/shareboardformaction.jsp"
     method="post" enctype="multipart/form-data"
      name="f">
    <table class="table table-bordered">
       <tr>
          <th width="100" bgcolor="#ffc266">ID</th>
          <td>
             <input type="text" class="form-control"
               style="width: 120px;" required="required"
               name="name" placeholder="ID">                  
          </td>
       </tr>
       <tr>
          <th width="100" bgcolor="#ffc266">제 목</th>
          <td>
             <input type="text" class="form-control"
               style="width: 300px;" required="required"
               name="subject" placeholder="제목">                  
          </td>
       </tr>
       
       <tr>
          <th width="100" bgcolor="#ffc266" align="center">숨은 관광지 맛집 추천</th>
          <td>
            <textarea class="form-control"              
              style="width:100%; height:300px; display:none;"
              name="content" id="content"></textarea>
       </tr>
       <tr>
          <td colspan="2" align="center">
             <input type="button" value="게시물공유"
              class="btn btn-warning btn-sm"
               style="width: 100px;"
               onclick="submitContents(this)">
               
             <input type="button" value="공유게시판목록"
              class="btn btn-warning btn-sm"
               style="width: 100px;"
               onclick="location.href='index.jsp?main=shareboard/shareboardlist.jsp'">  
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

    sSkinURI: "<%=request.getContextPath()%>/shareboardsmarteditor/SmartEditor2Skin.html",

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