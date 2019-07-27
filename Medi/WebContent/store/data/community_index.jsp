<%@page contentType="text/html;charset=EUC-KR"%>
<%
	    request.setCharacterEncoding("EUC-KR");
	
%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Medi</title>
		<link href="css/reset.css" rel="stylesheet" type="text/css">
		<link href="css/community_main.css" rel="stylesheet" type="text/css">
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="js/community_main.js" type="text/javascript"></script>
	</head>
	
	<body>
		<div id="wrap">
		<%@ include file="header.jsp" %>
		

		
		<section id="cm_main">
			<div id="cm_main_in">
				<div id="cm_main_img">
					<img width="540px" height="385px" src="imgs/cm_main_img.jpg" alt="main image"/>
				</div>
				<div id="cm_event">
					<ul class="event_img">
						<li class="event01"><a href="#"><img src="imgs/cm_event01.png" alt="event01"/></a></li>
						<li class="event02"><a href="#"><img src="imgs/cm_event02.png" alt="event01"/></a></li>
						<li class="event03"><a href="#"><img src="imgs/cm_event03.png" alt="event01"/></a></li>
					</ul>
					
					
					<ul class="ev_btn">
						<li><a href="#">　</a></li>
						<li><a href="#">　</a></li>
						<li><a href="#">　</a></li>
					</ul>
				</div>
			</div>
		</section>
						

				
		<section id="cm_story">
			<div id="cm_story_in">
				<diV class="ttl_box">
					<h3 class="con_ttl">오늘의 일러스트</h3>
					<span><a href="#" class="show_all">더보기</a></span>
				</diV>
				
				<ul class="story_list">
					<%for(int i=0; i<3; i++){ %> <!-- int i=0; i<3; i++ -->
					<li>
						<a href="#">
							<img src="imgs/story_img01.png" alt="" width="245px" height="235px"/>
						</a>
						<p class="s_txt">#게임 콜라보</p>
						<h4 class="s_title">푸리코네 & Re:Zero</h4>
						<span class="s_id">Natalie</span>
					</li>
					
					<%} %>

				</ul>
			<!--  -->				
			</div>
		</section>
		
		<section id="cm_pic">
			<div id="cm_pic_in">
				<diV class="ttl_box">
					<h3 class="con_ttl">오늘의 만 화</h3>
					<span><a href="#" class="show_all">더보기</a></span>
				</diV>
				
				<ul class="pic_list">
					<%for(int i=0; i<8; i++){ %>
					<li>
						<a href="#">
							<img src="imgs/pic_img01.jpg" alt="pic"/>
							<span class="pic_user_id">큐라레 마법도서관</span>
						</a>
					</li>
					<%} %>
				</ul>
			</div>
		</section>
			
		<div class="cm_info_box">
			<div class="cm_info_img">
				<a href="store_index.jsp">
					<img src="imgs/cm_info_box.jpg" alt="store infomation image"/>
				</a>
			</div>
		</div>
			
		<section id="cm_product">
			<div id="cm_product_in">
				<ul class="cm_p_list">
					<%for(int i=0; i<12; i++){ %>
					<li>
						<a href="#">
							<img src="imgs/P_IMG.jpg" alt="" width="245px" height="235px"/>
						</a>
						<p class="p_name">[마비노기]SD나오 피규어</p>
						<span class="p_price">4</span>
						<span class="won">$</span>
					</li>
					<%} %>
				</ul>
			</div>
		</section>
		
		<%@ include file="footer.jsp" %>
	</div>
	</body>
</html>