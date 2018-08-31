<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="utf-8">
<title>이용가이드</title>



<meta name="viewport"
	content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
<meta name="naver-site-verification"
	content="9cf6afa832a16b3ba913b7d07418de0d0c349d38" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" type="text/css" href="../../css/qna/qna.css">
<link rel="stylesheet" type="text/css" href="../../css/qna/invest.css">
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
		<main id="omcContainer">
		<div id="cMain" style="margin-bottom: 4000px;">
			<div class="head_guide">
				<div class="wrap_txt">
					<h3 class="tit_gudie" style="color: black;">
						&nbsp; <span class="sub_tit">&nbsp;</span>
					</h3>
					<p class="sub_txt" style="color: black;">&nbsp;</p>
				</div>
			</div>
			<article id="mContent" class="guide_cont">



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
					<h1 class="tit_guide"><span class="label_stock">증권형</span>펀딩참여자</h1> <!-- 후원형은 label_support -->
					<!-- 
					<ul class="list_guide_tab">
						<li class="support_tab"><a href="#" class="link_tab">후원형</a></li>
						<li class="stock_tab on"><a href="#" class="link_tab">증권형</a></li>
					</ul>
					 활성화 탭 : on 클래스 추가 -->
					<div class="box_guide" id="gstInvCer">
						<h2 class="tit_box">투자자 인증</h2>
						<span class="txt_prepare"><span class="label_prepare">준비물</span>휴대폰인증을 위한 본인명의의 휴대폰, 신분증 사본</span>
						<ol class="list_guide">
							<li>
								<h3 class="tit_list">1) 마이페이지의 계정정보 입력</h3>
								<p class="txt_guide">로그인 후 우측 상단의 화살표버튼을 클릭하여 마이페이지를 클릭하세요.</p>
								<ul class="list_sub_guide">
									<li>마이페이지 > 계정정보 클릭</li>
									<li>휴대폰번호, 주소 등 계정정보 입력</li>
									<li>입력정보 저장 클릭</li>
								</ul>
							</li>
							<li>
								<h3 class="tit_list">2) 투자자 인증</h3>
								<ul class="list_sub_guide">
									<li>휴대폰인증 클릭 : 본인 명의의 휴대폰번호를 통해 본인안심인증 진행</li>
								</ul>
								<a href="/mypage/investor" class="link_go">투자자 인증 바로가기</a>
								<span class="wrap_img"><img src="../../images/qna/img_guide1_pc.jpg" alt="1.통신사 선택 2.본인정보 입력 3.인증번호 입력 4.휴대폰 인증 완료" class=img_rwd></span>
								<ul class="list_sub_guide">
									<li>투자자 인증 유형 선택 후 실명인증번호 입력</li>
									<li>신분증 사본 파일 첨부 후 저장 (ex. 주민등록증 사본, 여권 사본, 외국인등록증 사본 등)</li>
								</ul>
							</li>
							<li>
								<h3 class="tit_list">3) 투자자인증 승인</h3>
								<p class="txt_guide">iCrowd에서 24시간 내로 입력하신 정보를 확인합니다.</p>
								<p class="txt_guide">투자자인증 승인완료 문자를 받으신 이후 투자를 진행하실 수 있습니다.</p>
							</li>
							<li>
								<h3 class="tit_list">4) 투자자유형 변경</h3>
								<p class="txt_guide">일반투자자에서 투자자유형을 변경하길 원하실 경우, 유형에 해당하는 서류와 함께 투자자 유형 인증을 진행해주세요.</p>
								<a href="/mypage/investor" class="link_go">투자자 유형 인증 바로가기</a>
							</li>
						</ol>
					</div>
					<div class="box_guide" id="gstInvPro">
						<h2 class="tit_box">투자 진행</h2>
						<span class="txt_prepare"><span class="label_prepare">준비물</span>증권입고가 가능한 증권계좌, 실시간계좌이체를 위한 보안카드 또는 OTP, 공인인증서</span>
						<ol class="list_guide">
							<li>
								<h3 class="tit_list">1) 투자할 프로젝트 선택하기</h3>
								<ul class="list_sub_guide">
									<li>투자자인증 완료 후 투자 진행</li>
									<li>사이트 상단 [증권형]을 클릭하거나 검색창을 통해 원하는 프로젝트 검색 후 선택</li>
								</ul>
							</li>
							<li>
								<h3 class="tit_list">2) 투자하기</h3>
								<ul class="list_sub_guide">
									<li>펀딩 기업의 온라인IR, 첨부문서 등의 정보를 확인</li>
									<li>‘투자하기’ 클릭</li>
									<li>투자한도조회 : 나의 투자한도 확인</li>
									<li>결제하기 : 구좌수를 입력하여 희망투자금액을 결정하고, 증권계좌정보를 입력한 후 약관 동의</li>
									<li class="txt_import">* 증권계좌가 없는 경우, 증권계좌없음을 선택하여 투자를 진행한 후 펀딩 종료일 전까지 마이페이지에 증권계좌번호를 입력해주세요.</li>
									<li>‘투자하기’ 클릭</li>
								</ul>
							</li>
							<li>
								<h3 class="tit_list">3) 투자금 이체</h3>
								<ul class="list_sub_guide">
									<li>금융결제원 Bankpay 결제 시스템을 통해 결제 진행</li>
									<li class="txt_import">* 결제정보 입력 단계에서 입력하는 계좌번호는 실제 투자금이 이체되는 금융기관 계좌입니다.</li>
								</ul>
								<span class="wrap_img"><img src="../../images/qna/img_guide2_pc.jpg" alt="1.이용동의 2.결제정보 입력 3.공인인증서 암호입력" class=img_rwd></span>
								<p class="txt_import">* 결제가 원활하지 않을 경우 1:1 대화 문의 혹은 T.02-388-2556(내선번호 2번)으로 연락 주시길 바랍니다.</p>
							</li>
							<li class="list_sub_guide">
								<h3 class="tit_list">4) 참여한 투자 정보 확인</h3>
								<ul>
									<li>마이페이지 > 참여 프로젝트 > 증권형 클릭</li> 
									<li>참여한 프로젝트 및 증권계좌정보 확인</li>
									<li>투자취소를 원하실 경우 투자기간 이내에 자유롭게 가능합니다.</li>
									<li>투자 당일 취소 시 이체수수료를 포함한 투자금 전액이 환불 처리되며, 투자 익일부터는 이체수수료를 제외한 투자금이 환불 처리됩니다.</li>
								</ul>
							</li>
						</ol>
					</div>
					<div class="box_guide" id="gstInvFaq">
						<h2 class="tit_box">FAQ</h2>
						
						<div class="box_accor">
							<h3 class="tit_list">투자 준비</h3>
							<ul class="list_accor">
								
								<li id="gstInvFaq23" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">실명인증을 하지 않고 투자할 수는 없나요?</em>
									<div class="cont_accor">
										<p>-증권형 크라우드펀딩에 참여하기 위해서는 반드시 실명인증절차가 필요합니다. 실명인증을 위해서는 현재 사용하시는 이메일 계정으로 회원가입을 하신 뒤, 본인 명의의 휴대폰 실명인증을 거쳐 신분증 사본을 업로드하시면 됩니다.</p>
								    </div>
								</li>
								
								<li id="gstInvFaq24" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">iCrowd는 어떤 역할을 담당하나요?</em>
									<div class="cont_accor">
										<p>- iCrowd는 금융위원회에 등록된 온라인소액투자중개업자입니다.<br /><br /></p>
