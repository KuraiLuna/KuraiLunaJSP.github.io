<%@page contentType="text/html;charset=EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="store.RegisterMgr"/>
<jsp:useBean id="logbean" class="store.LoginBean"/>
<jsp:setProperty property ="*" name = "logbean"/>
<%
	
	boolean successUpdate= mgr.updateRegister(logbean);
	String location = "member_update.jsp";
	String msg = "회원정보 수정에 실패했습니다.";
	if(successUpdate){
		//location = "store_index.jsp";
		location = "community.jsp";
		msg = "회원정보가 수정되었습니다.";
	}
%>
<script>
	alert("<%=msg%>");
	location.href ="<%=location%>";
</script>


