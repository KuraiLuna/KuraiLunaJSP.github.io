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
			alert("아이디를 입력해 주세요.");
			document.loginFrm.id.focus();
			return;
		}
		if (document.loginFrm.pass.value == "") {
			alert("비밀번호를 입력해 주세요.");
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
				<h3 class="bic_ttl">로그인</h3>
						<table class="table">
							<tr>
								<td><input id="id" type="text" placeholder="아이디" name="id" value=""></td>
							</tr>

							<tr>
								<td><input id="pw" type="password" placeholder="비밀번호" name="pass" value=""></td>
							</tr>

							<tr>
								<td>
								<input id="go_login" type="button" value="Login"  onclick="loginCheck()" >
								</td>
							</tr>
							
							<tr>
								<td class="bottom">
									<a class="left" href="member.jsp">회원가입</a>
									<a class="right" href="find.jsp">아이디/비밀번호 찾기</a>
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