<p>- 온라인소액투자중개업자란 크라우드펀딩 중개를 담당하는 금융투자업자로 고객 자산을 직접 수탁하거나 운용하지 않고 발행회사와 투자자 사이에서 증권을 단순 중개하는 역할을 합니다. 투자자를 보호하고 시장질서 교란을 방지하기 위해 반드시 자본금과 인적&bull;물적요건 등의 일정 요건을 갖춘 중개업자만이 금융위원회에 등록될 수 있으며, 중개업자는 투자자와 발행사 사이의 원활한 의견교환이 이루어질 수 있는 환경을 조성합니다.</p>
								    </div>
								</li>
								
								<li id="gstInvFaq25" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">투자할 수 있는 자격이 따로 정해져 있나요?</em>
									<div class="cont_accor">
										<p>- 누구나 크라우드펀딩의 투자자가 될 수 있습니다. 다만 투자금 결제는 금융결제원이 제공하는 Bankpay 서비스를 통해 이루어지기 때문에 투자자 명의의 계좌와 해당계좌의 온라인결제를 위한 공인인증서 및 보안카드(또는 OTP)가 필요합니다. 따라서 만 14세 미만의 미성년자의 경우 공인인증서 발급을 위해 법정대리인의 동의를 받아야만 결제 서비스를 이용하실 수 있습니다.</p>
								    </div>
								</li>
								
								<li id="gstInvFaq26" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">얼마까지 투자할 수 있나요?</em>
									<div class="cont_accor">
										<p>-현재 증권형 크라우드펀딩은 투자자 보호를 위해 투자자 유형에 따라 연간 투자한도가 다르게 설정되어 있습니다.</p>
<p>&nbsp;</p>
<p>- 투자자 유형은 크게 일반투자자와 적격투자자, 전문투자자, 연고자로 나뉘며, 모든 투자자는 회원가입 후 최초 승인단계에서 일반투자자로 유형이 설정되어 연간 최대 1,000만원, 동일 발행인당 최대 500만원까지 투자하실 수 있습니다. 적격투자자의 경우 연간 최대 2,000만원, 동일 발행인당 최대 1,000만원까지 투자가 가능하며, 전문투자자와 연고자의 경우 투자한도의 제한이 없습니다.<br /><br /></p>
<table>
<tbody>
<tr>
<td>
<p>투자자 유형</p>
</td>
<td>
<p>동일 발행인 당 한도</p>
</td>
<td>
<p>연간 한도</p>
</td>
</tr>
<tr>
<td>
<p>일반투자자</p>
</td>
<td>
<p>500만원</p>
</td>
<td>
<p>1,000만원</p>
</td>
</tr>
<tr>
<td>
<p>적격투자자</p>
</td>
<td>
<p>1,000만원</p>
</td>
<td>
<p>2,000만원</p>
</td>
</tr>
<tr>
<td>
<p>전문투자자</p>
</td>
<td>
<p>한도없음</p>
</td>
<td>
<p>한도없음</p>
</td>
</tr>
<tr>
<td>
<p>연고자</p>
</td>
<td>
<p>한도없음</p>
</td>
<td>
<p>한도없음</p>
</td>
</tr>
</tbody>
</table>
<p>&nbsp;</p>
								    </div>
								</li>
								
								<li id="gstInvFaq27" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">적격투자자는 누구인가요?</em>
									<div class="cont_accor">
										<p>-적격투자자란 자본시장법 시행령 제118조의17에 해당하는 &lsquo;소득 등 대통령령으로 정하는 요건을 갖춘 자&rsquo;로 연간 최대 2,000만원, 기업당 최대 1,000만원까지 투자할 수 있습니다.</p>
