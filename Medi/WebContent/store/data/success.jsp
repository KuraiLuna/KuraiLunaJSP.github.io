<%@page contentType="text/html;charset=EUC-KR"%>
<jsp:useBean id="mgr" class="store.RegisterMgr"/>
<%
	    request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("id");
		String name = mgr.getRegister(id).getName();
%>

<html>
	<head>
		<link href="css/reset.css" rel="stylesheet" type="text/css">
		<link href="css/success.css" rel="stylesheet" type="text/css">
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	</head>
	
	<body onload="sc()">
	<div id="wrap">
		<%@ include file="header2.jsp" %>
		
		<section id="contents">
			<div id="contents_in">
			<img class="logo" src="imgs/logo.png" alt="logo"/>
			<img class="ttl" src="imgs/success_ttl.jpg" alt="welcome"/>
			<p class="txt"><%=name %>님 회원가입을 축하합니다.<br/>
			메디 의 새로운 아이디는 <%=id %>입니다. </p>
			
			<a class="go_login" href="login.jsp">로그인 하기</a>
			</div>
		</section>
		
		
	</div>
	</body>
</html>