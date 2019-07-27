<%@page contentType="text/html;charset=EUC-KR"%>
<%
	    request.setCharacterEncoding("EUC-KR");
	
%>
<html>
	<head>
		<link href="css/reset.css" rel="stylesheet" type="text/css">
		<link href="css/success.css" rel="stylesheet" type="text/css">
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<style>
		#contents{ float: left; width: 100%; height:500px; 
		margin-top: 150px; padding-top: 20px;}
		#contents_in{ margin: 0 auto; width: 500px;
		 height:500px;   }
		 #tbl{ margin-top:100px;}
		.img01{ margin-right: 30px;}
		.memberUpdateBtn{ display: block; text-align: center;  width: 180px; height: 20px; padding: 15px;
		  background-color: cadetblue; color: #fff; border-radius: 5px; 
		  font-size: 17px; font-weight: 500; border: 0px; margin-right: 30px;}
		.cartBtn2{ display: block; text-align: center; width: 180px; height: 20px; padding: 15px ;
		  background-color: cadetblue; color: #fff; border-radius: 5px; 
		  font-size: 17px; font-weight: 500; border: 0px;}
		#id{
		border:1px solid black; width:200px; height:200px;
		}
		
	</style>
		
	</head>
	
	<body onload="sc()">
	<div>
		<%@ include file="header_member.jsp" %>
		<section id="contents">
			<div id="contents_in" >
			<table id="tbl">
				<tr>
					<td align="center">
						<img class="img01" src="imgs/mypage01.png" alt="">
					</td>
					<td align="center">
						<!-- <img class="img02" src="imgs/mypage02.png" alt=""> -->
					</td>
				</tr>
				<tr>
					<td><a class="memberUpdateBtn" href="member_update.jsp" >회원정보</a></td>
					<!-- <td><a class="cartBtn2" href="orderList.jsp" >주문조회</a></td> -->
			 	</tr>
			 	</table>
			</div>
		</section>
		
		
	</div>
	</body>
</html>