<p>적격투자자의 범위와 제출서류는 다음과 같습니다.</p>
<table>
<tbody>
<tr>
<td>
<p>&nbsp;</p>
</td>
<td>
<p>&nbsp;</p>
</td>
<td>
<p>범위</p>
</td>
<td>
<p>제출서류</p>
</td>
</tr>
<tr>
<td>
<p>소득적격투자자</p>
</td>
<td>
<p>개인의 경우</p>
</td>
<td>
<p>금융소득종합과세 대상자</p>
<p>이자소득 및 배당소득의 합계액이 2천만원*을 초과하는 투자자</p>
<p>*｢소득세법｣ 제14조제3항 제6호의 규정에 의한 이자소득 등의 종합과세기준금액</p>
</td>
<td>
<p>직전 과세기간의 종합소득세 신고서*</p>
<p>*이자소득명세서 및 배당소득명세서 페이지 포함</p>
</td>
</tr>
<tr>
<td>
<p>&nbsp;</p>
</td>
<td>
<p>&nbsp;</p>
</td>
<td>
<p>직전 과세기간의 사업소득과 근로소득의 합계액*이 1억원 이상인 자</p>
<p>*｢소득세법｣ 제19조에 따른 사업소득 + ｢소득세법｣ 제20조에 따른 근로소득</p>
</td>
<td>
<p>직전 과세기간의 종합소득세 신고서(사업소득명세서 페이지 포함) 및 근로소득원천징수영수증(두번째 페이지 포함)</p>
</td>
</tr>
<tr>
<td>
<p>&nbsp;</p>
</td>
<td>
<p>법인의 경우</p>
</td>
<td>
<p>최근 사업연도말 현재 자기자본이 10억원을 초과하는 법인</p>
</td>
<td>
<p>최근 사업연도말 법인세 세무조정 계산서 또는 세무대리인의 재무제표증명원</p>
</td>
</tr>
<tr>
<td>
<p>금융투자전문인력</p>
</td>
<td>
<p>&nbsp;</p>
</td>
<td>
<p>금융전문자격시험에 합격하고, 금융투자전문인력으로 협회에 등록된 자로서 등록기간이 3년 이상인 자*</p>
<p>*｢금융투자회사의 영업 및 업무에 관한 규정｣ 제2-16조의2에 해당하는 크라우드펀딩 적격투자자</p>
<p>*대상 금융전문자격시험</p>
<p>투자권유자문인력, 투자자산운용사, 금융투자분석사, 재무위험관리사, 국제투자분석사(CIIA), 국제재무분석사(CFA), 국제재무위험관리사(FRM) 시험 등</p>
<p>*대상 금융투자전문인력</p>
<p>투자권유자문인력, 투자운용인력, 조사분석인력, 위험관리전문인력</p>
</td>
<td>
<p>해당 금융자격증 및 등록확인 서류*</p>
<p>*등록확인서류 : 3년 이상의 금융투자회사 재직증명서, 혹은 금융투자협회에서 발급한 전문인력 등록확인서</p>
</td>
</tr>
</tbody>
</table>
<p>&nbsp;</p>
								    </div>
								</li>
								
								<li id="gstInvFaq28" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">전문투자자는 누구인가요?</em>
									<div class="cont_accor">
										<p>- 전문투자자란 자본시장법 제117조의10제6항에 해당하는 &lsquo;전문투자자 등 대통령령으로 정하는 자&rsquo;로 한도 제한 없이 투자할 수 있습니다.</p>
