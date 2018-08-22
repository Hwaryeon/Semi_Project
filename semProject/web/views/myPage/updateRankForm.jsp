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
		margin-top:10%;
	}
.container {
	width: 100%;
	max-width: 400px;
	margin-top: 150px;
	margin-bottom: 100px;
	padding: 40px 40px;
	font-family: Roboto, 'Noto Sans KR', sans-serif;
	border: 1px solid lightgray;
	border-radius: 10px;
}
</style>
</head>
<body>
	<%@ include file="../common/headBar.jsp" %>
	<h2 align="center" class="cmntitle">적격투자자 신청하기</h2>
	
	<div class="container">
		<form id="updateRankingForm"<%-- action="<%=request.getContextPath() %>/updateMember" method="post" --%>>
				<table>
					<tr align="center">
						<td colspan="3" font-size="30px">아래 영역을 클릭하여 필요한 자료를 첨부해주세요</td>
					</tr>
					<tr align="center">
						<td>근로소득원천징수 영수증</td>
						<td>종합소득세 신고서</td>
					</tr>
					<tr></tr>
					<tr>
						<td>
							<div id="withholdingRecipt">
								<img id="withholdingR" width="350px" height="200px">
							</div>
						</td>
						<td>
							<div id="generalIncomeTax">
								<img id="incomeTaxR" width="350px" height="200px">
							</div>
						</td>
						<td></td>
					</tr>
				</table>
			<div id="fileArea">
				<input type="file" id="Inv_attachment1" name="Inv_attachment1">
				<input type="file" id="Inv_attachment2" name="Inv_attachment2">
			</div>
			
			
			<div class="btnArea">
				<button>취소하기</button>
				<button class=""type="submit">작성완료</button>
			</div>
		</form>
	</div>
	
	<script>
		$(function(){
			$("#fileArea").hide();
			
			$("#withholdingRecipt").click(function(){
				$("#Inv_attachment1").click();
			});
			
			$("#generalIncomeTax").click(function(){
				$("#Inv_attachment2").click();
			});
		});
		
	</script>
</body>
</html>