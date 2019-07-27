<%@page import="store.ProductBean"%>
<%@page import="store.UtilMgr"%>
<%@page import="store.OrderBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html;charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="orderMgr" class="store.OrderMgr"/>
<jsp:useBean id="proMgr" class="store.ProductMgr"/>
<%
		if(session.getAttribute("idKey")==null){
			response.sendRedirect("login.jsp");
		}
%>
<html>
<head>
<title>�ֹ�������</title>
<link href="css/reset.css" rel="stylesheet" type="text/css">
<link href="css/orderList.css" rel="stylesheet" type="text/css">
<script  src="js/product_cart.js"></script>
</head>
<body>
<%@ include file="header_member.jsp" %>
<section id="contents">
	<table width="75%" align="center" class="tbl_main">
	<tr>
		<td colspan="7" align="center"><h3 class="ttl">�ֹ���ȸ</h3></td>
	</tr>
	<tr> 
	<td align="center">
		<table width="95%" class="tbl_in" cellspacing="0">
		<tr align="center" class="tr"> 
			<td class="th"><font>�ֹ���ȣ</font></td>
			<td class="th"><font>��ǰ��</font></td>
			<td class="th"><font>��ǰ��ȣ</font></td>
			<td class="th"><font>����</font></td>
			<td class="th"><font>����</font></td>
			<td class="th"><font>�ֹ���¥</font></td>
			<td class="th"><font>�ֹ�����</font></td>
		</tr>
		<%
				Vector<OrderBean> vlist = orderMgr.getOrderList();
				if(vlist.isEmpty()){
		%>
		<tr class="tr">
			<td class="td" colspan="7">
			�ֹ��Ͻ� ��ǰ�� �����ϴ�.
			</td>
		</tr>
		<%			
				}else{
					for(int i=0;i<vlist.size();i++){
						OrderBean order = vlist.get(i);
						ProductBean product = 
							proMgr.getProduct(order.getProductNum());
		%>
		<tr align="center" class="tr">
			<td class="td"><%=order.getOnum()%></td>
			<td class="td"><a href="javascript:productDetail('<%=order.getProductNum()%>')">
					<%=product.getPname()%></a></td>
			<td class="td"><%=order.getProductNum()%></td>
			<td class="td"><%=order.getQuantity()%></td>
			<td class="td"><%=UtilMgr.intFormat(product.getPrice())%></td>
			<td class="td"><%=order.getDate()%></td>
			<td class="td">
			<%
					switch(order.getState()){
						case "1": out.println("������"); break;
						case "2": out.println("����"); break;
						case "3": out.println("�Ա�Ȯ��");break;
						case "4": out.println("����غ�");break;
						case "5": out.println("�����");break;
						case "6": out.println("�Ϸ�");break;
					}//switch
			%>
			</td>
		</tr>
		<%				
					}//for
				}//if-else
		%>
		<tr>
			<td align="center" colspan="7" class="td_last">
				<a class="go_before" href="javascript:history.back(-1);">���� ��������</a>&nbsp; &nbsp; 
				<a class="go_home" href="store_index.jsp">�����Ȩ����</a>
			</td>
		</tr>
		</table> 
	</td>
	</tr>
	</table>
	<form name="detail" method="post" action="productDetail.jsp" >
		<input type="hidden" name="pnum">
	</form>
</section>	
</body>
</html>