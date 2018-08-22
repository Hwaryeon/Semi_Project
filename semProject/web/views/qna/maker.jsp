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

<link rel="stylesheet" type="text/css" href="../../css/qna/qna.css">
<link rel="stylesheet" type="text/css" href="../../css/qna/maker.css">
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
		<div id="cMain">
			<div class="head_guide">
				<div class="wrap_txt">
					<h3 class="tit_gudie" style="color: black;">
						이용가이드 <span class="sub_tit">Funding Guide</span>
					</h3>
					<p class="sub_txt" style="color: black;">펀딩 관련 서비스에 대해 안내드립니다.</p>
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
                    <h1 class="tit_guide"><span class="label_support">후원형</span>펀딩개설자</h1>
                    <div class="box_guide" id="mkrRewApp">
                        <h2 class="tit_box">프로젝트 신청</h2>
                        <ol class="list_guide">
                            <li>
                                <h3 class="tit_list">1) 개설 전 확인사항</h3>
                                <p class="txt_guide">
                                    ! 참여자 분들에게 제공할 리워드(상품 혹은 서비스)가 구체적으로 있는지 생각해 주세요.<br>
                                    ! 보여질 리워드(상품 혹은 서비스)관련 글과 이미지, 영상 자료가 풍부하게 준비되어 있는지 확인해주세요.<br>
                                    ! 단순 자금 조달을 위한 목적으로 프로젝트를 진행하는 건 아닌지 한번 더 생각해주세요.<br>
                                    ! 무조건리워드(Keep it all)방식과 성공해야리워드(All or nothing)방식 중 어떤 방식으로 진행할 것인지 미리 확인해주세요.
                                </p>
                            </li>
                            <li>
                                <h3 class="tit_list">2) 프로젝트 기간 및 목표금액 설정</h3>
                                <p class="txt_guide"><strong>- 기간</strong></p>
                                <ul class="list_sub_guide">
                                    <li>보통 30일에서 40일 정도의 기간을 잡고 있으며, 최대 90일까지 설정 가능합니다. </li>
                                    <li>프로젝트의 기간이 길다고 성공률이 높아지지 않습니다. 프로젝트 진행자(개설자) 상황을 고려해 결정하시기 바랍니다. 펀딩 종료 후 일주일간의 정산 날짜까지 고려해 여유 있게 프로젝트를 시작하는 것을 추천 드립니다.</li>
                                </ul>
                                <p class="txt_guide"><strong>- 목표금액</strong></p>
                                <ul class="list_sub_guide">
                                    <li>50만원에서 최대 1천만원까지 설정 가능합니다. 프로젝트를 처음 개설하는 경우라면 합리적인 목표 금액을 설정하여 달성률을 높이세요.</li>
                                </ul>
                                <span class="wrap_img"><img src="../../images/qna/target_amount_setting.png" alt="목표금액설정" class="img_rwd"></span>
                                <ul class="list_sub_guide">
                                    <li>합리적인 목표 금액 설정하는 방법<br>무조건리워드(Keep it all)방식으로 진행하신다면, 목표 금액 달성 여부 관계없이 진행하므로 목표 금액을 하향조정하여 목표 금액 대비 모집 금액의 수치인 달성률을 높여주세요. 성공해야리워드(All or nothing)방식으로 진행하신다면, 제품 및 서비스 최소 제작 수량에 맞는 단가로 목표 금액을 설정해주세요.</li>
                                </ul>
                            </li>
                            <li>
                                <h3 class="tit_list">3) 프로젝트 스토리 설정</h3>
                                <p class="txt_guide"><strong>- 제목</strong></p>
                                <ul class="list_sub_guide">
                                    <li>프로젝트 제목은 한눈에 알아볼 수 있도록 직관적인 문구로 정하세요. 즉, 프로젝트의 핵심적인 내용을 담은 문구로 표현하세요. </li>
                                    <li>좋은 예 보러가기 : <strong><a href="https://www.ohmycompany.com/reward/592" target="_blank">대지를 위한 바느질</a></strong>, <strong><a href="https://www.ohmycompany.com/reward/1938" target="_blank">오매장터</a></strong></li>
                                </ul>
                                <p class="txt_guide"><strong>- 간략소개</strong></p>
                                <ul class="list_sub_guide">
                                    <li>제목에서 표현하지 못했던 프로젝트의 구체적인 구체적인 내용을 기입하세요.  프로젝트만의 매력포인트(ex. 리워드, 사회적이슈, 스토리와 의미 등)를 나타내면 좋습니다.</li>
                                </ul>
                                <p class="txt_guide"><strong>- 프로젝트 이미지</strong></p>
                                <ul class="list_sub_guide">
                                    <li>총 5개까지 이미지 슬라이드 형태로 삽입 가능합니다.</li>
                                    <li>프로젝트 내용 혹은 리워드를 잘 나타내는 고화질 실사 이미지를 사용하세요.</li>
                                    <li>어두운 색감보다 밝고 눈에 띄는 색감의 이미지를 사용하세요.</li>
                                    <li>배너 이미지 내 프로젝트 제목 등의 글씨 삽입은 최대한 자제해주세요.</li>
                                    <li>인터넷에서 찾아서 사용한 이미지는 대체로 저작권이 있습니다. 저작권이 없는 무료 이미지 혹은 직접 촬영한 사진을 사용하세요.</li>
                                    <li>좋은 예 보러가기 : <strong><a href="https://www.ohmycompany.com/reward/1112" target="_blank">스마트베리</a></strong>, <strong><a href="https://www.ohmycompany.com/reward/1148" target="_blank">hatch</a></strong>, <strong><a href="https://www.ohmycompany.com/reward/1918" target="_blank">임실농부</a></strong>, <strong><a href="https://www.ohmycompany.com/reward/1475" target="_blank">감부자영농조합법인</a></strong></li>
                                </ul>
                                <p class="txt_guide"><strong>- 내용</strong></p>
                                <ul class="list_sub_guide">
                                    <li>프로젝트 소개 / 프로젝트를 통해 모은 자금 사용처 / 리워드 / 프로젝트 개설자 소개로 크게 네 단락으로 구분됩니다.</li>
                                    <li>①프로젝트를 소개: 프로젝트를 기획하게 된 이유와 소개 - 프로젝트를 기획한 이유와 소개 </li>
                                    <li>②프로젝트를 통해 모은 자금 사용처: 목표금액 혹은 단계별금액 달성 시 실행할 일들을 나열(구체적인 일정과 항목별 자금 사용계획까지 있다면 좋습니다.)</li>
                                    <li>③리워드: 프로젝트 참여자에게 드릴 상품 및 서비스를 사진과 함께 설명합니다.</li>
                                    <li>④프로젝트 개설자 소개</li>
                                    <li>좋은 예 보러가기 : <strong><a href="https://www.ohmycompany.com/reward/1169" target="_blank">제주올레</a></strong>, <strong><a href="https://www.ohmycompany.com/reward/1111" target="_blank">꿈er</a>, <a href="https://www.ohmycompany.com/reward/1918" target="_blank">임실농부</a>, <a href="https://www.ohmycompany.com/reward/2106" target="_blank">UCON</a>, <a href="https://www.ohmycompany.com/reward/2162" target="_blank">케어</a></strong></li>
                                    <li>단순히 내용 전달이 아닌 마치 내 블로그에 포스팅을 하는 것처럼 소통하고 공감할 수 있는 내용으로 만드세요.</li>
                                    <li>좋은 예 보러가기 : <strong><a href="https://www.ohmycompany.com/reward/1070" target="_blank">씨알</a></strong>, <strong><a href="https://www.ohmycompany.com/reward/1926" target="_blank">바이시클트로피</a></strong></li>
                                    <li>영상이나 gif 등 모션이 있는 콘텐츠가 있다면 꼭 넣어서 프로젝트의 이해도를 높이세요.</li>
                                </ul>
                            </li>
                            <li>
                                <h3 class="tit_list">4) 프로젝트 리워드 설정</h3>
                                <p class="txt_guide"><strong>- 리워드 설계</strong></p>
                                <ul class="list_sub_guide">
                                    <li>참여자의 다양한 리워드 선택을 위해 가격 범위 및 리워드 구성을 다양하게 설정하세요. 가격의 범위는 최소 1000원부터 ~ 1백만원 이상도 설정 가능합니다.</li>
                                    <li>좋은 예 보러가기 : <strong><a href="https://www.ohmycompany.com/reward/1049" target="_blank">애심뜰</a></strong>, <strong><a href="https://www.ohmycompany.com/reward/1359" target="_blank">하주영</a></strong></li>
                                    <li>서비스의 경우, 이를 제공받게 될 참여자의 경험을 상상하면서 프로젝트 진행 서비스를 상세히 제공하세요.(ex. 티켓, 체험서비스 이용 상세, 방법, 시간, 장소, 수령방법, 문의처 등)</li>
                                    <li>식품의 경우, 알레르기 등 개인에 따라 민감한 반응을 보일 수 있어 성분표기를 필수적으로 기입하세요.</li>
                                    <li>[리워드 옵션] 종류, 디자인, 색상, 사이즈 등 참여자를 배려한 리워드의 모든 정보를 입력하세요 (펀딩 결제 시 리워드 옵션을 선택하여 입력 가능하도록 되어 있답니다.)</li>
                                    <li>좋은 예 보러가기 : <strong><a href="https://www.ohmycompany.com/reward/1126" target="_blank">agust</a></strong></li>                                    
                                    <li>[수량 한정] 크라우드펀딩은 오픈 초반, 확산이 중요하므로 초기 참여자에게 펀딩 가격이나 상품의 혜택을 주어야 합니다.(ex.선착순 리워드 상품, 리워드 가격, 펀딩 할인가, 한정판 등)</li>
                                    <li>좋은 예 보러가기 : <strong><a href="https://www.ohmycompany.com/reward/1169" target="_blank">제주올레</a></strong></li>                                    
                                    <li>오마이컴퍼니 플랫폼을 최대한 활용해 리워드 이벤트를 기획해보세요. (ex. 참여자 랜덤이벤트, 응원댓글 이벤트, SNS 공유 이벤트등)</li>
                                    <li>펀딩 오픈 후에 리워드 수정이 불가능합니다. 크라우드펀딩 종료 후 제공 가능한 리워드로 준비하세요.</li>
                                </ul>
                                <p class="txt_guide"><strong>- 리워드 배송</strong></p>
                                <ul class="list_sub_guide">
                                    <li>리워드 제공이 가능한 일정을 배송일로 공지해주세요. </li>
                                    <li>리워드 배송안내에 관한 발송방법, 발송일, 택배비, 배송관련 문의처 등 필수로 기입합니다. </li>
                                    <li>좋은 예 보러가기 : <strong><a href="https://www.ohmycompany.com/reward/1926" target="_blank">바이시클트로피</a></strong></li>
                                </ul>
                            </li>
                        </ol>
                        
                    </div>
                    <div class="box_guide" id="mkrRewChe">
                        <h2 class="tit_box">프로젝트 심사</h2>
                        <ol class="list_guide">
                            <li>
                                <h3 class="tit_list">1) 아래와 같은 경우 프로젝트 진행이 불가능합니다.</h3>
                                <ul class="list_sub_guide">
                                    <li>타 크라우드펀딩 사이트와 동일 리워드로 동일한 기간에 진행하려는 프로젝트</li>
                                    <li>특정 계층을 비하하는 프로젝트 (여성, 남성, 장애인, 연령대별 계층, 특정 정치계층 등)</li>
                                    <li>프로젝트 실행 계획이 불확실한 프로젝트</li>
                                    <li>피드백 반영 후에도 프로젝트 내용 완성도가 떨어지는 프로젝트</li>
                                    <li>목표금액과 프로젝트 진행 기간이 가이드 기준을 벗어났을 때</li>
                                </ul>
                            </li>
                            <li>
                                <h3 class="tit_list">2) 프로젝트 심사 기간</h3>
                                <ul class="list_sub_guide">
                                    <li>프로젝트 개설 신청 후 프로젝트 검토는 영업일 기준 1~3일이 소요됩니다. 접수된 프로젝트는 프로젝트 매니저가 검토하여 진행 가능 여부를 확인합니다. 프로젝트 내용에 필요한 피드백은 메일로 발송해드립니다. 수정된 프로젝트 오픈 일정은 피드백 반영에 따라 상이합니다.</li>
                                    <li>통상적으로 프로젝트 개설 신청 후 업로드까지 1~2주가 소요됩니다. </li>
                                </ul>
                                <p class="txt_guide">회원가입에 필요한 업체명, 이메일주소, 비밀번호, 사업자 및 법인 등록번호 등의 기본정보를 입력해주세요.</p>
                            </li>
                        </ol>
                    </div>
                    <div class="box_guide" id="mkrRewPro">
                        <h2 class="tit_box">펀딩 진행</h2>
                        <ol class="list_guide">
                            <li>
                                <h3 class="tit_list">1) 프로젝트 운영</h3>
                                <p class="txt_guide">로그인▶마이페이지▶개설 프로젝트▶개설자 전용 페이지에서 진행중인 프로젝트를 관리합니다.</p>
                                <ul class="list_sub_guide">
                                    <li>개설자 정보: 개설자의 이메일, 연락처, SNS 주소 등 변경이 필요할 때 수정합니다.</li>
                                    <li>프로젝트관리: 참여자 응원글에 댓글, Q&amp;A에 답변, 최근소식에 게시물을 업로드 합니다.<br>최근 소식은 참여자가 궁금해 하는 질문만 모은 글 / 프로젝트 및 리워드 제작 과정/ 펀딩 달성률에 관한 감사 인사/ 리워드 배송 안내/ 펀딩금 사용내역 보고 등을 업로드 하여 꾸준히 참여자분들과 소통해주세요. </li>
                                    <li>통계: 일별, 리워드별, 결제수단별 참여수와 금액을 확인할 수 있습니다.</li>
                                    <li>참여/투자자 정보: 리워드 배송을 위한 참여자 정보를 확인하고, 메시지보내기 기능을 통해 배송안내를 할 수 있습니다. </li>
                                    <li>정산: 정산 완료 시 정산서 파일 다운로드가 가능합니다.</li>
                                    <li>리워드 제공관리: 약속한 리워드 제공일에 맞추어 리워드 제공여부를 관리합니다. 배송형 리워드라면 택배사와 송장번호를, 배송형 리워드가 아닌 경우엔 제공여부를 체크합니다.</li>
                                </ul>
                                <p class="txt_guide">로그인 ▶ 마이페이지 ▶ 메시지와 프로젝트 Q&amp;A를 통해 프로젝트에 대한 문의사항이 접수됩니다. 주기적으로 확인하여 참여자와 원활한 소통이 될 수 있게 합니다.</p>
                            </li>
                            <li>
                                <h3 class="tit_list">2) 프로젝트 홍보</h3>
                                <ul class="list_sub_guide">
                                    <li>SNS를 활용하여 많은 사람들에게 프로젝트를 공유하세요.</li>
                                    <li>발급받은 포인트가 있다면 포인트를 활용하여 홍보를 할 수 있습니다.</li>
                                </ul>
                            </li>
                        </ol>
                    </div>
                    <div class="box_guide" id="mkrRewCal">
                        <h2 class="tit_box">정산 및 리워드 배송</h2>
                        <ol class="list_guide">
                            <li>
                                <h3 class="tit_list">1) 정산 수수료</h3>
                                <p class="txt_guide">오마이컴퍼니 플랫폼 이용 수수료와 결제 대행사 수수료가 있으며, 플랫폼 이용 수수료는 진행방식에 따라 다릅니다.</p>
                                <span class="wrap_img"><img src="../../images/qna/reward_fee_0219.png" alt="플랫폼이용수수료" class="img_rwd"></span>
                            </li>
                            <li>
                                <h3 class="tit_list">2) 정산 시기</h3>
                                <ul class="list_sub_guide">
                                    <li>Keep it all 방식의 프로젝트는 마감일 이후 3~7일 이내로, All or nothing 방식의 프로젝트는 마감일 이후 7~10일 이내로 개설자 페이지에 정산서를 업로드 합니다.</li>
                                    <li>정산 전 리워드 배송이 필요하다면 개설자 전용 페이지▶참여/투자자 정보에서 결제 완료한 분들의 정보 확인이 가능합니다.</li>
                                    <li>프로젝트 신청 시 업로드 한 정산 계좌로 정산이 됩니다. 정산 계좌 변경이 필요하다면 02-388-2556번으로 연락주시기 바랍니다. </li>
                                </ul>
                            </li>
                            <li>
                                <h3 class="tit_list">3) 리워드 배송</h3>
                                <ul class="list_sub_guide">
                                    <li>약속한 기간 내 배송이 시작되면 참여자분에게 메일 또는 문자로 배송안내를 하세요.</li>
                                    <li>배송된 리워드는 개설자 전용 페이지▶리워드 제공관리에서 배송형 리워드인 경우 택배사와 송장번호를 입력하며, 배송형 리워드가 아닌 경우 제공여부를 체크하여 저장합니다.</li>
                                    <li>리워드 배송 완료 후(서비스의 경우 제공 완료 후) 오마이컴퍼니에 펀딩 후기를 전달해 주세요. 펀딩 후기는 오마이컴퍼니 메인 내 인터뷰 카테고리와 SNS등에 업로드될 예정이며, 프로젝트 내용과 개설자에 대하여 2차적인 홍보 효과를 누릴 수 있습니다.</li>
                                </ul>
                            </li>
                        </ol>
                    </div>
                    <div class="box_guide" id="mkrRewFaq">
                        <h2 class="tit_box">FAQ</h2>
                        
                        <div class="box_accor">
                            <h3 class="tit_list">프로젝트 신청</h3>
                            <ul class="list_accor">
                                
                                <li id="mkrRewFaq16" class="tit_down"> <!-- 활성화 클래스 : down  -->
                                    <em class="tit_accor">프로젝트 내용에 들어가는 컨텐츠에 제한이 있나요?</em>
                                    <div class="cont_accor">
                                        <p>- 프로젝트 내용에 들어가는 이미지는 고화질의 실사 이미지 혹은 컨셉 사진을 지향합니다.<br /><br />- 폰트는 저작권이 있으므로 프로젝트 소개 페이지를 직접 제작할 경우 무료 폰트 위주로 사용하여 주세요.<br /><br />- 기사, 영상 등 인터넷에서 첨부한 자료도 저작권이 있으므로 저작권자에게 사용 가능 여부 확인 후 꼭 출처를 명확히 밝혀주시기 바랍니다.<br /> <br />- 프로젝트 내용에 대한 저작권 관련된 분쟁이 있을 시 프로젝트 개설자에게 법적책임이 있습니다. </p>