<p>전문투자자의 범위와 제출서류는 다음과 같습니다.</p>
<ol>
<li>자본시장법상 전문투자자</li>
</ol>
<table>
<tbody>
<tr>
<td>
<p>&nbsp;</p>
</td>
<td>
<p>범위</p>
</td>
<td>
<p>제출서류</p>
</td>
</tr>
<tr>
<td rowspan="4">
<p>당연전문투자자</p>
</td>
<td>
<p>국가, 한국은행, 주권상장법인</p>
</td>
<td rowspan="4">
<p>사업자등록증,</p>
<p>법인등기부등본</p>
</td>
</tr>
<tr>
<td>
<p>은행(농&bull;수협 포함), 특수은행(산은, 기은, 수은), 금융투자업자, 보험회사, 종합금융회사, 증권금융회사, 자금중개회사, 금융지주회사, 여신전문금융회사, 상호저축은행, 산림조합중앙회, 새마을금고연합회, 신용협동조합중앙회, 이에 준하는 외국금융기관</p>
</td>
</tr>
<tr>
<td>
<p>예금보험공사, 정리금융기관, 한국자산관리공사, 한국주택금융공사, 한국투자공사, 금융투자협회, 한국예탁결제원, 거래소, 금융감독원, 집합투자기구(개별법 펀드 제외), 신용보증기금, 기술보증기금</p>
</td>
</tr>
<tr>
<td>
<p>연기금, 공제법인, 지방자치단체, 해외주권상장국내법인, 외국정부, 국제기구, 외국중앙은행</p>
</td>
</tr>
<tr>
<td rowspan="2">
<p>지정전문투자자</p>
</td>
<td>
<p>[법인]</p>
<p>금융투자상품 잔고가 100억원* 이상인 법인</p>
<p>*「주식회사의 외부감사에 관한 법률」에 따라 외부감사를 받는 주식회사는 50억원</p>
</td>
<td rowspan="2">
<p>금융투자협회 전문투자자 확인증, 법인등기부등본 또는 신분증</p>
</td>
</tr>
<tr>
<td>
<p>[개인]</p>
<p>&bull; 금융투자상품 잔고 5억원 이상</p>
<p>&bull; 직전 년도의 연소득 1억 또는 총자산 10억원 이상</p>
<p>&bull; 금융투자회사에서 계좌 개설 1년 이상 경과</p>
<p>*위의 세가지 조건을 모두 충족한 개인</p>
</td>
</tr>
</tbody>
</table>
<ol start="2">
<li>전문성&bull;위험감수능력을 갖춘 자</li>
</ol>
<table>
<tbody>
<tr>
<td>
<p>&nbsp;</p>
</td>
<td>
<p>범위</p>
</td>
<td>
<p>제출서류</p>
</td>
</tr>
<tr>
<td rowspan="3">
<p>전문가</p>
</td>
<td>
<p>회계법인, 신용평가회사</p>
</td>
<td rowspan="2">
<p>법인등기부등본(말소사항 포함)</p>
</td>
</tr>
<tr>
<td>
<p>중소기업창업투자회사</p>
<p>*「증권의 발행과 공시 등에 관한 규정」 2-1조제2항에 반영</p>
</td>
</tr>
<tr>
<td>
<p>발행인에게 회계, 자문 등의 용역을 제공하는 공인회계사, 감정인, 변호사, 변리사, 세무사</p>
</td>
<td>
<p>발행인과의 자문계약서(또는 이와 유사한 계약서) 사본, 각 전문자격사 등록증, 신분증 사본</p>
</td>
</tr>
<tr>
<td rowspan="3">
<p>투자전문그룹</p>
</td>
<td>
<p>개별법*에 따른 집합투자기구 : 창업투자조합, 신기술사업투자조합, 벤처투자조합 등</p>
<p>*영 제6조제1항 각호 : 「중소기업창업지원법」, 「여신전문금융업법」, 「벤처기업육성에 관한 특별조치법」 등</p>
</td>
<td>
<p>투자조합/신기사/창투사 등 등기서류</p>
</td>
</tr>
<tr>
<td>
<p>벤처&bull;창업자에 대해 최근 2년간 건당 1억원 이상 투자했거나 2건 이상일 경우 4천만원 이상의 투자실적을 보유한 적격엔젤투자자</p>
</td>
<td>
<p>적격투자자 증빙서류(투자를 한 회사의 사업자등록증, 법인등기부등본), 투자실적을 증빙할 수 있는 서류(주주명부, 투자계약서, 자본금납입증명서 등)</p>
</td>
</tr>
<tr>
<td>
<p>「벤처기업육성에 관한 특별조치법」 상 개인투자조합 및 전문엔젤투자자 등</p>
<p>*「증권의 발행과 공시 등에 관한 규정」 2-1조의 3제2항에 규정</p>
</td>
<td>
<p>전문엔젤투자자 확인서</p>
</td>
</tr>
<tr>
<td rowspan="3">
<p>연고자</p>
</td>
<td>
<p>발행기업의 최대주주, 임원, 우리사주조합원, 계열회사 및 그 임원</p>
</td>
<td>
<p>발행인 연고자라는 것을 증빙할 수 있는 서류(주주명부, 법인등기부등본, 우리사주조합 약정서 또는 한국증권금융㈜와의 지주관리위탁계약서, 우리사주조합원임을 증명할 수 있는 증빙 등)</p>
</td>
</tr>
<tr>
<td>
<p>모집&bull;매출 실적이 없는 주권비상장법인의 경우 주주</p>
</td>
<td>
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td>
<p>발행인이 설립중인 회사의 경우 발기인 등</p>
</td>
<td>
<p>&nbsp;</p>
</td>
</tr>
</tbody>
</table>
<p>&nbsp;</p>
								    </div>
								</li>
								
								<li id="gstInvFaq29" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">연고자는 누구인가요?</em>
									<div class="cont_accor">
										<p>- 연고자란 발행인의 최대주주, 임원, 우리사주조합원, 계열회사 및 그 임원, 모집&bull;매출 실적이 없는 주권비상장법인의 경우 주주, 발행인이 설립중인 회사의 경우 발기인 등 해당 발행기업과 연관 관계가 있는 자로 한도 제한 없이 투자할 수 있습니다. 연고자로 투자자 유형을 변경하기 위해서는 다음의 증빙서류를 제출하여 승인을 받으셔야 합니다.<br /><br /></p>
<table>
<tbody>
<tr>
<td>
<p>연고자 범위</p>
</td>
<td>
<p>제출서류</p>
</td>
</tr>
<tr>
<td>
<p>발행기업의 최대주주, 임원, 우리사주조합원, 계열회사 및 그 임원</p>
</td>
<td rowspan="3">
<p>발행인 연고자라는 것을 증빙할 수 있는 서류(주주명부, 법인등기부등본, 우리사주조합 약정서 또는 한국증권금융㈜와의 지주관리위탁계약서, 우리사주조합원임을 증명할 수 있는 증빙 등)</p>
</td>
</tr>
<tr>
<td>
<p>모집&bull;매출 실적이 없는 주권비상장법인의 경우 주주</p>
</td>
</tr>
<tr>
<td>
<p>발행인이 설립중인 회사의 경우 발기인 등</p>
</td>
</tr>
</tbody>
</table>
<p><br /><br /><br /><br /></p>
								    </div>
								</li>
								
								<li id="gstInvFaq30" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">투자를 하려면 무엇을 준비해야 하나요?</em>
									<div class="cont_accor">
										<p>- 증권형 크라우드펀딩으로 투자를 하기 위해서는 몇 가지 준비물이 필요합니다.</p>
