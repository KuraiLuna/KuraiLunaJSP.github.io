<!-- storyProc.jsp -->
<%@page import="java.io.File"%>
<%@page import="store.StoryBean"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page contentType="text/html;charset=EUC-KR"%>
<jsp:useBean id="mgr" class="store.StoryMgr"/>
<%

	    request.setCharacterEncoding("EUC-KR");
		boolean result = mgr.storyUpload(request);
		if(result){
			response.sendRedirect("story_main.jsp");
		}else{
			response.sendRedirect("story_write.jsp");%>
			<script>
				alert("업로드 실패");
			</script>
		<%}
%>
