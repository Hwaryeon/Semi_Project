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
<link rel="stylesheet" type="text/css" href="../../css/qna/guest.css">
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
					<h1 class="tit_guide"><span class="label_support">후원형</span>펀딩참여자</h1>
					<div class="box_guide" id="gstRewPay">
						<h2 class="tit_box">결제</h2>
						<ol class="list_guide">
							<li>1) ‘참여하기’ 버튼 혹은 금액대별 리워드 선택</li>
							<li>2) 결제 방식 선택 후 리워드 수령자 정보 입력</li>
							<li>3) 결제 진행(가상계좌의 경우 별도의 입금 절차 진행)</li>
							<li>4) 참여 완료창 확인(참여 완료 문자 및 메일 확인)</li>
						</ol>
					</div>

						<div class="box_guide" id="gstRewRew">
						<h2 class="tit_box">리워드</h2>
						<ol class="list_guide">
							<li>
								<h3 class="tit_list">1) 리워드 배송 시기</h3>
								<p class="txt_guide">
									- 크라우드펀딩플랫폼은 쇼핑몰이 아닙니다. 리워드는 프로젝트 개설자가 약속한 기간에 배송이 진행됩니다.<br>
									- 배송이 시작된 프로젝트는 마이페이지▶참여 프로젝트 ▶ 상세보기에서 배송형인 경우 송장번호로 배송조회가 가능하며, 배송형이 아닌 경우 제공여부 확인이 가능합니다.<br>
									- 프로젝트 개설자가 약속한 기간에 배송이 되지 않는다면 1차적으로 프로젝트 개설자에게 문의해주세요. 참여한 프로젝트 개설자에게 메시지 혹은 프로필 내 연락처로 문의해주세요. 혹 프로젝트 개설자와 소통이 되지 않을 경우 마이페이지 ▶ 문의하기로 문의해주세요.
								</p>
							</li>
							<li>
								<h3 class="tit_list">2) 리워드 변경</h3>
                                <p class="txt_guide">
                                    - 다른 금액대의 리워드로 변경하고 싶다면 환불 및 결제 취소 후에 원하는 금액대의 리워드를 다시 선택하여 결제하면 됩니다.<br>
                                    - 한번 선택한 리워드 옵션은 변경이 불가합니다. 변경이 필요하다면 환불 및 결제 취소 후에 재참여하시거나 프로젝트 개설자에게 별도로 문의해주세요.<br>
                                    - 리워드 수령지, 수령자 정보 변경을 원하시면 마이페이지 ▶ 참여 프로젝트 ▶ 자세히 보기 ▶ 배송지 수정을 통해 변경하세요. <br>
                                    참여한 프로젝트의 리워드 배송이 이미 시작된 것 같다면 프로젝트 개설자에게 별도로 문의해주세요.
                                </p>
							</li>
						</ol>
					</div>

						<div class="box_guide" id="gstRewFaq">
						<h2 class="tit_box">FAQ</h2>
						
						<div class="box_accor">
							<h3 class="tit_list">리워드 문의</h3>
							<ul class="list_accor">
							
								<li id="gstRewFaq12" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">리워드는 언제 배송되나요? </em>
									<div class="cont_accor">
										<p><strong>각 프로젝트의 리워드 제공일을 확인해주세요!</strong></p>
<p>- 크라우드펀딩은 쇼핑몰이 아닙니다. 프로젝트가 성공하여 리워드가 준비될 때까지는 시간이 걸릴 수 있습니다. 리워드는 프로젝트 개설자가 약속한 기간에 배송이 진행됩니다. 배송이 시작된 프로젝트는 마이페이지▶참여프로젝트▶상세보기에서 배송형인 경우 송장번호로 배송조회가 가능하며, 배송형이 아닌 경우 제공여부를 확인할 수 있습니다.</p>
<p><br />- 성공해야리워드(All or nothing) 방식의 경우 목표 금액을 달성해야만 리워드 배송이 시작되기 때문에 이미 참여했다면 주변의 다른 분들께도 추천하여 목표 금액을 달성할 수 있도록 도와주세요.</p>
<p><br />- 프로젝트 개설자가 약속한 기간에 배송이 되지 않는다면 1차적으로 프로젝트 개설자에게 문의해주세요. 각 프로젝트 개설자에 대한 연락처 정보는 프로젝트 대표이미지 아래쪽에서 확인하실 수 있습니다.</p>
<p><br />- 혹 프로젝트 개설자와 소통이 되지 않을 경우 마이페이지▶문의하기로 문의해주세요.</p>
								    </div>
								</li>
								
								<li id="gstRewFaq13" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">리워드를 변경하고 싶어요.</em>
									<div class="cont_accor">
										<p>- 다른 금액대의 리워드로 변경하고 싶다면 환불 및 결제 취소 후에 원하는 금액대의 리워드를 다시 선택하여 결제하면 됩니다.</p>
