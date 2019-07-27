<%@page contentType="text/html;charset=EUC-KR"%>
<jsp:useBean id="mgr" class="store.cartoonMgr"/>
<%
	    request.setCharacterEncoding("EUC-KR");
		String id = (String)session.getAttribute("idKey");
		int pos = Integer.parseInt(request.getParameter("pos"));
		String comment = request.getParameter("comment");
		String msg="업로드 실패";
		String location="cartoon.jsp";
		
		if(id==null||id==""){
			msg = "로그인을 해주세요";
			location="login.jsp";
		}else{
		boolean replyflag = mgr.replyUpload(id, pos, comment);
			if(replyflag ){
				msg = "댓글이 성공적으로 업로드 되었습니다.";
			}	
		}
		
%>
<script>

location.href = "<%=location %>";
</script>