<%@page import="store.ZipcodeBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="store.RegisterMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		Vector<ZipcodeBean> vlist = null;
		String check = request.getParameter("check");
		String area3 = null;
		if(check.equals("n")){
			//검색을 할 경우
			area3 = request.getParameter("area3");//동이름
			vlist = mgr.zipcodeRead(area3);
		}
%>
<html>
<head>
<title>우편번호 검색</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function dongCheck() {
		frm = document.zipFrm;
		if(frm.area3.value==""){
			alert("도로명을 입력하세요");
			frm.area3.focus();
			return;
		}
		frm.action = "zipCheck.jsp";
		frm.submit();
	}

	function sendAdd(zipcode, adds) {
		//alert(zipcode+" "+adds);
		opener.document.regFrm.zipcode.value=zipcode;
		opener.document.regFrm.address.value=adds;
		self.close();
		
	}
</script>
</head>
<body >
	<div align="center">
		<br />
		<form name="zipFrm" method="post">
			<table>
				<tr>
					<td><br> 도로명 입력 : <input name="area3" value=""> 
					<input type="button" value="검색"
						onclick="dongCheck();"></td>
				</tr>
				<!-- 검색결과 시작 -->
				<%
					if (check.equals("n")) {
						if (vlist.isEmpty()) {
				%>
				<tr>
					<td align="center"><br>검색된 결과가 없습니다.</td>
				</tr>
				<%
					} else {
				%>
				<tr>
					<td align="center"><br/>※검색 후, 아래 우편번호를 클릭하면 자동으로 입력됩니다.</td>
				</tr>
				<%
				String nullValue = "";
					for (int i = 0; i < vlist.size(); i++) {
						ZipcodeBean bean = vlist.get(i);
						String rZipcode = bean.getZipcode();
						String rArea1 = bean.getArea1();
						String rArea2 = bean.getArea2();
						String rArea3 = bean.getArea3();
						String rArea4 = bean.getArea4();
						
						if(rArea1==null){
							rArea1 = nullValue;
						}
						if(rArea2==null){
							rArea2 = nullValue;
						}
						if(rArea3==null){
							rArea3 = nullValue;
						}
						if(rArea4==null){
							rArea4 = nullValue;
						}
						String adds = rArea1+" "+rArea2+" "+rArea3+" "+rArea4;
				%>
				<tr>
					<td>
						<a href="#" onclick="javascript:sendAdd('<%=rZipcode%>','<%=adds %>')">
						<%=rZipcode+" "+adds %></a>
					</td>
				</tr>
				<%
							}//for
						}//if
					}//if
				%>
				<!-- 검색결과 끝 -->
				<tr>
					<td align="center"><br />
					<a href="#" onClick="self.close()">닫기</a></td>
				</tr>
			</table>
			<input type="hidden" name="check" value="n">
		</form>
	</div>
</body>
</html>