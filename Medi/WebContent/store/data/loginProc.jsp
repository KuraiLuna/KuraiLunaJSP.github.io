<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:useBean id="mgr" class="store.RegisterMgr"/>
<%
		request.setCharacterEncoding("euc-kr");
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		int mode = mgr.loginCheck(id, pass);
		boolean admin =mgr.adminCheck(id, pass);
		
		String msg = "�α��� ����";
		String url = "login.jsp";
		
		if(admin){
			session.setAttribute("idKey", id);
			session.setMaxInactiveInterval(10);
			msg="������ �Դϴ�.";
			url="../admin/admin_index.jsp";
		}else{
			if(mode==0){
				//session.setAttribute("idKey", id);
				msg = "���̵� Ȯ�����ּ���";
			}else if(mode==1){
				msg="��й�ȣ�� Ȯ�����ּ���";
			}else if(mode==2){
				session.setAttribute("idKey", id);
				session.setMaxInactiveInterval(60*30);
				msg="�α��� ����";
				response.sendRedirect("community.jsp");
				
			}
		}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>