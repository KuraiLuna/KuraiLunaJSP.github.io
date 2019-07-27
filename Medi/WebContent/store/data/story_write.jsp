<%@ page contentType="text/html;charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		
%>
<html>
<head>
	<link href="css/reset.css" rel="stylesheet" type="text/css">
	<link href="css/login.css" rel="stylesheet" type="text/css">
	<link href="css/story_write.css" rel="stylesheet" type="text/css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<script type="text/javascript">
function upload(){
	document.writeFrm.imgUpload.click();
}

</script>
<body >
	<div id="wrap">
		<%@ include file="header_member.jsp" %>	
		<section id="contents">
			<div id= "storybox" align="center">
				<form name="writeFrm" method="post" action="storyProc.jsp"  enctype="multipart/form-data">
				
				
				 	<table>
				 	<!--  <div class= "storybox" align="center">-->
				 	<h3 id="title" style="color:#37b7fe ">Illustration</h3>
					<!--  <div id="titlebox">
					
					<hr/>
					</div>-->
					<!--<p id="title">스토리 글쓰기</p>-->
					<tr>
						<td>
						<textarea id="txtarea" name="content" rows="20" cols="80" ></textarea>
						</td>
					</tr>
					</table> 
					<input type="text" size="40" name="imgName" readonly="readonly"> 
					<button class="replace" onclick="upload()" type="button">사진 업로드</button><br/>
					<input id="uploadBtn" type="file" name="imgUpload" display="none" onchange="document.writeFrm.imgName.value=this.value;"><br/>
					<input  id="go_login" type="submit" value="작성완료" >
					
					
					<input type="hidden" name="id" value="<%if(id != null){%><%=id%><%}%>">
					
					
				</form>			
			</div>
		</section>		

	</div>
	<!--  </div>-->
</body>
</html>





