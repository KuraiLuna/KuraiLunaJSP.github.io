<%@page contentType="text/html;charset=EUC-KR"%>
<jsp:useBean id="mgr" class="store.cartoonMgr"></jsp:useBean>
<%
	    request.setCharacterEncoding("EUC-KR");
		int snum = Integer.parseInt(request.getParameter("snum"));
		 mgr.cartoonDelete(snum);
		
%>
<script>
alert("�Խù��� �����Ǿ����ϴ�.");
location.href="cartoon.jsp";
</script>