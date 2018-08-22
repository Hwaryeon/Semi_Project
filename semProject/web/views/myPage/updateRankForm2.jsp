<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.cmntitle {
		margin-top:10%;
	}
	#text {
		background-color: white;
		padding: 20px;
		width: 60%;
		border: 1px solid black;
		margin-left:auto;
		margin-right:auto;
		margin-top:3%;
	}
</style>
</head>
<body>
	<%@ include file="../common/headBar.jsp" %>
	<h2 align="center" class="cmntitle">
	전문투자자 신청하기</h2>
	
	<div id="text" align="center">
		<form id="updateRankingForm"<%-- action="<%=request.getContextPath() %>/updateMember" method="post" --%>>
			<div class="insertArea">
				<table>
					<tr align="center">
						<td colspan="3" font-size="30px">아래 영역을 클릭하여 필요한 자료를 첨부해주세요</td>
					</tr>
					<tr align="center">
						<td>법인등기부등본</td>
						<td>그 외 첨부파일(1개)</td>
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
			</div>
			<div id="fileArea">
				<input type="file" id="Inv_attachment1" name="Inv_attachment1">
				<input type="file" id="Inv_attachment2" name="Inv_attachment2">
			</div>
			
			
			<div class="btnArea">
				<button>취소하기</button>
				<button type="submit">작성완료</button>
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