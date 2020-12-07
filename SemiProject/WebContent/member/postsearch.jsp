<%@page import="java.util.ArrayList"%>
<%@page import="data.dto.ZipcodeDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/member/css/2bootstrap.min.css"> --%>

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="shortcut icon" href="../image/favicon.ico">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/member/css/postsearch.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/member/js/postsearch.js" ></script>
<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function() {
			let txtRegion = document.getElementById("regionName");
			region = document.getElementById("regionName").value;
			
			txtRegion.addEventListener("keyup", function(e) {
					ShowAddr(this.value);
			});
			
			$(document).on('click','.sgLi', function(event) {
				let first = $(this).children(".sgIitem").children(".strongWord").html();
				alert(first);
				first = first.replace(/&nbsp;/g, ' ');
				alert(first);
				txtRegion.value = first;
				$(".btnSearch:button").trigger("click");
				/* let spanShow = document.getElementsByClassName("show");
				spanShow.setAttribute("label-value", inTxt);
				alert(txtRegion.getAttribute("value")); */
			});
	});
	
 	function ShowAddr(r) {
 		/*
 			초성 중성 종성 분리 하기
 			
 			유니코드 한글은 0xAC00 으로부터
 			초성 19개, 중성21개, 종성28개로 이루어지고
 			이들은 조합한 11,172개의 문자를 갖는다.
 			
 			한글코드의 값 = ((초성 * 21) + 중성) * 28 + 종성 + 0xAC00
 			(0xAC00은 'ㄱ'의 코드값)
 			
 			따라서 다음과 같은 계산 식이 구해진다.
 			유니코드 한글 문자 코드 값이 X일 때,
 			
 			초성 = ((X - 0xAC00) / 28) / 21
 			중성 = ((X - 0xAC00) / 28) % 21
 			종성 = (X - 0xAC00) % 28
 			
 			이 때 초성, 중성, 종성의 값은 각 소리 글자의 코드값이 아니라
 			이들이 각각 몇 번째 문자인가를 나타내기 때문에 다음과 같이 다시 처리한다.
 			
 			초성문자코드 = 초성 + 0x1100 //('ㄱ')
 			중성문자코드 = 중성 + 0x1161 //('ㅏ')
 			종성문자코드 = 종성 + 0x11A8 - 1 // (종성이 없는 경우가 있으므로 1을 뺌)
 		*/
		/* alert("onkeyUp이 작동되었습니다."); */
		let aFront = ["ㄱ","ㄲ","ㄴ","ㄷ","ㄸ","ㄹ","ㅁ","ㅂ","ㅃ","ㅅ","ㅆ","ㅇ","ㅈ","ㅉ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"];
		let aMiddle = ["ㅏ","ㅐ","ㅑ","ㅒ","ㅓ","ㅔ","ㅕ","ㅖ","ㅗ","ㅘ","ㅙ","ㅚ","ㅛ","ㅜ","ㅝ","ㅞ","ㅟ","ㅠ","ㅡ","ㅢ","ㅣ"];
		let aBack = ["","ㄱ","ㄲ","ㄳ","ㄴ","ㄵ","ㄶ","ㄷ","ㄹ","ㄺ","ㄻ","ㄼ","ㄽ","ㄾ","ㄿ","ㅀ","ㅁ","ㅂ","ㅄ","ㅅ","ㅆ","ㅇ","ㅈ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"];
		let aFsearch = ["가","까"," ","나"," "," ","다","따","라"," "," "," "," "," "," "," ","마","바","빠"," ","사","싸","아","자","짜","차","카","타","파","하"];
		
		let front;
		let middle;
		let back;
		
		let fN=19;//초성
		let mN=21;//중성
		let bN=28;//종성
		
		/* alert(r); */
		
		let sWord=r;
		/* for(var i=0 ; i < sWord.length ; i=i+1){
			let sTemp=sWord.charCodeAt(i) - 0xAC00;
			back=sTemp % bN;//종성
			middle=((sTemp-back)/bN) % mN;//중성
			front=(((sTemp-back)/bN) - middle)/mN;//초성
			
			console.log(
					"초성:"+aFront[front]+"\n"
					+"중성:"+aMiddle[middle]+"\n"
					+"종성:"+aBack[back]
			);			
		} */
		
		console.log("입력한 글자는 : " + r);
		console.log("16진수로는 : " + r.charCodeAt(0).toString(16));
		if(r.charCodeAt(0).toString(16) < "ac00"){
			let start=r.charCodeAt(0) - 0x3131;
			console.log("시작번지는 : " + start);
			let startHan= aFsearch[start];
			console.log("시작글자는 : " + startHan);
			for(var i=0 ; i < aFront.length ; i=i+1){
				if(r==aFront[i]){
					var fIndex = i;
				}
			}
			let end=0xAC00 + (fIndex * 21 * 28) + ((aMiddle.length - 1) * 28) + (aBack.length - 1);
			end = String.fromCharCode(end);
			console.log("끝 글자는 : " + end);
			/* console.log("가보다 작습니다."); */
			$.ajax({
				type: "get",
				url: "searchAddr.jsp",
				dataType: "xml",
				data: {"start":startHan,"end":end},
				success: function(data){
					var info = "";
					info = info + "<div class='popDownAddr'>";
					info = info + "<ul>";
					$(data).find("address").each(function(i, element) {
						info = info + "<li class='sgLi'>";
						info = info + "<a class='sgIitem' href='javascript:;' onclick='return false;'>";
						info = info + "<strong class='strongWord'>";
						info = info + $(this).find("sido").text() + "&nbsp;" + $(this).find("gugun").text() + "&nbsp;" + $(this).find("dong").text();
						info = info + "</strong>";
						info = info + "</a>";
						info = info + "<button type='button' class='sgBtnAdd'>";
						info = info + "<span class='ft'>↖</span>"
						info = info + "</button>";
						info = info + "</li>";
					});
					info = info + "</ul>";
					info = info + "</div>";
					$(".popSuggestTen").html(info);
				}
			});
		}
		else if(r.charCodeAt(0) - 44032 >= 0){
			let back = (r.charCodeAt(0) - 0xAC00) %28;
			console.log("종성위치는 : " + back);
			if(back==0){
				let end = r.charCodeAt(0) +27;
				console.log("끝글자 코드는 : " + end);
				end = String.fromCharCode(end);
				console.log("끝글자는 : " + end);
				$.ajax({
					type: "get",
					url: "searchAddr.jsp",
					dataType: "xml",
					data: {"start":r,"end":end},
					success:function(data){
						var info = "";
						info = info + "<div class='popDownAddr'>";
						info = info + "<ul>";
						$(data).find("address").each(function(i, element) {
							info = info + "<li class='sgLi'>";
							info = info + "<a class='sgIitem' href='javascript:;' onclick='return false;'>";
							info = info + "<strong class='strongWord'>";
							info = info + $(this).find("sido").text() + "&nbsp;" + $(this).find("gugun").text() + "&nbsp;" + $(this).find("dong").text();
							info = info + "</strong>";
							info = info + "</a>";
							info = info + "<button type='button' class='sgBtnAdd'>";
							info = info + "<span class='ft'>↖</span>"
							info = info + "</button>";
							info = info + "</li>";
						});
						info = info + "</ul>";
						info = info + "</div>";
						$(".popSuggestTen").html(info);
					}
				});
			}
			else{
				console.log("찾을 조합글자는 : " + r);
				$.ajax({
					type: "get",
					url: "searchAddr.jsp",
					dataType: "xml",
					data: {"region":r},
					success:function(data){
						var info = "";
						info = info + "<div class='popDownAddr'>";
						info = info + "<ul>";
						$(data).find("address").each(function(i, element) {
							info = info + "<li class='sgLi'>";
							info = info + "<a class='sgItem' href='javascript:;' onclick='return false;'>";
							info = info + "<strong class='strongWord'>";
							info = info + $(this).find("sido").text() + "&nbsp;" + $(this).find("gugun").text() + "&nbsp;" + $(this).find("dong").text();
							info = info + "</strong>";
							info = info + "</a>";
							info = info + "<button type='button' class='sgBtnAdd'>";
							info = info + "<span class='ft'>↖</span>"
							info = info + "</button>";
							info = info + "</li>";
						});
						info = info + "</ul>";
						info = info + "</div>";
						$(".popSuggestTen").html(info);
					}
				});
			}
		}
		
	}
 	
 	function popDownSubmit() {
 		document.getElementById("searchForm").submit();
 	}
