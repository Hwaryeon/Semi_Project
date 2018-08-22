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
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- <script>
	$(function() {
		$(".widget input[type=submit], .widget a, .widget button").button();
		$("button, input, a").click(function(event) {
			event.preventDefault();
		});
	});
</script> -->
<style>
.wrap {
	margin-top: 150px;
	min-height: 1000px;
	font-size: 14px;
}

.textMain {
	width: 650px;
	margin-left: auto;
	margin-right: auto;
	border: 1px solid black;
	background: #ffffff;
	padding-bottom: 30px;
}

.text1 {
	margin-left: 0 auto;
	margin-right: 0 auto;
	margin-top : 1px;
	position: absolute;
    left: 610px;
    top: 280px;
}



.title,.text1 .title, .text2 .title{
	font-weight:bold;
	font-size:1.15em;
	color:black;
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
.img1{
	margin-top : 30px;
	margin-left : 0;
	margin-right : 0;
	margin-bottom: 0;
}
#thumbnail{
	width:100%;
	height:280px;
	background-color:#fff;
	border-bottom : 1px solid black;
}

}
#tle{
	width:80%;
	height:100%;
	margin: 0 auto;
	background-color:gray;
}
h2{
	margin : 0 auto;
}
textarea{
	color:black;
	margin : 0 auto;
}
#titleImg{
	background-color:#66CCFF;
	width:321px;
	height:60px;
	margin : 0 auto;
  	position: absolute;
    left: 610px;
    top: 220px
}
#titleImgArea:hover{
	cursor:pointer;
}
#productthum{
	margin : 0 auto;
}
#tarea{
	position: absolute;
    left: 650px;
    top: 240px
}
#titleImgAreadiv{
	width: 320px;
	height:60px;
}
#firsttext{
	position:absolute;
	margin-top:10px;
	margin-left:16.2px;	
}
</style>





</head>

<body>
	<%@ include file="../common/headBar.jsp"%>

	<div class="wrap">
		
		<div class="textMain">
			
			<form action="<%= request.getContextPath()%>/insert.tn" method="post" encType="multipart/form-data">
					<div id="thumbnail"><span class="title" id="firsttext">1.썸내일 내용 제출</span>
					<br><br>
						<div id="tle">
							<div id="titleImgAreadiv">
								<img id="titleImg"><span id="tarea">클릭하여 대표 이미지를 등록하시오</span>
							</div>
							
							
							<div class="text1">
								<textarea name="intro" id="intro" cols="42" rows="5" style="resize: none"  onclick="removeContent()"> : 상품에 대한 간단한 소개를 작성해주세요.</textarea>
							</div> 
 						</div>
 						<br><br><br><br>
 					</div>
 					<div id="fileArea">
							<input type="file" id="thumbnailImg1" name="thumbnailImg1" multiple onchange="loadImg(this, 1)">
					</div>
 					
			
			
				<div class="text2">
					<span class="title" >2. 투자 핵심 준비</span> <br> <span style="margin-left: 25px;">
						<textarea name="projectPrepare" cols="78" rows="5" style="resize: none"></textarea>
					</span>
				</div>
				
				<div class="text2">
					<span class="title">3. 기업과 사업에 대한 소개</span> <br> <span
						style="margin-left: 25px;"> <textarea name="projectIntro" cols="78" rows="5"
							style="resize: none"></textarea>
					</span>
				</div>

				<div class="text2">
					<span class="title">4. 투자금 사용 계획</span> <br> <span
						style="margin-left: 25px;"> <textarea name="projectPlan" cols="78" rows="5"
							style="resize: none"></textarea>
					</span>
				</div>


				<div class="text2">
					<span class="title">5. 펀딩 오픈시 유의사항 권고</span> <br> <span
						style="margin-left: 25px;"> <textarea disabled cols="78"
							rows="5" style="resize: none">펀딩시 조심해야할점</textarea>
					</span>
				</div>
				<div class="fund_bu">
					<input class="ui-button ui-widget ui-corner-all" type="submit"
						value="등록하기">
				</div>
			</form>			
		</div>
	</div>
	<script>
		$(function(){
			$("#fileArea").hide();
			$("#titleImgAreadiv").click(function(){
				$("#thumbnailImg1").click();
			});
		});
		
		
		function loadImg(value,num){
			console.log("test");
			if(value.files && value.files[0]){
				var reader = new FileReader();
				reader.onload = function(e){
					switch(num){
					case 1 :
						$("#titleImg").attr("src", e.target.result);
						break;
					
					}
				}
				reader.readAsDataURL(value.files[0]);
			}
		}
		
		
		function removeContent(){
			var flag = 1;
			
			if(flag==1){
				$("#intro").val("");
				flag=0;
			}
		}
	</script>
</body>
</html>