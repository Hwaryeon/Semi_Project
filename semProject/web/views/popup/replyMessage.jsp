<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.sp.message.model.vo.*, com.kh.sp.board.model.vo.*"%>
<%
/* ArrayList<Message> list 
= (ArrayList<Message>)request.getAttribute("list");
PageInfo pi = (PageInfo)request.getAttribute("pi");
int listCount = pi.getListCount();
int currentPage = pi.getCurrentPage();
int maxPage = pi.getMaxPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage();
*/

 String userId = (String)request.getAttribute("userId");

%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>jQuery UI Tabs - Vertical Tabs functionality</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/message/message.css">

<script>
  $( function() {
    $( "#tabs" ).tabs().addClass( "ui-tabs-vertical ui-helper-clearfix" );
    $( "#tabs li" ).removeClass( "ui-corner-top" ).addClass( "ui-corner-left" );
  } );
  </script>
<style>
.ui-tabs-vertical {
	width: 55em;
}

.ui-tabs-vertical .ui-tabs-nav {
	padding: .2em .1em .2em .2em;
	float: left;
	width: 12em;
}

.ui-tabs-vertical .ui-tabs-nav li {
	clear: left;
	width: 100%;
	border-bottom-width: 1px !important;
	border-right-width: 0 !important;
	margin: 0 -1px .2em 0;
}

.ui-tabs-vertical .ui-tabs-nav li a {
	display: block;
}

.ui-tabs-vertical .ui-tabs-nav li.ui-tabs-active {
	padding-bottom: 0;
	padding-right: .1em;
	border-right-width: 1px;
}

.ui-tabs-vertical .ui-tabs-panel {
	padding: 1em;
	float: right;
	width: 40em;
}
form {
  margin: 0 auto;
  width: 400px;
  padding: 1em;
  border: 1px solid #CCC;
  border-radius: 1em;
}

div + div {
  margin-top: 1em;
}

label {
  display: inline-block;
  width: 90px;
  text-align: right;
}

input, textarea {
  font: 1em sans-serif;

  width: 300px;
  -moz-box-sizing: border-box;
       box-sizing: border-box;
  border: 1px solid #999;
}

input:focus, textarea:focus {
  border-color: #000;
}

textarea {
  vertical-align: top;
  height: 5em;
  resize: vertical;
}

.button {
  padding-left: 90px; 
  margin-left: auto;
  margin-right: auto;
  width: 100px;
}

button {
  margin-left: .5em;
}

#top_h4{
	margin-left: auto;
    margin-right: auto;
    width: 350px;
}
#msgBu{
	margin-left: auto;
    margin-right: auto;
    width: 134px;

}

</style>
</head>
<body>

	<div id="tabs">
		<ul style="margin-top: 108px;">
			<li><a href="#tabs-1">받은 쪽지함</a></li>
			<li><a href="#tabs-2">보낸 쪽지함</a></li>
			<!-- <li><a href="#tabs-3">Aenean lacinia</a></li> -->
		</ul>
		<div id="tabs-1">
			<h2>답장 보내기</h2>
			<p>
			<form class="form-horizontal" id="msgId"action="<%=request.getContextPath() %>/reWriteMessage" method="post">
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label" style="width:106px;">메시지 제목</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="title" name="title" placeholder="제목">
			    </div>
			  </div>
			  
			  <div>
			    <!-- 메시지 보내는 회원의 아이디 -->
				    <input type="hidden" id="user_id" name="user_id" value="999">
			    </div>
			    
			    <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">받는사람</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" value="<%=userId %>" id="receive_id" name="receive_id" placeholder="<%=userId %>" readonly >
			    </div>
			  </div>
			  
			   <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">문의내용</label>
			    <div class="col-sm-10">
			      <textarea style="resize: none;" id="msg" name="msg" class="form-control" rows="5" placeholder="내용"></textarea>
			    </div>
			  </div>
			  
			  <div class="form-group" id="msgBu">
			    <div class="col-sm-offset-2 col-sm-10">
			      <button type="submit" class="btn btn-default" onclick="closePopup();">보내기</button>
			    </div>
			  </div>
			</form>
			
			
			
			
			</p>
		</div>
	</div>

	<script>
	
		$('.deleChk').click(function(){
			
			/* var num = $(this).find('input').value;
			console.log(num); */
			
		});
	
	</script>


</body>
</html>