<%@ page contentType="text/html;charset=EUC-KR"%>
<html>
<head>
	<title>회원가입</title>
	<link href="css/reset.css" rel="stylesheet" type="text/css">
	<link href="css/member.css" rel="stylesheet" type="text/css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="js/script2.js" type="text/javascript"></script>
	<script type="text/javascript">
		function idCheck(id) {
			//alert(id);
			if(id==""){
				alert("아이디를 입력하세요");
				document.regFrm.id.focus();
				return;
			}
			url ="idCheck.jsp?id="+id;
			window.open(url,"IDCheck","width=300, height=100");
		}

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
		
		<section id="contents">
			<div id="contents_in">
			<form name="regFrm" method="post" action="memberProc.jsp">
				<table class="table" cellspacing="0" cellpadding="5px" align="center">
					<tr align="center" >
						<td colspan="2"><h3 class="f_ttl">회원가입</h3></td>
					</tr>
					<tr >
						<td class="f_left">아이디</td>
						<td width="50%"><input name="id" size="15"
							value=""> <input class="btn" type="button" value="ID중복확인"
							onClick="idCheck(this.form.id.value)">
						</td>

					</tr>
					<tr>
						<td class="f_left">비밀번호</td>
						<td><input type="password" name="pass" size="15"></td>

					</tr>
					<tr>
						<td class="f_left">비밀번호 확인</td>
						<td><input type="password" name="repass" size="15"></td>

					</tr>
					<tr>
						<td class="f_left">이름</td>
						<td><input name="name" size="15" value="">
						</td>

					</tr>
					<tr>
						<td class="f_left">전화번호</td>
						<td><input name="phone" size="11" value="">
						('-'빼고 입력하세요.)

					</tr>
					<tr>
						<td class="f_left">성별</td>
						<td>
							 남<input type="radio" name="gender" value="1" checked="checked">
							 여<input type="radio" name="gender" value="2">
						</td>

					</tr>
					<tr>
						<td class="f_left">생년월일</td>
						<td><input name="birth"  size="6">
							ex)830815</td>

					</tr>
					<tr>
						<td class="f_left">Email</td>
						<td><input name="email" size="40">
						</td>

					</tr>
					<tr>
						<td class="f_left">우편번호</td>
						<td><input name="zipcode" size="5" readonly="readonly" >
							<input class="btn" type="button" value="우편번호찾기" onClick="zipCheck()">
						</td>

					</tr>
					<tr>
						<td class="f_left">주소</td>
						<td><input name="address" size="40"></td>
					
					</tr>
					
					
					
					<tr>
						<td colspan="2" align="center">
						<input type="button" class="b_btn" value="회원가입" onclick="inputCheck()"> &nbsp;
						</td>
					</tr>
					
					<tr>
						<td colspan="2" align="center">
						이미 아이디가 있으신가요? <input class="btn" type="button" value="로그인"	 onClick="javascript:location.href='login.jsp'"></td>
					</tr>
				</table>
			</form>
			</div>
		</section>
		
		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>
