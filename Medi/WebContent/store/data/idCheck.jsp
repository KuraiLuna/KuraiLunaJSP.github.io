<%@page contentType="text/html;charset=EUC-KR"%>
<jsp:useBean id="mgr" class="store.RegisterMgr"></jsp:useBean>
<%
	    request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("id");
		boolean result = mgr.checkId(id);
%>


<body >
<div align="center">
<!-- <b><%=id%></b> -->
<%
	if(id.length()<8){
		out.println("8���� �̻� �Է����ּ���. ");
	}else if(result){
		out.println(id+"�� �̹� �����ϴ� ID�Դϴ�.");
	}else{
		out.println(id+"�� ��� �����մϴ�. ");
	}
%>
<a href="#" onclick="self.close()">�ݱ�</a>
</div>
</body>
