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

#login,#popCloseBtn{
		width:100px;
		height:30px;
	}
	#login{
		border:1px solid;
		background-color: #05a7e2;
		color: #fff;
	}
	#popCloseBtn{
		border:1px solid;
		color:#05a7e2;
		background-color:#fff;
	}
	#popupDiv {
    top : 0px;
    position: absolute;
    background: #fff;
    width: 400px;
    height: 220px;
    display: none; 
    text-align:center;
    font-size:17pt;
    }
    
    #popup_mask { 
        position: fixed;
        width: 100%;
        height: 1000px;
        top: 0px;
        left: 0px;
         display: none; 
         background-color:#000;
         opacity: 0.8;
    }
    
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
	margin-bottom: 88px;
}

.text1 {
	margin-left: 0 auto;
    margin-right: 0 auto;
    margin-top: 1px;
    /* margin-top: 30px; */
    /* margin-left: 28px; */
    float: right;
}



.title,.text1 .title, .text2 .title{
	font-weight:bold;
	font-size:1.15em;
	color:black;
}

.text1 .title, .text2 .title{
	font-weight:bold;
	font-size:1.15em;
	margin-bottom:0.1px;
	    text-align: left;
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
	margin-top: -41px;
}

.fund_bu {
	margin-left: auto;
	margin-right: auto;
	width: 100px;
	margin-top: 20px;
}
.fund_bu .ui-button{
	background:#00cca3;
	width: 100px;
}
.img1{
	margin-top : 30px;
	margin-left : 0;
	margin-right : 0;
	margin-bottom: 0;
}
#thumbnail{
	width:100%;
	height:236px;;
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
	height:108px;
	margin : 0 auto;
  	/* position: absolute; */
    left: 610px;
    top: 220px
        margin-left: 10px;
}
#titleImgArea:hover{
	cursor:pointer;
}
#productthum{
	margin : 0 auto;
}
#tarea{
	/* position: absolute;
    left: 493px;
    top: 212px; */
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
.fileTitle{
    font-size: 17px;
    color: black;
    font-family: 'Limelight';
    margin-left: 30px;
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
							<div id="titleImgAreadiv" style="float:left; position: relative;">
								<img id="titleImg"><span id="tarea"
								style="position: relative; left: 56px; top: -66px;">클릭하여 대표 이미지를 등록하시오</span>
							</div>
							<div class="text1">
								<textarea name="intro" id="intro" cols="42" rows="5" style="resize: none;margin-right: 18px;"  onclick="removeContent()"> : 상품에 대한 간단한 소개를 작성해주세요.</textarea>
							</div> 
							<br><br>
							<div style="margin-top: 91px;">
							<span  class="fileTitle" style="float:left; margin-right:10px; width: 214px;">사업자 등록증</span>
							
							 <input style="float:left;" type="file" id="image_uploads" name="uploads2" accept=".jpg, .jpeg, .png" multiple>
							<span  class="fileTitle" style="float:left; margin-right:10px; width: 214px;">재무제표</span>
							 <input style="float:left;" type="file" id="image_uploads2" name="uploads3" accept=".pdf, .jpeg, .png" multiple>
							</div>
							<br>
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
				
				<div class="text2">
					<span class="title">6. 펀딩 한 단위 가격</span> <br> <span
						style="margin-left: 25px;"> <textarea name="amount" cols="78" rows="5"
							style="resize: none"></textarea>
					</span>
				</div>
				<div class="fund_bu">
					<input class="ui-button ui-widget ui-corner-all" id="submit"
						value="등록하기">
				</div>
				
				<div id ="popup_mask" ></div>
    
    			<div id="popupDiv">
    	
    			<p><br>등록 신청이 완료되었습니다
    				내부 심사를 거쳐 프로젝트를 승인합니다.<br>
    				 </p>
    			<hr>
    			<button id="login">확인</button>
        		<!-- <button id="popCloseBtn">취소</button> -->
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
		
		$(document).ready(function(){
	        
	        $("#submit").click(function(event){   
	 
	             $("#popupDiv").css({
	                "top": (($(window).height()-$("#popupDiv").outerHeight())/2+$(window).scrollTop())+"px",
	                "left": (($(window).width()-$("#popupDiv").outerWidth())/2+$(window).scrollLeft())+"px"
	                
	             }); 
	            
	            $("#popup_mask").css("display","block"); 
	            $("#popupDiv").css("display","block"); 
	            
	            $("body").css("overflow","hidden");
	        });
	        
	        $("#popCloseBtn").click(function(event){
	            $("#popup_mask").css("display","none"); 
	            $("#popupDiv").css("display","none"); 
	            $("body").css("overflow","auto");
	        });
	    });
		
		$(function(){
	    	$("#login").click(function(){
	    		location.href="<%=request.getContextPath()%>/SelectList.tn";
	    	})
	    })
	</script>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>