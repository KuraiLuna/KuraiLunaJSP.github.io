<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html;charset=EUC-KR"%>
<jsp:useBean id="mgr" class="store.RegisterMgr"/>
<%
	    request.setCharacterEncoding("EUC-KR");
		///////	////////////��й�ȣ ã�� //////////////////////
		String find2_name =request.getParameter("find2_name");
		String find2_id =request.getParameter("find2_id");
		String find2_phone =request.getParameter("find2_phone");
		String find2_birth =request.getParameter("find2_birth");
		String pass = mgr.passFind(find2_name,find2_id, find2_phone, find2_birth);
		 
%>
<html>
<body  align="center">
<%if(pass==null){%>
	������ �ùٸ��� �ʽ��ϴ�.
<%}else { %>
<%=find2_name%>���� ��й�ȣ�� '<b><%=pass%></b>' �Դϴ�.<%} %>
</body>
</html>