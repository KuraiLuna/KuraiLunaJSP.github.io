<%@page contentType="text/html;charset=EUC-KR"%>
<jsp:useBean id="mgr" class="store.StoryMgr"/>
<%
	    request.setCharacterEncoding("EUC-KR");
		int pos  = Integer.parseInt(request.getParameter("pos"));
		String comment = request.getParameter("comment").trim();
		
		boolean deleteflag = mgr.replyDelete(pos, comment);
		String msg = "댓글 삭제 실패";
		String location ="story_main.jsp";
		if(deleteflag){
			msg = "댓글이 삭제되었습니다.";
		}
%>
<script>
alert("<%=msg%>");
location.href="<%=location%>";
</script>