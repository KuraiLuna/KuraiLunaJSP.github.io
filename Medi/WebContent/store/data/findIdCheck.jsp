<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html;charset=EUC-KR"%>
<jsp:useBean id="mgr" class="store.RegisterMgr"/>
<%
	    request.setCharacterEncoding("EUC-KR");
		///////	////////////���̵� ã�� //////////////////////
		String find_name =request.getParameter("find_name");
		String find_phone =request.getParameter("find_phone");
		String find_birth =request.getParameter("find_birth");
		ArrayList id = mgr.idFind(find_name, find_phone, find_birth);
		
%>
<html>
<body align="center">
<%if(id.isEmpty()){%>
	������ �ùٸ��� �ʽ��ϴ�.
<%}else { %>
<%=find_name%>���� ���̵�� 
<%for(int i = 0; i<id.size();i++){%>
'<b><%=id.get(i)%>'</b> 
<%}%>�Դϴ�.<%} %>
</body>
</html>