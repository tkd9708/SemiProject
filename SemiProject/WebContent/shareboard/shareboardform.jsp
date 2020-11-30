
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<style type="text/css">
   th.td{
      padding: 6px;
      text-align: center;
   
   }
   .usersubmit{
      position: relative;
      left: 150px;
      margin-top:50px;
      width: 100px;
      height: 50px;
      border-color: #f8c990;
      background: #ff9933;
      color: white;
   }
   .btn_cancel{
      position: relative;
      left: 200px;
      margin-top:50px;
      width: 100px;
      height: 50px;
      border-color: #e5e5e5;
      background: white;
      
   }
   .on{
      background-color: #ffcc00;
      overflow: hidden;
      
      
      
      
   }
   i{
      cursor: pointer;
      text-decoration: none;
   }
   
   div.shareboardform{
      position: absolute;
      left: 250px;
   }
   
   /*별점 css*/
 div.stars{
   position: absolute;
   top: 493px;
   left: 100px;
 
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
    width: 20px;
    height: 20px;
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

</head>
<body>
<div class="shareboardform">
<fieldset style="width: 800px;">
   <legend >공유하기</legend>
   <form action="notice/shareboardaction.jsp" method="post" 
   enctype="multipart/form-data">
   <table class="table table-bordered">
         <tr>
            <th bgcolor="#ffc34d"><span>추천맛집</span></th>
            <td>
              <input type="text" name="subject" class="form-control"
               required="required" style="width: 200px;height: 30px;"
               placeholder="맛집이름을 적어주세요" >
            </td>
         </tr>
         
         <tr>
            <th bgcolor="#ffc34d"><span>맛집주소</span></th>
            <td>
              <input type="text" name="addr" class="form-control"
               required="required" style="width:600px;height: 30px;"
               placeholder="주소를 입력하세요">
             </td>
         </tr>
         
         <tr>
            <th bgcolor="#ffc34d"><span>이미지</span></th>
            <td>
              <input class="btn" type="file" name="photo" style="width: 600px;">
            </td>
         </tr>
         
         <tr>
            <th bgcolor="#ffc34d"><span>내용</span></th>
            <td>
              <textarea class="form-control"
               rows="13" cols="70" maxlength="1500" name="content"
               style="resize: none;">
              </textarea>
            </td>
         </tr>
         
         <tr>
           <th bgcolor="#ffc34d"><span>평가</span></th>
            <td>
                               
           <!-- 별점 -->
      <div class="stars">
        <input class="stars__checkbox" type="radio" id="first-star" name="star">
        <label class="stars__star" for="first-star">
            <svg class="stars__star-icon" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                viewBox="0 0 53.867 53.867" style="enable-background:new 0 0 53.867 53.867;" xml:space="preserve">
                <polygon points="26.934,1.318 35.256,18.182 53.867,20.887 40.4,34.013 43.579,52.549 26.934,43.798 
                    10.288,52.549 13.467,34.013 0,20.887 18.611,18.182 "/>
            </svg>
        </label>
        <input class="stars__checkbox" type="radio" id="second-star" name="star">
        <label class="stars__star" for="second-star">
            <svg class="stars__star-icon" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                viewBox="0 0 53.867 53.867" style="enable-background:new 0 0 53.867 53.867;" xml:space="preserve">
                <polygon points="26.934,1.318 35.256,18.182 53.867,20.887 40.4,34.013 43.579,52.549 26.934,43.798 
                    10.288,52.549 13.467,34.013 0,20.887 18.611,18.182 "/>
            </svg>
        </label>
        <input class="stars__checkbox" type="radio" id="third-star" name="star">
        <label class="stars__star" for="third-star">
            <svg class="stars__star-icon" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                viewBox="0 0 53.867 53.867" style="enable-background:new 0 0 53.867 53.867;" xml:space="preserve">
                <polygon points="26.934,1.318 35.256,18.182 53.867,20.887 40.4,34.013 43.579,52.549 26.934,43.798 
                    10.288,52.549 13.467,34.013 0,20.887 18.611,18.182 "/>
            </svg>
        </label>
        <input class="stars__checkbox" type="radio" id="fourth-star" name="star">
        <label class="stars__star" for="fourth-star">
            <svg class="stars__star-icon" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                viewBox="0 0 53.867 53.867" style="enable-background:new 0 0 53.867 53.867;" xml:space="preserve">
                <polygon points="26.934,1.318 35.256,18.182 53.867,20.887 40.4,34.013 43.579,52.549 26.934,43.798 
                    10.288,52.549 13.467,34.013 0,20.887 18.611,18.182 "/>
            </svg>
        </label>
        <input class="stars__checkbox" type="radio" id="fifth-star" name="star">
        <label class="stars__star" for="fifth-star">
            <svg class="stars__star-icon" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                viewBox="0 0 53.867 53.867" style="enable-background:new 0 0 53.867 53.867;" xml:space="preserve">
                <polygon points="26.934,1.318 35.256,18.182 53.867,20.887 40.4,34.013 43.579,52.549 26.934,43.798 
                    10.288,52.549 13.467,34.013 0,20.887 18.611,18.182 "/>
            </svg>
        </label>
        </div>
        </td> 
       </tr>   
       </table> 
    </form>
   </fieldset>
              
    <div class="btn">
        <tr>
          <td colspan="2" align="center">
             <input type="button" value="공유하기"
              class="button"
               style="width: 100px; color: white;"
               onclick="submitContents(this)">
               
             <input type="button" value="추천목록"
              class="button"
               style="width: 100px;color: white;"
               onclick="location.href='index.jsp?main=shareboard/shareboardlist.jsp'">  
          </td>             
       </tr>
    </div>
  </div>
</body>
</html>