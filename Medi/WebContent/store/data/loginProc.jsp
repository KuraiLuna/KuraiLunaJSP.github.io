<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:useBean id="mgr" class="store.RegisterMgr"/>
<%
		request.setCharacterEncoding("euc-kr");
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		int mode = mgr.loginCheck(id, pass);
		boolean admin =mgr.adminCheck(id, pass);
		
		String msg = "로그인 실패";
		String url = "login.jsp";
		
		if(admin){
			session.setAttribute("idKey", id);
			session.setMaxInactiveInterval(10);
			msg="관리자 입니다.";
			url="../admin/admin_index.jsp";
		}else{
			if(mode==0){
				//session.setAttribute("idKey", id);
				msg = "아이디를 확인해주세요";
			}else if(mode==1){
				msg="비밀번호를 확인해주세요";
			}else if(mode==2){
				session.setAttribute("idKey", id);
				session.setMaxInactiveInterval(60*30);
				msg="로그인 성공";
				response.sendRedirect("community.jsp");
				
			}
		}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>