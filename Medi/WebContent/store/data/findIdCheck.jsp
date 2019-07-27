<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html;charset=EUC-KR"%>
<jsp:useBean id="mgr" class="store.RegisterMgr"/>
<%
	    request.setCharacterEncoding("EUC-KR");
		///////	////////////아이디 찾기 //////////////////////
		String find_name =request.getParameter("find_name");
		String find_phone =request.getParameter("find_phone");
		String find_birth =request.getParameter("find_birth");
		ArrayList id = mgr.idFind(find_name, find_phone, find_birth);
		
%>
<html>
<body align="center">
<%if(id.isEmpty()){%>
	정보가 올바르지 않습니다.
<%}else { %>
<%=find_name%>님의 아이디는 
<%for(int i = 0; i<id.size();i++){%>
'<b><%=id.get(i)%>'</b> 
<%}%>입니다.<%} %>
</body>
</html>