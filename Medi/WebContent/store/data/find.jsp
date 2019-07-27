<%@page contentType="text/html;charset=EUC-KR"%>
<%
	    request.setCharacterEncoding("EUC-KR");
	
%>
<html>
	<head>
		<link href="css/reset.css" rel="stylesheet" type="text/css">
		<link href="css/success.css" rel="stylesheet" type="text/css">
		<link href="css/find.css" rel="stylesheet" type="text/css">
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
		function findId(){
			var name = document.findIdFrm.find_name.value;
			var phone = document.findIdFrm.find_phone.value;
			var birth = document.findIdFrm.find_birth.value;
			if(name==""){
				alert("이름을 입력하세요");
				document.findIdFrm.find_name.focus();
			}else if(phone ==""){
				alert("전화번호를 입력하세요");
				document.findIdFrm.find_phone.focus();
			}else if(birth ==""){
				alert("생년월일을 입력하세요");
				document.findIdFrm.find_birth.focus();
			}else{
				url = "findIdCheck.jsp?find_name="+name+"&find_phone="+phone+"&find_birth="+birth;
				window.open(url,"findId","width=400, height=200,scrollbars=yes");
			}
			
		}
		function findPass(){
			var name = document.findPassFrm.find2_name.value;
			var id = document.findPassFrm.find2_id.value;
			var phone = document.findPassFrm.find2_phone.value;
			var birth = document.findPassFrm.find2_birth.value;
			if(name==""){
				alert("이름을 입력하세요");
				document.findPassFrm.find2_name.focus();
			}else if(id ==""){
				alert("아이디를 입력하세요");
				document.findPassFrm.find2_id.focus();
			}else if(phone ==""){
				alert("전화번호를 입력하세요");
				document.findPassFrm.find2_phone.focus();
			}else if(birth ==""){
				alert("생년월일을 입력하세요");
				document.findPassFrm.find2_birth.focus();
			}else{
				url = "findPassCheck.jsp?find2_name="+name+"&find2_id="+id+"&find2_phone="+phone+"&find2_birth="+birth;
				window.open(url,"findPass","width=400, height=200,scrollbars=yes");
			}
			
		}
		</script>
	</head>
	
	<body onload="sc()">
	<div id="wrap">
		<%@ include file="header2.jsp" %>
		
		<section id="contents">
			<div id="contents_in">
			<table >
				<tr>
					<td>
						<form class="findTbl" action="findProc.jsp" name="findIdFrm" method="post">
							<table class="table" class="findTbl" align="center">
								<tr align="center" >
									<td colspan="2"><h3 class="f_ttl">아이디 찾기</h3></td>
								</tr>
								<tr>
									<td class="f_left">이름</td>
									<td><input name="find_name" size="15" value="">
									</td>
								</tr>
								<tr>
									<td class="f_left">전화번호</td>
									<td><input name="find_phone" size="11" value=""><br/>
									('-'빼고 입력하세요.)
								</tr>
								<tr>
									<td class="f_left">생년월일</td>
									<td><input name="find_birth"  size="6"><br/>
										ex)830815</td>
								</tr>
							</table>
					<a class="findBtn" href="#" onclick="findId()" >아이디 찾기</a>
			</form>
					</td>
					
					<td>
						<form class="findTbl" action="findProc.jsp" name="findPassFrm" method="post">
			
						<table class="table"  align="center">
								<tr align="center" >
									<td colspan="2"><h3 class="f_ttl">비밀번호 찾기</h3></td>
								</tr>
								<tr>
									<td class="f_left">이름</td>
									<td><input name="find2_name" size="15" value="">
									</td>
								</tr>
								<tr>
									<td class="f_left">아이디</td>
									<td><input name="find2_id" size="15" value="">
									</td>
								</tr>
													<tr>
									<td class="f_left">전화번호</td>
									<td><input name="find2_phone" size="11" value=""><br/>
									('-'빼고 입력하세요.)
								</tr>
								<tr>
									<td class="f_left">생년월일</td>
									<td><input name="find2_birth"  size="6"><br/>
										ex)830815</td>
								</tr>
								
						</table>
						<a class="findBtn2" href="#" onclick="findPass()">비밀번호 찾기</a>
			</form>
					</td>
					
				</tr>
			
			</table>
		
			
			
			</div>
		</section>
		
		
	</div>
	</body>
</html>