<p>&nbsp;</p>
                                    </div>
                                </li>
                                
                            </ul>
                        </div>
                        
                        
                        <div class="box_accor">
                            <h3 class="tit_list">펀딩 진행</h3>
                            <ul class="list_accor">
                                
                                <li id="mkrRewFaq17" class="tit_down"> <!-- 활성화 클래스 : down  -->
                                    <em class="tit_accor">펀딩 진행 기간 중에 프로젝트 내용과 리워드를 변경하고 싶습니다.</em>
                                    <div class="cont_accor">
                                        <p>- 펀딩 진행이 시작되면 리워드, 펀딩 진행 방식(Keep it all, All or nothing) 등은 변경 불가능합니다. <br /><br />- 프로젝트 내용, 대표 이미지, 영상, 목표 금액은 수정이 가능합니다. 해당 수정사항은 관리자로 문의주시거나 오마이컴퍼니 메일 <a href="mailto:omc@ohmycompany.com">omc@ohmycompany.com</a>로 전달해주시길 바랍니다.</p>
                                    </div>
                                </li>
                                
                                <li id="mkrRewFaq18" class="tit_down" > <!-- 활성화 클래스 : down  -->
                                    <em class="tit_accor">프로젝트 참여 시 결제가 잘 되지 않는다는 문의가 있었습니다.</em>
                                    <div class="cont_accor">
                                        <p>- 마이페이지 ▶ 관리자 문의를 통해 정확히 어떤 단계에서 결제가 되지 않았는지&nbsp;기재하여 문의주시면 메일로 빠른 답변 드리겠습니다.</p>
                                    </div>
                                </li>
                                

                            </ul>
                        </div>
                        
                        
                        <div class="box_accor">
                            <h3 class="tit_list">정산 및 리워드 배송</h3>
                            <ul class="list_accor">
                                
                                <li id="mkrRewFaq19" class="tit_down"> <!-- 활성화 클래스 : down  -->
                                    <em class="tit_accor">약속된 기간 내 리워드 배송을 하지 못한다면 어떻게 해야 하나요?</em>
                                    <div class="cont_accor">
                                        <p>- 기본적으로 리워드 배송에 대한 법적 책임을 프로젝트 개설자에게 있습니다.<br /><br />- 약속된 배송일보다 배송이 지연된다면, 참여자분들에게 양해의 메시지나 메일, 연락등을 보내는 방법이 있습니다.<br /> <br />- 기존에 제공하기로 한 리워드가 제공이 불가능하게 된다면 참여자분들에게 안내 후 다른 리워드로 변경하여 제공하는 방법도 있습니다.<br /><br />- 부득이한 사유로 배송일 및 배송리워드가 확실하지 못하게 되었다면, 프로젝트 개설자분께서 정산 받으신 금액을 참여자분들께 펀딩한 금액 100%를 직접 환불해주셔야 합니다.</p>
                                    </div>
                                </li>
                                
                            </ul>
                        </div>
                        
                        
                                             
                        
                        <div class="box_accor">
                            <h3 class="tit_list">기타 문의</h3>
                            <ul class="list_accor">
                                
                                <li id="mkrRewFaq20" class="tit_down"> <!-- 활성화 클래스 : down  -->
                                    <em class="tit_accor">정산받는 금액의 회계처리는 어떻게 해야 하나요?</em>
                                    <div class="cont_accor">
                                        <p>- 프로젝트 모집금액은 현금이체로 정산 받으실 수 있으며 기업에서 일반상품, 현금매출로 기장하시면 됩니다.<br /><br /></p>
