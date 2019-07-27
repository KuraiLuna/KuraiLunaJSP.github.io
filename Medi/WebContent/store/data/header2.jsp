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
					<li class="nav_mn"><a href="community_index.jsp">Ŀ�´�Ƽ</a>
						<ul class="sub_mn">
							<li><a href="community_index.jsp">Ȩ</a></li>
							<li><a href="#">����</a></li>
							<li><a href="#">���丮</a></li>
							<li><a href="#">������ �亯</a></li>
						</ul>
					</li>
					<li class="nav_mn"><a href="store_index.jsp">�����</a>
						<ul class="sub_mn">
							<li><a href="product_list.jsp">��ü��ǰ</a></li>
							<li><a href="#">����Ʈ</a></li>
							<li><a href="product_list.jsp?category=����">����</a></li>
							<li><a href="product_list.jsp?category=����">����</a></li>
							<li><a href="product_list.jsp?category=�ֹ�">�ֹ�</a></li>
							<li><a href="product_list.jsp?category=��Ȱ����">��Ȱ������</a></li>
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
					<li><a href=login.jsp>�α���</a></li>
					<li><a href=member.jsp>ȸ������</a></li>
				</ul>
			</div>
		</header>
</body>
</html>