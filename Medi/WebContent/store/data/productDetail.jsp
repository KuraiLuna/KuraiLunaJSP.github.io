<%@page contentType="text/html;charset=EUC-KR"%>
<%@ page import="java.util.*,store.*"%>
<%@page import="store.ProductBean"%>
<jsp:useBean id="proMgr" class="store.ProductMgr" />
<%
		request.setCharacterEncoding("EUC-KR");
		int pnum = Integer.parseInt(request.getParameter("pnum"));
		ProductBean product = proMgr.getProduct(pnum);
%>
<html>
<head>
<link href="css/productDetail.css" rel="stylesheet" type="text/css">
<script  src="js/product_cart.js"></script>
</head>
<body>
<%@ include file="header_member.jsp" %>
<section id="container">
    <div id="left">
    <!-- First slider -->
    <div id="slider2" class="slider slider_first">
      <div class="slider_viewport">
        <div class="slider_list">
          <div class="slider_item"><img src="imgs/<%=product.getImage()%>"></div>
        </div>
      </div>         
    </div>
  </div>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script>
    <script  src="slide.js"></script>
	
    <div id="right">
    <form name="cart" action="cartProc.jsp">
        <div class="p_name2"><%=product.getPname()%></div>
        <div class="p_price2"><%=UtilMgr.intFormat(product.getPrice())%>$</div>
        <hr>
        <div class="selec">수량 
        <input name="quantity" id="quantity" size="5" value="1">개
        </div>
        
        <input type="submit" class="btn1" value="장바구니"/>
        <a href="javascript:history.back(-1);" class="btn2">이전페이지로</a>
   		<input type="hidden" name="productNum" value="<%=product.getPnum()%>">	
		<input type="hidden" name="flag" value="insert">
	</form>
    </div>
    </section>
    
    </body>
</body>
</html>