</script>
<title>멘도롱 또똣 :: 우편번호 보기</title>
</head>
<body>
	<div class="popupPost">
		<div class="popHead">
			<form action="postsearch.jsp" method="get" id="searchForm" class="formSearch">
				<fieldset class="postFld">
					<div class="postSearch">
						<div class="wrapAddress">
							<label class="fs">
								<div class="ipWrapper">
									<input type="text" id="regionName" 
									class="findRegion" name="regionName"
									value="" autocomplete="off" required="required"
									autofocus="autofocus"
									placeholder=" "></input>
									<span class="placeholder show" label-value="예) 서초구 강남대로459 백암빌딩"></span>
								</div>
							</label>
							<input type="hidden" name="key" value="result">
							<button type="submit" class="btnSearch" id="btnSearch">
								<svg width="1em" height="1em" viewBox="0 0 16 16" 
								class="bi bi-search imgPost" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
								  <path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/>
								  <path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
								</svg>
							</button>
						</div>
					</div>
				</fieldset>
			</form>
		</div>
		<div class="popSuggestTen">
		</div>
	<%
	String key=request.getParameter("key");
	if(key==null)
	{
		//검색폼
	%>
		<div class="popBody">
			<div class="Postinfo">
				<!-- <p class="infoWrite">아래와 같이 검색하세요.</p>
				<p class="infoWrite">도로명 + 건물번호</p>
				<span class="txtInfo">예) 강남대로 459,&nbsp;&nbsp;영동대로 220</span>
				<p class="infoWrite2">지역명(동/리) + 번지</p>
				<span class="txtInfo">예) 서초동 269-4,&nbsp;&nbsp;귤현동 234-7</span>
				<p class="infoWrite2">지역명(동/리) + 건물명(아파트명)</p>
				<span class="txtInfo">예) 분당 주공,&nbsp;&nbsp;귤현동 힐타운11차</span>
				<p class="infoWrite2">사서함명 + 번호</p>
				<span class="txtInfo">예) 강릉우체국사서함 1~100</span> -->
			</div>
		</div>
	<%}
	else
	{//결과
		String regionName=request.getParameter("regionName");
		System.out.println(regionName);
		String addrArr[] = regionName.split(" ");
		System.out.println("addrArr배열의 길이는 " + addrArr.length + "입니다");
		for(int i=0 ; i < addrArr.length ; i = i + 1)
		{
			System.out.println(addrArr[i]);
		}
		String imsi="";
		String inputDong="";
		String cfpost="";
		if(addrArr.length>1)
		{
			imsi=addrArr[2].substring(addrArr[2].length()-1, addrArr[2].length());
			System.out.println(imsi);
			cfpost=addrArr[2].substring(addrArr[2].length()-3, addrArr[2].length());
			
			if(cfpost.equals("사서함"))
			{
				inputDong=addrArr[2];
			}
			else
			{
				if(imsi.equals("동"))
					inputDong=addrArr[2].substring(0, addrArr[2].length()-1);
				else if(imsi.equals("면"))
					inputDong=addrArr[2].substring(0, addrArr[2].length()-1);
				else if(imsi.equals("가"))
					inputDong=addrArr[2].substring(0, addrArr[2].length()-1);
							
				System.out.println(inputDong);
			}
		}
		//dao 선언
		MemberDao dao=new MemberDao();
		
		//메서드 호출
		//List<ZipcodeDto> list=dao.getSearchDong(regionName);
		
		int totalCount=0;
		if(addrArr.length>1)
		{
			totalCount=dao.getFullTotalCount(addrArr[0], addrArr[1], inputDong);
		}
		else if(addrArr.length==1)
		{
			totalCount = dao.getTotalCount(regionName);
			System.out.println(totalCount);
		}
		int perPage = 13; //한페이지당 보여질 글의 갯수
		int perBlock = 1; //한블럭당 출력할 페이지의 갯수
		
		int totalPage;//총 페이지의 갯수
		int startPage;//각 블럭당 시작할 페이지번호
		int endPage;//각 블럭당 끝 페이지번호
		int start;//각 블럭당 불러올 글의 시작번호
		int end;//각 블럭당 불러올 글의 끝번호
		int currentPage;//현재 보여질 페이지 번호
		
		//현재 페이지 번호 구하기
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null)
			currentPage = 1;//페이지번호가 없을경우 무조건 1페이지로 간다
		else
			currentPage = Integer.parseInt(pageNum);
		//총 페이지 구하기(예: 총글수가 9 이구 한페이지당 2개씩 볼경우)
		totalPage=totalCount/perPage+(totalCount%perPage>0?1:0);
		//시작페이지와 끝페이지구하기
		//예:한페이지당 3개만 볼경우 현재 페이지가 2라면 sp:1, ep:3
		//현재 페이지가 7라면 sp:7, ep:9
		startPage=(currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;
		//마지막 블럭은 endPage 를 totalPage 로 해놔야 한다
		if(endPage>totalPage)
			endPage=totalPage;
		
		//각 페이지에서 불러올 글번호 구하기
		//예 : 1페이지: 1~2,2페이지 : 3~4....
		start=(currentPage-1)*perPage+1;
		end=start+perPage-1;
		//마지막 글번호는 총 글수와 같은 번호라야 한다
		if(end>totalCount)
			end=totalCount;
		
		List<ZipcodeDto>list=dao.getList(start, end, regionName);
		//최종 페이지에 해당하는 방명록 글 가져오기
		if(addrArr.length==3)
			list=dao.getFullslist(start, end, addrArr[0], addrArr[1], inputDong);
		//출력
	%>
		<div><b>검색결과</b></div>
		<div class="wholeAddr">주소 전체</div>
		<ul class="addrList">
			<%
			for(ZipcodeDto dto:list)
			{
				//보일때는 번지까지
				String addr1="("+dto.getZipcode()+")"
				+dto.getSido()+" "+dto.getGugun()
				+" "+dto.getDong()+" "+dto.getRi()
				+" "+dto.getBunji();
				//실제 적용은 번지 제외
				String addr2="("+dto.getZipcode()+")"
				+dto.getSido()+" "+dto.getGugun()
				+" "+dto.getDong()+" "+dto.getRi();
			%>
			<li class="addrRoll">
				<span class="postCode"><%=dto.getZipcode()%></span>
				<dl class="addrShow">
					<dt class="wrAddr"><span>주소</span></dt>
					<dd class="addrInfo">
						<button class="optAddress" onclick="select('<%=addr2%>')">
							<span class="txtAddr"><%=addr1%></span>
						</button>
					</dd>
				</dl>	
			</li>
			<%}
			%>
		</ul>
		<div class="addrPage">
			<div class="addrPgIn">
				<%
				//이전
				if(startPage>1)
				{%>
					<a href="<%=request.getContextPath()%>/member/postsearch.jsp?pageNum=<%=startPage-1%>&regionName=<%=regionName%>&key=result" class="prevPage pageArrow">
						<span class="glyphicon glyphicon-arrow-left"></span>
					</a>	
				<%}
				
				for(int i=startPage;i<=endPage;i=i+1)
				{
					//이동할 페이지
					String url =request.getServerName()+":"+request.getLocalPort()+request.getContextPath()+"/member/postsearch.jsp?pageNum="+i+"&regionName='"+regionName+"'&key=result";
					System.out.println(url);
					if(i==currentPage)
					{%>
						<a href="<%=url%>" class="currPage"><span class="showNum">&nbsp;<span class="inShowNum"><%=i%></span></span>&nbsp;/&nbsp;<%=totalPage%></span></a>	
					<%}
					else
					{%>
						<a href="<%=url%>" class="otherPage"><span><%=i%></span></a>
					<%}
				}
				
				//다음
				if(endPage<totalPage)
				{%>
					<a href="<%=request.getContextPath()%>/member/postsearch.jsp?pageNum=<%=endPage+1%>&regionName=<%=regionName%>&key=result" class="nextPage pageArrow">
						<span class="glyphicon glyphicon-arrow-right"></span>
					</a>
				<%}
				%>
			</div>
		</div>
	<%}
%>
		<div class="popupFoot">
			<span class="innerFooter">
				<strong class="ddoddot">멘도롱 또똣</strong>
			</span>
		</div>
	</div>
</body>
</html>
