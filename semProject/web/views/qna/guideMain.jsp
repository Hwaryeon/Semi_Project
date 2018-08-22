<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>







<title> 이용가이드</title>
	


<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">

<link rel="stylesheet" type="text/css" href="../../css/qna/qna.css">


<style>
.guide_top {
    max-width: 1224px;
    margin-left: auto;
    margin-right: auto;
}


.guide_top .search_area {
    margin-bottom: 28px;
}
.search_form {
    position: relative;
    width: 44%;
    margin: 0 auto;
}
fieldset, img {
    border: 0 none;
}
.search_form .tit_search {
    margin-bottom: 20px;
    font-size: 1.875em;
    text-align: center;
}
.tf_comm {
    display: block;
    position: relative;
}

.search_form .tf_comm .placehoder {
    padding: 3% 10px;
    font-size: 1em;
}
.tf_comm .placehoder {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    padding: 5px 10px;
    font-size: .875em;
    color: #999;
    cursor: text;
    display: block;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
    word-break: keep-all;
    word-wrap: break-word;
}
.search_form .tf_comm .tf_cont {
    width: 100%;
    padding: 3.2% 10px;
    text-align: center;
}
.tf_comm .tf_cont {
    display: block;
    padding: 5px 10px;
    border: 1px solid #e1e1e1;
    font-size: .875em;
    color: #303030;
}
.search_form .tf_comm .btn_search {
    position: absolute;
    top: 1px;
    right: 1px;
    width: 11%;
    height: 95%;
    background-color: #fff;
}
.search_form .tf_comm .btn_search .ico_comm {
    width: 26px;
    height: 28px;
    background-position: -909px -882px;
}
.ico_comm {
    display: inline-block;
    overflow: hidden;
    background-image: url(../../images/qna/search.png);
    vertical-align: middle;
    text-indent: -9999px;
}
.faq_panel {
    position: relative;
}
.faq_panel .tit_faq, .faq_panel .tit_target {
    height: 39px;
    font-weight: 400;
    line-height: 39px;
}
.faq_panel .tit_faq {
    font-size: 1.25em;
    color: #000;
}
.faq_panel .on .tit_target {
    z-index: 1;
    height: 40px;
    border-color: #8f8f8f;
    border-bottom: 0 none;
    background-color: #fff;
    color: #8f8f8f;
}
.faq_guest .tit_target {
    right: 114px;
}
.faq_panel .tit_target {
    position: absolute;
    top: 0;
    width: 115px;
    border: 1px solid #ccc;
    font-size: .875em;
    background-color: #e1e1e1;
    color: #777;
    text-align: center;
}

.faq_panel .on .list_top5 {
    display: block;
}
.faq_panel .list_top5 {
    display: none;
    border-top: 1px solid #8f8f8f;
    border-bottom: 1px solid #8f8f8f;
    background-color: #fff;
}
.faq_panel .list_top5 li:first-child {
    border-top: 0 none;
}
.faq_panel .list_top5 li {
    padding: 12px 0;
    border-top: 1px solid #d6d6d6;
}
.faq_host .tit_target {
    right: 0;
}
.guide_links {
    overflow: hidden;
    margin-top: 70px;
    border-right: 1px solid #e1e1e1;
}
.guide_links li {
    float: left;
    width: 33.333%;
    border-left: 1px solid #e1e1e1;
    text-align: center;
}
.guide_links .tit_common {
    background: url(../../images/qna/guideMain1.PNG) no-repeat 50% 65px;
}
.guide_links .tit_guest {
    background: url(../../images/qna/guideMain2.PNG) no-repeat 50% 65px;
}
.guide_links .tit_host {
    background: url(../../images/qna/guideMain3.PNG) no-repeat 50% 65px;
}
.guide_links strong {
    display: block;
    padding-bottom: 210px;
    font-weight: 400;
    font-size: 1.25em;
    line-height: 1.2;
}
.guide_links a {
    display: inline-block;
    padding: 12px 20px;
    font-size: .875em;
    background-color: #777;
    color: #fff;
}

.faq_panel .label_support {
    background-color: #80c72d;
}
.faq_panel .label_stock {
    background-color: #05a7e2;
}

.faq_panel .label_stock, .faq_panel .label_support {
    display: inline-block;
    width: 8.745%;
    height: 30px;
    margin-right: 5px;
    font-size: .875em;
    line-height: 30px;
    color: #fff;
    text-align: center;
    vertical-align: middle;
}

