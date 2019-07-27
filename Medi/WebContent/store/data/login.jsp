<!-- login.jsp -->
<%@ page contentType="text/html;charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		
%>
<html>
<head>
<link href="css/reset.css" rel="stylesheet" type="text/css">
		<link href="css/login.css" rel="stylesheet" type="text/css">
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<script type="text/javascript">
	function focus(){
		document.loginFrm.id.focus();
	}
	function loginCheck() {
		if (document.loginFrm.id.value == "") {
			alert("���̵� �Է��� �ּ���.");
			document.loginFrm.id.focus();
			return;
		}
		if (document.loginFrm.pass.value == "") {
			alert("��й�ȣ�� �Է��� �ּ���.");
			document.loginFrm.pass.focus();
			return;
		}
		document.loginFrm.submit();
	}
</script>
<body onload="focus()">
<div id="wrap">
		<%@ include file="header.jsp" %>
		
		<section id="contents">
			<div id="contents_in">

				<form name="loginFrm" method="post" action="loginProc.jsp">
				<h3 class="bic_ttl">�α���</h3>
						<table class="table">
							<tr>
								<td><input id="id" type="text" placeholder="���̵�" name="id" value=""></td>
							</tr>

							<tr>
								<td><input id="pw" type="password" placeholder="��й�ȣ" name="pass" value=""></td>
							</tr>

							<tr>
								<td>
								<input id="go_login" type="button" value="Login"  onclick="loginCheck()" >
								</td>
							</tr>
							
							<tr>
								<td class="bottom">
									<a class="left" href="member.jsp">ȸ������</a>
									<a class="right" href="find.jsp">���̵�/��й�ȣ ã��</a>
								</td>
							</tr>
						</table>
					</form>
				</div>
		</section>
		
		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>





