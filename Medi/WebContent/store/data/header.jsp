<%@page contentType="text/html;charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<%
	String id = (String)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
	
	String log="";
	if(id == null) log ="<a href=login.jsp>�α���</a>";
	else log = "<a href=logout.jsp>�α׾ƿ�</a>";

	String reg="";
	if(id == null) reg ="<a href=member.jsp>ȸ������</a>";
	else reg = "<a href=memberUpdate.jsp>ȸ������</a>";
%>
<html>
<head>
<link href="css/reset.css" rel="stylesheet" type="text/css">
	<link href="css/header.css" rel="stylesheet" type="text/css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="js/header.js" type="text/javascript"></script>
</head>
<body>
<header id="header">
			<h1 id="logo"><a href="community_index.jsp"><img src="imgs/logo.png" alt="homestar logo"/></a>&nbsp;&nbsp;</h1>
			<nav>
				<ul class="nav">
					<li class="nav_mn"><a href="community_index.jsp">Ŀ�´�Ƽ</a>
						<ul class="sub_mn">
							<li><a href="community_index.jsp">Ȩ</a></li>
							<li><a href="cartoon_logout.jsp">�� ȭ</a></li>
							<li><a href="story_main_logout.jsp"><font size="3" face="����">�Ϸ���Ʈ</font></a></li>
						</ul>
					</li>
					<!-- <li class="nav_mn"><a href="store_index.jsp">������</a> -->
						<!-- <ul class="sub_mn"> -->
							<!-- <li><a href="product_list_logout.jsp">��ü��ǰ</a></li> -->
							<!-- <li><a href="product_best_logout.jsp">����Ʈ</a></li> -->
							<!-- <li><a href="product_list_logout.jsp?category=cartoon">�� ȭ</a></li> -->
							<!-- <li><a href="product_list_logout.jsp?category=gundam_rilakkuma">�� �㡤��������</a></li> -->
							<!-- <li><a href="product_list_logout.jsp?category=userdiy">����DIY</a></li> -->
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
				<!-- <a href="cart.jsp" class="info_c"><img src="imgs/info_cart.png"/></a> -->
				
				<ul class="login">
				<%if(id != null){%>
					<li>ȯ���մϴ�. <a href="myPage.jsp"><%=name %>��</a></li>
				<%}%>
					<li><%=log %></li>
					<li><%=reg %></li>
				</ul>
			</div>
		</header>
</body>
</html>