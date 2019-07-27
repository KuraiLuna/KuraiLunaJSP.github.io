<%@page import="java.util.Enumeration"%>
<%@page import="store.OrderBean"%>
<%@page import="java.util.Hashtable"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="cartMgr" scope="session" class="store.CartMgr"/>
<jsp:useBean id="orderMgr" class="store.OrderMgr"/>
<jsp:useBean id="proMgr" class="store.ProductMgr"/>
<%
	String msg ="";
	Hashtable<Integer, OrderBean> hCart = 
			cartMgr.getCartList();
	Enumeration<Integer> hCartKey = hCart.keys();
	if(!hCart.isEmpty()){
		while(hCartKey.hasMoreElements()){
			//카트가 완전히 비워질 때까지
			OrderBean order =
					hCart.get(hCartKey.nextElement());
			orderMgr.insertOrder(order);//주문처리
			proMgr.reduceProduct(order);//재고수정
			cartMgr.deleteCart(order);//장바구니 비우기
		}
		msg = "주문처리 하였습니다.";
	}else{
		msg = "장바구니가 비었습니다.";
	}
%>
<script>
	alert("<%=msg%>");
	location.href = "orderList.jsp";
</script>
