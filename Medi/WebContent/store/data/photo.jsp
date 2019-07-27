<%@page contentType="text/html;charset=EUC-KR"%>
<%@ page import="java.util.*,store.*"%>
<%@page import="store.StoryBean"%>
<% request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="store.StoryMgr"/>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link href="css/reset.css" rel="stylesheet" type="text/css">
<link href="css/photo.css" rel="stylesheet" type="text/css">
    </head>
<body>
<div id="wrap">
<%@ include file="header.jsp" %>
<div id="container">
    <div class="photo_list_title">
        <p class="title">사진 모아보기</p>
        <hr>
    </div>
    
    <div id="photo_list">
        <ul class="list_01">
        <%
		Vector<StoryBean> storyList = mgr.storyList(); 
		
		for (int i = 0; i < storyList.size(); i++) {
			StoryBean story = storyList.get(i);
		    %>
        <li><img src="imgs/<%=story.getImgname()%>"/></li>
<%
}
%>
        </ul>
        </div>
        </div>
</div>
</body>
</html>