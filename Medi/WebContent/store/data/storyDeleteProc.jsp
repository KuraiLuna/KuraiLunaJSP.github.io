<%@page contentType="text/html;charset=EUC-KR"%>
<jsp:useBean id="mgr" class="store.StoryMgr"></jsp:useBean>
<%
	    request.setCharacterEncoding("EUC-KR");
		int snum = Integer.parseInt(request.getParameter("snum"));
		 mgr.storyDelete(snum);
		
%>
<script>
alert("�Խù��� �����Ǿ����ϴ�.");
location.href="story_main.jsp";
</script>