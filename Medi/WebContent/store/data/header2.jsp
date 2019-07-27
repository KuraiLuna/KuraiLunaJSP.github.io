<%@page contentType="text/html;charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
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
					<li class="nav_mn"><a href="community_index.jsp">커뮤니티</a>
						<ul class="sub_mn">
							<li><a href="community_index.jsp">홈</a></li>
							<li><a href="#">사진</a></li>
							<li><a href="#">스토리</a></li>
							<li><a href="#">질문과 답변</a></li>
						</ul>
					</li>
					<li class="nav_mn"><a href="store_index.jsp">스토어</a>
						<ul class="sub_mn">
							<li><a href="product_list.jsp">전체상품</a></li>
							<li><a href="#">베스트</a></li>
							<li><a href="product_list.jsp?category=가구">가구</a></li>
							<li><a href="product_list.jsp?category=가전">가전</a></li>
							<li><a href="product_list.jsp?category=주방">주방</a></li>
							<li><a href="product_list.jsp?category=생활수납">생활·수납</a></li>
						</ul>
					</li>
				</ul>
			</nav>
			
			<div class="info_mn">
				<div class="search">
					<img class="search_img" src="imgs/search_img.png" alt="search img"/>
					<input type="text" class="info_search" name="search">
				</div>
				
				<a href="#" class="info_w"><img src="imgs/info_write.png"/></a>
				<a href="cart.jsp" class="info_c"><img src="imgs/info_cart.png"/></a>
				
				<ul class="login">
					<li><a href=login.jsp>로그인</a></li>
					<li><a href=member.jsp>회원가입</a></li>
				</ul>
			</div>
		</header>
</body>
</html>