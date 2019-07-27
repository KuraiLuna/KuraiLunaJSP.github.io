<%@page contentType="text/html;charset=EUC-KR"%>
<%@ page import="java.util.*,store.*"%>
<jsp:useBean id="proMgr" class="store.ProductMgr" />
<%
	    request.setCharacterEncoding("EUC-KR");
%>
<html>
<head>
<link href="css/product_list.css" rel="stylesheet" type="text/css">
<link href="css/reset.css" rel="stylesheet" type="text/css">
<script  src="js/product_cart.js"></script>
</head>
<body>
<%
String category = request.getParameter("category");
%>
<%@ include file="header_member.jsp" %>
<section id="container">
    <div id="list">
    <h3 class="list_ttl">
   <%
   if(category==null){
	   out.println("전체상품");
   }else if(category.equals("furniture")){//furniture
	   out.println("가구");
   }else if(category.equals("cartoon")){//appliance
	   out.println("만화");
   } else if(category.equals("gundam_rilakkuma")){//kitchen
	   out.println("건담·리락쿠마");
   } else if(category.equals("userdiy")){//living
	   out.println("유저DIY");
   }  
   
   %>

</h3>
    <hr>
<ul class="product_ul">
<%
Vector<ProductBean> vResult=proMgr.getProductCategory(category); 

for (int i = 0; i < vResult.size(); i++) {
	ProductBean product = vResult.get(i);
    %>
    <li><a href="javascript:productDetail('<%=product.getPnum()%>')"><img src="imgs/<%=product.getImage()%>" width="245px" height="235px">
    <br><span class="p_name"><%=product.getPname()%></span>
    <br><span class="p_price"><%=UtilMgr.intFormat(product.getPrice())%>원</span></a></li>
<%
}
%>
    </ul>
    <form name="detail" method="post" action="productDetail.jsp" >
		<input type="hidden" name="pnum">
	</form>
    </div>
    </section>
</body>
</html>