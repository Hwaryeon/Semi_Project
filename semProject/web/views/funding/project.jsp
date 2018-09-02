<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>

<%--  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<title>프로젝트 신청</title>
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

	<script src="<%=request.getContextPath()%>/js/common/scroll.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.1/TweenMax.min.js"></script>
<style>
	
	*{margin:0;padding:0;}
	body{
		background:#f5f5f5;
	}
	
	#auth,#popCloseBtn{
		width:150px;
		height:40px;
	}
	#auth{
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
	
	.title{
		height:200px;
		margin:30px;
		font-size:25pt;
		text-align:center;
	}
	.title #bold{
		font-weight:bold;
	}

	 #header{
		height:100px;
		line-height:100px;
		font-size:30px;
		border-bottom:3px solid #000;
		text-align:center;
		background:white;
		}
	#footer{
		border-top:1px solid #666;
		height:70px;
		line-height:70px;
		text-align:center;
	}
	#content{
		position:relative;
		width:100%;
		height:200px;
		display:inline-block;
		background:#f5f5f5;
	}
	.left{
		position:absolute;
		width:50%;
		height:300px;
		left:50px;
	}
	#application{
		width:200px;
		height:50px;
		background-color: #05a7e2;
		border-color:#bbb;
		/* border:1px ; */
		color: #fff;
		margin-top: -10px;
	}
	
	#bt2{
		width:200px;
		height:50px;
		
		border-color:#bbb;
		/* position : relative;
		left : 500px;
		top : 100px; */
		color: #fff;
		margin-top: -10px;
	}
	#content .pro{
		width:50%;
		
		margin : 0 auto;
	}
	/* #content .btn{
		width:595px;
		border: 1px solid;
		border-top: 0px solid;
		margin:0 auto;
	} */
	#content .picture{
		width:600px;
		margin:0 auto;
	}
	.success{
		font-size:30pt;
		position : relative;
		height:500px;
		text-align:center;
	}
	#submit{
		/* width: 18%;
   	 	left: 210px;
    	position: absolute;
    	top: 110px; */
    	float: left;
    	margin-right: 20px;
	}
	#info{
		/* width: 22%;
   	 	left: 800px;
    	position: absolute;
    	top: 110px; */
	}
	.img_rwd{
		width:100%;
		height:230px;
	}
	#sediv{
		width:100%;
		height:200px;
		background:#E6E6E6;
	}
	#down{
		position:absolute;
		left:130px;
	}
	#down2{
		position:absolute;
		right:200px;
	}
</style>
</head>
<body>
	<%@ include file="../common/headBar.jsp"%> 
	<br><br><br>
	<header class="head_banner">
						<div class="hero"><img src="<%=request.getContextPath()%>/images/common/img_company_ceo1.jpg" alt="프로젝트 신청 배경 이미지 입니다." class="img_rwd"></div>
						<div class="layer">
							<h1 class="tit_comm"></h1>
							<p class="txt_comm"></p>
						</div>
					</header>
<!-- 	<hr style="width:100%;"> -->
<div class="firstlv" style="width:965px; margin-left:auto; margin-right:auto;">


	<div class="im">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<img src="<%=request.getContextPath()%>/images/common/projectinfo.PNG" id="firstim"></div>
</div>

	<div id="sediv">
		<div id="down" style="margin-left:70px; margin-top:73px; float:left;" >
			<div id="submit">프로젝트를 신청하시겠습니까?</div>
			<button id="application" class="bt1" type="button" style="border-radius: 1px;">프로젝트 신청하기</button>			
		</div>
		
		<div id="down2"style="float:left; margin-left: 70px; margin-top: 73px;">	
			<div id="info" style="float:left; margin-left:20px;">프로젝트 신청 전에 규정을 읽어보세요</div>
			<button class="form-control btn btn-danger" id="bt2" data-toggle="modal" data-target="#myModal" style="float:left; margin-left:20px;">규정 알아보기</button>
		</div>
	</div>
    <div id ="popup_mask" ></div>
    
    <div id="popupDiv">
    	
    	<p><br>사업자 인증이 필요합니다<br>
    	</p>
    	<hr>
    	<button id="auth">인증하기</button>
        <button id="popCloseBtn">취소</button>
    </div>
    
    <div id="popupDiv">
    	
    	<p><br>테스트용<br>
    	</p>
    	<hr>
    	<button id="auth">인증하기</button>
        <button id="popCloseBtn">취소</button>
    </div>
    
    <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h3 class="modal-title" align="center" style="font-size:24px">프로젝트 신청 규정</h3>
        </div>
        <div class="modal-body">
          <p id="left"><br>
 	&nbsp;투자모집 신청정보와 서류를 바탕으로 내부심사를 거쳐 펀딩 진행여부를 결정합니다.

