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
<button id="btn_go_jeju" onclick="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=jeju'">제주시</button>
<button id="btn_go_jocheon" onclick="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=jocheon'">조천읍</button>
<button id="btn_go_gujwa" onclick="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=gujwa'">구좌읍</button>
<button id="btn_go_sungsan" onclick="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=sungsan'">성산읍</button>
<button id="btn_go_pyoseon" onclick="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=pyoseon'">표선면</button>
<button id="btn_go_namwon" onclick="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=namwon'">남원읍</button>
<button id="btn_go_seogwipo" onclick="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=seogwipo'">서귀포시</button>
<button id="btn_go_andeok" onclick="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=andeok'">안덕면</button>
<button id="btn_go_daecheong" onclick="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=daecheong'">대청읍</button>
<button id="btn_go_hangyeong" onclick="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=hanggyeong'">한경면</button>
<button id="btn_go_hanrim" onclick="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=hanrim'">한림읍</button>
<button id="btn_go_aewol" onclick="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=aewol'">애월읍</button>
</body>
</html>