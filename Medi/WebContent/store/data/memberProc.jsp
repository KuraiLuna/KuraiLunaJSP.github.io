<%@page contentType="text/html;charset=EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="store.RegisterMgr"/>
<jsp:useBean id="logbean" class="store.LoginBean"/>
<jsp:setProperty property ="*" name = "logbean"/>
<%
	
	String id= mgr.insertResiter(logbean);
	String location = "member.jsp";
	if(id!=null){
		location = "success.jsp?id="+id;
	}
%>
<script>
	<%
		if(id==null){%>
			alert("ȸ�����Կ� �����Ͽ����ϴ�.");
		<%}
	%>
	location.href = "<%=location%>";
</script>


