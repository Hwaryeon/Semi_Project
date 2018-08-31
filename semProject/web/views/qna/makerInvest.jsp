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
<link rel="stylesheet" type="text/css" href="../../css/qna/makerInvest.css">

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
		<div id="cMain" style="margin-bottom: 3000px;">
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
					<h1 class="tit_guide"><span class="label_stock">증권형</span>펀딩개설자</h1>
					<div class="box_guide" id="mkrInvApp">
						<h2 class="tit_box">프로젝트 개설</h2>
						<ol class="list_guide">
							<li>
								<h3 class="tit_list">1) 회원가입</h3>
								<p class="txt_guide">증권형 프로젝트 개설 신청을 위해서는 iCrowd 법인회원으로 회원가입을 진행해주세요.</p>
								<ul class="list_sub_guide">
									<li>사이트 우측 상단 ‘회원가입’ 클릭</li>
									<li>회원유형 중 ‘법인’ 선택</li>
								</ul>
							</li>
							<li>
								<h3 class="tit_list">2) 투자 모집 신청</h3>
								<p class="txt_guide">투자받기를 클릭하여 투자 모집 안내사항을 확인해주세요.</p>
								<ul class="list_sub_guide">
									<li>사이트 상단 ‘프로젝트 신청’을 클릭하여 증권형 개설을 선택하세요.</li>
								</ul>
							</li>
						</ol>
					</div>
					<div class="box_guide" id="mkrInvChe">
						<h2 class="tit_box">내부심사 및 실사</h2>
						<ol class="list_guide">
							<li>
								<h3 class="tit_list">1) 내부 심사</h3>
								<p class="txt_guide">투자모집 신청정보와 서류를 바탕으로 내부심사를 거쳐 펀딩 진행여부를 결정합니다.</p>
								<p class="txt_guide">심사는 법적 요건 및 재무상황을 고려해 판단되며 필요한 경우 추가 서류 요청이 있을 수 있습니다.</p>
								<p class="txt_guide">심사기간은 최대 2주가 소요되며, 심사결과는 개별 안내 드립니다.</p>
							</li>
							<li>
								<h3 class="tit_list">2) 기업사실확인</h3>
								<p class="txt_guide">기업에서 제출한 자료 및 수집된 정보를 바탕으로 iCrowd 심사팀에서 사실 확인 및 점검을 진행합니다.</p>
								<p class="txt_guide">이 과정에서 제출 된 내용과 사실이 다를 경우 펀딩 진행이 취소될 수 있습니다. </p>
							</li>
						</ol>
					</div>
					<div class="box_guide" id="mkrInvReg">
						<h2 class="tit_box">펀딩 등록</h2>
						<ol class="list_guide">
							<li>
								<h3 class="tit_list">1) 발행조건 협의 및 중개계약 체결</h3>
								<p class="txt_guide">크라우드펀딩을 통해 발행될 증권의 세부 조건을 협의하고 발행예정기업과 iCrowd 간의 온라인소액투자중개 계약을 체결합니다.</p>
							</li>
							<li>
								<h3 class="tit_list">2) 펀딩 등록을 위한 서류 준비</h3>
								<p class="txt_guide">유관기관 등록에 필요한 서류들을 준비하여야 합니다.</p>
								<p class="txt_guide">요청서류에 관련하여서는 iCrowd에서 친절히 안내드리겠습니다.</p>
							</li>
							<li>
								<h3 class="tit_list">3) 온라인 IR 준비</h3>
								<p class="txt_guide">투자자분들께 펀딩에 대해 소개하는 IR 자료를 준비합니다.</p>
								<p class="txt_guide">IR자료에는 투자핵심정보, 기업과 사업에 대한 소개, 투자금 사용 계획 등이 포함되어야 합니다.<br>(iCrowd의 기존 프로젝트 참고) </p>
							</li>
						</ol>
					</div>
					<div class="box_guide" id="mkrInvPro">
						<h2 class="tit_box">펀딩 진행</h2>
						<ol class="list_guide">
							<li>
								<h3 class="tit_list">1) 프로젝트 오픈 전</h3>
								<p class="txt_guide">프로젝트 오픈 전 투자자들이 발행 기업의 정보를 충분히 검토할 수 있도록 온라인 IR을 iCrowd 홈페이지에 미리 게시할 수 있으며, 해당 프로젝트의 사전예약서비스를 통해 프로젝트 오픈 알림받기를 신청한 투자자들에게는 투자가 시작될 시 가장 먼저 알려드립니다.</p>
							</li>
							<li>
								<h3 class="tit_list">2) 프로젝트 오픈 후</h3>
								<p class="txt_guide">프로젝트가 오픈되면 투자마감일까지 투자자들이 자유롭게 기업의 정보를 보고 투자를 진행할 수 있습니다.</p>
								<p class="txt_guide">투자기간 동안 Q&A를 통해 투자자분들과 소통하실 수 있습니다.</p>
							</li>
						</ol>
					</div>
					<div class="box_guide" id="mkrInvDel">
						<h2 class="tit_box">증권 발행</h2>
						<ol class="list_guide">
							<li>
								<h3 class="tit_list">1) 펀딩 성공 기준</h3>
								<p class="txt_guide">투자기간 내에 목표금액의 80% 이상이 모집되었을 경우 펀딩 성공으로 인정되어 증권발행이 가능합니다.</p>
								<p class="txt_guide">목표금액의 80% 미만으로 모집되었을 경우, 펀딩 실패로 종료됩니다.</p>
								<p class="txt_guide">펀딩 실패시 투자금은 투자마감일 익일 환불처리 됩니다. 만일 목표금액의 100%를 초과하여 모집되었을 경우, 100%분 까지만 인정되어 초과된 투자금은 증권 배정작업이 완료된 후 환불처리 됩니다.</p>
							</li>
							<li>
								<h3 class="tit_list">2) 증권발행 절차</h3>
								<p class="txt_guide">펀딩 성공 시 발행되는 증권의 유형에 따라 개별 안내 드립니다.</p>
								<p class="txt_guide">투자마감일로부터 8 영업일 이후가 발행인이 투자금을 납입받는 납입일이며, 납입일 이전 증권 배정작업이 완료됩니다.</p>
								<p class="txt_guide">주식의 경우 납입일 익일에 증권이 발행되며, 투자마감일로부터 21 영업일 이후에 투자자분의 증권계좌로 주식이 입고됩니다.</p>
								<p class="txt_guide">채권의 경우 납입일, 발행일, 교부일이 모두 투자마감일로부터 8 영업일 이후입니다.</p>
							</li>
						</ol>
					</div>
					<div class="box_guide" id="mkrInvFaq">
						<h2 class="tit_box">FAQ</h2>
						
						<div class="box_accor">
							<h3 class="tit_list">펀딩 준비</h3>
							<ul class="list_accor">
								
								<li id="mkrInvFaq49" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">크라우드펀딩에 참여하기 위해 발행기업이 갖추어야할 자격요건이 있나요?</em>
									<div class="cont_accor">
										<p>- 크라우드펀딩을 통해 증권을 발행할 수 있는 발행인의 범위는 원칙적으로 &lsquo;창업 후 7년 이하의 비상장법인&rsquo;이어야 합니다. 단, 벤처기업, 기술혁신형 중소기업(이노비즈기업), 경영혁신형 중소기업(메인비즈기업), 사회적기업 인증을 받았거나 비상장중소기업이 신기술개발, 문화사업 등의 프로젝트 사업*을 운영하는 경우 업력과 무관하게 크라우드펀딩에 참여하실 수 있습니다.</p>
