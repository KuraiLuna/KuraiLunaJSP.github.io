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
			//�˻��� �� ���
			area3 = request.getParameter("area3");//���̸�
			vlist = mgr.zipcodeRead(area3);
		}
%>
<html>
<head>
<title>�����ȣ �˻�</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function dongCheck() {
		frm = document.zipFrm;
		if(frm.area3.value==""){
			alert("���θ��� �Է��ϼ���");
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
					<td><br> ���θ� �Է� : <input name="area3" value=""> 
					<input type="button" value="�˻�"
						onclick="dongCheck();"></td>
				</tr>
				<!-- �˻���� ���� -->
				<%
					if (check.equals("n")) {
						if (vlist.isEmpty()) {
				%>
				<tr>
					<td align="center"><br>�˻��� ����� �����ϴ�.</td>
				</tr>
				<%
					} else {
				%>
				<tr>
					<td align="center"><br/>�ذ˻� ��, �Ʒ� �����ȣ�� Ŭ���ϸ� �ڵ����� �Էµ˴ϴ�.</td>
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
				<!-- �˻���� �� -->
				<tr>
					<td align="center"><br />
					<a href="#" onClick="self.close()">�ݱ�</a></td>
				</tr>
			</table>
			<input type="hidden" name="check" value="n">
		</form>
	</div>
</body>
</html>