<%@page contentType="text/html;charset=EUC-KR"%>
<jsp:useBean id="mgr" class="store.cartoonMgr"/>
<%
	    request.setCharacterEncoding("EUC-KR");
		String id = (String)session.getAttribute("idKey");
		int pos = Integer.parseInt(request.getParameter("pos"));
		String comment = request.getParameter("comment");
		String msg="���ε� ����";
		String location="cartoon.jsp";
		
		if(id==null||id==""){
			msg = "�α����� ���ּ���";
			location="login.jsp";
		}else{
		boolean replyflag = mgr.replyUpload(id, pos, comment);
			if(replyflag ){
				msg = "����� ���������� ���ε� �Ǿ����ϴ�.";
			}	
		}
		
%>
<script>

location.href = "<%=location %>";
</script>