<p><strong>1.실명인증을 위한 &lsquo;본인 명의의 휴대폰&rsquo;</strong></p>
<p><strong>2.실명인증을 위한 &lsquo;신분증 사본&rsquo; (ex. 주민등록증, 운전면허증, 여권 등 실명인증번호가 포함된 신분증 사진 또는 문서)</strong></p>
<p><strong>3.청약금을 결제할 &lsquo;금융기관 계좌&rsquo;*, &lsquo;공인인증서&rsquo;, &lsquo;보안카드(또는 OTP)&rsquo;</strong></p>
<p><strong>4.(예탁의 경우) 주식 및 채권이 입고 가능한 &lsquo;증권계좌&rsquo;*</strong></p>
<p>&nbsp;</p>
<p><sub>*Bankpay 서비스 참가 금융기관(2017년 1월 기준)</sub><br /><sub>경남은행, 광주은행, KB국민은행, 기업은행, NH농협, 대구은행, 부산은행, KDB산업은행, 수협중앙회, 신한은행, 새마을금고, 산림조합, 신협중앙회, 우리은행, 우체국, 전북은행, SC제일은행, 제주은행, KEB하나은행, 한국씨티은행, 미래에셋대우증권, 대신증권, 동부증권, 유안타증권, 메리츠종금증권, 삼성증권, 신영증권, 신한금융투자, NH투자증권, 유진투자증권, 하나금융투자, 하이투자증권, 한국투자증권, 한화증권, 현대증권, HMC투자증권, SK증권<br /><br /></sub></p>
<p><sub>*크라우드펀딩 업무 참가 증권사(2017년 1월 기준 21개사)</sub><br /><sub>교보증권, 신한금융투자, 한국투자증권, 대신증권, 신영증권, 유진투자증권, 메리츠종금증권, NH투자증권, 현대차투자증권, SK증권, 골든브릿지투자증권, 삼성증권, DB증권, 하이투자증권, 미래에셋대우증권, 키움증권, KB증권(구 KB투자증권, 구 현대증권), IBK투자증권, 유안타증권, KTB투자증권, 코리아에셋투자증권</sub></p>
								    </div>
								</li>
								
								<li id="gstInvFaq31" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">증권계좌가 꼭 필요한가요? 증권계좌는 어떻게 개설하나요?</em>
									<div class="cont_accor">
										<p>- 네, 증권형 크라우드펀딩에 투자하기 위해서는 반드시 다음의 증권사* 중 한 곳의 증권계좌가 필요합니다. 단, 예탁이 아닌 보호예수가 되는 증권의 경우 증권계좌 없이 은행계좌만으로도 투자가 가능합니다.<br /><br /></p>
<p><sup>*크라우드펀딩 업무 참가 증권사(2017년 1월 기준 21개사)</sup><br /><sup>교보증권, 신한금융투자, 한국투자증권, 대신증권, 신영증권, 유진투자증권, 메리츠종금증권, NH투자증권, HMC투자증권, SK증권, 골든브릿지투자증권, 삼성증권, 동부증권, 하이투자증권, 미래에셋대우증권, 키움증권, KB증권(구 KB투자증권, 구 현대증권), IBK투자증권, 유안타증권, KTB투자증권, 코리아에셋투자증권<br /><br /></sup></p>
<p><strong>증권계좌를 만드는 방법은 간단합니다.</strong><br /><strong>1. 주로 거래하는 &lsquo;은행&rsquo; 또는 &lsquo;증권사&rsquo; 지점을 방문한다.</strong><br /><strong>2.&lsquo;주식 및 채권이 입고 가능한 증권계좌&rsquo; 개설을 요청한다.</strong><br /><strong>3. 상단의 증권사* 중 한 곳을 선택한다. (크라우드펀딩 업무 참가 증권사 참고)</strong><br /><strong>4. 증권계좌 개설 완료!<br /><br /></strong></p>
<p>온라인에 익숙하신 분이라면 은행이나 증권사를 방문하지 않고 증권사의 온라인 사이트를 통해서도 손쉽게 증권계좌를 만드실 수 있습니다. 증권계좌 개설이 완료되면 활성화가 되었는지 확인해주셔야 합니다. 간혹 증권계좌와 연결된 은행 연계계좌를 증권계좌로 착각하는 경우가 있는데, 연계계좌가 아닌 증권계좌번호를 꼭! 확인해주세요.</p>
								    </div>
								</li>
								
								<li id="gstInvFaq32" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">투자한도가 얼마나 남았는지 확인할 수 있나요?</em>
									<div class="cont_accor">
										<p>- 투자한도는 투자를 진행하는 단계에서 확인하실 수 있습니다. 원하는 프로젝트를 선택하고 &lsquo;투자하기&rsquo; 버튼을 클릭하면 &lsquo;투자한도조회&rsquo; 창으로 연결되는데, 바로 이 단계에서 나의 투자자유형과 그에 따른 투자한도를 알 수 있습니다. &lsquo;나의 투자한도&rsquo; 바로 옆에 보여지는 금액이 해당 프로젝트에서 최대로 투자할 수 있는 금액이며, &lsquo;총 연간 한도금액&rsquo;은 설정된 투자자 유형에 따라 연간 최대로 투자할 수 있는 금액입니다.</p>
								    </div>
								</li>
								
							</ul>
						</div>
						
						
						<div class="box_accor">
							<h3 class="tit_list">투자 진행</h3>
							<ul class="list_accor">
								
								<li id="gstInvFaq33" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">투자할 수 있는 시간이 정해져 있나요?</em>
									<div class="cont_accor">
										<p>-&nbsp;증권형 크라우드펀딩 투자가&nbsp;가능한 시간은 월~토 05:00 ~ 23:00 입니다.</p>
