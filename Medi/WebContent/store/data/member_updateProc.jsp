<%@page contentType="text/html;charset=EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="store.RegisterMgr"/>
<jsp:useBean id="logbean" class="store.LoginBean"/>
<jsp:setProperty property ="*" name = "logbean"/>
<%
	
	boolean successUpdate= mgr.updateRegister(logbean);
	String location = "member_update.jsp";
	String msg = "ȸ������ ������ �����߽��ϴ�.";
	if(successUpdate){
		//location = "store_index.jsp";
		location = "community.jsp";
		msg = "ȸ�������� �����Ǿ����ϴ�.";
	}
%>
<script>
	alert("<%=msg%>");
	location.href ="<%=location%>";
</script>


