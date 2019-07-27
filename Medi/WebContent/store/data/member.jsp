<%@ page contentType="text/html;charset=EUC-KR"%>
<html>
<head>
	<title>ȸ������</title>
	<link href="css/reset.css" rel="stylesheet" type="text/css">
	<link href="css/member.css" rel="stylesheet" type="text/css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="js/script2.js" type="text/javascript"></script>
	<script type="text/javascript">
		function idCheck(id) {
			//alert(id);
			if(id==""){
				alert("���̵� �Է��ϼ���");
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
						<td colspan="2"><h3 class="f_ttl">ȸ������</h3></td>
					</tr>
					<tr >
						<td class="f_left">���̵�</td>
						<td width="50%"><input name="id" size="15"
							value=""> <input class="btn" type="button" value="ID�ߺ�Ȯ��"
							onClick="idCheck(this.form.id.value)">
						</td>

					</tr>
					<tr>
						<td class="f_left">��й�ȣ</td>
						<td><input type="password" name="pass" size="15"></td>

					</tr>
					<tr>
						<td class="f_left">��й�ȣ Ȯ��</td>
						<td><input type="password" name="repass" size="15"></td>

					</tr>
					<tr>
						<td class="f_left">�̸�</td>
						<td><input name="name" size="15" value="">
						</td>

					</tr>
					<tr>
						<td class="f_left">��ȭ��ȣ</td>
						<td><input name="phone" size="11" value="">
						('-'���� �Է��ϼ���.)

					</tr>
					<tr>
						<td class="f_left">����</td>
						<td>
							 ��<input type="radio" name="gender" value="1" checked="checked">
							 ��<input type="radio" name="gender" value="2">
						</td>

					</tr>
					<tr>
						<td class="f_left">�������</td>
						<td><input name="birth"  size="6">
							ex)830815</td>

					</tr>
					<tr>
						<td class="f_left">Email</td>
						<td><input name="email" size="40">
						</td>

					</tr>
					<tr>
						<td class="f_left">�����ȣ</td>
						<td><input name="zipcode" size="5" readonly="readonly" >
							<input class="btn" type="button" value="�����ȣã��" onClick="zipCheck()">
						</td>

					</tr>
					<tr>
						<td class="f_left">�ּ�</td>
						<td><input name="address" size="40"></td>
					
					</tr>
					
					
					
					<tr>
						<td colspan="2" align="center">
						<input type="button" class="b_btn" value="ȸ������" onclick="inputCheck()"> &nbsp;
						</td>
					</tr>
					
					<tr>
						<td colspan="2" align="center">
						�̹� ���̵� �����Ű���? <input class="btn" type="button" value="�α���"	 onClick="javascript:location.href='login.jsp'"></td>
					</tr>
				</table>
			</form>
			</div>
		</section>
		
		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>
