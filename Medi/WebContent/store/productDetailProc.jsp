<%@page contentType="text/html;charset=EUC-KR"%>
<%@ page import="java.util.*,store.*"%>
<%@page import="store.ProductBean"%>
<jsp:useBean id="proMgr" class="store.ProductMgr" />
<%
	    request.setCharacterEncoding("EUC-KR");
		String category = request.getParameter("category");
%>
<script>
	location.href="productDetail.jsp?category=<%=category%>";
</script>