심사는 법적 요건 및 재무상황을 고려해 판단되며 필요한 경우 추가 서류 요청이 있을 수 있습니다.

심사기간은 최대 2주가 소요되며, 심사결과는 개별 안내 드립니다..<br>
 	<br>
 	&nbsp;기업에서 제출한 자료 및 수집된 정보를 바탕으로 오마이컴퍼니 심사팀에서 사실 확인 및 점검을 진행합니다.

이 과정에서 제출 된 내용과 사실이 다를 경우 펀딩 진행이 취소될 수 있습니다.<br>
 	&nbsp;크라우드펀딩을 통해 발행될 증권의 세부 조건을 협의하고 발행예정기업과 오마이컴퍼니 간의 온라인소액투자중개 계약을 체결합니다.<br>
 	&nbsp;유관기관 등록에 필요한 서류들을 준비하여야 합니다.

요청서류에 관련하여서는 오마이컴퍼니에서 친절히 안내드리겠습니다.<br>
 	&nbsp;투자자분들께 펀딩에 대해 소개하는 IR 자료를 준비합니다.

IR자료에는 투자핵심정보, 기업과 사업에 대한 소개, 투자금 사용 계획 등이 포함되어야 합니다.
(오마이컴퍼니의 기존 프로젝트 참고)<br>
 	&nbsp;프로젝트 오픈 전 투자자들이 발행 기업의 정보를 충분히 검토할 수 있도록 온라인 IR을 오마이컴퍼니 홈페이지에 미리 게시할 수 있으며, 해당 프로젝트의 사전예약서비스를 통해 프로젝트 오픈 알림받기를 신청한 투자자들에게는 투자가 시작될 시 가장 먼저 알려드립니다.<br>
 	&nbsp;프로젝트가 오픈되면 투자마감일까지 투자자들이 자유롭게 기업의 정보를 보고 투자를 진행할 수 있습니다.

투자기간 동안 Q&A를 통해 투자자분들과 소통하실 수 있습니다.<br>
 	&nbsp;투자기간 내에 목표금액의 80% 이상이 모집되었을 경우 펀딩 성공으로 인정되어 증권발행이 가능합니다.

목표금액의 80% 미만으로 모집되었을 경우, 펀딩 실패로 종료됩니다.

펀딩 실패시 투자금은 투자마감일 익일 환불처리 됩니다. 만일 목표금액의 100%를 초과하여 모집되었을 경우, 100%분 까지만 인정되어 초과된 투자금은 증권 배정작업이 완료된 후 환불처리 됩니다.<br>
 	<br>
 	&nbsp;펀딩 성공 시 발행되는 증권의 유형에 따라 개별 안내 드립니다.

투자마감일로부터 8 영업일 이후가 발행인이 투자금을 납입받는 납입일이며, 납입일 이전 증권 배정작업이 완료됩니다.

주식의 경우 납입일 익일에 증권이 발행되며, 투자마감일로부터 21 영업일 이후에 투자자분의 증권계좌로 주식이 입고됩니다.

채권의 경우 납입일, 발행일, 교부일이 모두 투자마감일로부터 8 영업일 이후입니다.<br>
 	<br>
 	
 	</p>
  	      </div>
  	    </div>
  	    
  	  </div>
 	 </div>
 	 
   <script>
    
    $(document).ready(function(){
    	$("#application").click(function(event){
    		<% if(loginUser.getUserClass().equals("general") || loginUser.getUserClass().equals("investor")){ %>
             $("#popupDiv").css({
               "top": (($(window).height()-$("#popupDiv").outerHeight())/4+$(window).scrollTop())+"px",
               "left": (($(window).width()-$("#popupDiv").outerWidth())/2+$(window).scrollLeft())+"px"
            	}); 
           	$("#popup_mask").css("display","block"); 
           	$("#popupDiv").css("display","block");
           	$("body").css("overflow","hidden"); 
           
   		
           <% } else if(loginUser.getUserClass().equals("business")) {%>
           
            var contextPath = '<%= request.getContextPath() %>';
         	var loc = contextPath + '/ptype';
         		
         	location.href=loc;
      		<% } %>
   	});
   });
    
      $("#auth").click(function(event){
      	var contextPath = '<%= request.getContextPath() %>';
      	var loc = contextPath + '/views/myPage/licensee.jsp';
      		
      	location.href=loc;
      });
      
      $("#popCloseBtn").click(function(event){
          $("#popup_mask").css("display","none"); 
          $("#popupDiv").css("display","none"); 
          $("body").css("overflow","auto");
      	});
   
    </script>
    
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>