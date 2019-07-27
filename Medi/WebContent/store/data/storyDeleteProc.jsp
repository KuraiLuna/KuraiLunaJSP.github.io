<%@page contentType="text/html;charset=EUC-KR"%>
<jsp:useBean id="mgr" class="store.StoryMgr"></jsp:useBean>
<%
	    request.setCharacterEncoding("EUC-KR");
		int snum = Integer.parseInt(request.getParameter("snum"));
		 mgr.storyDelete(snum);
		
%>
<script>
alert("게시물이 삭제되었습니다.");
location.href="story_main.jsp";
</script>