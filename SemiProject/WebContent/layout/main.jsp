<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	// 프로젝트 경로 구하기
	String url = request.getContextPath();
%>
<body>
<button id="btn_go_jeju" onclick="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=제주시'">제주시</button>
<button id="btn_go_jocheon" onclick="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=조천읍'">조천읍</button>
<button id="btn_go_gujwa" onclick="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=구좌읍'">구좌읍</button>
<button id="btn_go_sungsan" onclick="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=성산읍'">성산읍</button>
<button id="btn_go_pyoseon" onclick="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=표선면'">표선면</button>
<button id="btn_go_namwon" onclick="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=남원읍'">남원읍</button>
<button id="btn_go_seogwipo" onclick="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=서귀포시'">서귀포시</button>
<button id="btn_go_andeok" onclick="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=안덕면'">안덕면</button>
<button id="btn_go_daecheong" onclick="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=대청읍'">대청읍</button>
<button id="btn_go_hangyeong" onclick="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=한경면'">한경면</button>
<button id="btn_go_hanrim" onclick="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=한림읍'">한림읍</button>
<button id="btn_go_aewol" onclick="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=애월읍'">애월읍</button>
<button id="btn_go_aewol" onclick="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=우도'">우도</button>
<button id="btn_go_shareboard" onclick="location.href='<%=url%>/index.jsp?main=shareboard/shareboardlist.jsp'">공유게시판</button>
<div>
	<img src="image/jejuisland_dark_cut.png" style="max-width: 100%;height: auto;">
</div>

</body>
</html>