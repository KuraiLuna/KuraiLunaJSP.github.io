<%@page import="store.ReplyBean"%>
<%@page import="java.util.Vector"%>
<%@page import="store.StoryBean"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html;charset=EUC-KR"%>
<jsp:useBean id="mgr" class="store.StoryMgr"/>
<jsp:useBean id="lmgr" class="store.LikeCountMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		Vector<StoryBean> storyList = mgr.storyList(); 
%>
<html>
<head>
	<link href="css/reset.css" rel="stylesheet" type="text/css">
	<link href="css/login.css" rel="stylesheet" type="text/css">
	<link href="css/story_main.css" rel="stylesheet" type="text/css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<script type="text/javascript">
function fnlike(snum, mode){
	document.flike.snum.value=snum;
	document.flike.mode.value=mode;
	document.flike.submit();
}
function deleteStory(snum){
	document.storyDeleteFrm.snum.value=snum;
	document.storyDeleteFrm.submit();
} 
 function upReply(pos,comment){
	
	document.sFrm.pos.value=pos;
	document.sFrm.comment.value=comment;
	document.sFrm.submit();
}
 function deleteReply(pos,comment){
	 document.rDeleteFrm.pos.value=pos;
	 document.rDeleteFrm.comment.value=comment;
	 document.rDeleteFrm.submit();
 }
 function enter(e){
	   if (window.event) {
	           key = window.event.keyCode;
	      } else if (e) {
	           key = e.which;
	      }
	    if(key == 13){
	       return false
	   }
	}

</script>
<body >
	<div id="wrap">
		<%@ include file="header.jsp" %>	
			<div class= "storybox" align="center">
			<div id="titlebox">
				<h3 id="title">Home Story</h3>
				<hr/>
			</div>
				<% for(int i = storyList.size()-1; i>=0; i--){
					int count= lmgr.getLikesCount(storyList.get(i).getSnum());
					boolean likeflag = lmgr.getLikes(storyList.get(i).getSnum(), id);
					String imgSrc = "like.png";
					String mode = "ins";
					if(likeflag){ 
						imgSrc = "redlike.png";
						mode = "del";	
					}
					
				%>
					<br/>
					<div id="<%=storyList.get(i).getSnum()%>">
					<form method="get" name="storyFrm" action="replyProc.jsp" onkeydown="return enter(event)">
					<table	class="storytbl" >
						<tr >
							<td  style="padding-top: 10px;padding-bottom:10px;">
								<b class="idbox">&nbsp;&nbsp;<%=storyList.get(i).getId() %></b>
								</td>
								<td align="right">
								<%if(storyList.get(i).getId().equals(id)){ %>
								 <input id="deleteBtn" type="button" value="게시물 삭제"
								  onclick="deleteStory(<%=storyList.get(i).getSnum()%>)"><br/> 
								<%}%>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<img class="storyimg" alt="" src="../../uploadFile/<%=storyList.get(i).getImgname()%>">
							</td>
						</tr>
						<tr>
								<td colspan="2">
								<br/>
								&nbsp;&nbsp;
								<a href="#" onclick="javascript:fnlike(<%=storyList.get(i).getSnum()%>,'<%=mode%>' );">
									<img name="like" id="likeimg" alt=""  src="./imgs/<%=imgSrc%>" >
								</a>
								<b id="likefont">like <b id="likecount"><%=count %></b>개</b>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<br/>&nbsp;&nbsp;<%=storyList.get(i).getContent() %><br/><br/>
								<% 
										Vector<ReplyBean> replyList = mgr.replyList(storyList.get(i).getSnum());
										for(int j =0; j<replyList.size(); j++){
											if(storyList.get(i).getSnum()==replyList.get(j).getPos()){%>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><%=replyList.get(j).getId() %></b>
									<%if(replyList.get(j).getId().equals(id)){%>
										<input  id="deleteBtn"  type="button" value="댓글 삭제"
										 onclick="deleteReply(<%=replyList.get(j).getPos()%>,'<%=replyList.get(j).getComment()%>')">	
									<%} %>
									<br/>
									<img id="rimg" name="replyimg" alt="" src="./imgs/reply.png" >&nbsp;&nbsp;
									<%=replyList.get(j).getComment()%><br/>
														
								<%}
											}%>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input id="commentid" class="reply" name="comment" value="" placeholder="댓글을 남겨주세요" >
								<input class="replyBtn" name="replyBtn" type="button" value="입력" 
								onclick="upReply('<%=storyList.get(i).getSnum()%>',this.form.comment.value)" >

								
							</td>
						</tr>
					</table>
		</form>
					<br/>
					</div>
					<%} %>
				
		</div>
	<%@ include file="footer.jsp" %>
	</div>
	<form name="rDeleteFrm" method="post" action="replyDeleteProc.jsp">
	<input type="hidden" name="pos" >
	<input type="hidden" name="comment">
	</form>
	<form name="storyDeleteFrm" method="post" action="storyDeleteProc.jsp">
	<input type="hidden" name="snum" >
	</form>
	<form name="flike" method="post" action="likeProc.jsp">
		<input type="hidden" name="id" value="<%=id%>">
		<input type="hidden" name="snum">
		<input type="hidden" name="mode">
	</form>
	<form method="post" name="sFrm" action="replyProc.jsp">
		<input type="hidden" name="comment">
		<input type="hidden" name="pos">
	</form>
</body>
</html>