<table>
<tbody>
<tr>
<td>
<p>구분</p>
</td>
<td>
<p>포함</p>
</td>
<td>
<p>제외</p>
</td>
<td>
<p>비고</p>
</td>
</tr>
<tr>
<td>
<p>업력 7년 이내</p>
</td>
<td>
<p>-창업자 (중소기업창업지원법 제2조제2호)</p>
</td>
<td rowspan="2">
<p>- 주권상장법인</p>
<p>- 금융&bull;보험, 부동산, 기타 사행성 업종</p>
</td>
<td rowspan="2">
<p>제외업종 중 기타 금융지원 서비스(핀테크 일부) 및 공익목적의 부동산 사업은 포함</p>
</td>
</tr>
<tr>
<td rowspan="2">
<p>업력 무관 (7년 초과)</p>
</td>
<td>
<p>- 벤처기업<br />- 이노비즈기업<br />- 메인비즈기업 <br />- 인증사회적기업</p>
</td>
</tr>
<tr>
<td>
<p>- 프로젝트 사업</p>
</td>
<td>
<p>- 주권상장법인</p>
</td>
<td>
<p>분야: 신기술개발, 문화, 관광, 스포츠 등</p>
</td>
</tr>
</tbody>
</table>
<p>*프로젝트 사업 : 비상장중소기업이 기존 사업과 회계를 분리하여 운영하는 경우</p>
<p>단, 주권상장법인 및 다음과 같은 크라우드펀딩 제외업종*에 해당할 경우 발행이 제한됩니다.</p>
<p>*크라우드펀딩 제외업종 금융&bull;보험업, 부동산업, 겜블링&bull;배팅업, 무도장, 골프장, 스키장 등(중소기업창업지원법 시행령 제4조) 단, 제외업종 중 기타 금융지원 서비스(핀테크 일부) 및 부동산업을 하는 자 중 관계 법령에 따라 허가, 인가, 승인, 지정 등을 받아 공익을 목적으로 하는 자의 경우는 자금 모집이 가능합니다.</p>
								    </div>
								</li>
								
								<li id="mkrInvFaq50" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">크라우드펀딩으로 발행할 수 있는 증권은 어떤 것들이 있나요?</em>
									<div class="cont_accor">
										<p>- 크라우드펀딩을 통해 발행할 수 있는 증권은 크게 지분증권(주식), 채무증권(채권), 투자계약증권이 있습니다.</p>