<p>*일요일 또는 비정기적시스템 점검이 있을 경우 청약이 제한될 수 있습니다.</p>
<p>&nbsp;</p>
								    </div>
								</li>
								
								<li id="gstInvFaq34" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">투자는 어떻게 진행되나요?</em>
									<div class="cont_accor">
										<p><strong>1. 투자하기 클릭</strong></p>
<p>회원가입과 실명인증 절차가 모두 완료되었다면 원하시는 증권형 프로젝트를 선택하고, &lsquo;투자하기&rsquo; 버튼을 클릭해 진행해주시면 됩니다.</p>
<p><br /><strong>2. 투자한도조회</strong></p>
<p>나의 투자한도를 확인한 뒤, 투자하려는 금액에 맞게 구좌 수를 선택하고 유의사항 및 약관에 동의합니다.</p>
<p><br /><strong>3. 결제하기</strong></p>
<p>이후 Bankpay 결제 창에서 결제정보를 입력하고, 공인인증서 인증을 통해&nbsp;투자금 결제가 이루어지게 됩니다. 단, 이때 입력하는 계좌번호는 증권이 입고되는 증권계좌가 아닌 투자금이 빠져나가는 금융기관의 계좌임을 꼭 기억해주세요!</p>
<p><br /><strong>4. 투자 신청 완료!<br /></strong><br />결제가 완료되면 투자내역확인 창에서 앞서 입력한 증권계좌가 실제 이용가능한 계좌인지 확인하는 &lsquo;증권계좌 유효성 확인&rsquo;을 하실 수 있습니다.</p>
<p>&nbsp;</p>
								    </div>
								</li>
								
								<li id="gstInvFaq35" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">결제는 어떻게 하나요? 실시간계좌이체 말고 다른 결제방법은 없나요?</em>
									<div class="cont_accor">
										<p>- 현재 투자금의 결제는 금융결제원의 Bankpay 서비스를 통해 실시간계좌이체로 가능합니다.<br /><br /></p>
<p>- 증권형 크라우드펀딩은 실명법상 실명확인을 해야할 의무가 있기 때문에 실명확인절차가 필요합니다. 이때 실시간계좌이체는 별도의 대면 인증 없이도 본인명의의 거래임을 확인할 수 있는 비대면 실명확인의 수단이자 결제수단이 되기 때문에 투자금의 결제는 실시간계좌이체 방법으로 이루어지고 있습니다.</p>
								    </div>
								</li>
								
								<li id="gstInvFaq36" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">투자를 취소하고 싶은데, 환불은 어떻게 받나요?</em>
									<div class="cont_accor">
										<p>- 투자자는 투자기간이 끝나기 직전까지 결제한 투자를 취소할 수 있습니다.<br /><br /></p>
<p>- 투자취소는 투자가 가능한 시간(월~토 05:00 ~ 23:00) 내에 언제든지 가능합니다. 다만 결제가 이루어진 당일 투자를 취소할 경우 이체수수료를 포함한&nbsp;투자금 전액이 환불되지만, 당일이 넘어가면 이체수수료는 환불되지 않으며 투자금만 환불됩니다.<br />&nbsp;</p>
<p>-&nbsp;청약기간이 종료된 이후에는 투자의사를 철회하실 수 없습니다. 단, 투자한 프로젝트가 목표금액 모집에 실패한 경우에는 모집종료일 다음날(은행영업일 기준) 입금하신 투자금이 환불처리 됩니다.</p>
								    </div>
								</li>
								
								<li id="gstInvFaq37" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">투자위험은 어느 정도인가요? 투자자를 보호하기 위한 장치가 마련되어 있나요?</em>
									<div class="cont_accor">
										<p>- 투자자들은 증권형 크라우드펀딩을 통해 창업 혹은 성장 단계에 있는 비상장 중소기업 등이 발행한 증권에 투자합니다. 기업가치가 상대적으로 낮게 평가되는 시점에서 투자할 수 있다는 장점이 있는 반면, 사업의 성공 가능성에 대한 불확실성이 크고, 증권의 유동성이 낮아 그 성격에 따라 투자자금 회수에 이르기까지 상당한 기간이 소요될 수 있습니다.</p>
<p>&nbsp;</p>
<p>- 이에 증권형 크라우드펀딩 제도는 투자자들이 선의의 피해를 입지 않도록 제도적으로 발행인당 및 연간 투자한도에 제한을 두고 있습니다. iCrowd는 투자자들이 투자위험과 관련된 내용을 숙지하고, 신중하게 투자를 결정하시도록 안내해드립니다. 증권형 크라우드펀딩에 대한 투자는 고위험투자로, 「예금자보호법」에 따라 보호되지 않으며 투자원금의 손실이 발생할 수 있으므로 투자를 결정하실 때에는 신중을 기하여 주시기 바랍니다.</p>
<p>&nbsp;</p>
								    </div>
								</li>
								
								<li id="gstInvFaq38" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">투자한 금액에 대해 소득공제를 받을 수 있나요?</em>
									<div class="cont_accor">
										<p>- 크라우드펀딩으로 지분투자한 기업이 「벤처기업」 또는 「창업 3년 이내의 기술성 우수기업」에 해당하는 경우 엔젤투자 소득공제 요건(조세특례제한법 &sect;16⓵)에 따라 소득공제를 받으실 수 있습니다. 다만 투자 후 3년이 지나기 전에 지분을 양도하거나 회수할 경우 공제액이 추징될 수 있습니다.</p>