<p><br />- 한번 선택한 리워드 옵션은 변경이 불가합니다. 변경이 필요하다면 참여 취소 후 재참여 혹은 프로젝트 개설자에게 별도로 문의해주세요.</p>
<p><br />- 리워드 수령지, 수령자 정보 변경을 원하시면 마이페이지 ▶ 참여 프로젝트 ▶ 자세히 보기 ▶ 배송지 수정을 통해 변경해주세요. 변경을 원하시는 시점이 참여한 프로젝트의 리워드 배송이 이미 시작된 것 같다면 프로젝트 개설자에게 별도로 문의해주세요.(해당 프로젝트 리워드 제공 예정일 확인)</p>
								    </div>
								</li>
								
							</ul>
						</div>
						
						
						<div class="box_accor">
							<h3 class="tit_list">결제 문의</h3>
							<ul class="list_accor">
								
								<li id="gstRewFaq7" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">결제 완료는 어떻게 하나요?</em>
									<div class="cont_accor">
										<p><strong>무조건리워드(keep it all) 프로젝트의 경우</strong></p>
<p>- 가상계좌 입금의 경우 입금계좌번호는 이메일 및 문자로로 안내됩니다. 계좌 확인 후 가상계좌 유효기간 내에 입금하면 참여가 완료됩니다.<br /><br />- 기타 카드결제, 실시간이체, 핸드폰 소액결제의 경우는 참여와 함께 결제가 진행되며, 참여자응원글과 마이페이지-참여 프로젝트 목록에 프로젝트 정보가 보인다면 정상적으로 결제가 완료된 상태입니다.<br /><br /><br /><strong>성공해야리워드(all or nothing)프로젝트의 경우</strong><br /><br />- 카드예약결제로 진행되며, 참여 프로젝트 마감일 기준 목표금액 100% 이상 도달 해야지만 결제가 진행됩니다. 1차 결제는 마감일 익일 오전에 진행되며 카드잔액 부족 및 카드번호 불일치로 결제가 되지 못 할 경우 최대 5일간 재결제가 이뤄집니다. <br />* 재결제기간 내에는 참여취소가 불가능하오니 이 점 양해부탁드립니다.<br /><br /><br /><br /></p>
								    </div>
								</li>
								
								<li id="gstRewFaq8" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">결제 수단에서 카드만 나오던데 다른 방법은 없나요?</em>
									<div class="cont_accor">
										<p><strong>카드결제만 진행되는 프로젝트 방식<br /></strong><br />- 프로젝트의 진행방식마다 결제방법이&nbsp;다릅니다. 성공해야리워드(All or nothing) 방식의 프로젝트의 경우 프로젝트 목표금액 달성시에만 결제가 진행되며, 이를 위해 결제방법은 카드결제로 제한됩니다.&nbsp;</p>
<p><br />*&nbsp;국내에서 발급된 신용카드와 체크카드 모두 결제 가능(해외 발급 카드는 이용이 제한됩니다.)<br />* 프로젝트 성공 이후 프로젝트 마감일 다음 영업일에 예약결제가 진행됩니다.</p>
<p>&nbsp;</p>
<p><strong>리워드 수량이 한정되어있는 경우</strong></p>
<p>- 프로젝트의 리워드가 한정수량이거나 Early bird Reward일 경우&nbsp;결제와 함께 참여가 확정되는 카드결제서비스를 제공하고 있습니다. &nbsp;</p>
								    </div>
								</li>
								
								<li id="gstRewFaq9" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">결제 시 신용(체크)카드정보를 입력하면 오마이컴퍼니에서 번호를 수집하나요?</em>
									<div class="cont_accor">
										<p>펀딩 성공 시 결제가 이루어지는 All or nothing 프로젝트는 펀딩 마감 다음날에 결제됩니다. 예약결제시스템에 필요한 지불정보 입력을 받고 있습니다. 참여해주신 프로젝트에 한해 기존의 등록하신 카드에서 출금되며 해당 카드정보는 각 카드사에 보관된 정보를 요청하게됩니다.</p>
								    </div>
								</li>
								
								<li id="gstRewFaq10" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">입력한 신용(체크)카드정보를 변경하고 싶은데 어떻게 하나요?</em>
									<div class="cont_accor">
										<p>- 오마이컴퍼니 마이페이지 ▶ 지불정보 설정 페이지에서 지불정보(카드번호)를 변경할 수 있습니다.</p>