<p>&nbsp;</p>
<p>- 지분증권은 주식을 발행하여 투자금에 상응하는 지분을 제공하는 경우이며, 채무증권은 투자금에 대해 약정된 이자를 지급하고 만기에 원금을 상환하는 경우입니다. 투자계약증권은 주로 타인이 수행한 공동사업의 결과에 따른 손익을 받는 경우에 해당합니다.</p>
								    </div>
								</li>
								
								<li id="mkrInvFaq51" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">크라우드펀딩 진행 절차는 어떻게 되나요?</em>
									<div class="cont_accor">
										<p>-iCrowd의 증권형 크라우드펀딩 진행절차는 크게 5단계로 구분됩니다.<br /><br /><img src="/uploads/editorImages/2018/editorImg_20180128082812768.png" alt="" width="680" height="195" /></p>
<p>- 투자받기를 원하시면 iCrowd의 홈페이지 상단의<strong> 프로젝트 신청 &gt; 증권형</strong> 을 선택해주세요. 사업자등록증, 법인등기부등본, 재무자료, 사업계획서 등의 기초자료를 첨부하여 투자 신청을 진행해주세요.</p>
								    </div>
								</li>
								
								<li id="mkrInvFaq52" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">펀딩 진행을 위해 발행기업이 준비해야 하는 것들은 무엇인가요?</em>
									<div class="cont_accor">
										<p>- 펀딩 진행이 확정되면 iCrowd는 발행기업의 사실확인을 하고, 발행기업은 몇 가지 구비서류와 함께 온라인 IR을 준비하면 됩니다.</p>
