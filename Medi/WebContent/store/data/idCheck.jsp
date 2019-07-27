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
		out.println("8글자 이상 입력해주세요. ");
	}else if(result){
		out.println(id+"는 이미 존재하는 ID입니다.");
	}else{
		out.println(id+"는 사용 가능합니다. ");
	}
%>
<a href="#" onclick="self.close()">닫기</a>
</div>
</body>