<p><br />- 성공해야리워드(All or nothing) 프로젝트에 참여했는데 입력한 카드에서 출금이 실패되었다면 펀딩 마감일 익일부터 5일간 결제를 다시 진행합니다. 펀딩 마감 후 결제가 진행되지 않은 경우 지불정보를 확인하여 변경하실 수 있습니다.<br /><br /><br />- 등록된 지불정보 삭제를 원할 경우 지불정보 설정페이지에서 '지불정보 삭제'를 클릭해주세요. 결제 대기중인 프로젝트가 없는 경우, 예약결제실패의 경우는 결제 재요청기간 이후에 지불정보 삭제가 가능합니다.</p>
								    </div>
								</li>
								
								<li id="gstRewFaq11" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">참여 및 결제 취소는 어떻게 하나요? </em>
									<div class="cont_accor">
										<p><strong>펀딩기간 내 마이페이지 ▶ 참여 프로젝트에서 &lsquo;결제 취소하기&rsquo; 버튼을 클릭합니다.</strong></p>
<p>- 카드결제의 경우 당일 결제 후 취소에는 즉시환불 되며 결제일 이후 취소할 경우 영업일 기준 3~5일이 소요될 수 있습니다. 카드와 계좌이체 결제의 경우 결제 계좌로 환불이 이뤄지며 가상계좌의 경우 오마이컴퍼니 가상잔고로 환불 금액이 입금됩니다. 가상잔고로 입금된 금액은 다른 프로젝트 참여 시 결제금으로 사용가능하며, 출금신청을 할 경우 회원 계좌로 환불 처리됩니다.</p>
<p><br /><strong>취소가 되지 않는 경우</strong></p>
<p>- 펀딩기간 내 참여하고자 하는 프로젝트가 목표금액에 달성 시 직접 결제 취소는 불가능합니다. 부득이한 사유로 취소를 원하신다면 마이페이지▶문의하기로 문의해주세요.<br /><br /></p>
<p>- 펀딩기간 내 리워드가 배송되는 프로젝트에 참여 시 마이페이지▶참여 프로젝트▶상세보기 클릭 후 배송이 시작되어 송장번호가 입력되어 있거나, 제공완료 상태라면 결제 취소가 불가능합니다.<br /><br /></p>
<p>- 성공해야리워드(All or nothing) 방식의 프로젝트의 경우 모집에 실패할 경우 결제가 이뤄지지 않기 때문에 별도의 환불절차가 없습니다.</p>
								    </div>
								</li>
								
								<li id="gstRewFaq14" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">참여 및 결제한 영수증이 필요합니다.</em>
									<div class="cont_accor">
										<p>결제 시 결제창에 입력한 이메일로 오마이컴퍼니 결제내역정보가 전달되며 해당 영수증 출력도 가능합니다.</p>
								    </div>
								</li>
								
							</ul>
						</div>
						
						
						<div class="box_accor">
							<h3 class="tit_list">기타 문의</h3>
							<ul class="list_accor">
								
								<li id="gstRewFaq15" class="tit_down"> <!-- 활성화 클래스 : down  -->
									<em class="tit_accor">연말정산을 위해 기부금영수증이 필요합니다.</em>
									<div class="cont_accor">
										<p>- 프로젝트 개설자가 비영리단체의 경우에 기부금영수증 발급 요청이 가능합니다. 그 외에 프로젝트 소개 중에 기부영수증 발급이 가능하다는 내용이 있다면 해당 발급은 프로젝트 개설자에게 문의해주세요.</p>
<p><br />- 오마이컴퍼니에서는 기부금영수증 발급이 불가능합니다. </p>
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

	</div>

</body>
</html>