.faq_panel .on .tit_target {
    z-index: 1;
    height: 40px;
    border-color: #8f8f8f;
    border-bottom: 0 none;
    background-color: #fff;
    color: #8f8f8f;
}
.faq_panel .on .tit_target:after {
    position: absolute;
    bottom: 2px;
    left: 50%;
    width: 38px;
    height: 2px;
    margin-left: -19px;
    background-color: #f88b46;
    content: "";
}


</style>
<script>

$(document).on("click",".tit_target",function(){
	
	if( document.getElementById("faq_guest").className == "faq_guest on" ){
		document.getElementById("faq_guest").className = "faq_guest";
		document.getElementById("faq_host").className = "faq_host on";
	}else{
		document.getElementById("faq_guest").className = "faq_guest on";
		document.getElementById("faq_host").className = "faq_host";
	}
		
});



</script>


<style>
.head_guide {
    background: url(../../images/qna/bg_guide.jpg) no-repeat 50% 0;
}
</style>

</head>    
<body>
    <%@ include file="/views/common/headBar.jsp" %>
    <div id="omcWrap" style="margin-top:87px;">
    	<!-- header -->
        

   	    <!-- header -->
<main id="omcContainer" class="cont_guide">
	<div id="cMain">
	<div class="head_guide">
				<div class="wrap_txt">
					<h3 class="tit_gudie" style="color: black;">
						이용가이드 <span class="sub_tit">Funding Guide</span>
					</h3>
					<p class="sub_txt" style="color: black;">펀딩 관련 서비스에 대해 안내드립니다.</p>
				</div>
			</div>
		<article id="mContent" class="guide_top">
			<h2 id="omcBody" class="screen_out">이용가이드</h2>