<table>
<tbody>
<tr>
<td colspan="2">
<p>구분</p>
</td>
<td>
<p>소득공제율</p>
</td>
</tr>
<tr>
<td rowspan="3">
<p>개인이 직접 또는 개인투자조합을 통해 벤처기업에 투자하는 경우</p>
</td>
<td>
<p>1,500만원 이하</p>
</td>
<td>
<p>100%</p>
<p>*2015년부터 3년간 한시적용</p>
</td>
</tr>
<tr>
<td>
<p>1,500만원 초과 ~ 5,000만원 이하</p>
</td>
<td>
<p>50%</p>
</td>
</tr>
<tr>
<td>
<p>5,000만원 초과</p>
</td>
<td>
<p>30%</p>
</td>
</tr>
<tr>
<td colspan="2">
<p>창투조합 등을 통한 간접투자</p>
</td>
<td>
<p>10%</p>
</td>
</tr>
</tbody>
</table>
<p>&nbsp;</p>
<p>소득공제를 받기 위해서는 투자하신 벤처기업에 투자확인서 발급을 요청하신 후, 이를 원천징수의무자에게 소득공제서류로 제출하시면 됩니다.</p>
								    </div>
								</li>
								
								<li id="gstInvFaq39" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">투자자가 지불해야 하는 비용 혹은 수수료가 있나요?</em>
									<div class="cont_accor">
										<p>- iCrowd는 투자자의 투자와 관련하여 별도의 수수료를 받지 않습니다. 단, 투자금액을 실시간계좌이체하는 과정에서 PG사 결제수수료가 일부 발생하며, 투자금액별 수수료는 다음과 같습니다.</p>
<p>&nbsp;</p>
<table>
<tbody>
<tr>
<td>
<p>투자금액</p>
</td>
<td>
<p>PG수수료</p>
</td>
</tr>
<tr>
<td>
<p>1 ~ 9,899원</p>
</td>
<td>
<p>100원</p>
</td>
</tr>
<tr>
<td>
<p>9,900 ~ 29,800원</p>
</td>
<td>
<p>200원</p>
</td>
</tr>
<tr>
<td>
<p>29,801 ~ 49,750원</p>
</td>
<td>
<p>250원</p>
</td>
</tr>
<tr>
<td>
<p>49,751 ~ 69,700원</p>
</td>
<td>
<p>300원</p>
</td>
</tr>
<tr>
<td>
<p>49,751 ~ 69,700원</p>
</td>
<td>
<p>400원</p>
</td>
</tr>
<tr>
<td>
<p>99,601 ~ 499,400원</p>
</td>
<td>
<p>600원</p>
</td>
</tr>
<tr>
<td>
<p>499,401 ~ 9,999,000원</p>
</td>
<td>
<p>1000원</p>
</td>
</tr>
<tr>
<td>
<p>499,401 ~ 9,999,000원</p>
</td>
<td>
<p>2000원</p>
</td>
</tr>
<tr>
<td>
<p>99,998,001 ~ 499,995,000원</p>
</td>
<td>
<p>5,000원</p>
</td>
</tr>
<tr>
<td>
<p>499,995,001 ~ 9,999,990,000원</p>
</td>
<td>
<p>10,000원</p>
</td>
</tr>
</tbody>
</table>
<p>&nbsp;</p>
								    </div>
								</li>
								
								<li id="gstInvFaq40" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">결제한 투자금은 어떻게 관리되나요?</em>
									<div class="cont_accor">
										<p>- 투자하실 때 결제하신 투자금은 투자자 명의의 은행계좌에서 청약증거금 관리기관인 한국증권금융으로 이체되어 안전하게 관리됩니다. 투자기간이 끝나 크라우드펀딩에 성공했을 경우 증권이 발행되어 발행사에게 전달되고, 크라우드펀딩에 실패했을 경우에는 투자마감일 익일에 투자금을 입금하신 계좌로 환불처리됩니다.</p>
								    </div>
								</li>
								
								<li id="gstInvFaq41" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">모바일에서도 투자할 수 있나요?</em>
									<div class="cont_accor">
										<p>- 네, 모바일로도 투자하실 수 있습니다. 모바일 인터넷 브라우저에서 iCrowd 접속하신 후&gt; 증권형 선택 &gt; 원하시는 프로젝트에 투자를 진행해주시면 됩니다.<br /><br /><strong>- 단, 모바일을 통해 투자를 진행하시기 위해서는 몇가지 준비사항이 필요합니다.</strong></p>
