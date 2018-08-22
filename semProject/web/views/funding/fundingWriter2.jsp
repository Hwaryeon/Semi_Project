<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.js"></script>

<link href="https://fonts.googleapis.com/css?family=Sunflower:300"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Limelight|Sunflower:300"
	rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$(".widget input[type=submit], .widget a, .widget button").button();
		$("button, input, a").click(function(event) {
			event.preventDefault();
		});
	});
</script>
<style>
.wrap {
	margin-top: 150px;
	min-height: 1000px;
	font-size: 14px;
}

.textMain {
	width: 650px;
	/* height:850px; */
	margin-left: auto;
	margin-right: auto;
	border: 1px solid black;
	background: #ffffff;
	padding-bottom: 30px;
}

.text1 {
	width: 95%;
	height: 50px;
	/*  border: 1px solid; */
	margin-left: auto;
	margin-right: auto;
	margin-top: 50px;
}

.text1 span {
	float: left;
}

.text1 .title, .text2 .title{
	font-weight:bold;
	font-size:1.15em;
}

.text2 {
	width: 95%;
	height: 137px;
	/*  border: 1px solid; */
	margin-left: auto;
	margin-right: auto;
	margin-top: 10px;
}

.text2 textarea {
	margin-top: 10px;
}

.fund_bu {
	margin-left: auto;
	margin-right: auto;
	width: 100px;
	margin-top: 20px;
}
.fund_bu .ui-button{
	background:#00cca3;
}

</style>


</head>

<body>
	<%@ include file="../common/headBar.jsp"%>

	<div class="wrap">
		<form>
			<div class="textMain">
				<div class="text1">
					<span class="title">1. 자격확인</span> <span style="margin-left: 50px;"><input
						type="file"></span>
				</div>

				<div class="text2">
					<span class="title" >2. 투자 핵심 준비</span> <br> <span style="margin-left: 25px;">
						<textarea cols="78" rows="5" style="resize: none"></textarea>
					</span>
				</div>

				<div class="text2">
					<span class="title">3. 기업과 사업에 대한 소개</span> <br> <span
						style="margin-left: 25px;"> <textarea cols="78" rows="5"
							style="resize: none"></textarea>
					</span>
				</div>

				<div class="text2">
					<span class="title">4. 투자금 사용 계획</span> <br> <span
						style="margin-left: 25px;"> <textarea cols="78" rows="5"
							style="resize: none"></textarea>
					</span>
				</div>

				<div class="text2">
					<span class="title">5. 마감 방식 선택</span> <br> <span style="margin-left: 25px;">
						<textarea cols="78" rows="5" style="resize: none"></textarea>
					</span>
				</div>

				<div class="text2">
					<span class="title">6. 펀딩 오픈시 유의사항 권고</span> <br> <span
						style="margin-left: 25px;"> <textarea disabled cols="78"
							rows="5" style="resize: none">펀딩시 조심해야할점</textarea>
					</span>
				</div>

				<div class="fund_bu">
					<input class="ui-button ui-widget ui-corner-all" type="submit"
						value="등록하기">
				</div>


			</div>
		</form>
	</div>



</body>
</html>