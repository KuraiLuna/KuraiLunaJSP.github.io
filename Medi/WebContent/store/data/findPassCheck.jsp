<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html;charset=EUC-KR"%>
<jsp:useBean id="mgr" class="store.RegisterMgr"/>
<%
	    request.setCharacterEncoding("EUC-KR");
		///////	////////////비밀번호 찾기 //////////////////////
		String find2_name =request.getParameter("find2_name");
		String find2_id =request.getParameter("find2_id");
		String find2_phone =request.getParameter("find2_phone");
		String find2_birth =request.getParameter("find2_birth");
		String pass = mgr.passFind(find2_name,find2_id, find2_phone, find2_birth);
		 
%>
<html>
<body  align="center">
<%if(pass==null){%>
	정보가 올바르지 않습니다.
<%}else { %>
<%=find2_name%>님의 비밀번호는 '<b><%=pass%></b>' 입니다.<%} %>
</body>
</html>