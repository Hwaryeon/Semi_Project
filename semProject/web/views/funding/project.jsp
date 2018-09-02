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
		width:100px;
		height:30px;
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
		left:100px;
	}
	#down2{
		position:absolute;
		right:180px;
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
    	<button id="auth">>인증하기</button>
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
          <h3 class="modal-title" align="center" style="font-size:24px">투자 위험 주지 및 고지</h3>
        </div>
        <div class="modal-body">
          <p id="left"><br>
 	&nbsp;본 위험고지서는 자본시장과 금융투자에 관한 법률(이하 “자본시장법”이라고만 합니다) 제117조의7 제4항에 의하여 귀하가 iCrowd에 청약의 주문을 하기 전에 투자의 위험을 사전에 충분히 인지할 수 있도록 iCrowd가 귀하에게 교부하는 것입니다.<br>
 	<br>
 	&nbsp;1. 귀하는 투자대상인 금융투자상품은 자본시장법에 따른 “증권”에 해당하므로 원본손실의 위험성이 있으며, 청약증거금 등 투자한 자금의 원본을 회수할 없음에 따른 손실의 위험이 있음을 이해합니다. 또한 귀하가 예상하거나 기대하는 수익의 일부 또는 전부를 얻지 못할 수 있습니다.<br>
 	&nbsp;2. 귀하는 iCrowd의 홈페이지에 게재(정정)된 모집되는 증권의 발행조건, 발행인의 재무상태가 기재된 서류 및 사업계획서의 내용, 증권의 취득에 따른 투자위험요소 등을 충분히 확인하였으며, 청약의 주문 시 회사는 투자 위험의 고지 등에 관하여 별도로 정한 방법에 의하여 통지하는 내용에 대하여 확인합니다.<br>
 	&nbsp;3. 귀하는 금번에 발행되는 비상장 증권의 발행목적은 한국거래소의 상장에 있는 것은 아니므로 증권의 환금성에 큰 제약이 있음과 귀하가 예상하는 회수금액에 대한 일부 또는 전부를 회수할 수 없는 위험이 있음을 이해하며, 귀하가 이를 감당할 수 있음을 확인합니다.<br>
 	&nbsp;4. 귀하는 시장의 상황, 제도의 변경이 있을 수 있으며, 자본시장법 등 관련법규에 근거하여 투자의 한도에 제한이 있는 경우 이를 준수하여야 함을 이해합니다.<br>
 	&nbsp;5. 귀하는 자본시장법 제117조의10 제7항에 따라 전문투자자(벤처캐피탈 등)에 대한 매도 등 예외적인 경우를 제외하고는 원칙적으로 6개월간 전매가 제한된다는 점을 이해합니다.<br>
 	&nbsp;6. 귀하는 정부가 투자대상인 증권과 관련하여 게재된 사항이 진실 또는 정확하다는 것을 인정하거나 해당 증권의 가치를 보증 또는 승인한 것이 아니라는 점과 게재된 투자정보에 관한 사항은 청약기간 종료 전에 정정될 수 있음을 확인합니다.<br>
 	&nbsp;7. 귀하는 청약기간 중에만 한정하여 청약의 철회가 가능하며(청약기간 종료일 이후에는 청약의 철회 불가), 청약기간의 종료 시 모집금액이 발행인이 목표한 모집예정금액의 80% 미달하는 경우 증권의 발행은 취소된다는 점을 이해합니다.<br>
 	<br>
 	&nbsp;8. 귀하는 아래 사항들에 대하여도 이해하였음을 확인합니다.<br>
 	<br>
 	&nbsp;1) iCrowd는 온라인소액증권 청약과 관련하여 별도의 수수료는 징수하지 않습니다.<br>
	 &nbsp;2) 발행인이 증권의 발행조건과 관련하여 조기상환조건을 설정한 경우 이에 대한 구체적인 내용을 홈페이지를 통해 반드시 확인하여야 합니다.<br>
	 &nbsp;3) iCrowd는 자본시장법상의 온라인소액투자중개업자로서의 지위에서 온라인소액증권발행인과 온라인소액투자중개계약을 체결하여 위 발행인이 발행하는 증권에 대한 청약 거래를 중개하므로, 모집예정금액에 도달한다고 하더라도 직접 증권의 발행하거나 주금을 납입 받지 않습니다.<br>
 	&nbsp;4) 청약의 우대차별사유 : iCrowd는 발행인의 요청에 따라 합리적이고 명확한 기준(선착순 등)에 따라 투자자의 자격 등을 제한할 수 있습니다. 이 경우 귀하는 위 기준과 조건에 따라 청약거래에 있어 차별을 받게 될 수 있습니다.<br>
 	<br>
 	&nbsp;위 사항들은 청약의 주문 거래에 수반되는 위험∙제도 및 청약의 주문 거래와 관련하여 귀하가 알아야 할 사항을 간략하게 서술한 것으로 귀하의 위 거래와 관련하여 발생될 수 있는 모든 위험과 중요 사항을 전부 기술한 것은 아닙니다. 따라서 상세한 내용은 iCrowd 및 관계법규를 통하여 확인하여야 합니다. 또한 이 고지서는 청약의 주문 관련 법규 등에 우선하지 못한다는 점을 양지하시기 바랍니다.<br></p>
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