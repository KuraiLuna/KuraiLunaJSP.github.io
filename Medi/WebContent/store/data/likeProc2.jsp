<%@page contentType="text/html;charset=EUC-KR"%>
<jsp:useBean id="lmgr" class="store.LikeCount_carMgr"/>
<%
	    	request.setCharacterEncoding("EUC-KR");
			String id = request.getParameter("id");
			int snum = Integer.parseInt(request.getParameter("snum"));
			String mode = request.getParameter("mode");
			
			if(id==null||id.equals("null")){
				%>
				<script>
					alert("로그인을 해주세요.");
					location.href="login.jsp";
				</script>
		<%}else{
					if(mode.equals("ins")){
						lmgr.insertLike(snum, id);
					}else if(mode.equals("del")){
							lmgr.deleteLikes(snum, id);
					}
						response.sendRedirect("cartoon.jsp#"+snum);
			}
%>
