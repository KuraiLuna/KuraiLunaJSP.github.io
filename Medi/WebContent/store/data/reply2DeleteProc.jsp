<%@page contentType="text/html;charset=EUC-KR"%>
<jsp:useBean id="mgr" class="store.cartoonMgr"/>
<%
	    request.setCharacterEncoding("EUC-KR");
		int pos  = Integer.parseInt(request.getParameter("pos"));
		String comment = request.getParameter("comment").trim();
		
		boolean deleteflag = mgr.replyDelete(pos, comment);
		String msg = "��� ���� ����";
		String location ="cartoon.jsp";
		if(deleteflag){
			msg = "����� �����Ǿ����ϴ�.";
		}
%>
<script>
alert("<%=msg%>");
location.href="<%=location%>";
</script>