<%@page contentType="text/html;charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<%
	String id = (String)session.getAttribute("idKey");
	String sessionId = session.getId();
	//String name = (String)session.getAttribute("name");
	
	String log="";
	if(id == null) log ="<a href='login.jsp'>로그인</a>";
	else log = "<a href='logout.jsp'>로그아웃</a>";

	String reg="";
	if(id == null) reg ="<a href='member.jsp'>회원가입</a>";
	//else reg = "<a href='memberUpdate.jsp'>회원수정</a>";
%>
<html>
<head>
<link href="css/reset.css" rel="stylesheet" type="text/css">
	<link href="css/header1.css" rel="stylesheet" type="text/css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="js/header.js" type="text/javascript"></script>
	
</head>
<body>

<header id="header">

			<h1 id="logo"><a href="store_index.jsp"><img src="imgs/logo.png" alt="homestar logo"/></a></h1>
			<nav>
				<ul class="nav">
					<li class="nav_mn"><a href="community.jsp">커뮤니티</a>
						<ul class="sub_mn">
							<li><a href="community.jsp">홈</a></li>
							<li><a href="cartoon.jsp">만 화</a></li>
							<li><a href="story_main.jsp"><font size="3" face="돋움">일러스트</font></a></li>
						</ul>
					</li>
					<!-- <li class="nav_mn"><a href="store_index.jsp">굿즈스토어</a>
						<ul class="sub_mn">
							<li><a href="product_list.jsp">전체상품</a></li>
							<li><a href="product_best.jsp">베스트</a></li>
							<li><a href="product_list.jsp?category=cartoon">만 화</a></li>
							<li><a href="product_list.jsp?category=gundam_rilakkuma">건 담·리락쿠마</a></li>
							<li><a href="product_list.jsp?category=userdiy">유저DIY</a></li>
						</ul>
					</li> -->
				</ul>
			</nav>
			
			<div class="info_mn">
				<div class="search">
					<img class="search_img" src="imgs/search_img.png" alt="search img"/>
					<input type="text" class="info_search" name="search">
				</div>
				
				<a href="#" class="info_w"><img src="imgs/info_write.png"/></a>
				<!-- <a href="cart.jsp" class="info_c"><img src="imgs/info_cart.png"/></a> -->
				
				<ul class="login">
				<%if(id != null){%>
					<li><a href="mypage.jsp">마이페이지</a></li>
				<%}%>
					<li><%=log %></li>
					
				</ul>
			</div>
		</header>
</body>
</html>