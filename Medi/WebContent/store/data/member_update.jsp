<%@ page contentType="text/html;charset=EUC-KR"%>
<jsp:useBean id="mgr" class="store.RegisterMgr"/>
<jsp:useBean id="logbean" class="store.LoginBean"/>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<html>
<head>
	<title>회원가입</title>
	<link href="css/reset.css" rel="stylesheet" type="text/css">
	<link href="css/member.css" rel="stylesheet" type="text/css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="js/member_update.js" type="text/javascript"></script>
	<script type="text/javascript">
		

		function zipCheck() {
			url ="zipCheck.jsp?check=y";
			window.open(url,"ZipcodeSearch","width=500, height=300,scrollbars=yes");
		}

	</script>
	<script type="text/javascript" ></script>
</head>

<body  onLoad="regFrm.id.focus()">
	<div id="wrap">
		<%@ include file="header_member.jsp" %>
		<%
			logbean = mgr.getRegister(id);
			String pass = logbean.getPass();
			String name = logbean.getName();
			String phone = logbean.getPhone();
			String birth = logbean.getBirth();
			String address = logbean.getAddress();
			String zipcode = logbean.getZipcode();
			String email = logbean.getEmail();
		%>
		<section id="contents">
			<div id="contents_in">
			<form name="regFrm" method="post" action="member_updateProc.jsp">
				<table class="table" cellspacing="0" cellpadding="5px" align="center">
					<tr align="center" >
						<td colspan="2"><h3 class="f_ttl">회원정보</h3></td>
					</tr>
					<tr >
						<td class="f_left">아이디</td>
						<td width="50%"><input name="id" size="15"
							value="<%=id %>" readonly="readonly">
						</td>

					</tr>
					<tr>
						<td class="f_left">비밀번호</td>
						<td>
							<input type="password" name="pass" size="15" value="<%=pass%>">
						</td>

					</tr>
					<tr>
						<td class="f_left">비밀번호 확인</td>
						<td><input type="password" name="repass" size="15" value="<%=pass%>"></td>

					</tr>
					<tr>
						<td class="f_left">이름</td>
						<td><input name="name" size="15" value="<%=name%>" readonly="readonly">
						</td>

					</tr>
					<tr>
						<td class="f_left">전화번호</td>
						<td><input name="phone" size="11" value="<%=phone%>">
						('-'빼고 입력하세요.)

					</tr>
					
					<tr>
						<td class="f_left">생년월일</td>
						<td>
							<input name="birth"  size="6" readonly="readonly" value="<%=birth%>">
						</td>

					</tr>
					<tr>
						<td class="f_left">Email</td>
						<td><input name="email" size="40" value="<%=email%>">
						</td>

					</tr>
					<tr>
						<td class="f_left">우편번호</td>
						<td><input name="zipcode" size="5" readonly="readonly"  value="<%=zipcode%>">
							<input class="btn" type="button" value="우편번호찾기" onClick="zipCheck()">
						</td>

					</tr>
					<tr>
						<td class="f_left">주소</td>
						<td><input name="address" size="40" value="<%=address%>"></td>
					
					</tr>
					
					
					
					<tr>
						<td colspan="2" align="center">
						<input type="button" class="b_btn" value="수정 완료" onclick="inputCheck()"> &nbsp;
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