<p>- 또한, 프로젝트 진행자(개설자)는 별도의 세금계산서 발행이 필요하지 않으며 오마이컴퍼니에서 펀딩 수수료(플랫폼이용수수료 + PG 결제수수료)에 관한 세금계산서 발행이 됩니다.</p>
                                    </div>
                                </li>
                                
                                <li id="mkrRewFaq21" class="tit_down"> <!-- 활성화 클래스 : down  -->
                                    <em class="tit_accor">기부형 프로젝트는 진행할 수 없나요?</em>
                                    <div class="cont_accor">
                                        <p>- 순수 기부형 크라우드펀딩을 할 수 있는 프로젝트 개설자는 비영리단체로 한정합니다. 즉, 프로젝트 개설자가 기부금영수증을 발급할 수 있는 곳이어야 합니다. <br /><br /><br />-다만, 리워드형의 프로젝트라도 참여자가 직접 원하는 금액을 입력하여 &lsquo;리워드 없이 펀딩&rsquo; or &lsquo;추가 참여&rsquo; 을 통해 참여자로부터 순수한 응원을 받으실 수 있습니다.</p>
                                    </div>
                                </li>
                                
                                <li id="mkrRewFaq22" class="tit_down"> <!-- 활성화 클래스 : down  -->
                                    <em class="tit_accor">과거에 크라우드펀딩을 진행하고 실패했는데 다시 할 수 있나요?</em>
                                    <div class="cont_accor">
                                        <p>- 물론입니다. 과거 펀딩 실패 원인을 정확히 분석하여 프로젝트 내용, 홍보 전략을 구체적으로 세워 재도전하세요. <br />적극적으로 응원합니다!</p>
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

		<!-- footer -->


















		<!-- footer -->
	</div>

</body>
</html>