<script>
function fn_addClass(litype){
	$("#comCro_li").removeClass();
	$("#comJoi_li").removeClass();
	$("#comFaq_li").removeClass();
	$("#gstRewPay_li").removeClass();
	$("#gstRewRew_li").removeClass();
	$("#gstRewFaq_li").removeClass();
	$("#gstInvCer_li").removeClass();
	$("#gstInvPro_li").removeClass();
	$("#gstInvDis_li").removeClass();
	$("#gstInvFaq_li").removeClass();
	$("#mkrRewApp_li").removeClass();
	$("#mkrRewChe_li").removeClass();
	$("#mkrRewPro_li").removeClass();
	$("#mkrRewCal_li").removeClass();
	$("#mkrRewFaq_li").removeClass();
	$("#mkrInvApp_li").removeClass();
	$("#mkrInvChe_li").removeClass();
	$("#mkrInvReg_li").removeClass();
	$("#mkrInvPro_li").removeClass();
	$("#mkrInvDel_li").removeClass();
	$("#mkrInvFaq_li").removeClass();
	var base = $("#"+litype);
	var divId = window.location.hash;
	//alert(divId);
	base.addClass("on");
	if (divId.substring(1,4)=="com"){
		$("#comRoot").addClass("on");	
	} else if (divId.substring(1,4)=="gst"){
		$("#gstRoot").addClass("on");
		if(divId.substring(4,7)=="Inv"){
			//$("#gstInv").addClass("lnb_stock");	
		}else if (divId.substring(4,7)=="Rew"){
			$("#gstRew").addClass("lnb_support");
		}		
	} else if (divId.substring(1,4)=="mkr"){
		$("#mkrRoot").addClass("on");
		if(divId.substring(4,7)=="Inv"){
			$("mkrInv").addClass("on");
		}else if (divId.substring(4,7)=="Rew"){
			$("#mkrRew").addClass("on");
		}		
	}
}
</script>
<nav class="guide_nav">
					<h3 class="screen_out">이용가이드 서브메뉴</h3>
					<div class="inner">
						<ul class="list_nav_guide">
							<li id="comRoot"><a href="guide.jsp"
								class="link_cont">공통</a>
								<ul class="lnb_depth">
									<li id="9 6b bgvt6 vg6tfvg7"><a href="guide.jsp#comCro"
										class="link_depth" onclick="fn_addClass('comCro_li')">크라우드펀딩이란?</a></li>
									<li id="comJoi_li"><a href="guide.jsp#comJoi"
										class="link_depth" onclick="fn_addClass('comJoi_li')">회원가입</a></li>
									<li id="comFaq_li"><a href="guide.jsp#comFaq"
										class="link_depth" onclick="fn_addClass('comFaq_li')">FAQ</a></li>
								</ul></li>
							<li id="gstRoot"><a href="guest.jsp#gstRewPay"
								class="link_cont">펀딩 참여자</a>
								<ul class="list_sub">
									<li id="gstRew" class=""><a
										href="guest.jsp#gstRewPay" class="link_sub">후원형</a>
										<ul class="lnb_depth">
											<li id="gstRewPay_li"><a
												href="guest.jsp#gstRewPay" class="link_depth"
												onclick="fn_addClass('gstRewPay_li')">결제</a></li>
											<li id="gstRewRew_li"><a
												href="guest.jsp#gstRewRew" class="link_depth"
												onclick="fn_addClass('gstRewRew_li')">리워드</a></li>
											<li id="gstRewFaq_li"><a
												href="guest.jsp#gstRewFaq" class="link_depth"
												onclick="fn_addClass('gstRewFaq_li')">FAQ</a></li>
										</ul></li>
									<li id="gstInv" class=""><a
										href="invest.jsp#gstInvCer" class="link_sub">증권형</a>
										<ul class="lnb_depth">
											<li id="gstInvCer_li"><a
												href="invest.jsp#gstInvCer" class="link_depth"
												onclick="fn_addClass('gstInvCer_li')">투자자 인증</a></li>
											<li id="gstInvPro_li"><a
												href="invest.jsp#gstInvPro" class="link_depth"
												onclick="fn_addClass('gstInvPro_li')">투자 진행</a></li>
											<li id="gstInvFaq_li"><a
												href="invest.jsp#gstInvFaq" class="link_depth"
												onclick="fn_addClass('gstInvFaq_li')">FAQ</a></li>
										</ul></li>
								</ul></li>
							<li id="mkrRoot"><a href="maker.jsp#mkrRewApp"
								class="link_cont">펀딩 개설자</a>
								<ul class="list_sub">
									<li id="mkrRew" class=""><a
										href="maker.jsp#mkrRewApp" class="link_sub">후원형</a>
										<ul class="lnb_depth">
											<li id="mkrRewApp_li"><a
												href="maker.jsp#mkrRewApp" class="link_depth"
												onclick="fn_addClass('mkrRewApp_li')">프로젝트 신청</a></li>
											<li id="mkrRewChe_li"><a
												href="maker.jsp#mkrRewChe" class="link_depth"
												onclick="fn_addClass('mkrRewChe_li')">프로젝트 심사</a></li>
											<li id="mkrRewPro_li"><a
												href="maker.jsp#mkrRewPro" class="link_depth"
												onclick="fn_addClass('mkrRewPro_li')">펀딩 진행</a></li>
											<li id="mkrRewCal_li"><a
												href="maker.jsp#mkrRewCal" class="link_depth"
												onclick="fn_addClass('mkrRewCal_li')">정산</a></li>
											<li id="mkrRewFaq_li"><a
												href="maker.jsp#mkrRewFaq" class="link_depth"
												onclick="fn_addClass('mkrRewFaq_li')">FAQ</a></li>
										</ul></li>
									<li id="mkrInv" class=""><a
										href="makerInvest.jsp#mkrInvApp" class="link_sub">증권형</a>
										<ul class="lnb_depth">
											<li id="mkrInvApp_li"><a
												href="makerInvest.jsp#mkrInvApp" class="link_depth"
												onclick="fn_addClass('mkrInvApp_li')">투자받기 신청</a></li>
											<li id="mkrInvChe_li"><a
												href="makerInvest.jsp#mkrInvChe" class="link_depth"
												onclick="fn_addClass('mkrInvChe_li')">내부심사 및 실사</a></li>
											<li id="mkrInvReg_li"><a
												href="makerInvest.jsp#mkrInvReg" class="link_depth"
												onclick="fn_addClass('mkrInvReg_li')">펀딩 등록</a></li>
											<li id="mkrInvPro_li"><a
												href="makerInvest.jsp#mkrInvPro" class="link_depth"
												onclick="fn_addClass('mkrInvPro_li')">펀딩 진행</a></li>
											<li id="mkrInvDel_li"><a
												href="makerInvest.jsp#mkrInvDel" class="link_depth"
												onclick="fn_addClass('mkrInvDel_li')">증권 발행</a></li>
											<li id="mkrInvFaq_li"><a
												href="makerInvest.jsp#mkrInvFaq" class="link_depth"
												onclick="fn_addClass('mkrInvFaq_li')">FAQ</a></li>
										</ul></li>
								</ul></li>
						</ul>
					</div>
				</nav>
			<article class="guide_article">
				<div class="inner">
					<div class="faq_panel">
						<h3 class="tit_faq">TOP5 질문</h3>
						<div class="faq_guest on" id="faq_guest" ><!-- 선택 시 클래스 on 추가 -->
							<h4 class="tit_target" id="faq_guest_left"><a href="#none" class="link_tab" id="faqGuest">펀딩 참여자</a></h4>
							<div id="faq_left">
							<ul class="list_top5">
								
								<li>
									
									
									
									
									<span class="label_support">후원형</span>
									<a href="guest.jsp#gstRewFaq" class="link_cont">리워드는 언제 배송되나요? </a>
								</li>
   		          				
								<li>
									
									
									
									
									<span class="label_support">후원형</span>
									<a href="guest.jsp#gstRewFaq" class="link_cont">리워드를 변경하고 싶어요.</a>
								</li>
   		          				
								<li>
									
									
									
									
									<span class="label_support">후원형</span>
									<a href="guest.jsp#gstRewFaq" class="link_cont">참여 및 결제한 영수증이 필요합니다.</a>
								</li>
   		          				
								<li>
									
									
									
									
										
										
										
									
									<span class="label_stock">증권형</span>
									<a href="invest.jsp#gstInvFaq" class="link_cont">투자기간이 끝난 후에는 어떻게 진행되나요?</a>
								</li>
   		          				
								<li>
									
									
									
									
										
										
										
									
									<span class="label_stock">증권형</span>
									<a href="invest.jsp#gstInvFaq" class="link_cont">증권이 제대로 들어왔는지는 어떻게 확인할 수 있나요?</a>
								</li>
   		          				
							</ul>
							</div>
						</div>
						<div class="faq_host" id="faq_host">
							<h4 class="tit_target"><a href="#none" class="link_tab" id="faqHost">펀딩 개설자</a></h4>
							<div id="faq_right">
							<ul class="list_top5">
								
								<li>
									
									
																		
									
									<span class="label_support">후원형</span>
									<a href="maker.jsp#mkrRewFaq" class="link_cont">약속된 기간 내 리워드 배송을 하지 못한다면 어떻게 해야 하나요?</a>
								</li>
   		          				
								<li>
									
									
																		
									
									<span class="label_support">후원형</span>
									<a href="maker.jsp#mkrRewFaq" class="link_cont">정산받는 금액의 회계처리는 어떻게 해야 하나요?</a>
								</li>
   		          				
								<li>
									
									
																		
									
										
										
																				
									
									<span class="label_stock">증권형</span>
									<a href="makerInvest.jsp#mkrInvFaq" class="link_cont">온라인 IR 자료는 어떻게 작성해야 하나요?</a>
								</li>
   		          				
								<li>
									
									
																		
									
										
										
																				
									
									<span class="label_stock">증권형</span>
									<a href="makerInvest.jsp#mkrInvFaq" class="link_cont">펀딩 진행중에 온라인 IR을 수정할 수 있나요?</a>
								</li>
   		          				
								<li>
									
									
																		
									
										
										
																				
									
									<span class="label_stock">증권형</span>
									<a href="makerInvest.jsp#mkrInvFaq" class="link_cont">펀딩 종료된 후 절차는 어떻게 되나요?</a>
								</li>
   		          				
							</ul>
							</div>
						</div>
					</div>
					<ul class="guide_links">
						<li>
							<strong class="tit_common">공통<br>이용가이드</strong>
							<a href="guide.jsp" class="link_cont">자세히 보기</a>
						</li>
						<li>
							<strong class="tit_guest">펀딩 참여자<br>이용가이드</strong>
							<a href="guest.jsp" class="link_support">후원형</a>
							<a href="invest.jsp" class="link_stock">증권형</a>
						</li>
						<li>
							<strong class="tit_host">펀딩 개설자<br>이용가이드</strong>
							<a href="maker.jsp" class="link_support">후원형</a>
							<a href="makerInvest.jsp" class="link_stock">증권형</a>
						</li>
					</ul>
				</div>
			</article>
		</div>
	</div>
</main>
				
		<!-- footer -->


	</div>
		
</body>
</html>  