<p><strong>1.&lsquo;BankPay PG 앱&rsquo; 설치</strong><br /><strong>2. 투자금을 결제할 &lsquo;금융기관 계좌&rsquo;, 모바일에서 사용가능한 &lsquo;공인인증서&rsquo;, &lsquo;보안카드(또는 OTP)&rsquo;</strong></p>
								    </div>
								</li>
								
								<li id="gstInvFaq42" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">투자하려는 프로젝트의 모집금액 달성률이 100%를 초과한 상태입니다. 추가로 투자해도 되나요?</em>
									<div class="cont_accor">
										<p>- 투자기간 중 모집금액 달성률이 100%를 초과한 상태라도 추가&nbsp;투자참여는 가능합니다. 그러나 투자 후 실제 증권을 배정 받게 될지는 투자기간 중 투자 취소 여부나 배정방식 등에 따라 달라질 수 있습니다. 예를 들어 선착순 배정의 경우 먼저 투자한 순서대로 목표금액의 100%까지만 인정이 되고, 그 이후 투자한 투자자들의 투자금액(투자금액 이체 수수료 제외)은 환불 처리됩니다.</p>
								    </div>
								</li>
								
								<li id="gstInvFaq43" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">모여진 금액이 목표금액에 미치지 못했을 경우에는 어떻게 되나요?</em>
									<div class="cont_accor">
										<p>- 크라우드펀딩 특성상 모집된 금액이 목표금액의 80% 이상 달성하면 성공으로 인정되어 증권이 발행됩니다. 그러나 80%에 미달하는 경우에는 증권발행이 취소되며, 투자금은 환불예정일에 투자자에게 환불됩니다. 투자금액 환불 시 투자자가 결제한 투자금 이체수수료는 환불되지 않습니다.</p>
								    </div>
								</li>
								
								<li id="gstInvFaq44" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">증권이 제대로 들어왔는지는 어떻게 확인할 수 있나요?</em>
									<div class="cont_accor">
										<p>- 증권 입고는 발행기업의 펀딩 페이지에 명시된 교부일에 진행됩니다. 교부일 당일, 입력하신 증권사 계좌를 통해 입고여부를 확인하실 수 있습니다. 단, 증권사를 거치지 않고 실물 발행되어 보호예수 되는 경우에는 교부일 당일 발행사가 직접 한국예탁결제원에서 보호예수 절차를 진행합니다.</p>
								    </div>
								</li>
								
								<li id="gstInvFaq45" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">투자한 기업의 사업활동 및 자료는 어디서 확인할 수 있나요?</em>
									<div class="cont_accor">
										<p>- 발행기업의 펀딩 페이지에 해당 기업을 소개하는 IR 자료와 각종 참고자료가 게재됩니다. 그밖에 발행기업의 홈페이지나 SNS를 통해서도 사업활동 현황을 살펴보실 수 있습니다. 또한 펀딩이 마감된&nbsp;이후에도 iCrowd 홈페이지에서 크라우드펀딩 성공기업이 매년 1회 공시하는 요약재무정보 및 결산서류를 확인하실 수 있습니다.</p>
								    </div>
								</li>
								
								<li id="gstInvFaq46" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">투자기간이 끝난 후에는 어떻게 진행되나요?</em>
									<div class="cont_accor">
										<p>- 투자가 끝난 이후에는 투자자별 배정내역 확정, 발행사에 대금납입, 증권 발행, 교부 등의 절차가 순차적으로 진행됩니다. 주식, 채권 등 증권의 종류에 따라 진행절차와 일정에 차이가 있으니 상세 일정은 해당 기업의 펀딩 페이지 상에 게재된 내용을 참고해주시기 바랍니다.</p>
								    </div>
								</li>
								
								<li id="gstInvFaq47" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">투자 후 배정받은 증권은 누가, 어떻게 관리하나요?</em>
									<div class="cont_accor">
										<p>- 크라우드펀딩을 통해 발행된 증권은 한국예탁결제원에 예탁 또는 보호예수 되어 관리됩니다.<br /><br /></p>
<p>- 예탁이란 투자자가 증권사를 통해 맡긴 증권을 보관하고 매매거래의 결제, 권리행사 업무를 위임하는 것을 말하며, 보호예수란 실물로 발행된 증권을 보호예수를 의뢰한 발행인별로 구분하여 보관하고 반환하는 행위를 말합니다.<br />&nbsp;</p>
<p>- 예탁의 경우 본인 명의의 증권계좌로 증권이 입고되어 예탁기관인 한국예탁결제원에서 안전하게 처리되며, 보호예수의 경우도 실물로 발행된 증권이 보호예수기관인 한국예탁결제원에 안전하게 보관되어 집니다.</p>
<p>&nbsp;</p>
								    </div>
								</li>
								
								<li id="gstInvFaq48" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">투자 후 배정받은 증권을 바로 거래할 수 있나요?</em>
									<div class="cont_accor">
										<p>- 크라우드펀딩으로 발행된 증권은 창업초기기업의 원활한 사업 이행을 위해 증권발행 후 1년간은 매도 또는 양도할 수 없습니다. 다만 일반투자자와 달리 위험감수능력이 있다고 판단되는 전문투자자에게는 예외적으로 증권의 매도 또는 양도가 가능합니다. 이는 보호예수 되는 증권도 마찬가지로 적용됩니다.</p>
								    </div>
								</li>
								
								<li id="gstInvFaq62" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">펀딩 종료된 후 절차는 어떻게 되나요?</em>
									<div class="cont_accor">
										<p>- 발행되는 증권의 종류에 따라 진행일정 및 절차에 다소 차이가 있기는 하지만 증권발행조건에 명시된 납입일에 투자금을 받을 수 있습니다. 단, 출금은 납입일 익일부터 가능합니다.</p>
								    </div>
								</li>
								
							</ul>
						</div>
						
					</div>
				</div>
			</article>
       	</article>

		</div>
		</main>

		<%@ include file="/views/common/footer.jsp" %>
	</div>

</body>
</html>
