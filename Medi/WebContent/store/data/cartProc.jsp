<%@page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="cartMgr" scope="session" class="store.CartMgr"/>
<jsp:useBean id="order" class="store.OrderBean"/>
<jsp:setProperty property="*" name="order"/>
<%
		String id = (String)session.getAttribute("idKey");
		String msg = "";
		if(id==null){
			response.sendRedirect("login.jsp");
		}else{
			String flag = request.getParameter("flag");
			//flag : insert, update, del
			if(flag.equals("insert")){
				order.setId(id);
				cartMgr.addCart(order);
				msg = "장바구니에 담았습니다.";
			}else if(flag.equals("update")){
				order.setId(id);
				cartMgr.updateCart(order);
				msg = "장바구니를 수정 하였습니다.";
			}else if(flag.equals("del")){
				cartMgr.deleteCart(order);
				msg = "장바구니를 삭제 하였습니다.";
			}
%>
			<script>
				alert("<%=msg%>");
				location.href = "cart.jsp";
			</script>	
<%}%>








