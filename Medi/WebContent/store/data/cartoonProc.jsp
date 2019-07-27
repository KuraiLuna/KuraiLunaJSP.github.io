<!-- cartoonProc.jsp -->
<%@page import="java.io.File"%>
<%@page import="store.cartoonBean"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page contentType="text/html;charset=EUC-KR"%>
<jsp:useBean id="mgr" class="store.cartoonMgr"/>
<%

	    request.setCharacterEncoding("EUC-KR");
		boolean result = mgr.cartoonUpload(request);
		if(result){
			response.sendRedirect("cartoon.jsp");
		}else{
			response.sendRedirect("cartoon_write.jsp");%>
			<script>
				alert("업로드 실패");
			</script>
		<%}
%>
