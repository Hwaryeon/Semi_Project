<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
.cmntitle {
	margin-top: 10%;
	font-size:20px;
}

.container {
	width: 100%;
	max-width: 1200px;
	margin-top: 50px;
	margin-bottom: 100px;
	padding: 40px 40px;
	font-family: Roboto, 'Noto Sans KR', sans-serif;
	border: 1px solid lightgray;
	border-radius: 10px;
}

.form-update button {
	width: 200px;
	height: 40px;
	display: block;
	margin-bottom: 10px;
	z-index: 1;
	position: relative;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

.area {
	width: 200px;
	height: 200px;
	display: block;
	margin-bottom: 10px;
	border:1px solid lightgray;
	z-index: 1;
	position: relative;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

.area:hover {
	cursor:pointer;
}
</style>
</head>
<body>
	<%@ include file="../common/headBar.jsp"%>
	<h2 align="center" class="cmntitle">전문투자자 신청하기</h2>

	<div class="container">
		<form class="form-update" action="<%=request.getContextPath() %>/insert.urf?userid=<%= loginUser.getUserId() %>&ptype=2&userEmail=<%= loginUser.getEmail() %>" method="post" encType="multipart/form-data">
			<table align="center">
				<tr>
					<td colspan="3" align="center">
						<img src="/sp/image/professional investor.png" width="400px" height="200px">
					</td>
				</tr>
				<tr align="center">
					<td colspan="3" font-size="30px">아래 영역을 클릭하여 필요한 자료를 첨부해주세요</td>
				</tr>
				<tr align="center">
					<td>법인등기부등본</td>
					<td></td>
					<td>그 외 첨부파일(1개)</td>
				</tr>
				<tr></tr>
				<tr>
					<td>
						<div class="area withholdingRecipt">
							<img id="withholdR" src="/sp/image/upload.png" width="200px" height="200px">
						</div>
					</td>
					<td>&nbsp;</td>
					<td>
						<div class="area generalIncomeTax">
							<img id="incomeTaxR" src="/sp/image/upload.png" width="350px" height="200px">
						</div>
					</td>
					<td></td>
				</tr>
			</table>
			<div id="fileArea">
				<input type="file" id="Inv_attachment1" name="Inv_attachment1" multiple onchange="loadImg(this, 1)">
				<input type="file" id="Inv_attachment2" name="Inv_attachment2" multiple onchange="loadImg(this, 2)">
			</div>


			<div class="btnArea" align="center">
				<button class="btn-primary btn">취소하기</button>
				<button class="btn-primary btn" type="submit">작성완료</button>
			</div>
		</form>
	</div>

	<script>
		$(function(){
			
			$("#fileArea").hide();
			
			$("#withholdR").click(function(){
				$("#Inv_attachment1").click();
			});
			
			$(".generalIncomeTax").click(function(){
				$("#Inv_attachment2").click();
			});
		});
		
		function loadImg(value, num) {
			var reader = new FileReader();
			reader.onload = function(e) 
			{
				switch(num) 
				{
				case 1 : $("#withholdR").attr("src", "/sp/image/verification-on-cloud.png"); break;
				case 2 : $("#incomeTaxR").attr("src", "/sp/image/verification-on-cloud.png"); break;
				}
				
			}
			reader.readAsDataURL(value.files[0]);
		} 
		
	</script>
</body>
</html>