<p>&nbsp;</p>
<p><strong>1.투자받기 신청시</strong></p>
<p>발행인 기본정보입력 및 첨부서류(사업자등록증, 법인등기부등본, 사업계획서, 재무제표 및 기타 첨부서류(벤처기업확인서, 기업소개자료 등)</p>
<p>&nbsp;</p>
<p><strong>2.심사 통과 후</strong></p>
<p>⓵ 기업개요에 관한 자료 : 정관, 주주명부, 주주총회 혹은 이사회의사록(증권발행조건 결의)</p>
<p>⓶ 재무자료 : 재무제표(최근 3사업년도), 차입금 내역, 매출 내역, 결산서 등</p>
<p>⓷ 사업계획에 관한 자료 : 사업계획서</p>
<p>⓸ 발행기업 대표이사&middot;임원&middot;대주주의 범죄경력 사실 확인서</p>
<p>⓹ 특허, 기술인증 내역, 소송 관련 자료</p>
<p>⓺ 회계감사인의 감사의견서</p>
<p>⑦ 대표이사 확인서, 임원확인서 및 기타 투자판단에 영향을 미칠 수 있는 서류</p>
<p>&nbsp;</p>
<p>펀딩 진행이 확정되면 iCrowd에서 개별적으로 준비사항에 대해 상세하게 안내드릴 예정입니다.</p>
								    </div>
								</li>
								
								<li id="mkrInvFaq53" class="tit_down" > <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">증권형 크라우드펀딩을 통해 투자 받을 수 있는 최대한도는 얼마인가요?</em>
									<div class="cont_accor">
										<p>- 연간 한도는 모집예정일로부터 과거 1년 동안의 공모 모집 금액과 이번에 모집예정인 금액을 합산하여 7억원 이하로 산정됩니다.</p>
								    </div>
								</li>
								
								<li id="mkrInvFaq54" class="tit_down" > <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">펀딩 진행 여부를 결정하는데 적용되는 절차와 심사기준은 무엇인가요?</em>
									<div class="cont_accor">
										<p>- iCrowd는&nbsp;프로젝트 신청한 기업이 제출한 자료를 토대로 내부심사를 거쳐 최종 펀딩 진행여부를 결정합니다. 내부 심사는 법적 요건 및 재무 상황 등을 고려해 판단하며, 보다 상세한 내용이 궁금하시다면 iCrowd(omc@ohmycompany.com / 02-388-2556)로 문의주시기 바랍니다.</p>
								    </div>
								</li>
								
								<li id="mkrInvFaq55" class="tit_down" > <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">투자기간은 어떻게 설정하는지요?</em>
									<div class="cont_accor">
										<p>- 투자자를 유치하는 투자기간은 정해진 기간이 있지는 않으나 일반적으로 한달 내외로 진행됩니다. 투자기간은 내부적으로 협의하여 발행인의 의사에 따라 조정될 수 있습니다.</p>
								    </div>
								</li>
								
								<li id="mkrInvFaq56" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">펀딩 목표금액은 어떻게 결정하나요?</em>
									<div class="cont_accor">
										<p>- 발행기업은 크라우드펀딩을 통해 모집할 수 있는 연간 7억원 한도내에서 자유롭게 목표금액을 설정할 수 있습니다. 자금을 사용하려는 용도에 맞게 목표금액을 설정하시면 됩니다.</p>
								    </div>
								</li>
								
								<li id="mkrInvFaq57" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">목표금액의 100%를 초과해서 달성했을 경우에 초과된 투자금도 받을 수 있나요?</em>
									<div class="cont_accor">
										<p>- 모집금액이 목표금액의 100%를 초과 달성하였더라도 목표금액의 100%에 해당하는 금액까지만 인정되어 증권을 발행할 수 있습니다. 또한 증권형 크라우드펀딩 특성상 목표금액의 80% 이상만 달성되면 성공이 인정되어 증권이 발행됩니다.</p>
								    </div>
								</li>
								
								<li id="mkrInvFaq58" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">펀딩을 진행할 경우 소요되는 비용은 얼마나 되는지요?</em>
									<div class="cont_accor">
										<p>- iCrowd에서 크라우드펀딩을 진행하게 될 경우 사실확인수수료, 온라인 등록비, 펀딩수수료 등의 비용이 발생합니다. 펀딩수수료의 경우 크라우드펀딩에 성공했을 경우에만 발행된 금액에 비례하여 책정됩니다. <br /><br />- 사실확인수수료와 온라인등록비는 선불의 개념으로 청약 개시 시점이전에 납부하셔야 하며, 펀딩이 중단되거나 실패한 경우에도 환불되지 않습니다. 보다 자세한 내용은 iCrowd로 문의해주시면 상세하게 안내드리도록 하겠습니다.</p>
								    </div>
								</li>
								
								<li id="mkrInvFaq59" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">온라인 IR 자료는 어떻게 작성해야 하나요?</em>
									<div class="cont_accor">
										<p>- 온라인 IR(Investor Relations)은 투자자들에게 발행기업의 사업전망 및 성장가능성을 설명하는 자료입니다. 기업의 투자매력과 잠재력을 충분히 드러내는 동시에 기본적으로는 투자자들의 투자판단에 영향을 미칠 수 있는 모든 정보를 제공해야 합니다.</p>
<p>&nbsp;</p>
<p>- 따라서 발행기업에 대한 정보, 투자매력포인트, 사업소개 및 현황 등이 포함되어야 하며, 동시에 크라우드펀딩과 관련된 증권발행조건, 펀딩 진행과 관련하여 법률적으로 요구하고 있는 여러가지 문서(정관, 법인등기부등본, 이사회(주주총회)의사록, 범죄경력사실 등)을 게재하여야 합니다.</p>
								    </div>
								</li>
								
							</ul>
						</div>
						
						
						<div class="box_accor">
							<h3 class="tit_list">펀딩 진행</h3>
							<ul class="list_accor">
								
								<li id="mkrInvFaq60" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">펀딩 진행중에 온라인 IR을 수정할 수 있나요?</em>
									<div class="cont_accor">
										<p>- 발행기업은 게재정보 중 투자자의 투자판단에 영향을 미칠 수 있는 중요한 정보가 변경된 경우 게재정보를 즉시 정정하여야 합니다. 단, 게재정보의 정정이 투자기간의 말일부터 7일 이내에 이루어진 경우에는 그 날로부터 7일 후로 투자기간이 연장되도록 하여 투자자들이 변경된 정보를 토대로 충분한 의사판단을 할 수 있도록 숙려기간을 두어야 합니다.</p>
<p>&nbsp;</p>
								    </div>
								</li>
								
								<li id="mkrInvFaq61" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">펀딩 종료된 후 절차는 어떻게 되나요?</em>
									<div class="cont_accor">
										<p>- 투자기간 내에 목표금액의 80% 이상이 모집되었을 경우 펀딩에 성공한 것으로 인정되어 증권발행절차를 진행합니다.</p>
<p>&nbsp;</p>
<p>- 공모주식의 경우 펀딩 성공 확정 후 발행사의 진행일정은 다음과 같습니다.</p>
<p>(예시) 명의개서대리인선임계약 체결 및 배정내역 확정 &rarr; 주금납입(투자종료일 이후 7영업일) &rarr; 증권발행 &rarr; 증자 및 명의개서대리인 선임 등기 &rarr; 증권교부(투자종료일 이후 21영업일 이내)</p>
<p>&nbsp;</p>
<p>- 채무증권의 경우 펀딩 성공 확정 후 발행사의 진행일정은 다음과 같습니다.</p>
<p>(예시) 원리금지급대행/사채납입금수납대행 계약 체결(시중은행-발행사) &rarr; 투자자 배정명세서 수령 &rarr; 사채대금 납입(투자종료일 이후 8영업일) &rarr; 납입완료증명서 수령 &rarr; 증권교부(투자종료일 이후 8영업일)</p>
<p>&nbsp;</p>
<p>- 만약 목표금액의 80% 미만 모집되어 펀딩에 실패했을 경우, 미달된 투자금은 투자종료일 익일 환불처리 됩니다.</p>
<p>&nbsp;</p>
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
